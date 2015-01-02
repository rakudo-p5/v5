use NQPP6QRegex:from<NQP>;
use NQPP5QRegex:from<NQP>;
use Perl5::World;
use Perl6::World:from<NQP>;

multi sub postcircumfix:<{ }>( QAST::Node \SELF, \key, Mu :$BIND ) is rw is export {
    SELF.hash{key};
}
multi sub postcircumfix:<[ ]>( QAST::Node \SELF, \idx, Mu :$BIND ) is rw is export {
    SELF.list[idx];
}

sub find_symbol(@arr) is export {
    $*W.find_symbol(nqp::gethllsym("nqp", "nqplist")(|@arr))
}

sub symbol_lookup(@arr, $match, *%opts) is export {
    $*W.symbol_lookup(nqp::gethllsym("nqp", "nqplist")(|@arr), $match, |%opts)
}

sub is_name(@arr) is export {
    $*W.is_name(nqp::gethllsym("nqp", "nqplist")(|@arr))
}

sub throw($/, @pkg, *%opts) is export {
    $*W.throw($/, nqp::gethllsym("nqp", "nqplist")(|@pkg), |%opts);
}

my $V5DEBUG = %*ENV<V5DEBUG>;

# Represents a longname after having parsed it.
my class LongName {
    # a match object, so that error messages can get a proper line number
    has $.match is rw;

    # Set of name components. Each one will be either a string
    # or a PAST node that represents an expresison to produce it.
    has @.components is rw;

    # The colonpairs, if any.
    has @.colonpairs is rw;

    # Flag for if the name ends in ::, meaning we need to emit a
    # .WHO on the end.
    has $.get_who is rw;

    # Gets the textual name of the value.
    method text() {
        ~$!match
    }

    # Gets the name, by default without any adverbs.
    method name(:$decl, :$dba = '', :$with_adverbs) {
        my @parts := self.type_name_parts($dba, :$decl);
        unless $decl && $decl eq 'routine' {
            @parts.shift() while self.is_pseudo_package(@parts[0]);
        }
        join('::', @parts)
            ~ ($with_adverbs ?? join('', @!colonpairs) !! '');
    }

    # returns a QAST tree that represents the name
    # currently needed for 'require ::($modulename) <importlist>'
    # ignore adverbs for now
    method name_past() {
        if self.contains_indirect_lookup() {
            if @!components == 1 {
                return @!components[0];
            }
            else {
                my $past := QAST::Op.new(:op<call>, :name('&infix:<,>'));
                for @!components {
                    $past.push: $_ ~~ QAST::Node ?? $_ !! QAST::SVal.new(:value($_));
                }
                return QAST::Op.new(:op<callmethod>, :name<join>,
                    $past,
                    QAST::SVal.new(:value<::>)
                );
            }
        }
        else {
            my $value := join('::', @!components);
            QAST::SVal.new(:$value);
        }
    }

    # Gets the individual components (which should be strings) but
    # taking a sigil and twigil and adding them to the last component.
    method variable_components($sigil, $twigil) {
        my @result;
        for @!components {
            @result.push($_);
        }
        @result[+@result - 1] := $sigil ~ $twigil ~ @result[+@result - 1];
        @result
    }

    # Checks if there is an indirect lookup required.
    method contains_indirect_lookup() {
        for @!components {
            if nqp::istype($_, QAST::Node) {
                return 1;
            }
        }
        return 0;
    }

    # Fetches an array of components provided they are all known
    # or resolvable at compile time.
    method type_name_parts($dba, :$decl) {
        my @name;
        my int $beyond_pp;
        if $decl && $!get_who {
            my $name := self.text;
            nqp::die("Name $name ends with '::' and cannot be used as a $dba");
        }
        if +@!components == 1 && self.is_pseudo_package(@!components[0]) {
            my $c := @!components[0];
            if !$decl || ($decl eq 'routine') {
                nqp::push(@name, $c);
                return @name;
            }
            if $c eq 'GLOBAL' {
                nqp::die("Cannot declare pseudo-package GLOBAL");
            }
            throw($!match, <X PseudoPackage InDeclaration>,
                pseudo-package  => $c,
                action          => $dba,
            );
        }
        for @!components {
            if nqp::istype($_, QAST::Node) {
                if $_.has_compile_time_value {
                    for nqp::split('::', ~$_.compile_time_value) {
                        @name.push($_);
                    }
                }
                else {
                    my $name := self.text;
                    nqp::die("Name $name is not compile-time known, and can not serve as a $dba");
                }
            }
            elsif $beyond_pp || !self.is_pseudo_package($_) {
                @name.push: $_;
                $beyond_pp = 1;
            }
            else {
                if $decl {
                    if $_ ne 'GLOBAL' {
                        throw($!match, <X PseudoPackage InDeclaration>,
                            pseudo-package  => $_,
                            action          => $dba,
                        );
                    }
                }
                else {
                    @name.push: $_;
                }
            }
        }
        @name
    }

    method colonpairs_hash($dba) {
        my %result;
        for @!colonpairs {
            if $_<identifier> {
                my $pair := $*W.compile_time_evaluate($_, $_.ast);
                %result{$pair.key} := $pair.value;
            }
            else {
                $_.CURSOR.panic("Colonpair too complex in $dba");
            }
        }
        %result
    }

    # Checks if a name component is a pseudo-package.
    method is_pseudo_package($comp) {
        !nqp::istype($comp, QAST::Node) && (
        $comp eq 'CORE' || $comp eq 'SETTING' || $comp eq 'UNIT' ||
        $comp eq 'OUTER' || $comp eq 'MY' || $comp eq 'OUR' ||
        $comp eq 'PROCESS' || $comp eq 'GLOBAL' || $comp eq 'CALLER' ||
        $comp eq 'DYNAMIC' || $comp eq 'COMPILING' || $comp eq 'PARENT')
    }
}

# Takes a longname and turns it into an object representing the
# name.
sub dissect_longname($longname) is export {
    # Set up basic info about the long name.
    my $result    = LongName.new;
    $result.match = $longname;

    # Pick out the pieces of the name.
    my @components;
    my $name = $longname<name>;
    if $name<identifier> {
        @components.push(~$name<identifier>);
    }
    for $name<morename>.list {
        if $_<identifier> {
            @components.push(~$_<identifier>);
        }
        elsif $_<EXPR> {
            my $EXPR := $_<EXPR>.ast;
            @components.push($EXPR);
        }
        else {
            # Either it's :: as a name entirely, in which case it's anon,
            # or we're ending in ::, in which case it implies .WHO.
            if +@components {
                $result.get_who = 1;
            }
        }
    }
    $result.components = @components;

    $result
}

# Given a sigil and the the value type specified, works out the
# container type (what should we instantiate and bind into the
# attribute/lexpad), bind constraint (what could we bind to this
# slot later), and if specified a constraint on the inner value
# and a default value.
sub container_type_info($/, $sigil, @value_type, $shape?) is export {
    my %info;
    if $sigil eq '@' {
        %info<container_base>  := Array;
        %info<bind_constraint> := Positional;
        if @value_type {
            %info<container_type> := $*W.parameterize_type_with_args(
                %info<container_base>, [@value_type[0]], nqp::hash());
            %info<bind_constraint> := $*W.parameterize_type_with_args(
                %info<bind_constraint>, [@value_type[0]], nqp::hash());
            %info<value_type> := @value_type[0];
            %info<default_value> := @value_type[0];
        }
        else {
            %info<container_type> := %info<container_base>;
            %info<value_type>     := Any;
            %info<default_value>  := Any;
        }
        %info<default_value> := %info<value_type>;
        if $shape {
            throw($/, <X Comp NYI>, feature => 'Shaped arrays');
        }
    }
    elsif $sigil eq '%' {
        %info<container_base>  := Hash;
        %info<bind_constraint> := Associative;
        if $shape {
            @value_type[0] := Any unless +@value_type;
            my $shape_ast  := $shape[0].ast;
            if $shape_ast.isa(QAST::Stmts) {
                if +@($shape_ast) == 1 {
                    if $shape_ast[0].has_compile_time_value {
                        @value_type[1] := $shape_ast[0].compile_time_value;
                    } elsif (my $op_ast := $shape_ast[0]).isa(QAST::Op) {
                        if $op_ast.op eq "call" && +@($op_ast) == 2 {
                            if !nqp::isconcrete($op_ast[0].value) && !nqp::isconcrete($op_ast[1].value) {
                                throw($/, <X Comp NYI>,
                                    feature => "coercive type declarations");
                            }
                        }
                    } else {
                        throw($/, <X Comp AdHoc>,
                            payload => "Invalid hash shape; type expected");
                    }
                } elsif +@($shape_ast) > 1 {
                    throw($/, <X Comp NYI>,
                        feature => "multidimensional shaped hashes");
                }
            } else {
                throw($/, <X Comp AdHoc>,
                    payload => "Invalid hash shape; type expected");
            }
        }
        if @value_type {
            %info<container_type> := $*W.parameterize_type_with_args(
                %info<container_base>, @value_type, nqp::hash());
            %info<bind_constraint> := $*W.parameterize_type_with_args(
                %info<bind_constraint>, @value_type, nqp::hash());
            %info<value_type>    := @value_type[0];
            %info<default_value> := @value_type[0];
        }
        else {
            %info<container_type> := %info<container_base>;
            %info<value_type>     := Any;
            %info<default_value>  := Any;
        }
    }
    elsif $sigil eq '&' {
        %info<container_base>  := Scalar;
        %info<container_type>  := %info<container_base>;
        %info<bind_constraint> := Callable;
        if @value_type {
            %info<bind_constraint> := $*W.parameterize_type_with_args(
                %info<bind_constraint>, [@value_type[0]], nqp::hash());
        }
        %info<value_type>    := %info<bind_constraint>;
        %info<default_value> := Any;
        %info<scalar_value>  := Any;
    }
    elsif $sigil eq '*' {
        %info<container_base> := find_symbol(['Typeglob']);
        %info<container_type> := %info<container_base>;
        if @value_type {
            %info<bind_constraint> := @value_type[0];
            %info<value_type> := @value_type[0];
            %info<default_value> := $*PACKAGE; #@value_type[0];
        }
        else {
            %info<bind_constraint> := Mu;
            %info<value_type>      := Any;
            %info<default_value>   := $*PACKAGE; #@value_type[0];
        }
        %info<scalar_value> := %info<default_value>;
    }
    else {
        %info<container_base> := Scalar;
        %info<container_type> := %info<container_base>;
        if @value_type {
            %info<bind_constraint> := @value_type[0];
            %info<value_type> := @value_type[0];
            %info<default_value> := @value_type[0];
        }
        else {
            %info<bind_constraint> := Mu;
            %info<value_type>      := Any;
            %info<default_value>   := Any;
        }
        %info<scalar_value> := %info<default_value>;
    }
    %info
}

my role STDActions {
    method quibble($/) {
        make $<nibble>.ast;
    }

    method trim_heredoc($doc, $stop, Mu $origast) {
        $origast.pop();
        $origast.pop();
        my int $indent = -nqp::chars($stop.MATCH<ws>.Str);
        my $docast := $doc.MATCH.ast;
        if $docast.has_compile_time_value {
            my $dedented := nqp::unbox_s($docast.compile_time_value.indent($indent));

            my $chars := nqp::chars($dedented);
            if $chars {
                my $last := nqp::substr($dedented, $chars - 1);
                my $to_remove := 0;
                $to_remove := 1 if $last eq "\n" || $last eq "\r";
                $to_remove := 2 if $chars > 1
                    && nqp::substr($dedented, $chars - 2) eq "\r\n";

                $dedented := nqp::substr($dedented, 0, $chars - $to_remove);
            }

            $origast.push($*W.add_string_constant( $dedented ));
        }
        else {
            $origast.push( QAST::Op.new( :op('callmethod'), :name('chomp'),
                QAST::Op.new( :op('callmethod'), :name('indent'),
                $doc.MATCH.ast,
                QAST::IVal.new( :value($indent) ))));
        }
    }

    method decint($/) {
        $V5DEBUG && say("decint($/)"); make :10(~$/); }
    method hexint($/) {
        $V5DEBUG && say("hexint($/)"); make :16(~$/); }
    method octint($/) {
        $V5DEBUG && say("octint($/)"); make :8(~$/); }
    method binint($/) {
        $V5DEBUG && say("binint($/)"); make :2(~$/); }

    method ints_to_string($ints) {
        $V5DEBUG && say("method ints_to_string($ints)");
        if $ints ~~ Positional {
            my $result = '';
            for $ints.list {
                $result = $result ~ nqp::chr(nqp::unbox_i($_.ast));
            }
            $result;
        }
        else {
            nqp::chr(nqp::unbox_i($ints.ast));
        }
    }
}

class Perl5::Actions does STDActions {
    our @MAX_PERL_VERSION;

    our $FORBID_PIR;
    our $STATEMENT_PRINT;

    INIT {
        # If, e.g., we support Perl up to v6.1.2, set
        # @MAX_PERL_VERSION to [6, 1, 2].
        @MAX_PERL_VERSION[0] := 5;

        $FORBID_PIR := 0;
        $STATEMENT_PRINT := 0;
    }

    sub sink(Mu $past is rw) {
        $V5DEBUG && say("sub sink(\$past)");
        my $name := $past.unique('sink');
        QAST::Want.new(
            $past,
            'v',
            QAST::Stmts.new(
                QAST::Op.new(:op<bind>,
                    QAST::Var.new(:$name, :scope<local>, :decl<var>),
                    $past,
                ),
                QAST::Op.new(:op<if>,
                    QAST::Op.new(:op<if>,
                        QAST::Op.new(:op<isconcrete>,
                            QAST::Var.new(:$name, :scope<local>),
                        ),
                        QAST::Op.new(:op<can>,
                            QAST::Var.new(:$name, :scope<local>),
                            QAST::SVal.new(:value('sink')),
                        )
                    ),
                    QAST::Op.new(:op<callmethod>, :name<sink>,
                        QAST::Var.new(:$name, :scope<local>),
                    ),
                ),
            ),
        );
    }
    my %sinkable =
        call         => 1,
        callmethod   => 1,
        while        => 1,
        until        => 1,
        repeat_until => 1,
        repeat_while => 1,
        if           => 1,
        unless       => 1,
        handle       => 1,
        hllize       => 1;
    sub autosink(Mu $past is rw) {
        $V5DEBUG && say("sub autosink(\$past)");
        nqp::istype($past, QAST::Op) && %sinkable{$past.op} && !nqp::p6bool($past.ann('nosink'))
            ?? sink($past)
            !! $past;
    }

    sub xblock_immediate(Mu $xblock is rw) {
        $V5DEBUG && say("sub xblock_immediate(\$xblock)");
        nqp::bindpos($xblock, 1, pblock_immediate($xblock[1]));
        $xblock;
    }

    sub pblock_immediate(Mu $pblock is rw) {
        $V5DEBUG && say("sub pblock_immediate(\$pblock)");
        my $p := block_immediate($pblock.ann('uninstall_if_immediately_used').shift);
        $p
    }

    sub block_immediate(Mu $block is rw) {
        $V5DEBUG && say("sub block_immediate(\$block)");
        $block.blocktype('immediate');
        $block;
    }

    method deflongname($/) {
        $V5DEBUG && say("deflongname($/)");
        make dissect_longname($/).name(
            :dba("$*IN_DECL declaration"),
            :decl<routine>,
        );
    }

    # Turn $code into "for lines() { $code }"
    sub wrap_option_n_code($/, Mu $code is copy) {
        $code := make_topic_block_ref($code, copy => 1);
        return QAST::Op.new(
            :op<call>, :name<&eager>,
            QAST::Op.new(:op<callmethod>, :name<map>,
                QAST::Op.new( :op<call>, :name<&flat>,
                    QAST::Op.new(
                        :op<call>, :name<&flat>,
                        QAST::Op.new(
                            :name<&lines>,
                            :op<call>
                        )
                    )
                ),
                $code
            )
        );
    }

    # Turn $code into "for lines() { $code; say $_ }"
    # &wrap_option_n_code already does the C<for> loop, so we just add the
    # C<say> call here
    sub wrap_option_p_code($/, $code) {
        return wrap_option_n_code($/,
            QAST::Stmts.new(
                $code,
                QAST::Op.new(:name<&say>, :op<call>,
                    QAST::Var.new(:name<$_>)
                )
            )
        );
    }

    # XXX Move to HLL::Actions after NQP gets QAST.
    method CTXSAVE() {
        $V5DEBUG && say("CTXSAVE()");
        QAST::Stmt.new(
            QAST::Op.new(
                :op('bind'),
                QAST::Var.new( :name('ctxsave'), :scope('local'), :decl('var') ),
                QAST::Var.new( :name('$*CTXSAVE'), :scope('contextual') )
            ),
            QAST::Op.new(
                :op('unless'),
                QAST::Op.new(
                    :op('isnull'),
                    QAST::Var.new( :name('ctxsave'), :scope('local') )
                ),
                QAST::Op.new(
                    :op('if'),
                    QAST::Op.new(
                        :op<can>,
                        QAST::Var.new( :name('ctxsave'), :scope('local') ),
                        QAST::SVal.new( :value('ctxsave') )
                    ),
                    QAST::Op.new(
                        :op('callmethod'), :name('ctxsave'),
                        QAST::Var.new( :name('ctxsave'), :scope('local')
                    )))))
    }

    method install_doc_phaser($/) {
        $V5DEBUG && say("install_doc_phaser($/)");
        # Add a default DOC INIT phaser
        my $doc := %*COMPILING<%?OPTIONS><doc>;
        if $doc {
            my $block := $*W.push_lexpad($/);

            my $renderer := "Pod::To::$doc";

            my $module := $*W.load_module($/, $renderer, {}, $*GLOBALish);

            my $pod2text := QAST::Op.new(
                :op<callmethod>, :name<render>, :node($/),
                self.make_indirect_lookup([$renderer]),
                QAST::Var.new(:name<$=pod>, :scope('lexical'), :node($/))
            );

            $block.push(
                QAST::Op.new(
                    :op<call>, :node($/),
                    :name('&say'), $pod2text,
                ),
            );

            # TODO: We should print out $?USAGE too,
            # once it's known at compile time

            $block.push(
                QAST::Op.new(
                    :op<call>, :node($/),
                    :name('&exit'),
                )
            );

            $*W.pop_lexpad();
            $*W.add_phaser(
                $/, 'INIT', $*W.create_simple_code_object($block, 'Block'), $block
            );
        }
    }

    #~ method pod_content_toplevel($/) {
        #~ $V5DEBUG && say("pod_content_toplevel($/)");
        #~ my $child := $<pod_block>.ast;
        #~ # make sure we don't push the same thing twice
        #~ if $child {
            #~ my $id := $/.from ~ "," ~ ~$/.to;
            #~ if !$*POD_BLOCKS_SEEN{$id} {
                #~ $*POD_BLOCKS.push($child);
                #~ $*POD_BLOCKS_SEEN{$id} := 1;
            #~ }
        #~ }
        #~ make $child;
    #~ }

    #~ method pod_content:sym<block>($/) {
        #~ $V5DEBUG && say("pod_content:sym<block>($/)");
        #~ make $<pod_block>.ast;
    #~ }

    #~ method pod_configuration($/) {
        #~ $V5DEBUG && say("pod_configuration($/)");
        #~ make Perl6::Pod::make_config($/);
    #~ }

    #~ method pod_block:sym<delimited>($/) {
        #~ $V5DEBUG && say("pod_block:sym<delimited>($/)");
        #~ make Perl6::Pod::any_block($/);
    #~ }

    #~ method pod_block:sym<delimited_raw>($/) {
        #~ $V5DEBUG && say("pod_block:sym<delimited_raw>($/)");
        #~ make Perl6::Pod::raw_block($/);
    #~ }

    #~ method pod_block:sym<delimited_table>($/) {
        #~ $V5DEBUG && say("pod_block:sym<delimited_table>($/)");
        #~ make Perl6::Pod::table($/);
    #~ }

    #~ method pod_block:sym<paragraph>($/) {
        #~ $V5DEBUG && say("pod_block:sym<paragraph>($/)");
        #~ make Perl6::Pod::any_block($/);
    #~ }

    #~ method pod_block:sym<paragraph_raw>($/) {
        #~ $V5DEBUG && say("pod_block:sym<paragraph_raw>($/)");
        #~ make Perl6::Pod::raw_block($/);
    #~ }

    #~ method pod_block:sym<paragraph_table>($/) {
        #~ $V5DEBUG && say("pod_block:sym<paragraph_table>($/)");
        #~ make Perl6::Pod::table($/);
    #~ }

    #~ method pod_block:sym<abbreviated>($/) {
        #~ $V5DEBUG && say("pod_block:sym<abbreviated>($/)");
        #~ make Perl6::Pod::any_block($/);
    #~ }

    #~ method pod_block:sym<abbreviated_raw>($/) {
        #~ $V5DEBUG && say("pod_block:sym<abbreviated_raw>($/)");
        #~ make Perl6::Pod::raw_block($/);
    #~ }

    #~ method pod_block:sym<abbreviated_table>($/) {
        #~ $V5DEBUG && say("pod_block:sym<abbreviated_table>($/)");
        #~ make Perl6::Pod::table($/);
    #~ }

    #~ method pod_block:sym<end>($/) {
        #~ $V5DEBUG && say("pod_block:sym<end>($/)");
    #~ }

    #~ method pod_content:sym<config>($/) {
        #~ $V5DEBUG && say("pod_content:sym<config>($/)");
        #~ make Perl6::Pod::config($/);
    #~ }

    #~ method pod_content:sym<text>($/) {
        #~ $V5DEBUG && say("pod_content:sym<text>($/)");
        #~ my @ret := [];
        #~ for $<pod_textcontent> {
            #~ @ret.push($_.ast);
        #~ }
        #~ my $past := Perl6::Pod::serialize_array(@ret);
        #~ make $past.compile_time_value;
    #~ }

    #~ method pod_textcontent:sym<regular>($/) {
        #~ $V5DEBUG && say("pod_textcontent:sym<regular>($/)");
        #~ my @t     := Perl6::Pod::merge_twines($<pod_string>);
        #~ my $twine := Perl6::Pod::serialize_array(@t).compile_time_value;
        #~ make Perl6::Pod::serialize_object(
            #~ 'Pod::Block::Para', :content($twine)
        #~ ).compile_time_value
    #~ }

    #~ method pod_textcontent:sym<code>($/) {
        #~ $V5DEBUG && say("pod_textcontent:sym<code>($/)");
        #~ my $s := $<spaces>.Str;
        #~ my $t := $<text>.Str.subst(/\n$s/, "\n", :g);
        #~ $t    := $t.subst(/\n$/, ''); # chomp!
        #~ my $past := Perl6::Pod::serialize_object(
            #~ 'Pod::Block::Code',
            #~ :content(Perl6::Pod::serialize_aos([$t]).compile_time_value),
        #~ );
        #~ make $past.compile_time_value;
    #~ }

    #~ method pod_formatting_code($/) {
        #~ $V5DEBUG && say("pod_formatting_code($/)");
        #~ if ~$<code> eq 'V' {
            #~ make ~$<content>;
        #~ } else {
            #~ my @content := [];
            #~ for $<pod_string_character> {
                #~ @content.push($_.ast)
            #~ }
            #~ my @t    := Perl6::Pod::build_pod_string(@content);
            #~ my $past := Perl6::Pod::serialize_object(
                #~ 'Pod::FormattingCode',
                #~ :type(
                    #~ $*W.add_string_constant(~$<code>).compile_time_value
                #~ ),
                #~ :content(
                    #~ Perl6::Pod::serialize_array(@t).compile_time_value
                #~ )
            #~ );
            #~ make $past.compile_time_value;
        #~ }
    #~ }

    #~ method pod_string($/) {
        #~ $V5DEBUG && say("pod_string($/)");
        #~ my @content := [];
        #~ for $<pod_string_character> {
            #~ @content.push($_.ast)
        #~ }
        #~ make Perl6::Pod::build_pod_string(@content);
    #~ }

    #~ method pod_string_character($/) {
        #~ $V5DEBUG && say("pod_string_character($/)");
        #~ if $<pod_formatting_code> {
            #~ make $<pod_formatting_code>.ast
        #~ } else {
            #~ make ~$<char>;
        #~ }
    #~ }

    method table_row($/) {
        $V5DEBUG && say("table_row($/)");
        make ~$/
    }

    method unitstart($/) {
        $V5DEBUG && say("unitstart($/)");
        # Use SET_BLOCK_OUTER_CTX (inherited from HLL::Actions)
        # to set dynamic outer lexical context and namespace details
        # for the compilation unit.
        self.SET_BLOCK_OUTER_CTX($*UNIT_OUTER);
    }

    method statementlist($/) {
        $V5DEBUG && say("statementlist($/)");
        my $past := QAST::Stmts.new( :node($/) );
        if $<statement> {
            for $<statement>.list {
                my $ast := $_.ast;
                if $ast {
                    if $ast.ann('sink_past') {
                        $ast := QAST::Want.new($ast, 'v', $ast.ann('sink_past'));
                    }
                    elsif $ast.ann('bare_block') {
                        $ast := autosink($ast.ann('bare_block'));
                    }
                    else {
                        $ast := QAST::Stmt.new(autosink($ast), :returns($ast.returns)) if $ast ~~ QAST::Node;
                    }
                    $past.push( $ast );
                }
            }
        }
        if +$past.list < 1 {
            $past.push(QAST::Var.new(:name('Nil'), :scope('lexical')));
        }
        else {
            $past.returns($past.list[*-1].returns);
        }
        make $past;
    }

    method semilist($/) {
        $V5DEBUG && say("semilist($/)");
        my $past := QAST::Stmts.new( :node($/) );
        if $<statement> {
            for $<statement>.list { $past.push($_.ast) if $_.ast; }
        }
        unless +@($past) {
            $past.push( QAST::Op.new( :op('call'), :name('&infix:<,>') ) );
        }
        make $past;
    }

    method statement($/, $key?) {
        $V5DEBUG && say("statement($/, {$key // ''}?)");
        my $past;
        if $<EXPR> {
            my $mc = $<statement_mod_cond>;
            my $ml = $<statement_mod_loop>;
            $past  := $<EXPR>.ast;
            if $mc {
                $mc.ast.push($past);
                $mc.ast.push(QAST::Var.new(:name('Nil'), :scope('lexical')));
                $past := $mc.ast;
            }
            if $ml {
                my $cond := $ml<smexpr>.ast;
                if ~$ml<sym> eq 'given' {
                    $past := QAST::Op.new(
                        :op('call'),
                        make_topic_block_ref($past),
                        $cond
                    );
                }
                elsif ~$ml<sym> eq 'for' {
                    unless $past.ann('past_block') {
                        $past := make_topic_block_ref( $past,
                            :copy(nqp::istype($cond, QAST::Op) && ($cond.name eq '&keys' || $cond.name eq '&values')) );
                    }
                    $past := QAST::Op.new(
                            :op<callmethod>, :name<map>, :node($/),
                            QAST::Op.new(:op('call'), :name('&infix:<,>'), $cond),
                            block_closure($past)
                        );
                    $past := QAST::Op.new(
                        :op<callmethod>, :name<eager>, $past
                    );
                }
                else {
                    $past := QAST::Op.new($cond, $past, :op(~$ml<sym>), :node($/) );
                }
            }
        }
        elsif $<statement> {
            $past := $<statement>.ast;
        }
        elsif $<statement_control> {
            $past := $<statement_control>.ast;
        }
        else {
            $past := 0;
        }
        if $STATEMENT_PRINT && $past {
            $past := QAST::Stmts.new(:node($/),
                QAST::Op.new(
                    :op<say>,
                    QAST::SVal.new(:value(~$/))
                ),
                $past
            );
        }
        make $past;
    }

    method xblock($/) {
        $V5DEBUG && say("xblock($/)");
        make QAST::Op.new( :op('if'), QAST::Op.new( :op('call'), :name('&P5Bool'), $<EXPR>.ast),
                $<sblock>.ast, :node($/) );
    }

    sub add_param(Mu $block, @params, $name) {
        $V5DEBUG && say("add_param(\$block, $name)");
        if !$block.symbol($name) || $block.symbol($name)<for_variable> || $name eq '$_' {
            if $*IMPLICIT {
                @params.push({
                    :variable_name($name), :optional(1),
                    :nominal_type(find_symbol(['Mu'])),
                    :default_from_outer(1), :is_parcel(1),
                });
            }
            unless $block.symbol($name) {
                $block[0].push(QAST::Var.new( :name($name), :scope('lexical'), :decl('var') ));
            }
            $block.symbol($name, :scope('lexical'), :lazyinit($name eq '$_') );
        }
    }

    method sblock($/) {
        $V5DEBUG && say("sblock($/)");
        # Locate or build a set of parameters.
        my Mu $sig_info := nqp::hash();
        my @params;
        my Mu $block := $<blockoid>.ast;
        if $*IN_SORT {
            add_param($block, @params, '$a');
            add_param($block, @params, '$b');
        }
        elsif $*FOR_VARIABLE {
            add_param($block, @params, $*FOR_VARIABLE);
        }
        elsif $*IMPLICIT {
            add_param($block, @params, '$_');
        }
        nqp::bindkey($sig_info, 'parameters', nqp::gethllsym("nqp", "nqplist")(|@params));

        # Create signature object and set up binding.
        unless $*IN_SORT {
            for @params { $_<is_rw> := 1 }
        }
        set_default_parameter_type(@params, Mu);
        my $signature := create_signature_object($<signature>, $sig_info, $block);
        add_signature_binding_code($block, $signature, @params);

        # Add a slot for a $*DISPATCHER, and a call to take one.
        $block[0].push(QAST::Var.new( :name('$*DISPATCHER'), :scope('lexical'), :decl('var') ));
        $block[0].push(QAST::Op.new(
            :op('takedispatcher'),
            QAST::SVal.new( :value('$*DISPATCHER') )
        ));

        # We'll install PAST in current block so it gets capture_lex'd.
        # Then evaluate to a reference to the block (non-closure - higher
        # up stuff does that if it wants to).
        ($*W.cur_lexpad())[0].push(my $uninst := QAST::Stmts.new($block));
        $*W.attach_signature($*DECLARAND, $signature);
        $*W.finish_code_object($*DECLARAND, $block);
        my $ref := reference_to_code_object($*DECLARAND, $block);
        $ref.annotate('uninstall_if_immediately_used', $uninst);
        make $ref;
    }

    method block($/) {
        $V5DEBUG && say("block($/)");
        my $block := $<blockoid>.ast;
        if $block.ann('placeholder_sig') {
            my $name := $block.ann('placeholder_sig')<variable_name>;
            unless $name eq '%_' || $name eq '@_' {
                $name := nqp::concat(nqp::substr($name, 0, 1),
                        nqp::concat('^', nqp::substr($name, 1)));
            }

            throw( $/, <X Placeholder Block>,
                placeholder => $name,
            );
        }
        ($*W.cur_lexpad())[0].push(my $uninst := QAST::Stmts.new($block));
        $*W.attach_signature($*DECLARAND, $*W.create_signature(
            nqp::hash('parameters', nqp::gethllsym("nqp", "nqplist")())));
        $*W.finish_code_object($*DECLARAND, $block);
        my $ref := reference_to_code_object($*DECLARAND, $block);
        $ref.annotate('uninstall_if_immediately_used', $uninst);
        make $ref;
    }

    method blockoid($/) {
        $V5DEBUG && say("blockoid($/)");
        if $<statementlist> {
            my $past := $<statementlist>.ast;
            if %*HANDLERS {
                $past := QAST::Op.new( :op('handle'), $past );
                for %*HANDLERS {
                    $past.push($_.key);
                    $past.push($_.value);
                }
            }
            my $BLOCK := $*CURPAD;
            $BLOCK.push($past);
            $BLOCK.node($/);
            $BLOCK.annotate('handlers', %*HANDLERS) if %*HANDLERS;
            make $BLOCK;
        }
        else {
            if $*HAS_YOU_ARE_HERE {
                $/.CURSOR.panic('{YOU_ARE_HERE} may only appear once in a setting');
            }
            $*HAS_YOU_ARE_HERE := 1;
            make $<you_are_here>.ast;
        }
    }

    method newlex($/) {
        $V5DEBUG && say("newlex($/) $*IN_DECL");
        my Mu $new_block := $*W.cur_lexpad();
        $new_block.annotate('IN_DECL', $*IN_DECL);
    }

    method finishlex($/) {
        $V5DEBUG && say("finishlex($/)");
        # Generate the $_, $/, and $! lexicals for routines if they aren't
        # already declared. For blocks, $_ will come from the outer if it
        # isn't already declared.
        my $BLOCK := $*W.cur_lexpad();
        my $type := $BLOCK.ann('IN_DECL');
        if $type eq 'mainline' && %*COMPILING<%?OPTIONS><setting> eq 'NULL' {
            # Don't do anything in the case where we are in the mainline of
            # the setting; we don't have any symbols (Scalar, etc.) yet.
            return 1;
        }
        my $is_routine := $type eq 'sub' || $type eq 'method' ||
                          $type eq 'submethod' || $type eq 'mainline';
        if $is_routine {
            # Generate the lexical variable except if...
            #   (1) the block already has one, or
            #   (2) the variable is '$_' and $*IMPLICIT is set
            #       (this case gets handled by getsig)
            for <$_ $/ $!> {
                unless $BLOCK.symbol($_) || ($_ eq '$_' && $*IMPLICIT) {
                    $*W.install_lexical_magical($BLOCK, $_);
                }
            }
        }
        else {
            unless $BLOCK.symbol('$_') || $*IMPLICIT {
                $BLOCK[0].push(QAST::Op.new(
                    :op('bind'),
                    QAST::Var.new( :name('$_'), :scope('lexical'), :decl('var') ),
                    QAST::Op.new( :op('getlexouter'), QAST::SVal.new( :value('$_') ) )
                ));
                $BLOCK.symbol('$_', :scope('lexical'), :type(Mu));
            }
        }
    }


    ## Statement control
    sub if_statement($/) {
        my $count = +$<xblock> - 1;
        my $past := xblock_immediate( $<xblock>[$count].ast );
        # push the else block if any
        $past.push( $<else>
                    ?? pblock_immediate( $<else>.ast )
                    !!  QAST::Var.new(:name('Nil'), :scope('lexical'))
        );
        # build if/unless + elsif + else structure
        while $count > 0 {
            $count--;
            my $else := $past;
            $past := xblock_immediate( $<xblock>[$count].ast );
            $past.push($else);
        }
        $past;
    }

    method statement_control:sym<if>($/) {
        $V5DEBUG && say("statement_control:sym<if>($/)");
        make if_statement($/)
    }

    method statement_control:sym<unless>($/) {
        $V5DEBUG && say("statement_control:sym<unless>($/)");
        my $past := if_statement($/);
        $past.op('unless');
        make $past
    }

    method statement_control:sym<while>($/) {
        $V5DEBUG && say("statement_control:sym<while>($/)");
        my $past := xblock_immediate( $<xblock>.ast );
        $past.push( pblock_immediate( $<continue>.ast ) ) if $<continue>;
        $past.op(~$<sym>);
        make tweak_loop($past);
    }

    method statement_control:sym<until>($/) {
        $V5DEBUG && say("statement_control:sym<while>($/)");
        my $past := xblock_immediate( $<xblock>.ast );
        $past.push( pblock_immediate( $<continue>.ast ) ) if $<continue>;
        $past.op(~$<sym>);
        make tweak_loop($past);
    }

    method statement_control:sym<repeat>($/) {
        $V5DEBUG && say("statement_control:sym<repeat>($/)");
        my $op := 'repeat_' ~ ~$<wu>;
        my $past;
        if $<xblock> {
            $past := xblock_immediate( $<xblock>.ast );
            $past.op($op);
        }
        else {
            $past := QAST::Op.new( $<EXPR>.ast, pblock_immediate( $<sblock>.ast ),
                                   :op($op), :node($/) );
        }
        make tweak_loop($past);
    }

    method statement_control:sym<for>($/) {
        $V5DEBUG && say("statement_control:sym<for>($/)");
        if $<EXPR> {
            $V5DEBUG && say("statement_control:sym<for>($/) if");
            my $block := $<sblock>.ast;
            my $list := $<EXPR>.ast;
            if nqp::istype($list, QAST::Op) && ($list.name eq '&keys' || $list.name eq '&values') {
                $block := pblock_immediate($block);
                $block := make_topic_block_ref( $block, :copy(1), :name( $<variable> ?? $<variable>.ast.name !! '$_' ) );
            }
            my $past := QAST::Op.new(
                            :op<callmethod>, :name<map>, :node($/),
                            QAST::Op.new(:name('&infix:<,>'), :op('call'), $list),
                            block_closure($block)
            );
            $past := QAST::Op.new(
                :op<callmethod>, :name<eager>, $past
            );
            make $past;
        }
        else {
            $V5DEBUG && say("statement_control:sym<for>($/) else");
            # C-stye for loop
            my $block := pblock_immediate($<sblock>.ast);
            my $cond := $<e2>
                ?? QAST::Op.new(:op('call'), :name('&P5Bool'), $<e2>.ast)
                !! QAST::Var.new(:name<True>, :scope<lexical>);
            my $loop := QAST::Op.new( $cond, :op('while'), :node($/) );
            $loop.push($block);
            if $<e3> {
                $loop.push($<e3>.ast);
            }
            $loop := tweak_loop($loop);
            if $<e1> {
                $loop := QAST::Stmts.new( $<e1>.ast, $loop, :node($/) );
            }
            $loop := QAST::Op.new(
                :op<callmethod>, :name<eager>, $loop
            );
            make $loop;
        }
    }

    sub tweak_loop(Mu $loop is copy) {
        $V5DEBUG && say("tweak_loop(\$loop)");
        # Handle phasers.
        my $code := $loop[1].ann('code_object');
        my $block_type := find_symbol(['Block']);
        my $phasers := nqp::getattr($code, $block_type, '$!phasers');
        unless nqp::isnull($phasers) {
            if nqp::existskey($phasers, 'NEXT') {
                my $phascode := $*W.run_phasers_code($code, $block_type, 'NEXT');
                if +@($loop) == 2 {
                    $loop.push($phascode);
                }
                else {
                    $loop[2] := QAST::Stmts.new($phascode, $loop[2]);
                }
            }
            if nqp::existskey($phasers, 'FIRST') {
                $loop := QAST::Stmts.new(
                    QAST::Op.new( :op('p6setfirstflag'), QAST::WVal.new( :value($code) ) ),
                    $loop);
            }
            if nqp::existskey($phasers, 'LAST') {
                $loop := QAST::Stmts.new(
                    :resultchild(0),
                    $loop,
                    $*W.run_phasers_code($code, $block_type, 'LAST'));
            }
        }
        $loop
    }

    method statement_control:sym<import>($/) {
        $V5DEBUG && say("statement_control:sym<import>($/)");
        my $past := QAST::Var.new( :name('Nil'), :scope('lexical') );
        make $past;
    }

    method statement_control:sym<use>($/) {
        $V5DEBUG && say("statement_control:sym<use>($/)");
        my $past := $<statementlist>    ?? $<statementlist>.ast
                                        !! QAST::Var.new( :name('Nil'), :scope('lexical') );
        if $<statementlist> {
            $past := $<statementlist>.ast;
        }
        elsif $<version> {
            # TODO: replace this by code that doesn't always die with
            # a useless error message
#            my $i := -1;
#            for $<version><vnum>.list {
#                ++$i;
#                if $_ ne '*' && $_ < @MAX_PERL_VERSION[$i] {
#                    last;
#                } elsif $_ > @MAX_PERL_VERSION[$i] {
#                    my $mpv := nqp::join('.', @MAX_PERL_VERSION);
#                    $/.CURSOR.panic("Perl $<version> required--this is only v$mpv")
#                }
#            }
        }
        elsif $<module_name> {
            if ~$<module_name> eq 'fatal' {
                my $*SCOPE := 'my';
                declare_variable($/, QAST::Stmts.new(), '$', '*', 'FATAL', []);
                $past := QAST::Op.new(
                    :op('p6store'), :node($/),
                    QAST::Var.new( :name('$*FATAL'), :scope('lexical') ),
                    QAST::Op.new( :op('p6bool'), QAST::IVal.new( :value(1) ) )
                );
            }
            elsif ~$<module_name> eq 'FORBID_PIR' {
                $FORBID_PIR := 1;
            }
            elsif ~$<module_name> eq 'Devel::Trace' {
                $STATEMENT_PRINT := 1;
            }
        }
        make $past;
    }

    method statement_control:sym<no>($/) {
        $V5DEBUG && say("statement_control:sym<no>($/)");
        make QAST::Var.new( :name('Nil'), :scope('lexical') )
    }

    method statement_control:sym<require>($/) {
        $V5DEBUG && say("statement_control:sym<require>($/) module_name") if $<module_name>;
        $V5DEBUG && say("statement_control:sym<require>($/) file") if $<file>;
        $V5DEBUG && say("statement_control:sym<require>($/) EXPR") if $<EXPR>;
        my $past := QAST::Stmts.new(:node($/));

        if $<module_name> || $<file> {
            my $name_past := $<module_name>
                            ?? dissect_longname($<module_name><longname>).name_past()
                            !! $<file>.ast;
            my $opt_hash := QAST::Op.new( :op('hash'),
                QAST::SVal.new( :value('from') ),
                QAST::SVal.new( :value('Perl5') ) );
            my $op := QAST::Op.new(
                :op('callmethod'), :name('load_module'),
                QAST::Op.new( :op('getcurhllsym'),
                    QAST::SVal.new( :value('ModuleLoader') ) ),
                $name_past,
                $opt_hash,
                symbol_lookup(['GLOBAL'], $/),
            );
            if $<file> {
                $op.push( QAST::Op.new( :named<file>, :op<callmethod>, :name<Stringy>, $<file>.ast ) );
            }
            $past.push($op);

            if $<EXPR> {
                my $p6_arglist  := $*W.compile_time_evaluate($/, $<EXPR>.ast).list.eager;
                my $arglist     := nqp::getattr($p6_arglist, find_symbol(['List']), '$!items');
                my $lexpad      := $*W.cur_lexpad();
                my $*SCOPE      := 'my';
                my $import_past := QAST::Op.new(:node($/), :op<call>,
                                   :name<&REQUIRE_IMPORT>,
                                   $name_past);
                for $arglist.list {
                    my $symbol := nqp::unbox_s($_.Str());
                    throw($/, <X Redeclaration>, :$symbol)
                        if $lexpad.symbol($symbol);
                    declare_variable($/, $past,
                            nqp::substr($symbol, 0, 1), '', nqp::substr($symbol, 1),
                            []);
                    $import_past.push($*W.add_string_constant($symbol));
                }
                $past.push($import_past);
            }
        }

        $past.push(QAST::Var.new( :name('Nil'), :scope('lexical') ));

        make $past;
    }

    method statement_control:sym<given>($/) {
        $V5DEBUG && say("statement_control:sym<given>($/)");
        my $past := $<xblock>.ast;
        $past.push($past.shift); # swap [0] and [1] elements
        $past.op('call');
        make $past;
    }

    method statement_control:sym<when>($/) {
        $V5DEBUG && say("statement_control:sym<when>($/)");
        # Get hold of the smartmatch expression and the block.
        my $xblock := $<xblock>.ast;
        my $sm_exp := $xblock.shift;
        my $pblock := $xblock.shift;

        # Handle the smart-match.
        my $match_past := QAST::Op.new( :op('callmethod'), :name('ACCEPTS'),
            $sm_exp,
            QAST::Var.new( :name('$_'), :scope('lexical') )
        );

        # Use the smartmatch result as the condition for running the block,
        # and ensure continue/succeed handlers are in place and that a
        # succeed happens after the block.
        $pblock := pblock_immediate($pblock);
        make QAST::Op.new( :op('if'), :node( $/ ),
            $match_past, when_handler_helper($pblock)
        );
    }

    method statement_control:sym<default>($/) {
        $V5DEBUG && say("statement_control:sym<default>($/)");
        # We always execute this, so just need the block, however we also
        # want to make sure we succeed after running it.
        make when_handler_helper($<block>.ast);
    }

    method statement_prefix:sym<BEGIN>($/) {
        $V5DEBUG && say("statement_prefix:sym<BEGIN>($/)");
        make $*W.add_phaser($/, 'BEGIN', ($<sblock>.ast).ann('code_object'));
    }

    method statement_prefix:sym<UNITCHECK>($/) {
        $V5DEBUG && say("statement_prefix:sym<UNITCHECK>($/)");
        make $*W.add_phaser($/, 'UNITCHECK', ($<sblock>.ast).ann('code_object'));
    }

    method statement_prefix:sym<CHECK>($/) {
        $V5DEBUG && say("statement_prefix:sym<CHECK>($/)");
        make $*W.add_phaser($/, 'CHECK', ($<sblock>.ast).ann('code_object'));
    }

    method statement_prefix:sym<INIT>($/)  {
        $V5DEBUG && say("statement_prefix:sym<INIT>($/) ");
        make $*W.add_phaser($/, 'INIT', ($<sblock>.ast).ann('code_object'), ($<sblock>.ast).ann('past_block'));
    }

    method statement_prefix:sym<END>($/)   {
        $V5DEBUG && say("statement_prefix:sym<END>($/)  ");
        make $*W.add_phaser($/, 'END', ($<sblock>.ast).ann('code_object'));
    }

    method statement_prefix:sym<do>($/) {
        $V5DEBUG && say("statement_prefix:sym<do>($/)");
        if $<block> {
            make QAST::Op.new( :op('call'), $<block>.ast );
        }
        else {
            make QAST::Op.new( :op('call'), :name('&P5do'), $<EXPR>.ast );
        }
    }

    method statement_prefix:sym<eval>($/) {
        $V5DEBUG && say("statement_prefix:sym<eval>($/)");
        my $block := QAST::Op.new(:op<call>, $<block>.ast); # XXX should be immediate
        make QAST::Op.new(
            :op('handle'),

            # Success path puts Any into $! and evaluates to the block.
            QAST::Stmt.new(
                :resultchild(0),
                $block,
                QAST::Op.new(
                    :op('p6store'),
                    QAST::Var.new( :name<$!>, :scope<lexical> ),
                    QAST::Op.new( :op('callmethod'), :name('new'),
                        QAST::Var.new( :name<Str>, :scope<lexical> ) )
                )
            ),

            # On failure, capture the exception object into $!.
            'CATCH', QAST::Stmts.new(
                QAST::Op.new(
                    :op('p6store'),
                    QAST::Var.new(:name<$!>, :scope<lexical>),
                    QAST::Op.new( :op('callmethod'), :name('Stringy'),
                        QAST::Op.new(
                            :name<&EXCEPTION>, :op<call>,
                            QAST::Op.new( :op('exception') )
                    )),
                ),
                QAST::VM.new(
                    :parrot(QAST::VM.new(
                        pirop => 'perl6_invoke_catchhandler 1PP',
                        QAST::Op.new( :op('null') ),
                        QAST::Op.new( :op('exception') )
                    )),
                    :jvm(QAST::Op.new( :op('null') )),
                    :moar(QAST::Op.new( :op('null') )),
                ),
                QAST::WVal.new(
                    :value( find_symbol(['Nil']) ),
                ),
            )
        )
    }

    method statement_prefix:sym<try>($/) {
        $V5DEBUG && say("statement_prefix:sym<try>($/)");
        my $block := $<sblock>.ast;
        my $past;
        if $block.ann('past_block')<handlers> && $block.ann('past_block')<handlers><CATCH> {
            # we already have a CATCH block, nothing to do here
            $past := QAST::Op.new( :op('call'), $block );
        } else {
            $block := QAST::Op.new(:op<call>, $block); # XXX should be immediate
            $past := QAST::Op.new(
                :op('handle'),

                # Success path puts Any into $! and evaluates to the block.
                QAST::Stmt.new(
                    :resultchild(0),
                    $block,
                    QAST::Op.new(
                        :op('p6store'),
                        QAST::Var.new( :name<$!>, :scope<lexical> ),
                        QAST::Op.new( :op('callmethod'), :name('new'),
                            QAST::Var.new( :name<Str>, :scope<lexical> ) )
                    )
                ),

                # On failure, capture the exception object into $!.
                'CATCH', QAST::Stmts.new(
                    QAST::Op.new(
                        :op('p6store'),
                        QAST::Var.new(:name<$!>, :scope<lexical>),
                        QAST::Op.new( :op('callmethod'), :name('Stringy'),
                            QAST::Op.new(
                                :name<&EXCEPTION>, :op<call>,
                                QAST::Op.new( :op('exception') )
                        )),
                    ),
                    QAST::VM.new(
                        :parrot(QAST::VM.new(
                            pirop => 'perl6_invoke_catchhandler 1PP',
                            QAST::Op.new( :op('null') ),
                            QAST::Op.new( :op('exception') )
                        )),
                        :jvm(QAST::Op.new( :op('null') )),
                        :moar(QAST::Op.new( :op('null') )),
                    ),
                    QAST::WVal.new(
                        :value( find_symbol(['Nil']) ),
                    ),
                )
            );
        }
        make $past;
    }

    # Statement modifiers

    method modifier_expr($/) {
        $V5DEBUG && say("modifier_expr($/)"); make $<EXPR>.ast; }

    method statement_mod_cond:sym<if>($/)     {
        $V5DEBUG && say("statement_mod_cond:sym<if>($/)    ");
        make QAST::Op.new( :op<if>, QAST::Op.new( :op('call'), :name('&P5Bool'), $<modifier_expr>.ast ), :node($/) );
    }

    method statement_mod_cond:sym<unless>($/) {
        $V5DEBUG && say("statement_mod_cond:sym<unless>($/)");
        make QAST::Op.new( :op<unless>, QAST::Op.new( :op('call'), :name('&P5Bool'), $<modifier_expr>.ast ), :node($/) );
    }

    method statement_mod_cond:sym<when>($/) {
        $V5DEBUG && say("statement_mod_cond:sym<when>($/)");
        make QAST::Op.new( :op<if>,
            QAST::Op.new( :name('ACCEPTS'), :op('callmethod'),
                          $<modifier_expr>.ast,
                          QAST::Var.new( :name('$_'), :scope('lexical') ) ),
            :node($/)
        );
    }

    method statement_mod_loop:sym<while>($/)  {
        $V5DEBUG && say("statement_mod_loop:sym<while>($/) "); make $<smexpr>.ast; }
    method statement_mod_loop:sym<until>($/)  {
        $V5DEBUG && say("statement_mod_loop:sym<until>($/) "); make $<smexpr>.ast; }
    method statement_mod_loop:sym<for>($/)    {
        $V5DEBUG && say("statement_mod_loop:sym<for>($/)   "); make $<smexpr>.ast; }
    method statement_mod_loop:sym<given>($/)  {
        $V5DEBUG && say("statement_mod_loop:sym<given>($/) "); make $<smexpr>.ast; }

    ## Terms

    method term:sym<fatarrow>($/)           {
        $V5DEBUG && say("term:sym<fatarrow>($/)          "); make $<fatarrow>.ast; }
    method term:sym<variable>($/)           {
        $V5DEBUG && say("term:sym<variable>($/)");
        make $<variable>.ast;
    }
    method term:sym<package_declarator>($/) {
        $V5DEBUG && say("term:sym<package_declarator>($/)"); make $<package_declarator>.ast; }
    method term:sym<scope_declarator>($/)   {
        $V5DEBUG && say("term:sym<scope_declarator>($/)  "); make $<scope_declarator>.ast; }
    method term:sym<routine_declarator>($/) {
        $V5DEBUG && say("term:sym<routine_declarator>($/)"); make $<routine_declarator>.ast; }
    method term:sym<regex_declarator>($/)   {
        $V5DEBUG && say("term:sym<regex_declarator>($/)  "); make $<regex_declarator>.ast; }
    method term:sym<type_declarator>($/)    {
        $V5DEBUG && say("term:sym<type_declarator>($/)   "); make $<type_declarator>.ast; }
    method term:sym<circumfix>($/)          {
        $V5DEBUG && say("term:sym<circumfix>($/)         "); make $<circumfix>.ast; }
    method term:sym<statement_prefix>($/)   {
        $V5DEBUG && say("term:sym<statement_prefix>($/)  "); make $<statement_prefix>.ast; }
    method term:sym<value>($/)              {
        $V5DEBUG && say("term:sym<value>($/)             "); make $<value>.ast; }
    method term:sym<sigterm>($/)            {
        $V5DEBUG && say("term:sym<sigterm>($/)           "); make $<sigterm>.ast; }
    method term:sym<unquote>($/) {
        $V5DEBUG && say("term:sym<unquote>($/)");
        make QAST::Unquote.new(:position(+@*UNQUOTE_ASTS));
        @*UNQUOTE_ASTS.push($<statementlist>.ast);
    }

    method special_variable:sym<$0>($/) {
        $V5DEBUG && say("special_variable:sym<\$0>($/)");
        make QAST::Op.new( :op('call'), :name('&DYNAMIC'), $*W.add_string_constant('$*PROGRAM_NAME'))
    }

    method special_variable:sym<$!>($/) {
        $V5DEBUG && say("special_variable:sym<\$!>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<%!>($/) {
        $V5DEBUG && say("special_variable:sym<\%!>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$!{ }>($/) {
        $V5DEBUG && say("special_variable:sym<\$!\{ }>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$/>($/) {
        $V5DEBUG && say("special_variable:sym<\$/>($/)");
        make QAST::Op.new( :op('call'), :name('&DYNAMIC'), $*W.add_string_constant('$*INPUT_RECORD_SEPARATOR'))
    }

    method special_variable:sym<$~>($/) {
        $V5DEBUG && say("special_variable:sym<\$~>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$`>($/) {
        $V5DEBUG && say("special_variable:sym<\$`>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$@>($/) {
        $V5DEBUG && say("special_variable:sym<\$@>($/)");
        make QAST::Var.new( :name('$!'), :scope('lexical') )
    }

    method special_variable:sym<$#>($/) {
        $V5DEBUG && say("special_variable:sym<\$#>($/)");
        make QAST::Op.new( :op('die_s'), QAST::SVal.new( :value('$# is no longer supported' ) ) )
    }

    method special_variable:sym<$$>($/) {
        $V5DEBUG && say("special_variable:sym<\$\$>($/)");
        make make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }
    method special_variable:sym<$%>($/) {
        $V5DEBUG && say("special_variable:sym<\$%>($/)");
    }

    method special_variable:sym<$^X>($/) {
        $V5DEBUG && say("special_variable:sym<\$^X>($/)");
        make QAST::Var.new( :name($<sigil> ~ '^' ~ $<letter>), :scope('lexical') )
    }

    method special_variable:sym<$^>($/) {
        $V5DEBUG && say("special_variable:sym<\$^>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$&>($/) {
        $V5DEBUG && say("special_variable:sym<\$&>($/)");
        make QAST::Op.new( :op('call'), :name('&P5Str'), QAST::Var.new( :name('$/'), :scope('lexical') ) );
    }

    method special_variable:sym<$*>($/) {
        $V5DEBUG && say("special_variable:sym<\$*>($/)");
        make QAST::Op.new( :op('die_s'), QAST::SVal.new( :value('$* is no longer supported' ) ) )
    }

    method special_variable:sym<$(>($/) {
        $V5DEBUG && say("special_variable:sym<\$(>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$)>($/) {
        $V5DEBUG && say("special_variable:sym<\$)>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$->($/) {
        $V5DEBUG && say("special_variable:sym<\$->($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$=>($/) {
        $V5DEBUG && say("special_variable:sym<\$=>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<@+>($/) {
        $V5DEBUG && say("special_variable:sym<\@+>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<%+>($/) {
        $V5DEBUG && say("special_variable:sym<\%+>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$+[ ]>($/) {
        $V5DEBUG && say("special_variable:sym<\%+[ ]>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<@+[ ]>($/) {
        $V5DEBUG && say("special_variable:sym<\@+[ ]>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<@+{ }>($/) {
        $V5DEBUG && say("special_variable:sym<\@+{ }>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<@->($/) {
        $V5DEBUG && say("special_variable:sym<\@->($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<%->($/) {
        $V5DEBUG && say("special_variable:sym<\%->($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$-[ ]>($/) {
        $V5DEBUG && say("special_variable:sym<\$-[ ]>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<@-[ ]>($/) {
        $V5DEBUG && say("special_variable:sym<\@-[ ]>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<%-{ }>($/) {
        $V5DEBUG && say("special_variable:sym<\%-{ }>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$+>($/) {
        $V5DEBUG && say("special_variable:sym<\$+>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    # ${^WIN32_SLOPPY_STAT}, ${^MATCH}, ${^PREMATCH}, ${^RE_DEBUG_FLAGS}, ${^RE_TRIE_MAXBUF},
    # ${^CHILD_ERROR_NATIVE}, ${^WARNING_BITS}, ${^ENCODING}, ${^GLOBAL_PHASE}, ${^OPEN},
    # ${^TAINT}, ${^UNICODE}, ${^UTF8CACHE}, ${^UTF8LOCALE}
    method special_variable:sym<${^ }>($/) {
        $V5DEBUG && say("special_variable:sym<\$\{^ }>($/)");
        make QAST::Op.new( :op('call'), :name('&postcircumfix:<{ }>'),
                QAST::Var.new( :name('%*STASH'), :scope('lexical') ),
                QAST::SVal.new( :value(~$<text>) ) )
    }

    method special_variable:sym<::{ }>($/) {
        $V5DEBUG && say("special_variable:sym<::{ }>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$[>($/) {
        $V5DEBUG && say("special_variable:sym<\$[>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$\\>($/) {
        $V5DEBUG && say("special_variable:sym<\$\\>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$:>($/) {
        $V5DEBUG && say("special_variable:sym<\$:>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$'>($/) { #'
        $V5DEBUG && say("special_variable:sym<\$'>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$">($/) {
        $V5DEBUG && say("special_variable:sym<\$\">($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$,>($/) {
        $V5DEBUG && say("special_variable:sym<\$,>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym«\$<»($/) {
        $V5DEBUG && say("special_variable:sym<\$<>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym«\$>»($/) {
        $V5DEBUG && say("special_variable:sym<\$>>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method special_variable:sym<$.>($/) {
        $V5DEBUG && say("special_variable:sym<\$.>($/)");
        make QAST::Var.new( :name(~$<sym>), :scope('lexical') )
    }

    method name($/) {
        $V5DEBUG && say("name($/)"); }

    method fatarrow($/) {
        $V5DEBUG && say("fatarrow($/)");
        make QAST::Op.new( :op('call'), :name('&infix:<P5=>>'),  $*W.add_string_constant($<key>.Str), $<val>.ast);
    }

    method coloncircumfix($/) {
        $V5DEBUG && say("coloncircumfix($/)");
        make $<circumfix>
            ?? $<circumfix>.ast
            !! QAST::Var.new( :name('Nil'), :scope('lexical') );
    }

    sub make_pair(Mu $key_str, Mu $value) {
        $V5DEBUG && say("make_pair($key_str, $value)");
        my $key := $*W.add_string_constant($key_str);
        $key.named('key');
        $value.named('value');
        QAST::Op.new(
            :op('callmethod'), :name('new'), :returns(find_symbol(['Pair'])),
            QAST::Var.new( :name('Pair'), :scope('lexical') ),
            $key, $value
        )
    }

    method desigilname($/) {
        $V5DEBUG && say("desigilname($/)");
        if $<variable> {
            make QAST::Op.new( :op('callmethod'), $<variable>.ast );
        }
    }

    method variable($/) {
        $V5DEBUG && say("variable($/)");
        my $past;
        if $<index> {
            $past := QAST::Op.new( :op('call'), :name('&prefix:<P5.>'),
                QAST::Op.new( :op('call'), :name('&postcircumfix<P5[ ]>'),
                QAST::Var.new(:name('$/'), :scope('lexical')),
                $*W.add_constant('Int', 'int', +$<index> - 1),
            ) );
        }
        elsif $<postcircumfix> {
            $past := $<postcircumfix>.ast;
            $past.unshift( QAST::Var.new( :name('$/'), :scope('lexical') ) );
        }
        # ${x}
        elsif $<name> {
            $past := make_variable($/, [~$<sigil> ~ ~$<name>]);
        }
        # ${ }, @{ }, %{ }
        elsif $<block> {
            $past := $<block>.ast;
            my $name := ~$<sigil> eq '@' ?? 'list' !!
                        ~$<sigil> eq '%' ?? 'hash' !!
                                            'item';
            $past := QAST::Op.new( :op('callmethod'), :name($name),
                        QAST::Op.new( :op('call'), $past ) );
        }
        elsif $<semilist> {
            $past := $<semilist>.ast;
            my $name := ~$<sigil> eq '@' ?? 'list' !!
                        ~$<sigil> eq '%' ?? 'hash' !!
                                            'item';
            $past := QAST::Op.new( :op('callmethod'), :name($name), $past );
        }
        elsif $<infixish> {
            my $name := '&infix:<' ~ $<infixish>.Str ~ '>';
            $past := QAST::Op.new(
                :op('ifnull'),
                QAST::Var.new( :name($name), :scope('lexical') ),
                QAST::Op.new(
                    :op('die_s'),
                    QAST::SVal.new( :value("Could not find sub $name") )
                ));
        }
        # &routine( 1, 2)
        elsif $<arglist> {
            $past := $<arglist>.ast;
            if $<subname><desigilname><variable> {
                $past.name(~$<subname><desigilname><variable>);
            }
            elsif $*W.is_lexical('&' ~ $<subname>) || ($*ROUTINE_NAME && $<subname> eq $*ROUTINE_NAME) {
                $past.name('&' ~ $<subname>);
            }
            else {
                $past.unshift( self.make_indirect_lookup(['&' ~ $<subname>]) );
            }
        }
        # &routine
        elsif $<subname> {
            if $*W.is_lexical('&' ~ $<subname>) || ($*ROUTINE_NAME && $<subname> eq $*ROUTINE_NAME) {
                $past := QAST::Op.new( :op<call>, :name('&' ~ $<subname>) );
            }
            else {
                $past := QAST::Op.new( :op<call>, self.make_indirect_lookup(['&' ~ $<subname>]) );
            }
        }
        elsif $<desigilname><variable> {
            $past := $<desigilname>.ast;
            $past.name(~$<sigil> eq '@' ?? 'list' !!
                       ~$<sigil> eq '%' ?? 'hash' !!
                                           'item');
        }
        elsif $<special_variable> {
            $past := $<special_variable>.ast;
        }
        else {
            my $indirect;
            if $<desigilname> && $<desigilname><longname> -> $ln {
                if $ln eq 'INC' && ~$<sigil> eq '@'|'$#' && !$*W.is_lexical('@INC') {
                    $past := QAST::Op.new( :op('call'), :name('&postcircumfix:<{ }>'),
                        QAST::Op.new( :op('call'), :name('&DYNAMIC'), $*W.add_string_constant('%*CUSTOM_LIB') ),
                            QAST::SVal.new( :value<Perl5> )
                    )
                }
                else {
                    my $longname = dissect_longname($<desigilname><longname>);
                    if $longname.contains_indirect_lookup() {
                        if $*IN_DECL {
                            throw($/, <X Syntax Variable IndirectDeclaration>);
                        }
                        $past := self.make_indirect_lookup($longname.components(), ~$<sigil>);
                        $indirect := 1;
                    }
                    elsif $longname.get_who {
                        my $pkg := $longname.components.join('::');
                        $past := QAST::Op.new( :op('callmethod'), :name('new'),
                            QAST::WVal.new( :value(find_symbol(['Typeglob']) ) ),
                            QAST::WVal.new( :value(find_symbol([$pkg]) ), :named('value') )
                        )
                    }
                    elsif ~$<desigilname><longname> eq '::' {
                        $past := QAST::Op.new( :op('callmethod'), :name('new'),
                            QAST::WVal.new( :value(find_symbol(['Typeglob']) ) ),
                            QAST::WVal.new( :value(find_symbol(['GLOBAL']) ), :named('value') )
                        )
                    }
                    else {
                        $past := make_variable($/, $longname.variable_components(~$<sigil>, ''));
                    }
                }
            }
            else {
                $past := make_variable($/, [~$/]);
            }

            if ~$<sigil> eq '$#' {
                $past := QAST::Op.new( :op('callmethod'), :name('end'), $past, :node($/) );
            }
        }
        if $*IN_DECL eq 'variable' {
            $past.annotate('sink_ok', 1);
        }
        make $past;
    }

    sub make_variable($/, @name) {
        $V5DEBUG && say("make_variable($/, @name)");
        make_variable_from_parts($/, @name, $<sigil>.Str, $<desigilname>);
    }

    sub make_variable_from_parts($/, @name, $sigil, $desigilname) {
        $V5DEBUG && say("make_variable_from_parts($/, @name, $sigil, $desigilname)");
        my $past := QAST::Var.new( :name(@name[+@name - 1]), :node($/));
        if $past.name() eq '@_' || $past.name() eq '%_' {
            $past.scope('lexical');
        }
        elsif $past.name() eq '$?LINE' || $past.name eq '$?FILE' {
            if $*IN_DECL eq 'variable' {
                throw($/, <X Syntax Variable Twigil>,
                        twigil  => '?',
                        scope   => $*SCOPE,
                );
            }
            if $past.name() eq '$?LINE' {
                $past := $*W.add_constant('Int', 'int',
                        HLL::Compiler.lineof($/.orig, $/.from, :cache(1)));
            }
            else {
                $past := $*W.add_string_constant(nqp::getlexdyn('$?FILES') // '<unknown file>');
            }
        }
        elsif +@name > 1 {
            $past := symbol_lookup(@name, $/, :lvalue(1));
        }
        elsif $*IN_DECL ne 'variable' && (my $attr_alias := $*W.is_attr_alias($past.name)) {
            $past.name($attr_alias);
            $past.scope('attribute');
            $past.unshift(instantiated_type(['$?CLASS'], $/));
            $past.unshift(QAST::Var.new( :name('self'), :scope('lexical') ));
        }
        elsif $*IN_DECL ne 'variable' {
            # Expect variable to have been declared somewhere.
            # Locate descriptor and thus type.
            $past.scope('lexical');
            try {
                my $type := $*W.find_lexical_container_type($past.name);
                $past.returns($type);
            }

            # If it's a late-bound sub lookup, we may not find it, so be sure
            # to handle the case where the lookup comes back null.
            if $sigil eq '&' {
                $past := QAST::Op.new(
                    :op('ifnull'), $past,
                    QAST::Var.new(:name('Nil'), :scope('lexical')));
            }
            elsif $sigil eq '$#' {
                $past.name('@' ~ ~($desigilname || $<name>));
            }
        }
        $past
    }

    sub get_attribute_meta_object($/, $name) {
        unless nqp::can($*PACKAGE.HOW, 'get_attribute_for_usage') {
            $/.CURSOR.panic("Cannot understand $name in this context");
        }
        my $attr;
        my int $found = 0;
        try {
            $attr := $*PACKAGE.HOW.get_attribute_for_usage($*PACKAGE, $name);
            $found = 1;
        }
        unless $found {
            throw($/, <X Attribute Undeclared>,
                    symbol       => $name,
                    package-kind => $*PKGDECL,
                    package-name => $*PACKAGE.HOW.name($*PACKAGE),
                    what         => 'attribute',
            );
        }
        $attr
    }

    method package_declarator:sym<package>($/) {
        $V5DEBUG && say("package_declarator:sym<package>($/)"); make $<package_def>.ast; }

    method package_def($/) {
        $V5DEBUG && say("package_def($/)");
        # Get the body block PAST.
        my $block;
        if $<blockoid> {
            $block := $<blockoid>.ast;
        }
        else {
            $block := $*CURPAD;
            $block.push($<statementlist>.ast);
            $block.node($/);
        }
        $block.blocktype('immediate');

        # Compose.
        $*W.pkg_compose($*PACKAGE);

        # Make a code object for the block.
        $*W.create_code_object($block, 'Block',
            $*W.create_signature(nqp::hash('parameters', nqp::gethllsym("nqp", "nqplist")())));

        # Document
        #~ Perl6::Pod::document($/, $*PACKAGE, $*DOC);

        make QAST::Stmts.new(
            $block, QAST::WVal.new( :value($*PACKAGE) )
        );
    }

    method scope_declarator:sym<my>($/) {
        $V5DEBUG && say("scope_declarator:sym<my>($/)     ");
        make $<scoped>.ast;
    }

    method scope_declarator:sym<local>($/) {
        $V5DEBUG && say("scope_declarator:sym<local>($/)  ");
        make $<scoped>.ast;
    }

    method scope_declarator:sym<our>($/) {
        $V5DEBUG && say("scope_declarator:sym<our>($/)    ");
        make $<scoped>.ast;
    }

    method scope_declarator:sym<state>($/) {
        $V5DEBUG && say("scope_declarator:sym<state>($/)  ");
        make $<scoped>.ast;
    }

    method declarator($/) {
        $V5DEBUG && say("declarator($/)");
        if    $<routine_declarator>  { make $<routine_declarator>.ast  }
        elsif $<regex_declarator>    { make $<regex_declarator>.ast    }
        elsif $<type_declarator>     { make $<type_declarator>.ast     }
        elsif $<variable_declarator> {
            my $past := $<variable_declarator>.ast;
            if $<initializer> {
                my $orig_past := $past;
                if $*SCOPE eq 'has' {
                    if $<initializer><sym> eq '=' {
                        self.install_attr_init($<initializer>, $past.ann('metaattr'),
                            $<initializer>.ast, $*ATTR_INIT_BLOCK);
                    }
                    else {
                        $/.CURSOR.panic("Cannot use " ~ $<initializer><sym> ~
                            " to initialize an attribute");
                    }
                }
                elsif $<initializer><sym> eq '=' {
                    $past := assign_op($/, $past, $<initializer>.ast);
                }
                else {
                    $past := bind_op($/, $past, $<initializer>.ast,
                        $<initializer><sym> eq '::=');
                }
                if $*SCOPE eq 'state' {
                    $past := QAST::Op.new( :op('if'),
                        QAST::Op.new( :op('p6stateinit') ),
                        $past,
                        $orig_past);
                    $past<nosink> := 1;
                }
            }
            make $past;
        }
        elsif $<signature> {
            # Go over the params and declare the variable defined
            # in them.
            my $list   := QAST::Op.new( :op('call'), :name('&infix:<,>') );
            my @params := $<signature>.ast<parameters>;
            for @params {
                if $_<variable_name> {
                    my $past := QAST::Var.new( :name($_<variable_name>) );
                    $past := declare_variable($/, $past, $_<sigil>, '',
                        $_<desigilname>, []);
                    unless $past.isa(QAST::Op) && $past.op eq 'null' {
                        $list.push($past);
                    }
                }
                else {
                    my %cont_info := container_type_info($/, $_<sigil> || '$', []);
                    $list.push($*W.build_container_past(
                        %cont_info,
                        $*W.create_container_descriptor(%cont_info<value_type>, 1, 'anon')));
                }
            }

            if $<initializer> {
                my $orig_list := $list;
                if $<initializer><sym> eq '=' {
                    $/.CURSOR.panic("Cannot assign to a list of 'has' scoped declarations")
                        if $*SCOPE eq 'has';
                    $list := assign_op($/, $list, $<initializer>.ast);
                }
                elsif $<initializer><sym> eq '.=' {
                    $/.CURSOR.panic("Cannot use .= initializer with a list of declarations");
                }
                else {
                    my %sig_info := $<signature>.ast;
                    my @params := %sig_info<parameters>;
                    set_default_parameter_type(@params, Mu);
                    my $signature := create_signature_object($/, %sig_info, $*W.cur_lexpad());
                    $list := QAST::Op.new(
                        :op('p6bindcaptosig'),
                        QAST::WVal.new( :value($signature) ),
                        QAST::Op.new(
                            :op('callmethod'), :name('Capture'),
                            $<initializer>.ast
                        )
                    );
                }
                if $*SCOPE eq 'state' {
                    $list := QAST::Op.new( :op('if'),
                        QAST::Op.new( :op('p6stateinit') ),
                        $list, $orig_list);
                }
            }

            make $list;
        }
        elsif $<identifier> {
            # 'my \foo' style declaration
            if $*SCOPE ne 'my' {
                throw($/, <X Comp NYI>,
                    feature => "$*SCOPE scoped term definitions (only 'my' is supported at the moment)");
            }
            my $name       :=  ~$<identifier>;
            my $cur_lexpad := $*W.cur_lexpad;
            if $cur_lexpad.symbol($name) {
                throw($/, <X Redeclaration>, symbol => $name);
            }
            if $*OFTYPE {
                my $type := $*OFTYPE.ast;
                $cur_lexpad[0].push(QAST::Var.new( :$name, :scope('lexical'),
                    :decl('var'), :returns($type) ));
                $cur_lexpad.symbol($name, :$type, :scope<lexical>);
                make QAST::Op.new(
                    :op<bind>,
                    QAST::Var.new(:$name, :scope<lexical>),
                    QAST::Op.new(
                        :op('p6bindassert'),
                        $<term_init>.ast,
                        QAST::WVal.new( :value($type) ),
                    )
                );
            }
            else {
                $cur_lexpad[0].push(QAST::Var.new(:$name, :scope('lexical'), :decl('var')));
                $cur_lexpad.symbol($name, :scope('lexical'));
                make QAST::Op.new(
                    :op<bind>,
                    QAST::Var.new(:$name, :scope<lexical>),
                    $<term_init>.ast
                );
                }
        }
        else {
            $/.CURSOR.panic('Unknown declarator type');
        }
    }

    method scoped($/) {
        $V5DEBUG && say("scoped($/)");
        make $<DECL>.ast;
    }

    method variable_declarator($/) {
        $V5DEBUG && say("variable_declarator($/)");
        my $past   := $<variable>.ast;
        my $sigil  := ~($<variable><sigil> // '');
        if $<variable><desigilname> {
            my $name := $sigil ~ ~$<variable><desigilname>;
            my $lex  := $*W.cur_lexpad();
            if $lex.symbol($name) -> $sym {
                unless $sym<for_variable> || $name eq '$_' {
                    $/.CURSOR.typed_worry('X::Redeclaration', symbol => $name);
                }
                make declare_variable($/, $past, $sigil, '', $<variable><desigilname> // '', $<trait>, $<semilist>);
            }
            elsif $lex.ann('also_uses') && $lex.ann('also_uses'){$name} {
                make QAST::Op.new( :op<call>, :name('&postcircumfix:<{ }>'),
                    QAST::Op.new( :op<who>,
                        QAST::Op.new( :op<call>, :name('&postcircumfix:<{ }>'),
                            QAST::Op.new( :op<callmethod>, :name<new>,
                                QAST::WVal.new( :value(PseudoStash) )
                            ),
                            QAST::SVal.new( :value<OUTER> )
                        )
                    ),
                    QAST::SVal.new( :value($name) )
                )
            }
            else {
                make declare_variable($/, $past, $sigil, '', $<variable><desigilname> // '', $<trait>, $<semilist>);
            }
        }
        else {
            make declare_variable($/, $past, $sigil, '', $<variable><desigilname> // '', $<trait>, $<semilist>);
        }
    }

    sub declare_variable($/, Mu $past is rw, $sigil, $twigil, $desigilname, $trait_list, $shape?) {
        my $name  := $sigil ~ $twigil ~ $desigilname;
        my $BLOCK := $*W.cur_lexpad();

        if $*SCOPE eq 'my' || $*SCOPE eq 'our' || $*SCOPE eq 'state' || $*SCOPE eq 'local' {
            my $package := $*PACKAGE;
            # Twigil handling.
            if $twigil eq '.' {
                add_lexical_accessor($/, $past, $desigilname, $*W.cur_lexpad());
                $name := $sigil ~ $desigilname;
            }
            elsif $twigil eq '!' {
                throw($/, <X Syntax Variable Twigil>,
                    twigil => $twigil,
                    scope  => $*SCOPE,
                );
            }
            if $*SCOPE eq 'our' {
                if $*OFTYPE {
                    $/.CURSOR.panic("Cannot put a type constraint on an 'our'-scoped variable");
                }
                elsif $shape {
                    $/.CURSOR.panic("Cannot put a shape on an 'our'-scoped variable");
                }
                elsif $desigilname eq '' {
                    $/.CURSOR.panic("Cannot have an anonymous 'our'-scoped variable");
                }
            }
            if $desigilname.substr(0, 2) eq '::' {
                if $*SCOPE eq 'my' {
                    $/.CURSOR.panic("\"my\" variable $name can't be in a package");
                }
                elsif $*SCOPE eq 'our' {
                    $/.CURSOR.panic("No package name allowed for variable $name in \"our\"");
                }
                $package := symbol_lookup(['GLOBAL'], $/)
            }

            # Create a container descriptor. Default to rw and set a
            # type if we have one; a trait may twiddle with that later.
            my %cont_info  := container_type_info($/, $sigil, $*OFTYPE ?? [$*OFTYPE.ast] !! [], $shape);
            my $descriptor := $*W.create_container_descriptor(%cont_info<value_type>, 1, $name);

            # Install the container.
            if $desigilname eq '' {
                $name := QAST::Node.unique('ANON_VAR_');
            }

            # If this variable has a lookup (getlexouter), replace it with a declaration.
            if $BLOCK.symbol($name) {
                my $i := 0;
                for @($BLOCK[0]) {
                    if nqp::istype($_, QAST::Op) && +@($_) == 2
                    && nqp::istype($_[0], QAST::Var) && $_[0].name eq $name
                    && nqp::istype($_[1], QAST::Op)  && $_[1].op   eq 'getlexouter' {
                        $BLOCK[0][$i] := QAST::Var.new( :$name, :scope('lexical'), :decl('var') );
                        last;
                    }
                    $i := $i + 1;
                }
            }

            $*W.install_lexical_container($BLOCK, $name, %cont_info, $descriptor,
                :scope($*SCOPE), :package($package));

            # Set scope and type on container, and if needed emit code to
            # reify a generic type.
            if $past.isa(QAST::Var) {
                $past.name($name);
                $past.scope('lexical');
                $past.returns(%cont_info<bind_constraint>);
                if %cont_info<bind_constraint>.HOW.archetypes.generic {
                    $past := QAST::Op.new(
                        :op('callmethod'), :name('instantiate_generic'),
                        QAST::Op.new( :op('p6var'), $past ),
                        QAST::Op.new( :op('curlexpad') ));
                }

                if $*SCOPE eq 'our' {
                    $BLOCK[0].push(QAST::Op.new(
                        :op('bind'),
                        $past,
                        symbol_lookup([$name], $/, :package_only(1), :lvalue(1))
                    ));
                }
            }
        }
        else {
            throw($/, <X Comp NYI>,
                feature => "$*SCOPE scoped variables");
        }

        return $past;
    }

    sub add_lexical_accessor($/, $var_past, $meth_name, $install_in) {
        # Generate and install code block for accessor.
        my $a_past := $*W.push_lexpad($/);
        $a_past.name($meth_name);
        $a_past.push($var_past);
        $*W.pop_lexpad();
        $install_in[0].push($a_past);

        # Produce a code object and install it.
        my $invocant_type := find_symbol([$*W.is_lexical('$?CLASS') ?? '$?CLASS' !! 'Mu']);
        my %sig_info := hash(parameters => []);
        my $code := methodize_block($/, $*W.stub_code_object('Method'),
            $a_past, %sig_info, $invocant_type);
        install_method($/, $meth_name, 'has', $code, $install_in);
    }

    method routine_declarator($/) {
        $V5DEBUG && say("routine_declarator($/)"); make $<routine_def>.ast; }

    method routine_def($/) {
        $V5DEBUG && say("routine_def($/)");
        unless $<blockoid> {
            return make QAST::Var.new( :name<Nil>, :scope<lexical>, :node($/) );
        }
        my $block := $<blockoid>.ast;
        $block.blocktype('declaration');
        if is_clearly_returnless($block) {
            unless nqp::objprimspec($block[1].returns) {
                $block[1] := QAST::Op.new(
                    :op('p6decontrv'),
                    QAST::WVal.new( :value($*DECLARAND) ),
                    $block[1]);
            }
            $block[1] := QAST::Op.new(
                :op('p6typecheckrv'),
                $block[1],
                QAST::WVal.new( :value($*DECLARAND) ));
        }
        else {
            nqp::bindpos($block, 1, wrap_return_handler($block[1]));
        }

        # Add an slurpy @_ parameter by default.
        my %sig_info;
        %sig_info<parameters> = [];
        my @params := %sig_info<parameters>;

        my $param_name := '@_';
        %sig_info<parameters>.push( {
            variable_name => $param_name,
            pos_slurpy    => 1,
            named_slurpy  => 0,
            sigil         => '@'
        } );

        # Add variable declaration, and evaluate to a lookup of it.
        unless $block.symbol($param_name) {
            $block[0].push(QAST::Var.new( :name($param_name), :scope('lexical'), :decl('var') ));
        }
        $block.symbol($param_name, :scope('lexical'), :placeholder_parameter(0));

        set_default_parameter_type(@params, Any);
        my $signature := create_signature_object($/, %sig_info, $block);
        add_signature_binding_code($block, $signature, @params);

        # Needs a slot that can hold a (potentially unvivified) dispatcher;
        $block[0].push(QAST::Var.new( :name('$*DISPATCHER'), :scope('lexical'), :decl('var') ));
        $block[0].push(QAST::Op.new( :op('takedispatcher'),
            QAST::SVal.new( :value('$*DISPATCHER') )
        ));

        # Set name.
        if $<deflongname> {
            $block.name(~$<deflongname>.ast);
        }

        # Finish code object, associating it with the routine body.
        my $code := $*DECLARAND;
        $*W.attach_signature($code, $signature);
        $*W.finish_code_object($code, $block, $*MULTINESS eq 'proto', :yada(is_yada($/)));

        # Install PAST block so that it gets capture_lex'd correctly and also
        # install it in the lexpad.
        my $outer := $*W.cur_lexpad();
        $outer[0].push(QAST::Stmt.new($block));

        # Install &?ROUTINE.
        $*W.install_lexical_symbol($block, '&?ROUTINE', $code);

        if $<deflongname> {
            # If it's a multi, need to associate it with the surrounding
            # proto.
            my $name := '&' ~ ~$<deflongname>.ast;
            # Install.
            if $outer.symbol($name) {
                throw($/, <X Redeclaration>,
                        symbol => ~$<deflongname>.ast,
                        what   => 'routine',
                );
            }

            install_method($/, ~$<deflongname>.ast, $*SCOPE, $code, $outer, :private(0));

            # Install in lexpad and in package, and set up code to
            # re-bind it per invocation of its outer.
            $*W.install_lexical_symbol($outer, $name, $code, :clone(1));
            $*W.install_package_symbol($*PACKAGE, $name, $code);
            $outer[0].push(QAST::Op.new(
                :op('bindkey'),
                QAST::Op.new( :op('who'), QAST::WVal.new( :value($*PACKAGE) ) ),
                QAST::SVal.new( :value($name) ),
                QAST::Var.new( :name($name), :scope('lexical') )
            ));

            # Add inlining information if it's inlinable.
            self.add_inlining_info_if_possible($/, $code, $block, @params);

            #~ # implicit 'is export' trait, maybe for 'use Exporter' later?
            #~ $outer[0].push( QAST::Op.new( :op('call'), :name('&EXPORT_SYMBOL'),
                #~ QAST::SVal.new( :value(~$name) ),
                #~ QAST::Op.new( :op('callmethod'), :name('new'),
                    #~ QAST::WVal.new( :value(find_symbol('Array')),
                        #~ QAST::SVal.new( :value('ALL') ),
                        #~ QAST::SVal.new( :value('DEFAULT') ),
                #~ ) ),
                #~ QAST::Var.new( :name($name), :scope('lexical') )
            #~ ) );
        }

        # Apply traits.
        for $<trait>.list -> $t {
            if $t.ast { $*W.ex-handle($t, { ($t.ast)($code) }) }
        }

        my $closure := block_closure(reference_to_code_object($code, $block));
        $closure.annotate('sink_past', QAST::Op.new( :op('null') ));
        # an anonymous sub can be called already
        if $<arglist><arg>[0]<EXPR> {
            make QAST::Op.new( :op('call'), $closure, $<arglist><arg>[0]<EXPR>.ast );
        }
        elsif $<arglist> {
            make QAST::Op.new( :op('call'), $closure );
        }
        else {
            make $closure;
        }
    }

    method autogenerate_proto($/, $name, $install_in) {
        $V5DEBUG && say("autogenerate_proto($/, $name, $install_in)");
        my $p_past := $*W.push_lexpad($/);
        $p_past.name(~$name);
        $p_past.push(QAST::Op.new( :op('p6multidispatch') ));
        $*W.pop_lexpad();
        $install_in.push(QAST::Stmt.new($p_past));
        my @p_params = { is_capture => 1, nominal_type => find_symbol(['Mu']) };
        my $p_sig := $*W.create_signature(nqp::hash('parameters', [$*W.create_parameter($/, @p_params[0])]));
        add_signature_binding_code($p_past, $p_sig, @p_params);
        my $code := $*W.create_code_object($p_past, 'Sub', $p_sig, 1);
        $*W.apply_trait($/, '&trait_mod:<is>', $code, :onlystar(1));
        $code
    }

    method add_inlining_info_if_possible($/, $code, Mu $past, @params) {
        $V5DEBUG && say("add_inlining_info_if_possible($/, \$code, \$past, \@params)");
        # Make sure the block has the common structure we expect
        # (decls then statements).
        return 0 unless +@($past) == 2;

        # Ensure all parameters are simple and build placeholders for
        # them.
        my %arg_placeholders;
        my int $arg_num = 0;
        for @params {
            return 0 if $_<optional> || $_<is_capture> || $_<pos_slurpy> ||
                $_<named_slurpy> || $_<pos_lol> || $_<bind_attr> ||
                $_<bind_accessor> || $_<nominal_generic> || $_<named_names> ||
                $_<type_captures> || $_<post_constraints>;
            %arg_placeholders{$_<variable_name>} :=
                QAST::InlinePlaceholder.new( :position($arg_num) );
            $arg_num = $arg_num + 1;
        }

        # Ensure nothing extra is declared.
        for @($past[0]) {
            if nqp::istype($_, QAST::Var) && $_.scope eq 'lexical' {
                my $name := $_.name;
                return 0 if $name ne '$*DISPATCHER' && $name ne '$_' &&
                    $name ne '$/' && $name ne '$!' && $name ne '&?ROUTINE' &&
                    !nqp::existskey(%arg_placeholders, $name);
            }
        }

        # If all is well, we try to build the QAST for inlining. This dies
        # if we fail.
        my $PseudoStash;
        try $PseudoStash := find_symbol(['PseudoStash']);
        sub clear_node(Mu $qast) {
            $qast.node(nqp::null());
            $qast
        }
        sub node_walker(Mu $node) {
            # Simple values are always fine; just return them as they are, modulo
            # removing any :node(...).
            if nqp::istype($node, QAST::IVal) || nqp::istype($node, QAST::SVal)
            || nqp::istype($node, QAST::NVal) {
                return $node.node ?? clear_node($node.shallow_clone()) !! $node;
            }

            # WVal is OK, though special case for PseudoStash usage (which means
            # we are doing funny lookup stuff).
            elsif nqp::istype($node, QAST::WVal) {
                if $node.value =:= $PseudoStash {
                    nqp::die("Routines using pseudo-stashes are not inlinable");
                }
                else {
                    return $node.node ?? clear_node($node.shallow_clone()) !! $node;
                }
            }

            # Operations need checking for their inlinability. If they are OK in
            # themselves, it comes down to the children.
            elsif nqp::istype($node, QAST::Op) {
                if nqp::getcomp('QAST').operations.is_inlinable('perl6', $node.op) {
                    my $replacement := $node.shallow_clone();
                    my int $i = 0;
                    my int $n = +@($node);
                    while $i < $n {
                        $replacement[$i] := node_walker($node[$i]);
                        $i = $i + 1;
                    }
                    return clear_node($replacement);
                }
                else {
                    nqp::die("Non-inlinable op '" ~ $node.op ~ "' encountered");
                }
            }

            # Variables are fine *if* they are arguments.
            elsif nqp::istype($node, QAST::Var) && ($node.scope eq 'lexical' || $node.scope eq '') {
                if nqp::existskey(%arg_placeholders, $node.name) {
                    my $replacement := %arg_placeholders{$node.name};
                    if $node.named || $node.flat {
                        $replacement := $replacement.shallow_clone();
                        if $node.named { $replacement.named($node.named) }
                        if $node.flat { $replacement.flat($node.flat) }
                    }
                    return $replacement;
                }
                else {
                    nqp::die("Cannot inline with non-argument variables");
                }
            }

            # Statements need to be cloned and then each of the nodes below them
            # visited.
            elsif nqp::istype($node, QAST::Stmt) || nqp::istype($node, QAST::Stmts) {
                my $replacement := $node.shallow_clone();
                my int $i = 0;
                my int $n = +@($node);
                while $i < $n {
                    $replacement[$i] := node_walker($node[$i]);
                    $i = $i + 1;
                }
                return clear_node($replacement);
            }

            # Want nodes need copying and every other child visiting.
            elsif nqp::istype($node, QAST::Want) {
                my $replacement := $node.shallow_clone();
                my int $i = 0;
                my int $n = +@($node);
                while $i < $n {
                    $replacement[$i] := node_walker($node[$i]);
                    $i = $i + 2;
                }
                return clear_node($replacement);
            }

            # Otherwise, we don't know what to do with it.
            else {
                nqp::die("Unhandled node type; won't inline");
            }
        };
        my $inline_info;
        try $inline_info := node_walker($past[1]);
        return 0 unless nqp::istype($inline_info, QAST::Node);

        # Attach inlining information.
        $*W.apply_trait($/, '&trait_mod:<is>', $code, inlinable => $inline_info)
    }

    sub methodize_block($/, $code is rw, Mu $past is rw, %sig_info, Mu $invocant_type, :$yada) {
        $V5DEBUG && say("sub methodize_block($/)");
        # Get signature and ensure it has an invocant and *%_.
        my @params := %sig_info<parameters>;
        if $past.ann('placeholder_sig') {
            $/.CURSOR.panic('Placeholder variables cannot be used in a method');
        }
        unless @params[0]<is_invocant> {
            @params.unshift({
                nominal_type => $invocant_type,
                is_invocant => 1,
                is_multi_invocant => 1
            });
        }
        unless @params[+@params - 1]<named_slurpy> {
            unless nqp::can($*PACKAGE.HOW, 'hidden') && $*PACKAGE.HOW.hidden($*PACKAGE) {
                @params.push({
                    variable_name => '%_',
                    nominal_type => find_symbol(['Mu']),
                    named_slurpy => 1,
                    is_multi_invocant => 1
                });
                $past[0].unshift(QAST::Var.new( :name('%_'), :scope('lexical'), :decl('var') ));
                $past.symbol('%_', :scope('lexical'));
            }
        }
        set_default_parameter_type(@params, Any);
        my $signature := create_signature_object($/, %sig_info, $past);
        add_signature_binding_code($past, $signature, @params);

        # Place to store invocant.
        $past[0].unshift(QAST::Var.new( :name('self'), :scope('lexical'), :decl('var') ));
        $past.symbol('self', :scope('lexical'));

        # Needs a slot to hold a multi or method dispatcher.
        $*W.install_lexical_symbol($past, '$*DISPATCHER', find_symbol(['MethodDispatcher']));
        $past[0].push(QAST::Op.new(
            :op('takedispatcher'),
            QAST::SVal.new( :value('$*DISPATCHER') )
        ));

        # Finish up code object.
        $*W.attach_signature($code, $signature);
        $*W.finish_code_object($code, $past, $*MULTINESS eq 'proto', :yada($yada));
        return $code;
    }

    # Installs a method into the various places it needs to go.
    sub install_method($/, $name, $scope, Mu $code, Mu $outer is rw, :$private) {
        $V5DEBUG && say("install_method($/, $name, $scope)");
        # Ensure that current package supports methods, and if so
        # add the method.
        my $meta_meth;
        if $private {
            if $*MULTINESS { $/.CURSOR.panic("Private multi-methods are not supported"); }
            $meta_meth := 'add_private_method';
        }
        else {
            $meta_meth := 'add_method';
        }
        if $scope ne 'anon' && nqp::can($*PACKAGE.HOW, $meta_meth) {
            $*W.pkg_add_method($/, $*PACKAGE, $meta_meth, $name, $code);
        }

        # May also need it in lexpad and/or package.
        if $*SCOPE eq 'my' {
            $*W.install_lexical_symbol($outer, '&' ~ $name, $code, :clone(1));
        }
        elsif $*SCOPE eq 'our' || $*SCOPE eq '' {
            $*W.install_lexical_symbol($outer, '&' ~ $name, $code, :clone(1));
            $*W.install_package_symbol($*PACKAGE, '&' ~ $name, $code);
        }
    }

    sub is_clearly_returnless(Mu $block) {
        sub returnless_past(Mu $past) {
            return 0 unless
                # It's a simple operation.
                nqp::istype($past, QAST::Op)
                    && nqp::getcomp('QAST').operations.is_inlinable('perl6', $past.op) ||
                # Just a variable lookup.
                nqp::istype($past, QAST::Var) ||
                # Just a QAST::Want
                nqp::istype($past, QAST::Want) ||
                # Just a primitive or world value.
                nqp::istype($past, QAST::WVal) ||
                nqp::istype($past, QAST::IVal) ||
                nqp::istype($past, QAST::NVal) ||
                nqp::istype($past, QAST::SVal);
            for @($past) {
                if nqp::istype($_, QAST::Node) {
                    if !returnless_past($_) {
                        return 0;
                    }
                }
            }
            1;
        }

        # Only analyse things with a single simple statement.
        if +$block[1].list == 1 && nqp::istype($block[1][0], QAST::Stmt) && +$block[1][0].list == 1 {
            # Ensure there's no nested blocks.
            for @($block[0]) {
                if nqp::istype($_, QAST::Block) { return 0; }
                if nqp::istype($_, QAST::Stmts) {
                    for @($_) {
                        if nqp::istype($_, QAST::Block) { return 0; }
                    }
                }
            }

            # Ensure that the PAST is whitelisted things.
            returnless_past($block[1][0][0])
        }
        elsif +$block[1].list == 1 && nqp::istype($block[1][0], QAST::WVal) {
            1
        }
        else {
            0
        }
    }

    sub is_yada($/) {
        if $<blockoid><statementlist> && +$<blockoid><statementlist><statement> == 1 {
            my $btxt := ~$<blockoid><statementlist><statement>[0];
            if $btxt.match(/^ \s* ['...'|'???'|'!!!'] \s* $/) {
                return 1;
            }
        }
        0
    }

    method onlystar($/) {
        $V5DEBUG && say("onlystar($/)");
        my $BLOCK := $*CURPAD;
        $BLOCK.push(QAST::Op.new( :op('p6multidispatch') ));
        $BLOCK.node($/);
        make $BLOCK;
    }

    method regex_def($/) {
        $V5DEBUG && say("regex_def($/)");
        my $coderef;
        my $name := ~%*RX<name>;

        my %sig_info := $<signature> ?? $<signature>.ast !! hash(parameters => []);
        if $*MULTINESS eq 'proto' {
#            unless $<onlystar> {
                $/.CURSOR.panic("Proto regex body must be \{*\} (or <*> or <...>, which are deprecated)");
#            }
            my $proto_body := QAST::Op.new(
                :op('callmethod'), :name('!protoregex'),
                QAST::Var.new( :name('self'), :scope('local') ),
                QAST::SVal.new( :value($name) ));
            $coderef := regex_coderef($/, $*DECLARAND, $proto_body, $*SCOPE, $name, %sig_info, $*CURPAD, $<trait>, :proto(1));
        } else {
            $coderef := regex_coderef($/, $*DECLARAND, $<nibble>.ast, $*SCOPE, $name, %sig_info, $*CURPAD, $<trait>);
        }

        # Install &?ROUTINE.
        $*W.install_lexical_symbol($*CURPAD, '&?ROUTINE', $*DECLARAND);

        # Return closure if not in sink context.
        my $closure := block_closure($coderef);
        $closure.annotate('sink_past', QAST::Op.new( :op('null') ));
        make $closure;
    }

    sub regex_coderef($/, $code is rw, Mu $qast is rw, $scope, $name, %sig_info, Mu $block is rw, $traits?, :$proto, :$use_outer_match) {
        # create a code reference from a regex qast tree
        my $past;
        if $proto {
            $block[1] := $qast;
            $past := $block;
        }
        else {
            $block[0].push(QAST::Var.new(:name<$¢>, :scope<lexical>, :decl('var')));
            $block.symbol('$¢', :scope<lexical>);
            unless $use_outer_match {
                $*W.install_lexical_magical($block, '$/');
            }
            $past := %*LANG<P5Regex-actions>.qbuildsub($qast, $block, code_obj => $code)
        }
        $past.name($name);
        $past.blocktype("declaration");

        # Install a $?REGEX (mostly for the benefit of <~~>).
        $block[0].push(QAST::Op.new(
            :op('bind'),
            QAST::Var.new(:name<$?REGEX>, :scope<lexical>, :decl('var')),
            QAST::Op.new(
                :op('getcodeobj'),
                QAST::Op.new( :op('curcode') )
            )));
        $block.symbol('$?REGEX', :scope<lexical>);

        # Do the various tasks to turn the block into a method code object.
        my $inv_type  := find_symbol([ # XXX Maybe Cursor below, not Mu...
            $name && $*W.is_lexical('$?CLASS') ?? '$?CLASS' !! 'Mu']);
        methodize_block($/, $code, $past, %sig_info, $inv_type);

        # Need to put self into a register for the regex engine.
        $past[0].push(QAST::Op.new(
            :op('bind'),
            QAST::Var.new( :name('self'), :scope('local'), :decl('var') ),
            QAST::Var.new( :name('self'), :scope('lexical') )));

        # Install PAST block so that it gets capture_lex'd correctly.
        my $outer := $*W.cur_lexpad();
        $outer[0].push($past);

        # Apply traits.
        if $traits {
            for $traits.list {
                if $_.ast { ($_.ast)($code) }
            }
        }

        # Install in needed scopes.
        install_method($/, $name, $scope, $code, $outer) if $name ne '';

        # Return a reference to the code object
        reference_to_code_object($code, $past);
    }

    method initializer:sym<=>($/) {
        $V5DEBUG && say("initializer:sym<=>($/)");
        make $<EXPR>.ast;
    }

    method parensig($/) {
        make $<signature>.ast;
    }

    method signature($/) {
        $V5DEBUG && say("signature($/)");
        # Fix up parameters with flags according to the separators.
        # TODO: Handle $<typename>, which contains the return type declared
        # with the --> syntax.
        my %signature;
        my @parameter_infos;
        my int $multi_invocant = 1;
        if $*PROTOTYPE {
            # XXX translate things like '$;@' to a perl6 signature
        }
        else {
            for $/[0].list {
                if $_<variable_declarator> {
                    my $v := $_<variable_declarator>;
                    @parameter_infos.push({
                        variable_name     => ~$v<variable>,
                        sigil             => ~$v<variable><sigil>,
                        desigilname       => ~$v<variable><desigilname>,
                        is_multi_invocant => $multi_invocant,
                    });
                }
                else {
                    @parameter_infos.push({
                        variable_name     => '',
                        sigil             => '$',
                        desigilname       => '',
                        is_multi_invocant => $multi_invocant,
                    });
                }
            }
        }
        %signature<parameters> := @parameter_infos;
        if $<typename> {
            %signature<returns> := $<typename>.ast;
        }

        # Mark current block as having a signature.
        $*W.mark_cur_lexpad_signatured();

        # Result is set of parameter descriptors.
        make %signature;
    }

    method parameter($/) {
        $V5DEBUG && say("parameter($/)");
        # Sanity checks.
        my $quant := $<quant>;
        if $<default_value> {
            my $name := %*PARAM_INFO<variable_name> // '';
            if $quant eq '*' {
                $/.CURSOR.typed_sorry('X::Parameter::Default', how => 'slurpy',
                            parameter => $name);
            }
            if $quant eq '!' {
                $/.CURSOR.typed_sorry('X::Parameter::Default', how => 'required',
                            parameter => $name);
            }
            my $val := $<default_value>.ast;
            if $val.has_compile_time_value {
                %*PARAM_INFO<default_value> := $val.compile_time_value;
                %*PARAM_INFO<default_is_literal> := 1;
            }
            else {
                %*PARAM_INFO<default_value> :=
                    $*W.create_thunk($<default_value>, $val);
            }
        }

        # Set up various flags.
        %*PARAM_INFO<pos_slurpy>   := $quant eq '*' && %*PARAM_INFO<sigil> eq '@';
        %*PARAM_INFO<pos_lol>      := $quant eq '**' && %*PARAM_INFO<sigil> eq '@';
        %*PARAM_INFO<named_slurpy> := $quant eq '*' && %*PARAM_INFO<sigil> eq '%';
        %*PARAM_INFO<optional>     := $quant eq '?' || $<default_value> || ($<named_param> && $quant ne '!');
        %*PARAM_INFO<is_parcel>    := $quant eq '\\';
        %*PARAM_INFO<is_capture>   := $quant eq '|';

        # Stash any traits.
        %*PARAM_INFO<traits> := $<trait>;

        # Result is the parameter info hash.
        make %*PARAM_INFO;
    }

    method param_var($/) {
        $V5DEBUG && say("param_var($/)");
        if $<signature> {
            if nqp::existskey(%*PARAM_INFO, 'sub_signature_params') {
                $/.CURSOR.panic('Cannot have more than one sub-signature for a parameter');
            }
            %*PARAM_INFO<sub_signature_params> := $<signature>.ast;
            if nqp::substr(~$/, 0, 1) eq '[' {
                %*PARAM_INFO<sigil> := '@';
                %*PARAM_INFO<nominal_type> := find_symbol(['Positional']);
            }
        }
        else {
            # Set name, if there is one.
            if $<name> {
                %*PARAM_INFO<variable_name> := ~$/;
                %*PARAM_INFO<desigilname> := ~$<name>;
            }
            %*PARAM_INFO<sigil> := my $sigil := ~$<sigil>;

            # Depending on sigil, use appropriate role.
            my int $need_role;
            my $role_type;
            if $sigil eq '@' {
                $role_type := find_symbol(['Positional']);
                $need_role  = 1;
            }
            elsif $sigil eq '%' {
                $role_type := find_symbol(['Associative']);
                $need_role  = 1;
            }
            elsif $sigil eq '&' {
                $role_type := find_symbol(['Callable']);
                $need_role  = 1;
            }
            if $need_role {
                if nqp::existskey(%*PARAM_INFO, 'nominal_type') {
                    %*PARAM_INFO<nominal_type> := $*W.parameterize_type_with_args(
                        $role_type, [%*PARAM_INFO<nominal_type>], nqp::hash());
                }
                else {
                    %*PARAM_INFO<nominal_type> := $role_type;
                }
            }

            # Handle twigil.
            my $twigil := $<twigil> ?? ~$<twigil> !! '';
            %*PARAM_INFO<twigil> := $twigil;
            if $twigil eq '' || $twigil eq '*' {
                # Need to add the name.
                if $<name> {
                    self.declare_param($/, ~$/);
                }
            }
            elsif $twigil eq '!' {
                %*PARAM_INFO<bind_attr> := 1;
                %*PARAM_INFO<attr_package> := $*PACKAGE;
            }
            elsif $twigil eq '.' {
                %*PARAM_INFO<bind_accessor> := 1;
                if $<name> {
                    %*PARAM_INFO<variable_name> := ~$<name>;
                }
                else {
                    $/.CURSOR.panic('Cannot declare $. parameter in signature without an accessor name');
                }
            }
            else {
                if $twigil eq ':' {
                    $/.CURSOR.typed_sorry('X::Parameter::Placeholder',
                        parameter => ~$/,
                        right     => ':' ~ $<sigil> ~ ~$<name>,
                    );
                }
                else {
                    $/.CURSOR.typed_sorry('X::Parameter::Twigil',
                        parameter => ~$/,
                        twigil    => $twigil,
                    );
                }
            }
        }
    }

    method declare_param($/, $name) {
        $V5DEBUG && say("declare_param($/, $name)");
        my $cur_pad := $*W.cur_lexpad();
        if $cur_pad.symbol($name) {
            throw($/, <X Redeclaration>, symbol => $name);
        }
        if nqp::existskey(%*PARAM_INFO, 'nominal_type') {
            $cur_pad[0].push(QAST::Var.new( :$name, :scope('lexical'),
                :decl('var'), :returns(%*PARAM_INFO<nominal_type>) ));
            %*PARAM_INFO<container_descriptor> := $*W.create_container_descriptor(
                %*PARAM_INFO<nominal_type>, 0, %*PARAM_INFO<variable_name>);
            $cur_pad.symbol(%*PARAM_INFO<variable_name>, :descriptor(%*PARAM_INFO<container_descriptor>),
                :type(%*PARAM_INFO<nominal_type>));
        } else {
            $cur_pad[0].push(QAST::Var.new( :name(~$/), :scope('lexical'), :decl('var') ));
        }
        $cur_pad.symbol($name, :scope('lexical'));
    }

    method named_param($/) {
        $V5DEBUG && say("named_param($/)");
        %*PARAM_INFO<named_names> := %*PARAM_INFO<named_names> || [];
        if $<name>               { %*PARAM_INFO<named_names>.push(~$<name>); }
        elsif $<param_var><name> { %*PARAM_INFO<named_names>.push(~$<param_var><name>); }
        else                     { %*PARAM_INFO<named_names>.push(''); }
    }

    method defterm($/) {
        $V5DEBUG && say("defterm($/)");
        my $name := ~$<identifier>;
        %*PARAM_INFO<variable_name> := $name;
        %*PARAM_INFO<desigilname>   := $name;
        %*PARAM_INFO<sigil>         := '';
        self.declare_param($/, $name);
    }

    method default_value($/) {
        $V5DEBUG && say("default_value($/)");
        make $<EXPR>.ast;
    }

    # Sets the default parameter type for a signature.
    sub set_default_parameter_type(@parameter_infos, Mu $type) {
        for @parameter_infos.kv -> $i, $_ is rw {
            #~ my $p := nqp::decont($_);
            #~ my $p := $_;
            #~ unless nqp::existskey($p, 'nominal_type') {
            unless $_<nominal_type> {
                #~ nqp::bindkey(@parameter_infos[$i], 'nominal_type', $type);
                $_<nominal_type> := $type;
            }
            #~ if nqp::existskey($p, 'sub_signature_params') {
            #~ if $p<sub_signature_params> {
                #~ set_default_parameter_type(@parameter_infos[$i]<sub_signature_params><parameters>, $type);
            #~ }
            #~ @parameter_infos[$i] := hash($p);
        }
    }

    # Create Parameter objects, along with container descriptors
    # if needed. Parameters will be bound into the specified
    # lexpad.
    sub create_signature_object($/, %signature_info, Mu $lexpad, :$no_attr_check) {
        my $parameters := nqp::gethllsym("nqp", "nqplist")();
        my %seen_names;
        for %signature_info<parameters>.list {
            my $p := hash(|nqp::decont($_));
            # Check we don't have duplicated named parameter names.
            if $_<named_names> {
                for $_<named_names>.list {
                    if %seen_names{$_} {
                        throw($/, <X Signature NameClash>,
                            name => $_
                        );
                    }
                    %seen_names{$_} := 1;
                }
            }

            # If it's !-twigil'd, ensure the attribute it mentions exists unless
            # we're in a context where we should not do that.
            if $_<bind_attr> && !$no_attr_check {
                get_attribute_meta_object($/, $_<variable_name>);
            }

            # If we have a sub-signature, create that.
            if $_<sub_signature_params> {
                nqp::bindkey($p, 'sub_signature', create_signature_object($/, $_<sub_signature_params>, $lexpad));
            }

            # Add variable as needed.
            if $_<variable_name> {
                my %sym := $lexpad.symbol($_<variable_name>);
                if +%sym && !nqp::existskey(%sym, 'descriptor') {
                    nqp::bindkey($p, 'container_descriptor', $*W.create_container_descriptor(
                        $_<nominal_type>, $_<is_rw> ?? 1 !! 0, $_<variable_name>));
                    $lexpad.symbol($_<variable_name>, :descriptor($p<container_descriptor>));
                }
            }

            # Create parameter object and apply any traits.
            my Mu $param_obj := $*W.create_parameter($/, $p);
            if $_<traits> {
                for $_<traits>.list {
                    ($_.ast)($param_obj) if $_.ast;
                }
            }

            # Add it to the signature.
            nqp::push($parameters, $param_obj);
        }
        nqp::bindkey(%signature_info, 'parameters', $parameters);
        $*W.create_signature(%signature_info) # XXX use a Perl 6 Hash and then pass along its $!storage.
    }

    method trait($/) {
        $V5DEBUG && say("trait($/)");
        for $<identifier>.list {
            my %arg;
            %arg{~$_} := find_symbol(['Bool', 'True']);
            make -> $declarand, *%additional {
                $*W.apply_trait($/, '&trait_mod:<is>', $declarand, |%arg, |%additional);
            };
        }
    }

    method postop($/) {
        $V5DEBUG && say("postop($/)");
        make $<postfix> ?? $<postfix>.ast !! $<postcircumfix>.ast;
    }

    method dotty:sym«->»($/)   { $V5DEBUG && say("dotty:sym«->»($/)");   make $<dottyop>.ast; }
    method postfix:sym«->»($/) { $V5DEBUG && say("postfix:sym«->»($/)"); make $<dottyop>.ast; }

    method dottyop($/) {
        $V5DEBUG && say("dottyop($/)");
        if $<methodop> {
            make $<methodop>.ast;
        } else {
            make $<postcircumfix>.ast;
        }
    }

    method methodop($/) {
        $V5DEBUG && say("methodop($/)");
        my $past := $<args> ?? $<args>.ast !! QAST::Op.new( :node($/) );
        $past.op('callmethod');
        if $<longname> {
            # May just be .foo, but could also be .Foo::bar. Also handle the
            # macro-ish cases.
            my @parts := dissect_longname($<longname>).components();
            my $name := @parts.pop;
            if +@parts {
                $past.unshift(symbol_lookup(@parts, $/));
                $past.unshift($*W.add_string_constant($name));
                $past.name('dispatch:<::>');
            }
            elsif $name eq 'can' {
                $past.name('&P5can');
                $past.op('call');
            }
            elsif $name eq 'isa' {
                $past.name('&P5isa');
                $past.op('call');
            }
            elsif $name eq 'WHAT' {
                whine_if_args($/, $past, $name);
                $past.op('what');
            }
            elsif $name eq 'HOW' {
                whine_if_args($/, $past, $name);
                $past.op('how');
            }
            elsif $name eq 'WHO' {
                whine_if_args($/, $past, $name);
                $past.op('who');
            }
            elsif $name eq 'VAR' {
                whine_if_args($/, $past, $name);
                $past.op('p6var');
            }
            elsif $name eq 'REPR' {
                whine_if_args($/, $past, $name);
                $past.op('p6reprname');
            }
            elsif $name eq 'DEFINITE' {
                whine_if_args($/, $past, $name);
                $past.op('p6definite');
            }
            else {
                $past.name( $name );
            }
        }
        elsif $<quote> {
            $past.unshift(
                QAST::Op.new(
                    :op<unbox_s>,
                    $<quote>.ast
                )
            );
        }
        elsif $<variable> {
            $past.unshift($<variable>.ast);
            $past.name('dispatch:<var>');
        }
        make $past;
    }

    sub whine_if_args($/, Mu $past, $name) {
        if +@($past) > 0 {
           throw($/, <X Syntax Argument MOPMacro>, macro => $name);
        }
    }

    method term:sym<now>($/) {
        $V5DEBUG && say("term:sym<now>($/)");
        make QAST::Op.new( :op('call'), :name('&term:<now>'), :node($/) );
    }

    #~ method term:sym<time>($/) {
        #~ $V5DEBUG && say("term:sym<time>($/)");
        #~ make QAST::Op.new( :op('call'), :name('&term:<time>'), :node($/) );
    #~ }

    sub expr_or_topic( $/ ) {
        QAST::Op.new( :op('if'),
            # condition
            QAST::Op.new( :op('callmethod'), :name('Bool'),
                $<EXPR> ?? $<EXPR>.ast
                        !! QAST::Var.new( :name('$_'), :scope('lexical') ) ),
            # when true
            $<EXPR> ?? $<EXPR>.ast
                    !! QAST::Var.new( :name('$_'), :scope('lexical') ),
            # else
            QAST::SVal.new( :value("") )
            #~ QAST::Op.new( :op('callmethod'), :name('new'), :returns(find_symbol(['Str'])),
                #~ QAST::Var.new( :name('Str'), :scope('lexical') ) )
        )
    }

    sub call_expr_or_topic( $/, $name ) {
        QAST::Op.new( :op('callmethod'), :$name,
            # like: $string // Str.new
            expr_or_topic( $/ )
        );

        #~ QAST::Op.new(
                    #~ :op('callmethod'), :$name,
                    #~ $<EXPR> ?? $<EXPR>.ast
                            #~ !! QAST::Var.new( :name('$_'), :scope('lexical') ) );
    }

    method term:sym<chop>($/) {
        $V5DEBUG && say("term:sym<chop>($/)");
        my $exorto     := QAST::Node.unique('exorto');
        my $chopped    := QAST::Node.unique('chopped');
        my $chopped_of := QAST::Node.unique('chopped_of');

        #~ $exorto.chars ?? {
            #~ my $chopped = chop($exorto);
            #~ my $chopped_of = $exorto.substr($chopped.chars);
            #~ $exorto = $chopped;
            #~ $chopped_of
        #~ }()
        #~ !! ""
        my $chopped_var := QAST::Var.new( :name($chopped), :scope('lexical') );
        my $bind := $<EXPR> ?? bind_op($/, $<EXPR>, $chopped_var, '$')
                            !! QAST::Op.new( :op('bind'),
                                    QAST::Var.new( :name('$_'), :scope('lexical') ),
                                    QAST::Var.new( :name($chopped), :scope('lexical') ) );

        make QAST::Stmts.new(
                # $exorto = $<EXPR> // $_
                QAST::Op.new( :op('bind'),
                    QAST::Var.new( :name($exorto), :scope('lexical'), :decl('var') ),
                    expr_or_topic( $/ ) ),

                QAST::Op.new( :op('unless'),
                    # condition
                    QAST::Op.new( :op('callmethod'), :name('chars'),
                        QAST::Var.new( :name($exorto), :scope('lexical') ) ),
                    # noop, if input string is empty, return an empty string
                    QAST::Op.new( :op('callmethod'), :name('new'), :returns(find_symbol(['Str'])),
                        QAST::Var.new( :name('Str'), :scope('lexical') ) ),
                    # else, input string has a length
                    QAST::Stmts.new(
                        # $chopped = chop($exporto)
                        QAST::Op.new( :op('bind'),
                            QAST::Var.new( :name($chopped), :scope('lexical'), :decl('var') ),
                            QAST::Op.new( :op('callmethod'), :name('chop'),
                                QAST::Var.new( :name($exorto), :scope('lexical') ) ) ),
                        # $chopped_of = $exorto.substr($chopped.chars);
                        QAST::Op.new( :op('bind'),
                            QAST::Var.new( :name($chopped_of), :scope('lexical'), :decl('var') ),
                            QAST::Op.new( :op('callmethod'), :name('substr'),
                                QAST::Var.new( :name($exorto), :scope('lexical') ),
                                QAST::Op.new( :op('callmethod'), :name('chars'),
                                    QAST::Var.new( :name($chopped), :scope('lexical') ) ) ) ),
                        # $exorto = $chopped;
                        $bind,


                        # return $chopped_of
                        QAST::Var.new( :name($chopped_of), :scope('lexical') )
                    )
                )
            );
    }

    method term:sym<defined>($/) {
        $V5DEBUG && say("term:sym<defined>($/)");
        my $past := $<EXPR> ?? $<EXPR>.ast
                 !! QAST::Op.new( :op('call'), QAST::Var.new( :name('$_'), :scope('lexical') ) );

        $past := QAST::Op.new( :op('callmethod'), :name('defined'), $past );
        make $past
    }

    method term:sym<eval>($/) {
        $V5DEBUG && say("term:sym<eval>($/)");
        my $block := call_expr_or_topic( $/, 'EVAL' );
        make QAST::Op.new(
            :op('handle'),

            # Success path puts Any into $! and evaluates to the block.
            QAST::Stmt.new(
                :resultchild(0),
                $block,
                QAST::Op.new(
                    :op('p6store'),
                    QAST::Var.new( :name<$!>, :scope<lexical> ),
                    QAST::Op.new( :op('callmethod'), :name('new'),
                        QAST::Var.new( :name<Str>, :scope<lexical> ) )
                )
            ),

            # On failure, capture the exception object into $!.
            'CATCH', QAST::Stmts.new(
                QAST::Op.new(
                    :op('p6store'),
                    QAST::Var.new(:name<$!>, :scope<lexical>),
                    QAST::Op.new( :op('callmethod'), :name('Stringy'),
                        QAST::Op.new(
                            :name<&EXCEPTION>, :op<call>,
                            QAST::Op.new( :op('exception') )
                    )),
                ),
                QAST::VM.new(
                    :parrot(QAST::VM.new(
                        pirop => 'perl6_invoke_catchhandler 1PP',
                        QAST::Op.new( :op('null') ),
                        QAST::Op.new( :op('exception') )
                    )),
                    :jvm(QAST::Op.new( :op('null') )),
                    :moar(QAST::Op.new( :op('null') )),
                ),
                QAST::WVal.new(
                    :value( find_symbol(['Nil']) ),
                ),
            )
        )
    }

    method term:sym<goto>($/) {
        $V5DEBUG && say("term:sym<goto>($/)");
        my $ast;
        if nqp::substr(~$<EXPR>, 0, 1) eq '&' {
            # From http://perldoc.perl.org/functions/goto.html
            # The goto-&NAME form is quite different from the other forms of goto. In fact, it isn't
            # a goto in the normal sense at all, and doesn't have the stigma associated with other
            # gotos. Instead, it exits the current subroutine (losing any changes set by local()) and
            # immediately calls in its place the named subroutine using the current value of @_. This
            # is used by AUTOLOAD subroutines that wish to load another subroutine and then pretend
            # that the other subroutine had been called in the first place (except that any
            # modifications to @_ in the current subroutine are propagated to the other subroutine.)
            # After the goto, not even caller will be able to tell that this routine was called first.
            my $subname := $<EXPR><variable><subname>;
            $ast := QAST::Op.new( :op('call'),
                        QAST::Op.new( :op('call'), :name('&postcircumfix:<{ }>'),
                            QAST::Op.new( :op('callmethod'), :name('my'),
                                QAST::Op.new( :op('call'), :name('&callframe') ) ),
                                $*W.add_string_constant('@_') ) );

            if $subname<desigilname><variable> {
                $ast.name(~$subname<desigilname><variable>);
            }
            elsif $*W.is_lexical('&' ~ $subname) || $subname eq $*ROUTINE_NAME {
                $ast.name('&' ~ $subname);
            }
            else {
                $ast.unshift( self.make_indirect_lookup(['&' ~ $subname]) );
            }
            $ast := QAST::Op.new( :op('call'), :name('&return'), $ast )
        }
        else {
            throw($/, <X Comp NYI>, feature => "goto $<EXPR> NYI");
        }
        make $ast
    }

    method indirect_object($/) {
        $V5DEBUG && say("indirect_object($/)");
        if $<name><barename>.?ast {
            $V5DEBUG && say("indirect_object($/) barename");
            make QAST::Op.new( :op('call'), :name('&infix:<does>'),
                $*W.add_string_constant(~$<name>),
                QAST::WVal.new( :value(find_symbol(['P5Bareword'])) )
            )
        }
        elsif $<name> {
            $V5DEBUG && say("indirect_object($/) name");
            make QAST::WVal.new( :value(find_symbol([~$<name>])))
        }
        elsif $<sblock> {
            $V5DEBUG && say("indirect_object($/) sblock");
            make $<sblock>.ast
        }
        elsif $<variable> {
            $V5DEBUG && say("indirect_object($/) variable");
            make $<variable>.ast
        }
    }

    method term:sym<scalar>($/) {
        $V5DEBUG && say("term:sym<scalar>($/)");
        my @args;
        my $last := $<arg>.pop;
        for $<arg>.list {
            @args.push( $_<EXPR>.ast )
        }
        $last := QAST::Op.new( :op('call'), :name('&P5scalar'), $last<EXPR>.ast );
        make QAST::Stmts.new( |@args, $last );
    }

    method term:sym<rand>($/) {
        $V5DEBUG && say("term:sym<rand>($/)");
        make QAST::Op.new( :op('call'), :name('&rand'), :node($/) );
    }

    method term:sym<__LINE__>($/) {
        $V5DEBUG && say("term:sym<__LINE__>($/)");
        make $*W.add_constant('Int', 'int', HLL::Compiler.lineof($/.orig, $/.from, :cache(1)))
    }

    method term:sym<__FILE__>($/) {
        $V5DEBUG && say("term:sym<__FILE__>($/)");
        make $*W.add_string_constant(nqp::unbox_s(nqp::ifnull(nqp::getlexdyn('$?FILES'), '<unknown file>')));
    }

    method term:sym<__PACKAGE__>($/) {
        $V5DEBUG && say("term:sym<__PACKAGE__>($/)");
        # TODO stringify to 'main' for (GLOBAL)
        make QAST::Var.new( :name('$?PACKAGE'), :scope('lexical') );
    }

    method term:sym<filehandle>($/) {
        $V5DEBUG && say("term:sym<filehandle>($/)");
        make QAST::Op.new( :op('call'), :name('&lines') );
    }

    sub make_yada($name, $/) {
        my $past := $<args>.ast;
        $past.name($name);
        $past.node($/);
        unless +$past.list() {
            $past.push($*W.add_string_constant('Stub code executed'));
        }
        return $past;
    }

    method term:sym<...>($/) {
        $V5DEBUG && say("term:sym<...>($/)");
        make QAST::Op.new( :op('call'), :name('&die'), QAST::SVal.new( :value('Unimplemented'), :node($/) ) )
    }

    method term:sym<???>($/) {
        $V5DEBUG && say("term:sym<???>($/)");
        make make_yada('&warn', $/);
    }

    method term:sym<!!!>($/) {
        $V5DEBUG && say("term:sym<!!!>($/)");
        make make_yada('&die', $/);
    }

    method term:sym<dotty>($/) {
        $V5DEBUG && say("term:sym<dotty>($/)");
        my $past := $<dotty>.ast;
        $past.unshift(QAST::Var.new( :name('$_'), :scope('lexical') ) );
        make QAST::Op.new( :op('hllize'), $past);
    }

    method term:sym<blocklist>($/) {
        $V5DEBUG && say("term:sym<blocklist>($/)");
        my $past := $<arglist>.ast;
        $past.name('&' ~ $<identifier>);
        $past.unshift( $<sblock>.ast ) if $<sblock>;
        make $past;
    }

    my $i          = 0;
    my $default    = $i++;
    my $proto      = $i++;
    my $arg_op     = $i++;
    my $arg_opname = $i++;
    my $op         = $i++;
    my $opname     = $i++;

    my %builtin =
        'binmode' => [ '',   '*;$', '',    '',              'call',       '&P5binmode' ],
        'chr'     => [ '$_', '_',  'call', '&P5Numeric',    'call',       '&P5chr' ],
        'close'   => [ '',   '*',  '',     '',              'call',       '&P5close' ],
        'chdir'   => [ '',   '$',  '',     '',              'call',       '&P5chdir' ],
        'each'    => [ '',   '$',  '',     '',              'call',       '&P5each' ],
        'int'     => [ '$_', '_',  'call', '&P5Numeric',    'callmethod', 'Int' ],
        'length'  => [ '$_', '_',  '',     '',              'call',       '&P5length' ],
        'ord'     => [ '$_', '_',  'call', '&infix:<P5.>',  'call',       '&P5ord' ],
        'ref'     => [ '$_', '_',  '',     '',              'call',       '&P5ref' ],
        'not'     => [ '',   '@',  '',     '',              'call',       '&prefix:<P5not>' ],
        'say'     => [ '$_', '*@', '',     '',              'call',       '&P5say' ],
        'open'    => [ '',   '*@', '',     '',              'call',       '&P5open' ],
        'pack'    => [ '',   '$@', '',     '',              'call',       '&P5pack' ],
        'print'   => [ '$_', '*@', '',     '',              'call',       '&P5print' ],
        'shift'   => [ '@_', ';+', '',     '',              'call',       '&P5shift' ],
        'split'   => [ '',   '$$$', '',    '',              'call',       '&P5split' ],
        'unlink'  => [ '$_', '@',  '',     '',              'call',       '&P5unlink' ],
        'unpack'  => [ '@_', '$@', '',     '',              'call',       '&P5unpack' ],
        'unshift' => [ '@_', '+@', '',     '',              'call',       '&P5unshift' ],
        'push'    => [ '@_', '+@', '',     '',              'call',       '&P5push' ],
        'pop'     => [ '@_', ';+', '',     '',              'call',       '&P5pop' ],
        'pos'     => [ '$_', '$',  '',     '',              'call',       '&P5pos' ],
        'rand'    => [ '',   '',   '',     '',              'call',       '&P5rand' ],
        'read'    => [ '',   '*\\$$;$', '', '',             'call',       '&P5read' ],
        'seek'    => [ '',   '*$$', '',    '',              'call',       '&P5seek' ],
        'splice'  => [ '',   '@',  '',     '',              'call',       '&P5splice' ],
        'substr'  => [ '',   '$$$$', '',   '',              'call',       '&P5substr' ],
        'time'    => [ '',   '',   '',     '',              'call',       '&term:<time>' ];
    method term:sym<identifier>($/) {
        $V5DEBUG && say("term:sym<identifier>($/)");
        my $past;
        my $name    = ~$<identifier>;
        my $builtin = %builtin{$name};

        if $name eq 'map' {
            my $i      = 0;
            my $items := QAST::Op.new(:op('call'), :name('&infix:<,>'));
            if $<args><semiarglist> {
                for $<args><semiarglist>.ast.list {
                    if $i {
                        $items.push( $_ );
                    }
                    else {
                        $past := $_;
                    }
                    $i++;
                }
            }
            else {
                for $<args><arglist><arg>.list {
                    if $i {
                        $items.push( $_<EXPR>.ast );
                    }
                    else {
                        $past := $_<EXPR>.ast;
                    }
                    $i++;
                }
            }
            $past := QAST::Op.new( :op<callmethod>, :name<eager>,
                QAST::Op.new( :op<callmethod>, :name<map>, :node($/),
                    $items,
                    block_closure( make_topic_block_ref( $past ) )
                )
            );
        }
        elsif $builtin {
            if !$*ARGUMENT_HAVE && !$*HAS_INDIRECT_OBJ && !$builtin[$default] && $builtin[$proto] && $name ne 'not' {
                make QAST::Op.new( :op('die_s'), QAST::SVal.new( :value("Not enough arguments for $name" ) ) );
                return 0;
            }
            # Default to $_/@_.
            elsif !$*ARGUMENT_HAVE && !$*HAS_INDIRECT_OBJ && $builtin[$default] {
                my $var := ($name eq 'shift' || $name eq 'pop')
                        ?? QAST::Var.new( :name($*SHIFT_FROM // $builtin[$default]), :scope('lexical') )
                        !! QAST::Var.new( :name($builtin[$default]), :scope('lexical') );
                $past   := QAST::Op.new( $var, :node($/) );
            }
            # Expect args in this case.
            elsif $builtin[$proto] {
                $past := $<args>.ast
            }
            # It takes no arguments if proto is ''.
            else {
                $past := QAST::Op.new( :node($/) );
            }

            # Wrap the args if needed.
            if $builtin[$arg_op] && $*ARGUMENT_HAVE {
                if $*HAS_INDIRECT_OBJ {
                    $past[1].op( $builtin[$arg_op] );
                    $past[1].name( $builtin[$arg_opname] );
                }
                else {
                    $past.op( $builtin[$arg_op] );
                    $past.name( $builtin[$arg_opname] );
                    $past := QAST::Op.new( $past );
                }
            }

            if $builtin[$proto] && $builtin[$proto].substr(0, 1) eq '*' {
                nqp::push($past, QAST::Var.new( :name('$?PACKAGE'), :scope('lexical'), :named('pkg') ) );
            }

            if $builtin[$op] {
                $past.op( $builtin[$op] );
                $past.name( $builtin[$opname] );
            }
            else {
                $past.op( 'callmethod' );
                $past.name( $name );
            }
        }
        elsif $*W.is_lexical($name) {
            $past := QAST::Op.new( :op('call'), :name('&infix:<does>'),
                $*W.add_string_constant(~$name),
                QAST::WVal.new( :value(find_symbol(['P5Bareword'])) )
            )
        }
        else {
            $past := $<args>.ast;
            $past.op('call');
            if $*W.is_lexical('&' ~ $name) || ($*ROUTINE_NAME && $name eq $*ROUTINE_NAME) {
                $past.name('&' ~ $name);
            }
            else {
                $past.unshift( self.make_indirect_lookup(['&' ~ $name]) );
            }
        }
        make $past;
    }

    method make_indirect_lookup(@components, $sigil?, :$object, :$method) {
        $V5DEBUG && say("make_indirect_lookup(@components, $sigil?)");
        my $past := QAST::Op.new(
            :op<call>,
            :name<&P5INDIRECT_NAME_LOOKUP>,
            QAST::Op.new(
                :op<callmethod>, :name<new>,
                QAST::WVal.new( :value(find_symbol(['PseudoStash'])) )
            )
        );
        $past.push($*W.add_string_constant($sigil)) if $sigil;
        for @components {
            if nqp::can($_, 'isa') && $_.isa(QAST::Node) {
                $past.push($_);
            } else {
                $past.push($*W.add_string_constant(~$_));
            }
        }
        $past;
    }

    method term:sym<name>($/) {
        $V5DEBUG && say("term:sym<name>($/)");
        my $past;
        if $*longname.contains_indirect_lookup() {
            if $<args> {
                $/.CURSOR.panic("Combination of indirect name lookup and call not (yet?) allowed");
            }
            $past := self.make_indirect_lookup($*longname.components())
        }
        elsif $<args> {
            # If we have args, it's a call. Look it up dynamically
            # and make the call.
            # Add & to name.
            my @name := nqp::clone($*longname.components());
            my $final := @name[+@name - 1];
            if nqp::substr($final, 0, 1) ne '&' {
                @name[+@name - 1] := '&' ~ $final;
            }
            $past := capture_or_parcel($<args>.ast, ~$<longname>);
            if +@name == 1 {
                $past.name(@name[0]);
            }
            else {
                $past.unshift(symbol_lookup(@name, $/));
            }
        }
        else {
            # Otherwise, it's a type name; build a reference to that
            # type, since we can statically resolve them.
            my @name = $*longname.type_name_parts('type name').list;
            if $<arglist> {
                # Look up parametric type.
                my $ptype := find_symbol(@name);

                # Do we know all the arguments at compile time?
                my int $all_compile_time = 1;
                if $<arglist><arg> {
                    for @($<arglist><arg>.ast) {
                        unless $_.has_compile_time_value {
                            $all_compile_time = 0;
                        }
                    }
                }
                if $all_compile_time {
                    my $curried := $*W.parameterize_type($ptype, $<arglist>, $/);
                    $past := QAST::WVal.new( :value($curried) );
                }
                else {
                    my $ptref := QAST::WVal.new( :value($ptype) );
                    $past := $<arglist>.ast;
                    $past.op('callmethod');
                    $past.name('parameterize');
                    $past.unshift($ptref);
                    $past.unshift(QAST::Op.new( :op('how'), $ptref ));
                }
            }
            elsif +@name == 0 {
                $past := QAST::Op.new(
                    :op<callmethod>, :name<new>,
                    QAST::WVal.new( :value(find_symbol(['PseudoStash'])) )
                );
            }
            elsif $*W.is_pseudo_package(@name[0]) {
                $past := symbol_lookup(@name, $/);
            }
            elsif +@name == 1 && is_name(@name)
                    && !nqp::p6bool($*W.symbol_has_compile_time_value(@name)) {
                # it's a sigilless param or variable
                $past := make_variable_from_parts($/, @name, '', @name[0]);
            }
            else {
                $past := instantiated_type(@name, $/);
            }

            # Names ending in :: really want .WHO.
            if $*longname.get_who {
                $past := QAST::Op.new( :op('who'), $past );
            }
        }

        $past.node($/);
        make $past;
    }

    method args($/) {
        $V5DEBUG && say("args($/)");
        my $past;
        if    $<semiarglist> { $past := $<semiarglist>.ast; }
        elsif $<arglist>     { $past := $<arglist>.ast; }
        else {
            $past := QAST::Op.new( :op('call'), :node($/) );
        }
        make $past;
    }

    method semiarglist($/) {
        $V5DEBUG && say("semiarglist($/)");
        if +$<arglist>.list == 1 {
            make $<arglist>[0].ast;
        }
        else {
            my $past := QAST::Op.new( :op('call'), :node($/) );
            for $<arglist>.list {
                my $ast := $_.ast;
                $ast.name('&infix:<,>');
                $past.push($ast);
            }
            make $past;
        }
    }

    method arglist($/) {
        $V5DEBUG && say("arglist($/)");
        my $past := QAST::Op.new( :op('call'), :node($/) );
        if $<arg> {
            for $<arg>.list -> $arg {
                if $arg<EXPR> {
                    $V5DEBUG && say("arglist($/) EXPR");
                    my $expr := $arg<EXPR>.ast;
                    my @arg   = nqp::istype($expr, QAST::Op) && $expr.name eq '&infix:<,>'
                        ?? $expr.list
                        !! $expr;
                    for @arg {
                        nqp::push($past, nqp::decont($_));
                    }
                }
                elsif $arg<barename> {
                    $V5DEBUG && say("arglist($/) barename");
                    nqp::push($past, QAST::Op.new( :op('call'), :name('&infix:<does>'),
                        $*W.add_string_constant(~$arg<barename>),
                        QAST::WVal.new( :value(find_symbol(['P5Bareword'])) )
                    ))
                }
                elsif $arg<name> {
                    $V5DEBUG && say("arglist($/) name");
                    nqp::push($past, $*W.add_string_constant(~$arg<name>));
                }
            }
        }
        if $<indirect_object> {
            $V5DEBUG && say("arglist($/) indirect_object");

            $past.name('&infix:<,>');
            $past := nqp::elems($past)
                    ?? QAST::Op.new( :op('callmethod'), $<indirect_object>.ast, $past )
                    !! QAST::Op.new( :op('callmethod'), $<indirect_object>.ast );
        }

        make $past;
    }

    method circumfix:sym<( )>($/) {
        $V5DEBUG && say("circumfix:sym<( )>($/)");
        my $past := $<semilist>.ast;
        my $size := +$past.list;
        if $size == 0 {
            $past := QAST::Op.new( :op('call'), :name('&infix:<,>') );
        }
        else {
            my $last := $past[ $size - 1 ];
            $past.returns($last.returns);
            if nqp::istype($last, QAST::Block) {
                $past.arity($last.arity);
            }
        }
        make $past;
    }

    method circumfix:sym<ang>($/) {
        $V5DEBUG && say("circumfix:sym<ang>($/)"); make $<nibble>.ast; }

    method circumfix:sym«<< >>»($/) {
        $V5DEBUG && say("circumfix:sym«<< >>»($/)"); make $<nibble>.ast; }

    method circumfix:sym<« »>($/) {
        $V5DEBUG && say("circumfix:sym<« »>($/)"); make $<nibble>.ast; }

    method circumfix:sym<{ }>($/) {
        $V5DEBUG && say("circumfix:sym<\{ }>($/)");
        # If it was {YOU_ARE_HERE}, nothing to do here.
        my $past := $<sblock>.ast;
        if ~$/ eq '{YOU_ARE_HERE}' {
            make $past;
            return 1;
        }

        # If it is completely empty or consists of a single list, the first
        # element of which is either a hash or a pair, it's a hash constructor.
        # Note that if it declares any symbols it is also not one.
        my $Pair := find_symbol(['Pair']);
        my int $is_hash = 0;
        my $stmts := +$<sblock><blockoid><statementlist><statement>;
        my $bast  := $<sblock><blockoid>.ast;
        if $bast.symbol('$_')<used> || $bast.ann('also_uses') && $bast.ann('also_uses')<$_> {
            # Uses $_, so not a hash.
        }
        elsif $stmts == 0 {
            # empty block, so a hash
            $is_hash = 1;
        }
        elsif $stmts == 1 {
            my $elem := try $past.ann('past_block')[1][0][0];
            $elem := $elem[0] if $elem ~~ QAST::Want;
            if $elem ~~ QAST::Op && $elem.name eq '&infix:<,>' {
                # block contains a list, so test the first element
                $elem := $elem[0];
            }
            if $elem ~~ QAST::Op
                    && (istype($elem.returns, $Pair) || $elem.name eq '&infix:<=>>'
                                                     || $elem.name eq '&infix:<P5=>>') {
                # first item is a pair
                $is_hash = 1;
            }
            elsif $elem ~~ QAST::Var
                    && nqp::substr($elem.name, 0, 1) eq '%' {
                # first item is a hash
                $is_hash = 1;
            }
        }
        #~ if $is_hash {
            #~ for $past<past_block>.symtable() {
                #~ if $sym ne '$_' && $sym ne '$*DISPATCHER' {
                    #~ $is_hash = 0;
                #~ }
            #~ }
        #~ }
        if $is_hash && $past.ann('past_block').arity == 0 {
            my $children := $past.ann('past_block')[1];
            $past := QAST::Op.new(
                :op('call'),
                :name('&circumfix:<{ }>'),
                :node($/)
            );
            for $children.list {
                if nqp::istype($_, QAST::Stmt) {
                    # Mustn't use QAST::Stmt here, as it will cause register
                    # re-use within a statemnet, which is a problem.
                    $past.push(QAST::Stmts.new( |$_.list, :node($/) ));
                }
                else {
                    $past.push($_);
                }
            }
        }
        else {
            $past := block_closure($past);
            $past.annotate('bare_block', QAST::Op.new(
                :op('call'),
                QAST::BVal.new( :value($past.ann('past_block')) )));
        }
        make $past;
    }

    method statement_control:sym<{ }>($/) {
        $V5DEBUG && say("statement_control:sym<\{ }>($/)");
        my Mu $block := QAST::Stmts.new;
        $block.push( pblock_immediate($<sblock>.ast) );
        $block.push( pblock_immediate($<continue>.ast) ) if $<continue>;
        make QAST::Op.new( :op<callmethod>, :name<map>, :node($/),
                QAST::IVal.new(:value(1)),
                block_closure( make_topic_block_ref( $block, :name($*FOR_VARIABLE) ) )
            );
    }

    method circumfix:sym<[ ]>($/) {
        $V5DEBUG && say("circumfix:sym<[ ]>($/)");
        make QAST::Op.new( :op('call'), :name('&circumfix:<[ ]>'), $<semilist>.ast, :node($/) );
    }

    ## Expressions
    my %specials =
        INFIX => {
            #~ '=',    -> $/, $sym { assign_op($/, $/[0].ast, $/[1].ast) },
            '**'  => '&infix:<P5**>',
            '*'   => '&infix:<P5*>',
            '/'   => '&infix:<P5/>',
            '%'   => '&infix:<P5%>',
            'x'   => '&infix:<P5x>',
            '+'   => '&infix:<P5+>',
            '-'   => '&infix:<P5->',
            '.'   => '&infix:<P5.>',
            '<<'  => '&infix:<P5<<>',
            '>>'  => '&infix:<P5>>>',
            '<'   => '&infix:<P5<>',
            '>'   => '&infix:<P5>>',
            '<='  => '&infix:<P5<=>',
            '>='  => '&infix:<P5>=>',
            '=='  => '&infix:<P5==>',
            '!='  => '&infix:<P5!=>',
            '<=>' => '&infix:<P5<=>>',
            'eq'  => '&infix:<P5eq>',
            'ne'  => '&infix:<P5ne>',
            'cmp' => '&infix:<P5cmp>',
            '~~'  => '&infix:<P5~~>',
            '&'   => '&infix:<P5&>',
            '|'   => '&infix:<P5|>',
            '^'   => '&infix:<P5^>',
            '..'  => '&infix:<P5..>',
            '...' => '&infix:<P5...>',
            '|='  => '&infix:<P5|=>',
            '&='  => '&infix:<P5&=>',
            '||=' => '&infix:<P5||=>',
            '&&=' => '&infix:<P5&&=>',
            '+='  => '&infix:<P5+=>',
            '-='  => '&infix:<P5-=>',
            '*='  => '&infix:<P5*=>',
            '/='  => '&infix:<P5/=>',
            '.='  => '&infix:<P5.=>',
        },
        PREFIX => {
            '!'   => '&prefix:<P5!>',
            '~'   => '&prefix:<P5~>',
            '.'   => '&prefix:<P5.>',
            '+'   => '&prefix:<P5+>',
            '-'   => '&prefix:<P5->',
            '++'  => '&prefix:<P5++>',
            '--'  => '&prefix:<P5-->',
            'not' => '&prefix:<P5not>',
            '\\'  => '&prefix:<P5bs>',
        },
        POSTFIX => {
            '++'  => '&postfix:<P5++>',
            '--'  => '&postfix:<P5-->',
        },
        LIST => {
            '=>'  => '&infix:<P5=>>',
        };
    method EXPR($/, $key? is copy) {
        $V5DEBUG && say("EXPR($/, {$key // ''}?)");
        unless $key { return 0; }
        my $past := $/.ast // $<OPER>.ast;
        my $sym   = ~($<infix><sym> // $<prefix><sym> // $<postfix><sym> // '');
        my int $return_map = 0;
        if $past && nqp::substr($past.name, 0, 19) eq '&METAOP_TEST_ASSIGN' {
            $past.push($/[0].ast);
            $past.push(make_thunk_ref($/[1].ast, $/));
            make $past;
            return 1;
        }
        elsif $sym eq '=~' {
            make make_match($/, 0);
            return 1;
        }
        elsif $sym eq '!~' {
            make make_match($/, 1);
            return 1;
        }
        elsif $key eq 'LIST' && %specials{$key}{$sym} {
            $past := QAST::Op.new( :op('call'), :name(%specials{$key}{$sym}));
            for $/.list { if $_.ast { $past.push($_.ast); } }
            make $past;
            return 1;
        }
        elsif %specials{$key}{$sym} {
            $past := QAST::Op.new( :op('call'), :name(%specials{$key}{$sym}), $/[0].ast);
            $past.push: $/[1].ast if $key eq 'INFIX';
            make $past;
            return 1;
        }
        unless $past {
            if $<OPER><O><pasttype> {
                $past := QAST::Op.new( :node($/), :op( ~$<OPER><O><pasttype> ) );
            }
            elsif $<OPER><O><pirop> {
                $past := QAST::VM.new( :node($/), :pirop(~$<OPER><O><pirop>) );
            }
            else {
                $past := QAST::Op.new( :node($/), :op('call') );
            }
            if $<OPER><sym> {
                my $name;
                if $past.isa(QAST::Op) && !$past.name {
                    if $key eq 'LIST' { $key = 'infix'; }
                    $name := nqp::lc($key) ~ ':<' ~ $<OPER><sym> ~ '>';
                    $past.name('&' ~ $name);
                }
            }
        }
        if $key eq 'POSTFIX' {
            # Method calls may be to a foreign language, and thus return
            # values may need type mapping into Perl 6 land.
            my $object := $/[0]<identifier>;
            my $method := $<OPER><dottyop><methodop><longname>;
            if $object && $method && nqp::istype($/[0].ast, QAST::Op)
            && $/[0].ast[0]    && nqp::istype($/[0].ast[0], QAST::Op) && $/[0].ast[0].name eq '&P5INDIRECT_NAME_LOOKUP' {
                $object := $*W.add_string_constant(~$object);
                $method := $*W.add_string_constant(~$method);
                $object.named('object');
                $method.named('method');
                $/[0].ast[0].push: $object;
                $/[0].ast[0].push: $method;
            }
            $past.unshift($/[0].ast);
            if $past.isa(QAST::Op) && $past.op eq 'callmethod' {
                $return_map = 1;
            }
        }
        else {
            my $done = 0;
            for $/.list {
                if $_.ast {
                    if !$done && $past.isa(QAST::Op) && ($past.op eq 'if' || $past.op eq 'unless') {
                        $past.push(QAST::Op.new( :node($/), :op('call'), :name('&P5Bool'), $_.ast));
                    }
                    else {
                        $past.push($_.ast);
                    }
                    $done = 1;
                }
            }
        }
        if $past.isa(QAST::Op) && $past.op eq 'xor' {
            $past.push(QAST::Var.new(:named<false>, :scope<lexical>, :name<Nil>));
        }
        if $key eq 'PREFIX' || $key eq 'INFIX' || $key eq 'POSTFIX' {
            $past := whatever_curry($/, (my $orig := $past), $key eq 'INFIX' ?? 2 !! 1);
            if $return_map && $orig =:= $past {
                $past := QAST::Op.new($past,
                    :op('hllize'), :returns($past.returns()));
            }
        }
        make $past;
    }

    method termish($/) {
        $V5DEBUG && say("termish($/)");
        make $<term>.ast;
    }

    sub make_match($/, $negated) {
        $V5DEBUG && say("make_match($/, $negated)");
        my $lhs := $/[0].ast;
        my $rhs := $/[1].ast;
        my $old_topic_var := $lhs.unique('old_topic');
        my $result_var := $lhs.unique('sm_result');
        my $sm_call;

        # TODO only set last-match if modifier "g" was used. (m//g)
        #~ say($rhs.dump);

        # In case of a tr/// we return the number of translated chars.
        if $rhs.ann('is_trans') {
            $sm_call := $rhs
        }
        # In case the rhs is a substitution, the result should say if it actually
        # matched something. Calling ACCEPTS will always be True for this case.
        elsif $rhs.ann('is_subst') {
            $sm_call := QAST::Stmt.new(
                $rhs,
                QAST::Op.new(
                    :op('callmethod'), :name('Bool'),
                    QAST::Var.new( :name('$/'), :scope('lexical') )
                )
            );
        }
        else {
            # Call $rhs.ACCEPTS( $_ ), where $_ is $lhs.
            $sm_call := QAST::Op.new(
                :op('callmethod'), :name('ACCEPTS'),
                $rhs,
                QAST::Var.new( :name('$_'), :scope('lexical') )
            );
        }

        if $negated {
            $sm_call := QAST::Op.new( :op('call'), :name('&prefix:<!>'), $sm_call );
        }

        QAST::Stmt.new(
            # Stash original $_.
            QAST::Op.new( :op('bind'),
                QAST::Var.new( :name($old_topic_var), :scope('local'), :decl('var') ),
                QAST::Var.new( :name('$_'), :scope('lexical') )
            ),

            # Evaluate LHS and bind it to $_.
            QAST::Op.new( :op('bind'),
                QAST::Var.new( :name('$_'), :scope('lexical') ),
                $lhs
            ),

            # Evaluate RHS and call ACCEPTS on it, passing in $_. Bind the
            # return value to a result variable.
            QAST::Op.new( :op('bind'),
                QAST::Var.new( :name($result_var), :scope('local'), :decl('var') ),
                $sm_call
            ),

            QAST::Op.new( :op('if'),
                QAST::Op.new( :op('callmethod'), :name('defined'), $lhs ),
                QAST::Stmt.new(
                    QAST::Op.new( :op('unless'),
                        QAST::Op.new( :op('callmethod'), :name('dispatch:<.^>'),
                            $lhs,
                            $*W.add_string_constant('can'),
                            $*W.add_string_constant('last-match')
                        ),
                        QAST::Op.new( :op('call'), :name('&infix:<does>'),
                            $lhs,
                            QAST::WVal.new( :value(find_symbol(['P5MatchPos'])) )
                        )
                    ),
                    QAST::Op.new( :op('p6store'),
                        QAST::Op.new( :op('hllize'),
                            QAST::Op.new( :op('callmethod'), :name('last-match'), $lhs ) ),
                        QAST::Var.new( :name($result_var), :scope('local') )
                    )
                )
            ),

            # Re-instate original $_.
            QAST::Op.new( :op('bind'),
                QAST::Var.new( :name('$_'), :scope('lexical') ),
                QAST::Var.new( :name($old_topic_var), :scope('local') )
            ),

            # And finally evaluate to the smart-match result.
            QAST::Op.new( :op('if'),
                QAST::Op.new( :op('call'), :name('&P5scalar'),
                    QAST::Op.new( :op('callmethod'), :name('list'),
                        QAST::Var.new( :name($result_var), :scope('local') ) ) ),
                QAST::Op.new( :op('hllize'),
                    QAST::Op.new( :op('callmethod'), :name('list'),
                        QAST::Var.new( :name($result_var), :scope('local') ) ) ),
                QAST::Op.new( :op('call'), :name('&P5Bool'),
                    QAST::Var.new( :name($result_var), :scope('local') ) ) )
        )
    }

    sub bind_op($/, $target, Mu $source is copy, $sigish) {
        # Check we know how to bind to the thing on the LHS.
        if $target.isa(QAST::Var) {
            # Check it's not a native type; we can't bind to those.
            if nqp::objprimspec($target.returns) {
                throw($/, <X Bind NativeType>,
                        name => ($target.name // ''),
                );
            }

            # We may need to decontainerize the right, depending on sigil.
            my $sigil := nqp::substr($target.name(), 0, 1);
            if $sigil eq '@' || $sigil eq '%' {
                $source := QAST::Op.new( :op('decont'), $source );
            }

            # Now go by scope.
            if $target.scope eq 'attribute' {
                # Source needs type check.
                my $meta_attr;
                try {
                    $meta_attr := $*PACKAGE.HOW.get_attribute_for_usage(
                        $*PACKAGE, $target.name
                    );
                }
                $source := QAST::Op.new(
                    :op('p6bindassert'),
                    $source, QAST::WVal.new( :value($meta_attr.type) ))
            }
            else {
                # Probably a lexical.
                my int $was_lexical = 0;
                try {
                    my $type := $*W.find_lexical_container_type($target.name);
                    $source := QAST::Op.new(
                        :op('p6bindassert'),
                        $source, QAST::WVal.new( :value($type) ));
                    $was_lexical = 1;
                }
                unless $was_lexical {
                    throw($/, <X Bind>);
                }
            }

            # Finally, just need to make a bind.
            make QAST::Op.new( :op('bind'), $target, $source );
        }
        elsif $target.isa(QAST::Op) && $target.op eq 'hllize' &&
                $target[0].isa(QAST::Op) && $target[0].op eq 'call' &&
                ($target[0].name eq '&postcircumfix:<[ ]>' || $target[0].name eq '&postcircumfix:<{ }>') {
            $source.named('BIND');
            $target[0].push($source);
            make $target;
        }
        elsif $target.isa(QAST::Op) && $target.op eq 'call' &&
              ($target.name eq '&postcircumfix:<[ ]>' || $target.name eq '&postcircumfix:<{ }>') {
            $source.named('BIND');
            $target.push($source);
            make $target;
        }
        elsif $target.isa(QAST::WVal) && nqp::istype($target.value, find_symbol(['Signature'])) {
            make QAST::Op.new(
                :op('p6bindcaptosig'),
                $target,
                QAST::Op.new(
                    :op('callmethod'), :name('Capture'),
                    $source
                ));
        }
        # XXX Several more cases to do...
        else {
            throw($/, <X Bind>);
        }
    }

    sub assign_op($/, Mu $lhs_ast is rw, Mu $rhs_ast is rw) {
        my $past;
        my $var_sigil;
        if $lhs_ast.isa(QAST::Var) {
            $var_sigil := nqp::substr($lhs_ast.name, 0, 1);
        }
        if nqp::istype($lhs_ast, QAST::Var)
                && nqp::objprimspec($lhs_ast.returns) {
            # Native assignment is actually really a bind at low level.
            $past := QAST::Op.new(
                :op('bind'), :returns($lhs_ast.returns),
                $lhs_ast, $rhs_ast);
        }
        elsif $var_sigil && ($var_sigil eq '@' || $var_sigil eq '%') {
            # While the scalar container store op would end up calling .STORE,
            # it does it in a nested runloop, which gets pricey. This is a
            # simple heuristic check to try and avoid that by calling .STORE.
            $past := QAST::Op.new(
                :op('callmethod'), :name('STORE'),
                $lhs_ast, $rhs_ast);
            $past.annotate('nosink', 1);
        }
        else {
            $past := QAST::Op.new( :node($/), :op('p6store'),
                $lhs_ast, $rhs_ast);
        }
        return $past;
    }

    sub concat_op($/, $lhs_ast, $rhs_ast, $assign = 0) {
        my $past := QAST::Op.new(
            :op('call'), :name('&infix:<P5.>'),
            $lhs_ast,
            $rhs_ast
        );
        $past := QAST::Op.new( :op('bind'), $lhs_ast, $past ) if $assign;
        $past
    }

    method prefixish($/) {
        $V5DEBUG && say("prefixish($/)");
    }

    method infixish($/) {
        $V5DEBUG && say("infixish($/)");
        if $<infixish> {
            make $<infixish>.ast;
        }
    }

    method filetest($/) {
        $V5DEBUG && say("filetest($/)");
        my $name = ~$<letter>;
        make QAST::Op.new(
                :op('callmethod'), :$name,
                QAST::Op.new(
                    :op('callmethod'), :name('IO'),
                    $<EXPR> ?? $<EXPR>.ast
                            !! $name eq 't' # http://perldoc.perl.org/functions/-X.html
                                ?? QAST::Var.new( :name('STDIN'), :scope('lexical') )
                                !! QAST::Var.new( :name('$_'), :scope('lexical') ) ) )
    }

    method term:sym<filetest>($/) {
        $V5DEBUG && say("term:sym<filetest>($/)");
        make $<filetest>.ast
    }

    method postfixish($/) {
        $V5DEBUG && say("postfixish($/)");
    }

    method postcircumfix:sym<[ ]>($/) {
        $V5DEBUG && say("postcircumfix:sym<[ ]>($/)");
        my $past := QAST::Op.new( :name('&postcircumfix<P5[ ]>'), :op('call'), :node($/) );
        if $<semilist><statement> {
            my $slast := $<semilist>.ast;
            $past.push($slast);
        }
        make $past;
    }

    method postcircumfix:sym<{ }>($/) {
        $V5DEBUG && say("postcircumfix:sym<\{ }>($/)");
        my $past := QAST::Op.new( :name('&postcircumfix:<{ }>'), :op('call'), :node($/) );
        if $<nibble> {
            $past.push( QAST::Op.new( :name('Stringy'), :op('callmethod'), :node($/), $<nibble>.ast ) );
        }
        elsif +$<semilist><statement> > 1 {
            my $op := QAST::Op.new( :name('join'), :op('callmethod'), :node($/),
                QAST::Var.new( :name('$;'), :scope('lexical') ) );
            for $<semilist><statement>.list -> $statement {
                $op.push( $statement.ast );
            }
            $past.push( $op );
        }
        elsif +$<semilist><statement> {
            $past.push( QAST::Op.new( :name('Stringy'), :op('callmethod'), :node($/), $<semilist><statement>[0].ast ) );
        }
        else {
            return make QAST::Var.new(:name('Nil'), :scope('lexical'));
        }
        make $past;
    }

    method postcircumfix:sym<ang>($/) {
        $V5DEBUG && say("postcircumfix:sym<ang>($/)");
        my $past := QAST::Op.new( :name('&postcircumfix:<{ }>'), :op('call'), :node($/) );
        my $nib  := $<nibble>.ast;
        $past.push($nib)
            unless nqp::istype($nib, QAST::Stmts) && nqp::istype($nib[0], QAST::Op) &&
            $nib[0].name eq '&infix:<,>' && +@($nib[0]) == 0;
        make $past;
    }

    method postcircumfix:sym«<< >>»($/) {
        $V5DEBUG && say("postcircumfix:sym«<< >>»($/)");
        my $past := QAST::Op.new( :name('&postcircumfix:<{ }>'), :op('call'), :node($/) );
        my $nib  := $<nibble>.ast;
        $past.push($nib)
            unless nqp::istype($nib, QAST::Stmts) && nqp::istype($nib[0], QAST::Op) &&
            $nib[0].name eq '&infix:<,>' && +@($nib[0]) == 0;
        make $past;
    }

    method postcircumfix:sym<« »>($/) {
        $V5DEBUG && say("postcircumfix:sym<« »>($/)");
        my $past := QAST::Op.new( :name('&postcircumfix:<{ }>'), :op('call'), :node($/) );
        my $nib  := $<nibble>.ast;
        $past.push($nib)
            unless nqp::istype($nib, QAST::Stmts) && nqp::istype($nib[0], QAST::Op) &&
            $nib[0].name eq '&infix:<,>' && +@($nib[0]) == 0;
        make $past;
    }

    method postcircumfix:sym<( )>($/) {
        $V5DEBUG && say("postcircumfix:sym<( )>($/)");
        make $<arglist>.ast;
    }

    method value:sym<quote>($/) {
        $V5DEBUG && say("value:sym<quote>($/)");
        make $<quote>.ast;
    }

    method value:sym<number>($/) {
        $V5DEBUG && say("value:sym<number>($/)");
        make $<number>.ast;
    }
    method value:sym<version>($/) {
        $V5DEBUG && say("value:sym<version>($/)");
        make $<version>.ast;
    }

    method version($/) {
        $V5DEBUG && say("version($/)");
        my $v := find_symbol(['Version']).new(~$<vstr>);
        $*W.add_object($v);
        make QAST::WVal.new( :value($v) );
    }

    method number:sym<complex>($/) {
        $V5DEBUG && say("number:sym<complex>($/)");
        my $re := $*W.add_constant('Num', 'num', 0e0);
        my $im := $*W.add_constant('Num', 'num', +~$<im>);
        make $*W.add_constant('Complex', 'type_new', $re.compile_time_value, $im.compile_time_value);
    }

    method number:sym<numish>($/) {
        $V5DEBUG && say("method number:sym<numish>($/)");
        make $<numish>.ast;
    }

    method integer($/) {
        $V5DEBUG && say("method integer($/)");
        make $<VALUE>.ast;
    }

    sub add_numeric_constant($/, $type is rw, $number) {
        $V5DEBUG && say("add_numeric_constant($/, $type, $number)");
        my Mu $value := nqp::decont($number);
        return nqp::istype($value, Int) && nqp::isbig_I($value)
            ?? $*W.add_constant($type, 'bigint', $value)
            !! $*W.add_constant($type, $type.lc, $value);
    }

    method numish($/) {
        $V5DEBUG && say("method numish($/)");
        if $<integer> {
            make add_numeric_constant($/, 'Int', $<integer>.ast);
        }
        elsif $<dec_number> { make $<dec_number>.ast; }
        elsif $<rad_number> { make $<rad_number>.ast; }
        else {
            make add_numeric_constant($/, 'Num', +$/);
        }
    }

    # filter out underscores and similar stuff
    sub filter_number($n) {
        my int $i = 0;
        my str $allowed = '0123456789';
        my str $result = '';
        while $i < nqp::chars($n) {
            my $char := nqp::substr($n, $i, 1);
            $result = $result ~ $char if nqp::index($allowed, $char) >= 0;
            $i = $i + 1;
        }
        $result;
    }

    method escale($/) {
        $V5DEBUG && say("method escale($/)");
        make $<sign> eq '-'
            ??  nqp::neg_I($<decint>.ast, $<decint>.ast)
            !! $<decint>.ast;
    }

    method dec_number($/) {
        $V5DEBUG && say("method dec_number($/)");
        my $int  := $<int> ?? filter_number(~$<int>) !! "0";
        my $frac := $<frac> ?? filter_number(~$<frac>) !! "0";
        if $<escale> {
            my $e := nqp::islist($<escale>) ?? $<escale>[0] !! $<escale>;
            make radcalc($/, 10, ~$<coeff>, 10, nqp::unbox_i($e.ast), :num);
        } else {
            make radcalc($/, 10, ~$<coeff>);
        }
    }

    method rad_number($/) {
        $V5DEBUG && say("method rad_number($/)");
        my $radix    := +($<radix>.Str);
        if $<bracket>   {
            make QAST::Op.new(:name('&unbase_bracket'), :op('call'),
                add_numeric_constant($/, 'Int', $radix), $<bracket>.ast);
        }
        elsif $<circumfix> {
            make QAST::Op.new(:name('&unbase'), :op('call'),
                add_numeric_constant($/, 'Int', $radix), $<circumfix>.ast);
        } else {
            my $intpart  := $<intpart>.Str;
            my $fracpart := $<fracpart> ?? $<fracpart>.Str !! "0";
            my $intfrac  := $intpart ~ $fracpart; #the dot is a part of $fracpart, so no need for ~ "." ~

            my $base;
            my $exp;
            $base   := +($<base>.Str) if $<base>;
            $exp    := +($<exp>.Str)  if $<exp>;

            my $error;
            make radcalc($/, $radix, $intfrac, $base, $exp);
        }
    }

    method typename($/) {
        $V5DEBUG && say("method typename($/)");
        # Locate the type object and make that. Anything that wants a PAST
        # reference to it can obtain one, but many things really want the
        # actual type object to build up some data structure or make a trait
        # dispatch with. Note that for '::T' style things we need to make a
        # GenericHOW, though whether/how it's used depends on context.
        if $<longname> {
            if nqp::substr(~$<longname>, 0, 2) ne '::' {
                my $longname := dissect_longname($<longname>);
                my $type := find_symbol($longname.type_name_parts('type name').list);
                if $<arglist> {
                    $type := $*W.parameterize_type($type, $<arglist>, $/);
                }
                if $<typename> {
                    $type := $*W.parameterize_type_with_args($type,
                        [$<typename>.ast], hash());
                }
                make $type;
            }
            else {
                if $<arglist> || $<typename> {
                    $/.CURSOR.panic("Cannot put type parameters on a type capture");
                }
                if ~$<longname> eq '::' {
                    $/.CURSOR.panic("Cannot use :: as a type name");
                }
                make $*W.pkg_create_mo($/, %*HOW<generic>, :name(nqp::substr(~$<longname>, 2)));
            }
        }
        else {
            make find_symbol(['::?' ~ ~$<identifier>]);
        }
    }

    my %SUBST_ALLOWED_ADVERBS;
    my %SHARED_ALLOWED_ADVERBS;
    my %MATCH_ALLOWED_ADVERBS;
    my %MATCH_ADVERBS_MULTIPLE =
        x       => 1,
        g       => 1,
        global  => 1,
        ov      => 1,
        overlap => 1,
        ex      => 1,
        exhaustive => 1;
    my %REGEX_ADVERBS_CANONICAL =
        ignorecase  => 'i',
        ratchet     => 'r',
        sigspace    => 's',
        continue    => 'c',
        pos         => 'p',
        th          => 'nth',
        st          => 'nth',
        nd          => 'nth',
        rd          => 'nth',
        global      => 'g',
        overlap     => 'ov',
        exhaustive  => 'ex',
        Perl5       => 'P5',
        samecase    => 'ii',
        samespace   => 'ss';
    my %REGEX_ADVERB_IMPLIES =
        ii        => 'i',
        ss        => 's';
    INIT {
        for <i ignorecase s sigspace r ratchet Perl5 P5> {
            %SHARED_ALLOWED_ADVERBS{$_} = 1;
        }

        for <g global ii samecase ss samespace x c continue p pos nth th st nd rd> {
            %SUBST_ALLOWED_ADVERBS{$_} = 1;
        }

        for <x c continue p pos nth th st nd rd g global ov overlap ex exhaustive> {
            %MATCH_ALLOWED_ADVERBS{$_} = 1;
        }
    }

    method rx_adverbs($/) {
        $V5DEBUG && say("method rx_adverbs($/)");
        my @pairs;
        #~ for $<quotepair>.list {
            #~ nqp::push(@pairs, $_.ast);
        #~ }
        make @pairs;
    }

    method rx_mods($/) {
        $V5DEBUG && say("method rx_mods($/)");
        make ~$/
    }

    method quote:sym<' '>($/)  { $V5DEBUG && say("method quote:sym<' '>($/)");   make $<nibble>.ast; }
    method quote:sym<" ">($/)  { $V5DEBUG && say("method quote:sym<\" \">($/)"); make $<nibble>.ast; }
    method quote:sym<` `>($/)  { $V5DEBUG && say("method quote:sym<` `>($/)");
        make QAST::Op.new( :name('&QX'), :op('call'), :node($/), $<nibble>.ast ); }
    method quote:sym<__DATA__>($/) {
        $V5DEBUG && say("method quote:sym<__DATA__>($/)");
        # do something with $<text>
    }
    method quote:sym«<<»($/)   {
        $V5DEBUG && say("method quote:sym«<<»($/)");
        make $<quibble>
            ?? $<quibble>.ast
            !! QAST::Stmts.new(
                QAST::Op.new( :op<die_s>, QAST::SVal.new( :value("Premature heredoc consumption") ) ),
                QAST::SVal.new( :value(~$/), :node($/) ) )
    }
    method quote:sym<qq>($/)   { $V5DEBUG && say("method quote:sym<qq>($/)");    make $<quibble>.ast; }
    method quote:sym<q>($/)    { $V5DEBUG && say("method quote:sym<q>($/)");     make $<quibble>.ast; }
    method quote:sym<qw>($/)   { $V5DEBUG && say("method quote:sym<qw>($/)");    make $<quibble>.ast; }
    method quote:sym<qr>($/)   {
        $V5DEBUG && say("method quote:sym<qr>($/)");
        my $block := QAST::Block.new(QAST::Stmts.new, QAST::Stmts.new, :node($/));
        #~ self.handle_and_check_adverbs($/, %SHARED_ALLOWED_ADVERBS, 'rx', $block);
        my %sig_info := hash(parameters => []);
        my $coderef := regex_coderef($/, $*W.stub_code_object('Regex'),
            $<quibble>.ast, 'anon', '', %sig_info, $block, :use_outer_match(1));
        my $past := block_closure($coderef);
        $past.annotate('sink_past', QAST::Op.new(:op<call>, :name<P5Bool>, $past));
        make $past;
    }
    method quote:sym</ />($/) {
        $V5DEBUG && say("method quote:sym</ />($/)");
        my $block := QAST::Block.new(QAST::Stmts.new, QAST::Stmts.new, :node($/));
        my %sig_info := hash(parameters => []);
        my $coderef := regex_coderef($/, $*W.stub_code_object('Regex'),
            $<nibble>.ast, 'anon', '', %sig_info, $block, :use_outer_match(1));

        my $past := block_closure($coderef);
        unless $*IN_SPLIT {
            $past := QAST::Op.new(
                :node($/),
                :op('callmethod'), :name('match'),
                QAST::Op.new( :op('defor'),
                    QAST::Var.new( :name('$_'), :scope('lexical') ),
                    QAST::SVal.new( :value('') ),
                ),
                $past
            );
            $past := QAST::Stmts.new(
                QAST::Op.new( :op('p6store'),
                    QAST::Var.new(:name('$/'), :scope('lexical')),
                    $past ),
                QAST::Var.new(:name('$/'), :scope('lexical'))
            );
        }
        make $past;
    }

    method quote:sym<m>($/) {
        $V5DEBUG && say("method quote:sym<m>($/)");
        my $block := QAST::Block.new(QAST::Stmts.new, QAST::Stmts.new, :node($/));
        my %sig_info := hash(parameters => []);
        my $coderef := regex_coderef($/, $*W.stub_code_object('Regex'),
            $<quibble>.ast, 'anon', '', %sig_info, $block, :use_outer_match(1));

        my $past := block_closure($coderef);
        unless $*IN_SPLIT {
            $past := QAST::Op.new(
                :node($/),
                :op('callmethod'), :name('match'),
                QAST::Op.new( :op('defor'),
                    QAST::Var.new( :name('$_'), :scope('lexical') ),
                    QAST::SVal.new( :value('') ),
                ),
                $past
            );
            $past := QAST::Stmts.new(
                QAST::Op.new( :op('p6store'),
                    QAST::Var.new(:name('$/'), :scope('lexical')),
                    $past ) );

            if !$<rx_mods> || nqp::index(~$<rx_mods>.ast, 'g') == -1 {
                $past := QAST::Op.new( :node($/), :op('call'), :name('&P5Bool'), $past )
            }
        }
        make $past;
    }

    # returns 1 if the adverbs indicate that the return value of the
    # match will be a List of matches rather than a single match
    method handle_and_check_adverbs($/, %adverbs, $what, $past?) {
        $V5DEBUG && say("method handle_and_check_adverbs($/, %adverbs, $what, $past)");
        my int $multiple = 0;
        for $<rx_adverbs>.ast.list {
            $multiple = 1 if %MATCH_ADVERBS_MULTIPLE{$_.named};
            unless %SHARED_ALLOWED_ADVERBS{$_.named} || %adverbs{$_.named} {
                throw($/, <X Syntax Regex Adverb>,
                    adverb    => $_.named,
                    construct => $what,
                );
            }
            if $past {
                $past.push($_);
            }
        }
        $multiple;
    }

    method quote:sym<s>($/) {
        $V5DEBUG && say("method quote:sym<s>($/)");
        # Build the regex.
        my $rx_block := QAST::Block.new(QAST::Stmts.new, QAST::Stmts.new, :node($/));
        my %sig_info := hash(parameters => []);
        my $rx_coderef := regex_coderef($/, $*W.stub_code_object('Regex'),
            $<sibble><left>.ast, 'anon', '', %sig_info, $rx_block, :use_outer_match(1));

        my $rhs;
        if $<rx_mods> && nqp::index(~$<rx_mods>.ast, 'e') >= 0 {
            $rhs := QAST::Op.new( :op<callmethod>, :name<EVAL>, $*W.add_string_constant(~$<sibble><right>));
        }
        else {
            $rhs := $<sibble><right>.ast;
        }

        # Quote needs to be closure-i-fied.
        my $closure := block_closure(make_thunk_ref($rhs, $<sibble><right>));
        # make $_ = $_.subst(...)
        my $past := QAST::Op.new(
            :node($/),
            :op('callmethod'), :name('subst'),
            QAST::Var.new( :name('$_'), :scope('lexical') ),
            $rx_coderef, $closure
        );
        # TODO handle modifier p
#        self.handle_and_check_adverbs($/, %SUBST_ALLOWED_ADVERBS, 'substitution', $past);
        if $/[0] {
            $past.push(QAST::IVal.new(:named('samespace'), :value(1)));
        }
        $past.push(QAST::IVal.new(:named('SET_CALLER_DOLLAR_SLASH'), :value(1)));

        $past := make QAST::Op.new(
            :node($/),
            :op('call'),
            :name('&infix:<=>'),
            QAST::Var.new(:name('$_'), :scope('lexical')),
            $past
        );

        $past.annotate('is_subst', 1);
        $past
    }

    method quote:sym<tr>($/) {
        $V5DEBUG && say("method quote:sym<tr>($/)");
        my $left  := ~$<tribble><left>;
        my $right := ~$<tribble><right>;
        my $past := make QAST::Op.new(:op<call>, :name<&P5trans>,
            QAST::Var.new(:name('$_'), :scope<lexical>),
            make_pair($left, QAST::SVal.new(:value($right))),
        );
        $past.annotate('is_trans', 1);
        $past
    }

    # Adds code to do the signature binding.
    sub add_signature_binding_code(Mu $block is copy, $sig_obj, @params) {
        $V5DEBUG && say("add_signature_binding_code()");
        # Set arity.
        my int $arity = 0;
        for @params {
            last if $_<optional> || $_<named_names> ||
               $_<pos_slurpy> || $_<named_slurpy>;
            $arity = $arity + 1;
        }
        $block.arity($arity);

        # Flag that we do custom arguments processing, and invoke the binder.
        $block.custom_args(1);
        $block[0].push(QAST::Op.new( :op('p6bindsig') ));

        $block;
    }

    # Adds a placeholder parameter to this block's signature.
    sub add_placeholder_parameter($/, $sigil, $ident, :$named, :$pos_slurpy, :$named_slurpy, :$full_name) {
        $V5DEBUG && say("add_placeholder_parameter($/, $sigil, $ident, :$named, :$pos_slurpy, :$named_slurpy, :$full_name)");
        # Ensure we're not trying to put a placeholder in the mainline.
        my $block := $*W.cur_lexpad();
        if $block.ann('IN_DECL') eq 'mainline' || $block.ann('IN_DECL') eq 'eval' {
            throw($/, <X Placeholder Mainline>,
                placeholder => $full_name,
            );
        }

        # Obtain/create placeholder parameter list.
        my @params := $block.ann('placeholder_sig') || $block.annotate('placeholder_sig', []);

        # If we already declared this as a placeholder, we're done.
        my $name := ~$sigil ~ ~$ident;
        for @params {
            if $_<variable_name> eq $name {
                return QAST::Var.new( :name($name), :scope('lexical') );
            }
        }

        # Make descriptor.
        my %param_info := hash(
            variable_name => $name,
            pos_slurpy    => $pos_slurpy,
            named_slurpy  => $named_slurpy,
            placeholder   => $full_name,
            sigil         => ~$sigil);

        # If it's slurpy, just goes on the end.
        if $pos_slurpy || $named_slurpy {
            @params.push(%param_info);
        }

        # If it's named, just shove it on the end, but before any slurpies.
        elsif $named {
            %param_info<named_names> := [$ident];
            my @popped;
            while @params
                    && (@params[+@params - 1]<pos_slurpy> || @params[+@params - 1]<named_slurpy>) {
                @popped.push(@params.pop);
            }
            @params.push(%param_info);
            while @popped { @params.push(@popped.pop) }
        }

        # Otherwise, put it in correct lexicographic position.
        else {
            my int $insert_at = 0;
            for @params {
                last if $_<pos_slurpy> || $_<named_slurpy> ||
                        $_<named_names> ||
                        nqp::substr($_<variable_name>, 1) gt $ident;
                $insert_at = $insert_at + 1;
            }
            nqp::splice(@params, [%param_info], $insert_at, 0);
        }

        # Add variable declaration, and evaluate to a lookup of it.
        my %existing := $block.symbol($name);
        if +%existing && !%existing<placeholder_parameter> {
            throw($/, <X Redeclaration>,
                symbol  => ~$/,
                postfix => ' as a placeholder parameter',
            );
        }
        $block[0].push(QAST::Var.new( :name($name), :scope('lexical'), :decl('var') ));
        $block.symbol($name, :scope('lexical'), :placeholder_parameter(1));
        return QAST::Var.new( :name($name), :scope('lexical') );
    }

    sub reference_to_code_object($code_obj is rw, Mu $past_block is rw) {
        $V5DEBUG && say("reference_to_code_object($past_block.cuid())");
        my $ref := QAST::WVal.new( :value($code_obj) );
        $ref.annotate('past_block', $past_block);
        $ref.annotate('code_object', $code_obj);
        return $ref;
    }

    sub block_closure(Mu $code is rw) {
        $V5DEBUG && say("block_closure()");
        my Mu $closure := QAST::Op.new(
            :op('callmethod'), :name('clone'),
            $code
        );
        $closure := QAST::Op.new( :op('p6capturelex'), $closure);
        $closure.annotate('past_block',  $code.ann('past_block'));
        $closure.annotate('code_object', $code.ann('code_object'));
        return $closure;
    }

    sub make_thunk_ref(Mu $to_thunk is rw, $/) {
        $V5DEBUG && say("make_thunk_ref($/)");
        my $block := $*W.push_lexpad($/);
        $block.push(QAST::Stmts.new(autosink($to_thunk)));
        #~ $block.push(QAST::Stmts.new($to_thunk));
        $*W.pop_lexpad();
        reference_to_code_object(
            $*W.create_simple_code_object($block, 'Code'),
            $block);
    }

    sub make_topic_block_ref(Mu $past is rw, :$copy, :$name = '$_') {
        $V5DEBUG && say("sub make_topic_block_ref($copy, $name)");
        my Mu $block := QAST::Block.new(
            QAST::Stmts.new(
                QAST::Var.new( :name($name), :scope('lexical'), :decl('var') )
            ),
            $past
        );
        ($*W.cur_lexpad())[0].push($block);
        my $param := hash( :variable_name($name), :nominal_type(find_symbol(['Mu'])), :is_parcel(!$copy) );
        if $copy {
            nqp::bindkey($param, 'container_descriptor', $*W.create_container_descriptor(
                    find_symbol(['Mu']), 0, $name
            ));
        }
        my $param_obj := $*W.create_parameter($/, $param);
        if $copy { $param_obj.set_copy() }
        my $sig := $*W.create_signature(nqp::hash('parameters', nqp::gethllsym("nqp", "nqplist")($param_obj)));
        add_signature_binding_code($block, $sig, nqp::gethllsym("nqp", "nqplist")($param));
        return reference_to_code_object(
            $*W.create_code_object($block, 'Block', $sig),
            $block);
    }

    sub make_where_block($expr) {
        # If it's already a block, nothing to do at all.
        if $expr.ann('past_block') {
            return $expr.ann('code_object');
        }

        # Build a block that'll smartmatch the topic against the
        # expression.
        my $past := QAST::Block.new(
            QAST::Stmts.new(
                QAST::Var.new( :name('$_'), :scope('lexical'), :decl('var') )
            ),
            QAST::Stmts.new(
                QAST::Op.new(
                    :op('callmethod'), :name('ACCEPTS'),
                    $expr,
                    QAST::Var.new( :name('$_'), :scope('lexical') )
                )));
        ($*W.cur_lexpad())[0].push($past);

        # Give it a signature and create code object.
        my $param := hash(
            variable_name => '$_',
            nominal_type => find_symbol(['Mu']));
        my $sig := $*W.create_signature(nqp::hash('parameters', [$*W.create_parameter($/, $param)]));
        add_signature_binding_code($past, $sig, [$param]);
        return $*W.create_code_object($past, 'Block', $sig);
    }

    sub when_handler_helper(Mu $when_block is copy) {
        unless nqp::existskey(%*HANDLERS, 'SUCCEED') {
            %*HANDLERS<SUCCEED> := QAST::Op.new(
                :op('p6return'),
                QAST::Op.new(
                    :op('p6typecheckrv'),
                    QAST::Op.new(
                        :op('getpayload'),
                        QAST::Op.new( :op('exception') )
                    ),
                    QAST::WVal.new( :value($*DECLARAND) )));
        }

        # if this is not an immediate block create a call
        if $when_block.ann('past_block') {
            $when_block := QAST::Op.new( :op('call'), $when_block);
        }

        # call succeed with the block return value, succeed will throw
        # a BREAK exception to be caught by the above handler
        my $result := QAST::Op.new(
            :op('call'),
            :name('&succeed'),
            $when_block,
        );

        # wrap it in a handle op so that we can use a PROCEED exception
        # to skip the succeed call
        return QAST::Op.new(
            :op('handle'),
            $result,
            'PROCEED',
            QAST::Op.new(
                :op('getpayload'),
                QAST::Op.new( :op('exception') )
            )
        );
    }

    # XXX This isn't quite right yet... need to evaluate these semantics
    sub set_block_handler($/, $handler, $type) {
        # Handler needs its own $/ and $!.
        $*W.install_lexical_magical($handler.ann('past_block'), '$!');
        $*W.install_lexical_magical($handler.ann('past_block'), '$/');

        # unshift handler preamble: create exception object and store it into $_
        my $exceptionreg := $handler.unique('exception_');
        my $handler_preamble := QAST::Stmts.new(
            QAST::Var.new( :scope('local'), :name($exceptionreg), :decl('param') ),
            QAST::Op.new(
                :op('bind'),
                QAST::Var.new( :scope('lexical'), :name('$_'), :decl('var') ),
                QAST::Op.new(
                    :op('call'), :name('&EXCEPTION'),
                    QAST::Var.new( :scope('local'), :name($exceptionreg) )
                )
            ),
            QAST::Op.new( :op('p6store'),
                QAST::Op.new( :op('getlexouter'), QAST::SVal.new( :value('$!') ) ),
                QAST::Var.new( :scope('lexical'), :name('$_') ),
            )
        );
        $handler.ann('past_block').unshift($handler_preamble);

        # If the handler has a succeed handler, then make sure we sink
        # the exception it will produce.
        if $handler.ann('past_block')<handlers> && nqp::existskey($handler.ann('past_block')<handlers>, 'SUCCEED') {
            my $suc := $handler.ann('past_block')<handlers><SUCCEED>;
            $suc[0] := QAST::Stmts.new(
                sink(QAST::Op.new(
                    :op('getpayload'),
                    QAST::Op.new( :op('exception') )
                )),
                QAST::Var.new( :name('Nil'), :scope('lexical') )
            );
        }

        # set up a generic exception rethrow, so that exception
        # handlers from unwanted frames will get skipped if the
        # code in our handler throws an exception.
        my $ex := QAST::Op.new( :op('exception') );
        if $handler.ann('past_block')<handlers> && nqp::existskey($handler.ann('past_block')<handlers>, $type) {
            if $*VM.name eq 'parrot' {
                $ex := QAST::VM.new( :pirop('perl6_skip_handlers_in_rethrow__0Pi'),
                    $ex, QAST::IVal.new( :value(1) ));
            }
        }
        else {
            my $prev_content := QAST::Stmts.new();
            $prev_content.push($handler.ann('past_block').shift()) while +@($handler.ann('past_block'));
            $prev_content.push(QAST::Var.new( :name('Nil'), :scope('lexical') ));
            $handler.ann('past_block').push(QAST::Op.new(
                :op('handle'),
                $prev_content,
                'CATCH',
                QAST::VM.new(
                    :parrot(QAST::VM.new(
                        :pirop('perl6_based_rethrow 1PP'),
                        QAST::Op.new( :op('exception') ),
                        QAST::Var.new( :name($exceptionreg), :scope('local') ),
                    )),
                    :jvm(QAST::Op.new(
                        :op('rethrow'),
                        QAST::Op.new( :op('exception') )
                    )),
                    :moar(QAST::Op.new(
                        :op('rethrow'),
                        QAST::Op.new( :op('exception') )
                    )),
                )));

            # rethrow the exception if we reach the end of the handler
            # (if a when {} clause matches this will get skipped due
            # to the BREAK exception)
            $handler.ann('past_block').push(QAST::Op.new(
                :op('rethrow'),
                QAST::Var.new( :name($exceptionreg), :scope('local') )));
        }

        # create code that calls our handler with the Parrot exception
        # as argument and returns the result. The install the handler.
        %*HANDLERS{$type} := QAST::Stmts.new(
            :node($/),
            QAST::VM.new(
                :parrot(QAST::VM.new( :pirop('perl6_invoke_catchhandler__vPP'), $handler, $ex )),
                :jvm(QAST::Op.new( :op('call'), $handler )),
                :moar(QAST::Op.new( :op('call'), $handler )),
            ),
            QAST::Var.new( :scope('lexical'), :name('Nil') )
        );
    }

    # Handles the case where we have a default value closure for an
    # attribute.
    method install_attr_init($/, $attr, $initializer, $block) {
        $V5DEBUG && say("method install_attr_init($/, $attr, $initializer, $block)");
        # Construct signature and anonymous method.
        my @params := [
            hash( is_invocant => 1, nominal_type => $*PACKAGE),
            hash( variable_name => '$_', nominal_type => find_symbol(['Mu']))
        ];
        my $sig := $*W.create_signature(nqp::hash('parameters', [
            $*W.create_parameter($/, @params[0]),
            $*W.create_parameter($/, @params[1])
        ]));
        $block[0].push(QAST::Var.new( :name('self'), :scope('lexical'), :decl('var') ));
        $block[0].push(QAST::Var.new( :name('$_'), :scope('lexical'), :decl('var') ));
        $block.push(QAST::Stmts.new( $initializer ));
        $block.symbol('self', :scope('lexical'));
        add_signature_binding_code($block, $sig, @params);
        my $code := $*W.create_code_object($block, 'Method', $sig);

        # Block should go in current lexpad, in correct lexical context.
        ($*W.cur_lexpad())[0].push($block);

        # Dispatch trait. XXX Should really be Bool::True, not Int here...
        my $true := ($*W.add_constant('Int', 'int', 1)).compile_time_value;
        $*W.apply_trait($/, '&trait_mod:<will>', $attr, :build($code));
    }

    # This is the hook where, in the future, we'll use this as the hook to check
    # if we have a proto or other declaration in scope that states that this sub
    # has a signature of the form :(\|$parcel), in which case we don't promote
    # the Parcel to a Capture when calling it. For now, we just worry about the
    # special case, return.
    sub capture_or_parcel(Mu $args, $name) {
        $V5DEBUG && say("sub capture_or_parcel($name)");
        if $name eq 'return' {
            # Need to demote pairs again.
            my $parcel := QAST::Op.new( :op('call') );
            for @($args) {
                $parcel.push($_<before_promotion> ?? $_<before_promotion> !! $_);
            }
            $parcel
        }
        else {
            $args
        }
    }

    # This checks if we have something of the form * op *, * op <thing> or
    # <thing> op * and if so, and if it's not one of the ops we do not
    # auto-curry for, emits a closure instead. We hard-code the things not
    # to curry for now; in the future, we will inspect the multi signatures
    # of the op to decide, or likely store things in this hash from that
    # introspection and keep it as a quick cache.

    # %curried == 0 means do not curry
    # %curried == 1 means curry WhateverCode only
    # %curried == 2 means curry both WhateverCode and Whatever (default)

    my %curried;
    INIT {
        %curried{'&infix:<...>'}  := 0;
        %curried{'&infix:<...^>'} := 0;
        %curried{'&infix:<~~>'}   := 0;
        %curried{'&infix:<=>'}    := 0;
        %curried{'&infix:<:=>'}   := 0;
        %curried{'&infix:<..>'}   := 1;
        %curried{'&infix:<..^>'}  := 1;
        %curried{'&infix:<^..>'}  := 1;
        %curried{'&infix:<^..^>'} := 1;
        %curried{'&infix:<xx>'}   := 1;
        %curried{'callmethod'}    := 2;
    }
    sub whatever_curry($/, Mu $past is copy, $upto_arity) {
        my $curried :=
            # It must be an op and...
            nqp::istype($past, QAST::Op) && (

            # Either a call that we're allowed to curry...
                (($past.op eq 'call' || $past.op eq 'chain') &&
                    (nqp::index($past.name, '&infix:') == 0 ||
                     nqp::index($past.name, '&prefix:') == 0 ||
                     nqp::index($past.name, '&postfix:') == 0 ||
                     (nqp::istype($past[0], QAST::Op) &&
                        nqp::index($past[0].name, '&METAOP') == 0)) &&
                    %curried{$past.name} // 2)

            # Or not a call and an op in the list of alloweds.
                || ($past.op ne 'call' && %curried{$past.op} // 0)
            );
        my int $i = 0;
        my int $whatevers = 0;
        while $curried && $i < $upto_arity {
            my $check := $past[$i];
            $check := $check[0] if (nqp::istype($check, QAST::Stmts) ||
                                    nqp::istype($check, QAST::Stmt)) &&
                                   +@($check) == 1;
            $whatevers = $whatevers + 1 if istype($check.returns, WhateverCode)
                            || $curried > 1 && istype($check.returns, Whatever);
            $i = $i + 1;
        }
        if $whatevers {
            my int $i = 0;
            my @params;
            my $block := QAST::Block.new(QAST::Stmts.new(), $past);
            $*W.cur_lexpad()[0].push($block);
            while $i < $upto_arity {
                my $old := $past[$i];
                $old := $old[0] if (nqp::istype($old, QAST::Stmts) ||
                                    nqp::istype($old, QAST::Stmt)) &&
                                   +@($old) == 1;
                if istype($old.returns, WhateverCode) {
                    my $new := QAST::Op.new( :op<call>, :node($/), $old);
                    my $acount := 0;
                    while $acount < $old.arity {
                        my $pname := '$x' ~ (+@params);
                        @params.push(hash(
                            :variable_name($pname),
                            :nominal_type(find_symbol(['Mu'])),
                            :is_parcel(1),
                        ));
                        $block[0].push(QAST::Var.new(:name($pname), :scope<lexical>, :decl('var')));
                        $new.push(QAST::Var.new(:name($pname), :scope<lexical>));
                        $acount++;
                    }
                    $past[$i] := $new;
                }
                elsif $curried > 1 && istype($old.returns, Whatever) {
                    my $pname := '$x' ~ (+@params);
                    @params.push(hash(
                        :variable_name($pname),
                        :nominal_type(find_symbol(['Mu'])),
                        :is_parcel(1),
                    ));
                    $block[0].push(QAST::Var.new(:name($pname), :scope<lexical>, :decl('var')));
                    $past[$i] := QAST::Var.new(:name($pname), :scope<lexical>);
                }
                $i = $i + 1;
            }
            my %sig_info := hash(parameters => @params);
            my $signature := create_signature_object($/, %sig_info, $block);
            add_signature_binding_code($block, $signature, @params);
            my $code := $*W.create_code_object($block, 'WhateverCode', $signature);
            $past    := block_closure(reference_to_code_object($code, $block));
            $past.returns(WhateverCode);
            $past.arity(+@params);
        }
        $past
    }

    sub wrap_return_handler(Mu $past is rw) {
        QAST::Op.new(
            :op('p6typecheckrv'),
            QAST::Stmts.new(
                :resultchild(0),
                QAST::Op.new(
                    :op<lexotic>, :name<RETURN>,
                    # If we fall off the bottom, decontainerize if
                    # rw not set.
                    QAST::Op.new( :op('p6decontrv'), QAST::WVal.new( :value($*DECLARAND) ), $past )
                ),
                QAST::Op.new(
                    :op<bind>,
                    QAST::Var.new(:name<RETURN>, :scope<lexical>),
                    QAST::Var.new(:name<&EXHAUST>, :scope<lexical>))
            ),
            QAST::WVal.new( :value($*DECLARAND) )
        )
    }

    # Works out how to look up a type. If it's not generic we statically
    # resolve it. Otherwise, we punt to a runtime lexical lookup.
    sub instantiated_type(@name, $/) {
        my $type := find_symbol(@name);
        my $is_generic := 0;
        try { $is_generic := $type.HOW.archetypes.generic }
        my $past;
        if $is_generic {
            $past := symbol_lookup(@name, $/);
            $past.set_compile_time_value($type);
        }
        else {
            $past := QAST::WVal.new( :value($type) );
        }
        $past.returns($type.WHAT);
        return $past;
    }

    # Ensures that the given PAST node has a value known at compile
    # time and if so obtains it. Otherwise reports an error, involving
    # the $usage parameter to make it more helpful.
    sub compile_time_value_str($past, $usage, $/) {
        if $past.has_compile_time_value {
            nqp::unbox_s($past.compile_time_value);
        }
        else {
            throw($/, <X Value Dynamic>, what => $usage);
        }
    }

    sub istype(Mu $val, Mu $type) {
        try { return nqp::istype($val, $type) }
        0
    }

    sub strip_trailing_zeros(str $n is copy) {
        $V5DEBUG && say("sub strip_trailing_zeros(str $n)");
        return $n if nqp::index($n, '.') < 0;
        while nqp::index('_0',nqp::substr($n, -1)) >= 0 {
            $n = nqp::substr($n, 0, nqp::chars($n) - 1);
        }
        $n;
    }

    # radix, $base, $exponent: parrot numbers (Integer or Float)
    # $number: parrot string
    # return value: PAST for Int, Rat or Num
    sub radcalc($/, $radix is copy, $number is copy, $base?, $exponent?, :$num) {
        my $sign = 1;
        throw($/, <X Syntax Number RadixOutOfRange>, :$radix)
            if $radix < 2 || $radix > 36;
        nqp::die("You gave us a base for the magnitude, but you forgot the exponent.")
            if nqp::defined($base) && !nqp::defined($exponent);
        nqp::die("You gave us an exponent for the magnitude, but you forgot the base.")
            if !nqp::defined($base) && nqp::defined($exponent);

        if $number.substr(0, 1) eq '-' {
            $sign = -1;
            $number = nqp::substr($number, 1);
        }
        if nqp::substr($number, 0, 1) eq '0' {
            my $radix_name := nqp::uc(nqp::substr($number, 1, 1));
            if nqp::index('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ', $radix_name) > $radix {
                $number = nqp::substr($number, 2);

                if      $radix_name eq 'B' {
                    $radix = 2;
                } elsif $radix_name eq 'O' {
                    $radix = 8;
                } elsif $radix_name eq 'D' {
                    $radix = 10;
                } elsif $radix_name eq 'X' {
                    $radix = 16;
                } else {
                    nqp::die("Unkonwn radix character '$radix_name' (can be b, o, d, x)");
                }
            }
        }

        $number          = strip_trailing_zeros(~$number);
        my $iresult      = 0;
        my $fdivide      = 1;
        my $radixInt     = $radix.Int;
        my int $idx      = -1;
        my int $seen_dot = 0;
        while $idx < $number.chars - 1 {
            $idx = $idx + 1;
            my $current = $number.substr($idx, 1).uc;
            next if $current eq '_';
            if $current eq '.' {
                $seen_dot = 1;
                next;
            }
            my $i = nqp::index('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ', $current);
            nqp::die("Invalid character '$current' in number literal") if $i < 0 || $i >= $radix;
            $iresult = $iresult * $radixInt + $i;
            $fdivide = $fdivide * $radixInt if $seen_dot;
        }

        $iresult = $iresult * $sign;

        if $num {
            if $iresult {
                my Num $result = ($iresult.Num / $fdivide.Num) * $base**$exponent;
                return add_numeric_constant($/, 'Num', $result);
            } else {
                return add_numeric_constant($/, 'Num', 0e0);
            }
        } else {
            if nqp::defined($exponent) {
                $iresult = $iresult * $base**$exponent;
            }
            if $seen_dot {
                # add_constant special-cases Rat, so there is
                # no need to add $iresult and $fdivide first
                return $*W.add_constant('Rat', 'type_new',
                    $iresult, $fdivide, :nocache(1)
                );
            } else {
                return add_numeric_constant($/, 'Int', $iresult);
            }
        }
    }
}

class Perl5::QActions does STDActions {
    method nibbler($/) {
        $V5DEBUG && say("method nibbler($/)");
        my Mu $asts := nqp::list();
        my $lastlit := '';

        for @*nibbles {
            if nqp::istype($_, Match) {
                if nqp::istype($_.ast, QAST::Node) {
                    if $lastlit ne '' {
                        nqp::push($asts, $*W.add_string_constant($lastlit));
                        $lastlit := '';
                    }
                    nqp::push($asts, $_.ast.ann('ww_atom')
                        ?? $_.ast
                        !! QAST::Op.new( :op('call'), :name('&prefix:<P5.>'),  $_.ast ));
                }
                else {
                    $lastlit := $lastlit ~ $_.ast;
                }
            }
            else {
                $lastlit := $lastlit ~ $_;
            }
        }
        if $lastlit ne '' || !nqp::elems($asts) {
            nqp::push($asts, $*W.add_string_constant($lastlit));
        }

        my $past := nqp::shift($asts);
        while nqp::elems($asts) && ($_ := nqp::shift($asts)) {
            $past := QAST::Op.new( :op('call'), :name('&infix:<P5.>'), $past, $_ );
        }

        if nqp::can($/.CURSOR, 'postprocessor') {
            my $pp := $/.CURSOR.postprocessor;
            $past := self."postprocess_$pp"($/, $past);
        }

        $past.node($/);
        make $past;
    }

    method postprocess_null($/, $past) {
        $V5DEBUG && say("method postprocess_null($/, \$past)");
        $past
    }

    method postprocess_run($/, $past) {
        $V5DEBUG && say("method postprocess_run($/, \$past)");
        QAST::Op.new( :name('&QX'), :op('call'), :node($/), $past )
    }

    method postprocess_words($/, Mu $past is copy) {
        $V5DEBUG && say("method postprocess_words($/, \$past)");
        if $past.has_compile_time_value {
            my @words = $past.compile_time_value.words.list;
            if +@words != 1 {
                $past := QAST::Op.new( :op('call'), :name('&infix:<,>'), :node($/) );
                for @words { $past.push($*W.add_string_constant(~$_)); }
                $past := QAST::Stmts.new($past);
            }
            else {
                $past := $*W.add_string_constant(~@words[0]);
            }
        }
        else {
            $past := QAST::Op.new( :op('callmethod'), :name('words'), :node($/), $past );
        }
        return $past;
    }

    method postprocess_quotewords($/, Mu $past) {
        $V5DEBUG && say("method postprocess_quotewords($/, \$past)");
        my $result := QAST::Op.new( :op('call'), :name('&infix:<,>'), :node($/) );
        sub walk($node) {
            if $node.ann('ww_atom') {
                $result.push($node);
            }
            elsif nqp::istype($node, QAST::Op) && $node.name eq '&infix:<P5.>' {
                $node.name('&infix:<P5.>');
                walk($node[0]);
                walk($node[1]);
            }
            else {
                my $ppw := self.postprocess_words($/, $node);
                unless nqp::istype($ppw, QAST::Stmts) && +@($ppw[0]) == 0 {
                    $result.push($ppw);
                }
            }
        }
        walk($past);
        return +@($result) == 1 ?? $result[0] !! $result;
    }

    method postprocess_heredoc($/, Mu $past) {
        $V5DEBUG && say("method postprocess_heredoc($/)");
        return QAST::Stmts.new(
            QAST::Op.new( :op<die_s>, QAST::SVal.new( :value("Premature heredoc consumption") ) ),
            $past);
    }

    method charspec($/) {
        $V5DEBUG && say("charspec($/)");
        make $<charnames>
            ?? $<charnames>.ast
            !! $<number>
                ?? nqp::chr(+$<number>)
                !! $<quest>
                    ?? nqp::chr(127)
                    !! nqp::chr(nqp::ord(nqp::uc($/)) - 64);
    }

    method escape:sym<\\>($/) { make $<item>.ast; }
    method backslash:sym<qq>($/) { make $<quote>.ast; }
    method backslash:sym<\\>($/) { make $<text>.Str; }
    method backslash:sym<stopper>($/) { make $<text>.Str; }
    method backslash:sym<miscq>($/) { make '\\' ~ ~$/; }
    method backslash:sym<misc>($/) { make ~$/; }

    method backslash:sym<a>($/) { make nqp::chr(7) }
    method backslash:sym<b>($/) { make "\b" }
    method backslash:sym<c>($/) { make $<charspec>.ast }
    method backslash:sym<e>($/) { make "\c[27]" }
    method backslash:sym<f>($/) { make "\c[12]" }
    method backslash:sym<n>($/) { make "\n" }
    method backslash:sym<N>($/) {
        my $name := ~$<charname>;
        my $codepoint := $name eq 'NEL' ?? 0x85 !! nqp::codepointfromname($name);
        $/.CURSOR.panic("Unrecognized character name $<charname>") if $codepoint < 0;
        make nqp::chr($codepoint);
    }
    method backslash:sym<r>($/) { make "\r" }
    method backslash:sym<t>($/) { make "\t" }
    method backslash:sym<x>($/) { make self.ints_to_string( $<hexint> ?? $<hexint> !! $<hexints><hexint> ) }
    method backslash:sym<0>($/) { make self.ints_to_string( $<octint> ?? $<octint> !! $<octints><octint> ) }

    method escape:sym<{ }>($/) {
        make QAST::Op.new(
            :op('callmethod'), :name('Stringy'),
            QAST::Op.new(
                :op('call'),
                QAST::Op.new( :op('p6capturelex'), $<block>.ast ),
                :node($/)));
    }

    method escape:sym<$>($/) { make $<EXPR>.ast; }
    method escape:sym<@>($/) {
        my $joiner := $*W.add_string_constant(' ');
        $joiner.named('joiner');
        make QAST::Op.new( :op<call>, :name<&P5Str>, $<termish>.ast, $joiner )
    }
    method escape:sym<%>($/) { make $<termish>.ast; }
    method escape:sym<&>($/) { make $<EXPR>.ast; }

    method escape:sym<' '>($/) { make mark_ww_atom($<quote>.ast); }
    method escape:sym<" ">($/) { make mark_ww_atom($<quote>.ast); }
    sub mark_ww_atom($ast) {
        $ast.annotate('ww_atom', 1);
        $ast;
    }
}

class Perl5::RegexActions does STDActions {
    method nibbler($/) { make $<alternation>.ast }

    method alternation($/) {
        my $qast := $<sequence>[0].ast;
        if +$<sequence> > 1 {
            $qast := QAST::Regex.new( :rxtype<altseq>, :node($/) );
            for $<sequence>.list { $qast.push($_.ast); }
        }
        make $qast;
    }

    method sequence($/) {
        if $<quantified_atom> {
            my $qast := QAST::Regex.new( :rxtype<concat>, :node($/) );
            my $lastlit := 0;
            for $<quantified_atom>.list {
                my $ast := $_.ast;
                if $ast {
                    if $lastlit && $ast.rxtype eq 'literal'
                            && !QAST::Node.ACCEPTS($ast[0]) {
                        $lastlit[0] := $lastlit[0] ~ $ast[0];
                    }
                    else {
                        $qast.push($_.ast);
                        $lastlit := $ast.rxtype eq 'literal'
                                    && !QAST::Node.ACCEPTS($ast[0])
                                    ?? $ast !! 0;
                    }
                }
            }
            make $qast;
        }
        else {
            make QAST::Regex.new( :rxtype<anchor>, :name<pass>, :node($/) );
        }
    }

    method quantified_atom($/) {
        my $qast := $<atom>.ast;
        if $<quantifier> {
            my $ast := $<quantifier>[0].ast;
            $ast.unshift($qast || QAST::Regex.new( :rxtype<anchor>, :name<pass> ));
            $qast := $ast;
        }
        $qast.backtrack('r') if $qast && !$qast.backtrack && %*RX<r>;
        make $qast;
    }

    method atom($/) {
        if $<metachar> {
            make $<metachar>.ast;
        }
        elsif $<esc> {
            my $qast := QAST::Regex.new( ~$<esc>, :rxtype<literal>, :node($/));
            make $qast;
        }
        else {
            my $qast := QAST::Regex.new( ~$/, :rxtype<literal>, :node($/));
            $qast.subtype('ignorecase') if %*RX<i>;
            make $qast;
        }
    }

    method p5metachar:sym<bs>($/) {
        make $<backslash>.ast;
    }

    method p5metachar:sym<.>($/) {
        make %*RX<s>
            ?? QAST::Regex.new( :rxtype<cclass>, :name<.>, :node($/) )
            !! QAST::Regex.new( :rxtype<cclass>, :name<n>, :negate(1), :node($/) );
    }

    method p5metachar:sym<^>($/) {
        make QAST::Regex.new( :rxtype<anchor>, :subtype(%*RX<m> ?? 'bol' !! 'bos'), :node($/) );
    }

    method p5metachar:sym<$>($/) {
        make QAST::Regex.new(
            :rxtype('concat'),
            QAST::Regex.new(
                :rxtype('quant'), :min(0), :max(1),
                QAST::Regex.new( :rxtype('literal'), "\n" )
            ),
            QAST::Regex.new( :rxtype<anchor>, :subtype(%*RX<m> ?? 'eol' !! 'eos'), :node($/) )
        );
    }

    method p5metachar:sym<(? )>($/) { # like P6's $<name>=[ ... ]
        my $qast;
        if $<nibbler> {
            $qast := QAST::Regex.new( :rxtype<subcapture>, :name(~$<name>),
                $<nibbler>.ast, :node($/) );
        }
        else {
            $qast := $<assertion>.ast;
        }
        make $qast;
    }

    method p5metachar:sym<(?: )>($/) {
        make $<nibbler>.ast;
    }

    method p5metachar:sym<( )>($/) {
        make QAST::Regex.new( :rxtype<subcapture>, :node($/),
            $<nibbler>.ast );
    }

    method p5metachar:sym<[ ]>($/) {
        make $<cclass>.ast;
    }

    method p5metachar:sym<(?{ })>($/) {
        make QAST::Regex.new( $<codeblock>.ast,
                              :rxtype<qastnode>, :node($/) );
    }

    method p5metachar:sym<(??{ })>($/) {
        make QAST::Regex.new(
                 QAST::NodeList.new(
                    QAST::SVal.new( :value('INTERPOLATE') ),
                    $<codeblock>.ast,
                    QAST::IVal.new( :value(%*RX<i> ?? 1 !! 0) ),
                    QAST::IVal.new( :value(1) ),
                    QAST::IVal.new( :value(1) ) ),
                 :rxtype<subrule>, :subtype<method>, :node($/));
    }

    method p5metachar:sym<var>($/) {
        if $*INTERPOLATE {
            make QAST::Regex.new( QAST::NodeList.new(
                                        QAST::SVal.new( :value('INTERPOLATE') ),
                                        $<var>.ast,
                                        QAST::IVal.new( :value(%*RX<i> ?? 1 !! 0) ),
                                        QAST::IVal.new( :value($*SEQ ?? 1 !! 0) ),
                                        QAST::IVal.new( :value(1) ) ),
                                  :rxtype<subrule>, :subtype<method>, :node($/));
        }
        else {
            make QAST::Regex.new( QAST::NodeList.new(
                                        QAST::SVal.new( :value('!LITERAL') ),
                                        $<var>.ast,
                                        QAST::IVal.new( :value(%*RX<i> ?? 1 !! 0) ) ),
                                :rxtype<subrule>, :subtype<method>, :node($/));
        }
    }

    method codeblock($/) {
        my $blockref := $<block>.ast;
        my $past :=
            QAST::Stmts.new(
                QAST::Op.new(
                    :op('p6store'),
                    QAST::Var.new( :name('$/'), :scope<lexical> ),
                    QAST::Op.new(
                        QAST::Var.new( :name('$¢'), :scope<lexical> ),
                        :name('MATCH'),
                        :op('callmethod')
                    )
                ),
                QAST::Op.new(:op<call>, $blockref)
            );
        make $past;
    }

    method cclass($/) {
        my $str := '';
        my $qast;
        my @alts;
        for $<charspec>.list {
            if $_[1] {
                my $node;
                my $lhs;
                my $rhs;
                if $_[0]<backslash> {
                    $node := $_[0]<backslash>.ast;
                    $/.CURSOR.panic("Illegal range endpoint in regex: " ~ ~$_)
                        if $node.rxtype ne 'literal' && $node.rxtype ne 'enumcharlist'
                            || $node.negate || nqp::chars($node[0]) != 1;
                    $lhs := $node[0];
                }
                else {
                    $lhs := ~$_[0][0];
                }
                if $_[1][0]<backslash> {
                    $node := $_[1][0]<backslash>.ast;
                    $/.CURSOR.panic("Illegal range endpoint in regex: " ~ ~$_)
                        if $node.rxtype ne 'literal' && $node.rxtype ne 'enumcharlist'
                            || $node.negate || nqp::chars($node[0]) != 1;
                    $rhs := $node[0];
                }
                else {
                    $rhs := ~$_[1][0][0];
                }
                sub add_range($from, $to) {
                    my $ord0 = nqp::ord($from);
                    my $ord1 = nqp::ord($to);
                    $/.CURSOR.panic("Illegal reversed character range in regex: " ~ ~$_)
                        if $ord0 > $ord1;
                    $str := nqp::concat($str, nqp::chr($ord0++)) while $ord0 <= $ord1;
                }
                if %*RX<i> {
                    add_range(nqp::lc($lhs), nqp::lc($rhs));
                    add_range(nqp::uc($lhs), nqp::uc($rhs));
                }
                else {
                    add_range($lhs, $rhs);
                }
            }
            elsif $_[0]<backslash> {
                my $bs := $_[0]<backslash>.ast;
                $bs.negate(!$bs.negate) if $<sign> eq '^';
                @alts.push($bs);
            }
            else {
                my $c := ~$_[0];
                $str := $str ~ (%*RX<i> ?? nqp::lc($c) ~ nqp::uc($c) !! $c);
            }
        }
        @alts.push(QAST::Regex.new( $str, :rxtype<enumcharlist>, :node($/), :negate( $<sign> eq '^' ) ))
            if nqp::chars($str);
        $qast := +@alts == 1 ?? @alts[0] !!
            $<sign> eq '^' ??
                QAST::Regex.new( :rxtype<concat>, :node($/),
                    QAST::Regex.new( :rxtype<conj>, :subtype<zerowidth>, |@alts ),
                    QAST::Regex.new( :rxtype<cclass>, :name<.> ) ) !!
                QAST::Regex.new( :rxtype<altseq>, |@alts );
        make $qast;
    }

    method p5backslash:sym<A>($/) {
        make QAST::Regex.new( :rxtype<anchor>, :subtype<bos>, :node($/) );
    }

    method p5backslash:sym<b>($/) {
        make QAST::Regex.new(:rxtype<subrule>, :subtype<zerowidth>,
                             :node($/), :negate($<sym> eq 'B'), :name(''),
                             QAST::NodeList.new( QAST::SVal.new( :value('wb') ) ));
    }

    method p5backslash:sym<h>($/) {
        make QAST::Regex.new( "\x[09,20,a0,1680,180e,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,200a,202f,205f,3000]", :rxtype('enumcharlist'),
                        :negate($<sym> eq 'H'), :node($/) );
    }

    method p5backslash:sym<r>($/) {
        make QAST::Regex.new( "\r", :rxtype('enumcharlist'), :node($/) );
    }

    method p5backslash:sym<R>($/) {
        make QAST::Regex.new( :rxtype<cclass>, :name( 'n' ), :node($/) );
    }

    method p5backslash:sym<s>($/) {
        make QAST::Regex.new(:rxtype<cclass>, :name( nqp::lc(~$<sym>) ),
                             :negate($<sym> le 'Z'), :node($/));
    }

    method p5backslash:sym<t>($/) {
        make QAST::Regex.new( "\t", :rxtype('enumcharlist'),
                        :negate($<sym> eq 'T'), :node($/) );
    }

    method p5backslash:sym<v>($/) {
        make QAST::Regex.new( "\x[0a,0b,0c,0d,85,2028,2029]",
                        :rxtype('enumcharlist'),
                        :negate($<sym> eq 'V'), :node($/) );
    }

    method p5backslash:sym<x>($/) {
        my $hexlit := nqp::chars(~$<hexint>)
            ?? nqp::chr( :16(~$<hexint>) )
            !! nqp::chr(0);
        make QAST::Regex.new( $hexlit, :rxtype('literal'), :node($/) );
    }

    method p5backslash:sym<z>($/) {
        make QAST::Regex.new( :rxtype<anchor>, :subtype<eos>, :node($/) );
    }

    method p5backslash:sym<Z>($/) {
        make QAST::Regex.new(
            :rxtype('concat'),
            QAST::Regex.new(
                :rxtype('quant'), :min(0), :max(1),
                QAST::Regex.new( :rxtype('literal'), "\n" )
            ),
            QAST::Regex.new( :rxtype<anchor>, :subtype('eos'), :node($/) )
        );
    }

    method p5backslash:sym<misc>($/) {
        if $<litchar> {
            make QAST::Regex.new( ~$<litchar> , :rxtype('literal'), :node($/) );
        }
        else {
            make QAST::Regex.new( :rxtype<subrule>, :subtype<method>, :node($/),
                QAST::NodeList.new(
                    QAST::SVal.new( :value('!BACKREF') ),
                    QAST::SVal.new( :value(~$<number> - 1) ) ) );
        }
    }

    method p5assertion:sym«<»($/) {
        if $<nibbler> {
            make QAST::Regex.new(
                :rxtype<subrule>, :subtype<zerowidth>, :negate($<neg> eq '!'), :node($/),
                QAST::NodeList.new(
                    QAST::SVal.new( :value('after') ),
                    self.qbuildsub(self.flip_ast($<nibbler>.ast), :anon(1), :addself(1))
                ));
        }
        else {
            make 0;
        }
    }

    method p5assertion:sym<=>($/) {
        if $<nibbler> {
            make QAST::Regex.new(
                :rxtype<subrule>, :subtype<zerowidth>, :node($/),
                QAST::NodeList.new(
                    QAST::SVal.new( :value('before') ),
                    self.qbuildsub($<nibbler>.ast, :anon(1), :addself(1))
                ));
        }
        else {
            make 0;
        }
    }

    method p5assertion:sym<!>($/) {
        if $<nibbler> {
            make QAST::Regex.new(
                :rxtype<subrule>, :subtype<zerowidth>, :negate(1), :node($/),
                QAST::NodeList.new(
                    QAST::SVal.new( :value('before') ),
                    self.qbuildsub($<nibbler>.ast, :anon(1), :addself(1))
                ));
        }
        else {
            make 0;
        }
    }

    method p5mods($/) {
        for nqp::split('', ~$<on>) {
            %*RX{$_} := 1;
        }
        if $<off> {
            for nqp::split('', ~$<off>[0]) {
                %*RX{$_} := 0;
            }
        }
    }

    method p5assertion:sym<mod>($/) {
        if $<nibbler> {
            make $<nibbler>[0].ast;
        }
        else {
            for %*RX {
                %*OLDRX{$_.key} := $_.value;
            }
            make 0;
        }
    }

    method p5quantifier:sym<*>($/) {
        my $qast := QAST::Regex.new( :rxtype<quant>, :min(0), :max(-1), :node($/) );
        make quantmod($qast, $<quantmod>);
    }

    method p5quantifier:sym<+>($/) {
        my $qast := QAST::Regex.new( :rxtype<quant>, :min(1), :max(-1), :node($/) );
        make quantmod($qast, $<quantmod>);
    }

    method p5quantifier:sym<?>($/) {
        my $qast := QAST::Regex.new( :rxtype<quant>, :min(0), :max(1), :node($/) );
        make quantmod($qast, ~$<quantmod>);
    }

    method p5quantifier:sym<{ }>($/) {
        my $qast;
        $qast := QAST::Regex.new( :rxtype<quant>, :min(+$<start>), :node($/) );
        if $<end> && ~$<end>[0] ne '' { $qast.max(+$<end>[0]); }
        elsif $<comma>                { $qast.max(-1); }
        else                          { $qast.max($qast.min); }
        make quantmod($qast, $<quantmod>);
    }

    sub quantmod(Mu $ast is rw, $mod) {
        if    $mod eq '?' { $ast.backtrack('f') }
        elsif $mod eq '+' { $ast.backtrack('g') }
        $ast;
    }

    method qbuildsub(Mu $qast is rw, Mu $block = QAST::Block.new(), :$anon, :$addself, *%rest) {
        $block := nqp::decont($block);
        my $code_obj := nqp::existskey(%rest, 'code_obj')
            ?? %rest<code_obj>
            !! self.create_regex_code_object($block);

        if $addself {
            $block.push(QAST::Var.new( :name('self'), :scope('local'), :decl('param') ));
        }
        unless $block.symbol('$¢') {
            $block.push(QAST::Var.new(:name<$¢>, :scope<lexical>, :decl('var')));
            $block.symbol('$¢', :scope<lexical>);
        }

        my $capnames := capnames($qast, 0);
        $capnames    := nqp::getattr($capnames, EnumMap, '$!storage');
        self.store_regex_caps($code_obj, $block, $capnames);
        self.store_regex_nfa($code_obj, $block, QRegex::NFA.new.addnode($qast));

        $block.annotate('orig_qast', $qast);
        $qast := QAST::Regex.new( :rxtype<concat>,
                     QAST::Regex.new( :rxtype<scan> ),
                     $qast,
                     ($anon ??
                          QAST::Regex.new( :rxtype<pass> ) !!
                          QAST::Regex.new( :rxtype<pass>, :name(%*RX<name>) )));
        $block.push($qast);

        $block;
    }

    sub capnames(Mu $ast is rw, $count is copy) {
        my %capnames;
        my $rxtype := $ast.rxtype;
        if $rxtype eq 'concat' {
            for $ast.list {
                my %x = capnames($_, $count);
                for %x {
                    %capnames{$_.key} = %capnames{$_.key}:exists
                        ?? +%capnames{$_.key} + $_.value !! $_.value;
                }
                $count = %x{''};
            }
        }
        elsif $rxtype eq 'altseq' || $rxtype eq 'alt' {
            my $max = $count;
            for $ast.list {
                my %x = capnames($_, $count);
                for %x {
                    %capnames{$_.key} = (%capnames{$_.key} // 0) < 2 && %x{$_.key} == 1 ?? 1 !! 2;
                }
                $count = %x{''};
            }
        }
        elsif $rxtype eq 'subrule' && $ast.subtype eq 'capture' {
            my $name = $ast.name;
            if $name eq '' { $name = $count; $ast.name($name); }
            my @names = $name.split('=');
            for @names {
                if $_ eq '0' || $_ > 0 { $count = $_ + 1; }
                %capnames{$_} = 1;
            }
        }
        elsif $rxtype eq 'subcapture' {
            my $name = $ast.name;
            unless $name { $name = $count; $ast.name($name); }
            for $name.Str.split(' ').list {
                if $_ eq '0' || $_ > 0 { $count = $_ + 1; }
                %capnames{$_} = 1;
            }
            my %x = capnames($ast[0], $count);
            for %x {
                %capnames{$_.key} = %capnames{$_.key}:exists
                    ?? +%capnames{$_.key} + %x{$_.key} !! %x{$_.key};
            }
            $count = %x{''};
        }
        elsif $rxtype eq 'quant' {
            my %astcap = capnames($ast[0], $count);
            $count = %astcap{''};
        }
        %capnames{''} = $count;
        %capnames<$!from>:delete;
        %capnames<$!to>:delete;
        %capnames;
    }

    method flip_ast($qast) {
        return $qast unless nqp::istype($qast, QAST::Regex);
        if $qast.rxtype eq 'literal' {
            $qast[0] := nqp::flip($qast[0]);
        }
        elsif $qast.rxtype eq 'concat' {
            my @tmp;
            while +@($qast) { @tmp.push(@($qast).shift) }
            while @tmp      { @($qast).push(self.flip_ast(@tmp.pop)) }
        }
        else {
            for @($qast) { self.flip_ast($_) }
        }
        $qast
    }

    method create_regex_code_object(Mu $block) {
        $*W.create_code_object($block, 'Regex',
            $*W.create_signature(nqp::hash('parameters', [])))
    }

    # Stores the captures info for a regex.
    method store_regex_caps($code_obj, Mu $block, $caps is rw) {
        $V5DEBUG && say("store_regex_caps()");
        $code_obj.SET_CAPS(nqp::getattr($caps, EnumMap, '$!storage'));
    }

    method store_regex_nfa($code_obj, Mu $block, Mu $nfa) {
        $code_obj.SET_NFA($nfa.save);
    }

    method subrule_alias($ast, $name) {
        if $ast.name gt '' { $ast.name( $name ~ '=' ~ $ast.name ); }
        else { $ast.name($name); }
        $ast.subtype('capture');
    }
}

# vim: ft=perl6
