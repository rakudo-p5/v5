use QRegex;
use NQPP6QRegex;
use NQPP5QRegex;
use Perl5::Actions;
use Perl5::World;
use Perl6::Pod; # XXX do we need that?

role startstop5[$start,$stop] {
    token starter { $start }
    token stopper { $stop }
} # end role

role stop5[$stop] {
    token starter { <!> }
    token stopper { $stop }
} # end role

role unitstop5[$stop] {
    token unitstopper { $stop }
} # end role

role STD5 {
    token opener {
        <[
        \x0028 \x003C \x005B \x007B \x00AB \x0F3A \x0F3C \x169B \x2018 \x201A \x201B
        \x201C \x201E \x201F \x2039 \x2045 \x207D \x208D \x2208 \x2209 \x220A \x2215
        \x223C \x2243 \x2252 \x2254 \x2264 \x2266 \x2268 \x226A \x226E \x2270 \x2272
        \x2274 \x2276 \x2278 \x227A \x227C \x227E \x2280 \x2282 \x2284 \x2286 \x2288
        \x228A \x228F \x2291 \x2298 \x22A2 \x22A6 \x22A8 \x22A9 \x22AB \x22B0 \x22B2
        \x22B4 \x22B6 \x22C9 \x22CB \x22D0 \x22D6 \x22D8 \x22DA \x22DC \x22DE \x22E0
        \x22E2 \x22E4 \x22E6 \x22E8 \x22EA \x22EC \x22F0 \x22F2 \x22F3 \x22F4 \x22F6
        \x22F7 \x2308 \x230A \x2329 \x23B4 \x2768 \x276A \x276C \x276E \x2770 \x2772
        \x2774 \x27C3 \x27C5 \x27D5 \x27DD \x27E2 \x27E4 \x27E6 \x27E8 \x27EA \x2983
        \x2985 \x2987 \x2989 \x298B \x298D \x298F \x2991 \x2993 \x2995 \x2997 \x29C0
        \x29C4 \x29CF \x29D1 \x29D4 \x29D8 \x29DA \x29F8 \x29FC \x2A2B \x2A2D \x2A34
        \x2A3C \x2A64 \x2A79 \x2A7D \x2A7F \x2A81 \x2A83 \x2A8B \x2A91 \x2A93 \x2A95
        \x2A97 \x2A99 \x2A9B \x2AA1 \x2AA6 \x2AA8 \x2AAA \x2AAC \x2AAF \x2AB3 \x2ABB
        \x2ABD \x2ABF \x2AC1 \x2AC3 \x2AC5 \x2ACD \x2ACF \x2AD1 \x2AD3 \x2AD5 \x2AEC
        \x2AF7 \x2AF9 \x2E02 \x2E04 \x2E09 \x2E0C \x2E1C \x2E20 \x3008 \x300A \x300C
        \x300E \x3010 \x3014 \x3016 \x3018 \x301A \x301D \xFD3E \xFE17 \xFE35 \xFE37
        \xFE39 \xFE3B \xFE3D \xFE3F \xFE41 \xFE43 \xFE47 \xFE59 \xFE5B \xFE5D \xFF08
        \xFF1C \xFF3B \xFF5B \xFF5F \xFF62
        ]>
    }
    
    method balanced($start, $stop) {
        self.HOW.mixin(self, startstop5.HOW.curry(startstop5, $start, $stop));
    }
    method unbalanced($stop) {
        self.HOW.mixin(self, stop5.HOW.curry(stop5, $stop));
    }
    
    token starter { <!> }
    token stopper { <!> }
    
    my %quote_lang_cache;
    method quote_lang($l, $start, $stop, @base_tweaks?, @extra_tweaks?) {
        sub lang_key() {
            my @keybits := [$l.HOW.name($l), $start, $stop];
            for @base_tweaks {
                @keybits.push($_);
            }
            for @extra_tweaks {
                if $_[0] eq 'to' {
                    return 'NOCACHE';
                }
                @keybits.push($_[0] ~ '=' ~ $_[1]);
            }
            nqp::join("\0", @keybits)
        }
        sub con_lang() {
            my $lang := $l;
            for @base_tweaks {
                $lang := $lang."tweak_$_"(1);
            }
            for @extra_tweaks {
                my $t := $_[0];
                if nqp::can($lang, "tweak_$t") {
                    $lang := $lang."tweak_$t"($_[1]);
                }
                else {
                    self.sorry("Unrecognized adverb: :$t");
                }
            }
            $start ne $stop ?? $lang.balanced($start, $stop)
                            !! $lang.unbalanced($stop);
        }

        # Get language from cache or derive it.
        my $key := lang_key();
        nqp::ifnull(%quote_lang_cache, %quote_lang_cache := nqp::hash());
        if nqp::existskey(%quote_lang_cache, $key) && $key ne 'NOCACHE' {
            %quote_lang_cache{$key};
        }
        else {
            %quote_lang_cache{$key} := con_lang();
        }
    }
    
    token babble($l, @base_tweaks?) {
        :my @extra_tweaks;
        <.ws>
        $<B>=[<?>]
        {
            # Work out the delimeters.
            my $c := $/.CURSOR;
            my @delims := $c.peek_delimiters($c.target, $c.pos);
            my $start := @delims[0];
            my $stop  := @delims[1];
            
            # Get the language.
            my $lang := self.quote_lang($l, $start, $stop, @base_tweaks, @extra_tweaks);
            $<B>.'!make'([$lang, $start, $stop]);
        }
    }
    
    my @herestub_queue;

    my class Herestub {
        has $!delim;
        has $!orignode;
        has $!lang;
        method delim() { $!delim }
        method orignode() { $!orignode }
        method lang() { $!lang }
    }

    role herestop {
        token stopper { ^^ {} $<ws>=(\h*?) $*DELIM \h* <.unv>?? $$ \v? }
        #~ token stopper { ^^ {} $<ws>=(\h*?) $*DELIM \h* <.unv>?? $$ \v? }
    }

    method heredoc () {
        my $here := self.'!cursor_start_cur'();
        $here.'!cursor_pos'(self.pos);
        while +@herestub_queue {
            my $herestub := nqp::shift(@herestub_queue);
            my $*DELIM := $herestub.delim;
            my $lang := $herestub.lang.HOW.mixin($herestub.lang, herestop);
            my $doc := $here.nibble($lang);
            if $doc {
                # Match stopper.
                my $stop := $lang.'!cursor_init'(self.orig(), :p($doc.pos), :shared(self.'!shared'())).stopper();
                unless $stop {
                    self.panic("Ending delimiter $*DELIM not found");
                }
                $here.'!cursor_pos'($stop.pos);
                
                # Get it trimmed and AST updated.
                $*ACTIONS.trim_heredoc($doc, $stop, $herestub.orignode.MATCH.ast);
            }
            else {
                self.panic("Ending delimiter $*DELIM not found");
            }
        }
        $here.'!cursor_pass'($here.pos);
        $here
    }

    method queue_heredoc($delim, $lang) {
        #~ nqp::ifnull(@herestub_queue, @herestub_queue := []);
        @herestub_queue := [];
        nqp::push(@herestub_queue, Herestub.new(:$delim, :$lang, :orignode(self)));
        return self;
    }

    token quibble($l, *@base_tweaks) {
        :my $lang;
        :my $start;
        :my $stop;
        <babble($l, @base_tweaks)>
        { my $B := $<babble><B>.ast; $lang := $B[0]; $start := $B[1]; $stop := $B[2]; }

        $start <nibble($lang)> [ $stop || { $/.CURSOR.panic("Couldn't find terminator $stop") } ]

        {
            nqp::can($lang, 'herelang') && self.queue_heredoc(
                $*W.nibble_to_str($/, $<nibble>.ast[1], -> { "Stopper '" ~ $<nibble> ~ "' too complex for heredoc" }),
                $lang.herelang)
        }
    }

    method nibble($lang) {
        my $lang_cursor := $lang.'!cursor_init'(self.orig(), :p(self.pos()), :shared(self.'!shared'()));
        my $*ACTIONS;
        for %*LANG {
            if nqp::istype($lang, $_.value) {
                $*ACTIONS := %*LANG{$_.key ~ '-actions'};
                last;
            }
        }
        $lang_cursor.nibbler();
    }
    
    method panic(*@args) {
        self.typed_panic('X::Comp::AdHoc', payload => nqp::join('', @args))
    }
    method sorry(*@args) {
        self.typed_sorry('X::Comp::AdHoc', payload => nqp::join('', @args))
    }
    method worry(*@args) {
        self.typed_worry('X::Comp::AdHoc', payload => nqp::join('', @args))
    }

    method typed_panic($type_str, *%opts) {
        $*W.throw(self.MATCH(), nqp::split('::', $type_str), |%opts);
    }
    method typed_sorry($type_str, *%opts) {
        if +@*SORROWS + 1 == $*SORRY_LIMIT {
            $*W.throw(self.MATCH(), nqp::split('::', $type_str), |%opts);
        }
        else {
            @*SORROWS.push($*W.typed_exception(self.MATCH(), nqp::split('::', $type_str), |%opts));
        }
        self
    }
    method typed_worry($type_str, *%opts) {
        @*WORRIES.push($*W.typed_exception(self.MATCH(), nqp::split('::', $type_str), |%opts));
        self
    }
    
    method malformed($what) {
        self.typed_panic('X::Syntax::Malformed', :$what);
    }
    method missing($what) {
        self.typed_panic('X::Syntax::Missing', :$what);
    }
    method NYI($feature) {
        self.typed_panic('X::Comp::NYI', :$feature)
    }

    method EXPR_nonassoc($cur, $left, $right) {
        self.typed_panic('X::Syntax::NonAssociative', :left(~$left), :right(~$right));
    }

    # "when" arg assumes more things will become obsolete after Perl 6 comes out...
    method obs($old, $new, $when = 'in Perl 6') {
        $*W.throw(self.MATCH(), ['X', 'Obsolete'],
            old         => $old,
            replacement => $new,
            when        => $when,
        );
    }
    method sorryobs($old, $new, $when = ' in Perl 6') {
        $*W.throw(self.MATCH(), ['X', 'Obsolete'],
            old         => $old,
            replacement => $new,
            when        => $when,
        );
    }
    method worryobs($old, $new, $when = ' in Perl 6') {
        $*W.throw(self.MATCH(), ['X', 'Obsolete'],
            old         => $old,
            replacement => $new,
            when        => $when,
        );
    }
    
#    method check_variable ($variable) {
#        my $name := $variable.Str;
#        my $here := self.cursor($variable.from);
#        #self.deb("check_variable $name") if $*DEBUG +& DEBUG::symtab;
#        if $variable<really> { $name := $variable<really> ~ nqp::substr($name,1) }
#        my @parts := $name ~~ /(\$|\@|\%|\&|\*)(.?)/;
#        my $sigil := @parts[0];
#        my $first := @parts[1];
#        return self if $first eq '{';
#        my $ok := 0;
#        $ok := $ok || $*IN_DECL;
#        $ok := $ok || $first lt 'A';
#        $ok := $ok || $sigil eq '*';
#        $ok := $ok || self.is_known($name);
#        $ok := $ok || ($*IN_SORT && ($name eq '$a' || $name eq '$b'));
#        if !$ok {
#            my $id := $name;
#            #$id ~~ s/^\W\W?//;
#            $id := nqp::substr($id, 1, nqp::chars($id) - 1) if $id ~~ /^\W/;
#            $id := nqp::substr($id, 1, nqp::chars($id) - 1) if $id ~~ /^\W/;
#            if $sigil eq '&' {
#                $here.add_mystery($variable<sublongname>, self.pos, 'var')
#            }
#            elsif $name eq '@_' || $name eq '%_' {
#                
#            }
#            else {  # guaranteed fail now
#                if my $scope := @*MEMOS[$variable.from]<declend> {
#                    return $here.sorry("Variable $name is not predeclared (declarators are tighter than comma, so maybe your '$scope' signature needs parens?)");
#                }
#                elsif !($id ~~ /\:\:/) {
#                    if self.is_known('@' ~ $id) {
#                        return $here.sorry("Variable $name is not predeclared (did you mean \@$id?)");
#                    }
#                    elsif self.is_known('%' ~ $id) {
#                        return $here.sorry("Variable $name is not predeclared (did you mean \%$id?)");
#                    }
#                }
#                return $here.sorry("Variable $name is not predeclared");
#            }
#        }
#        elsif $*CURLEX{$name} {
#            $*CURLEX{$name}<used> := $*CURLEX{$name}<used> + 1;
#        }
#        self;
#    }

    my %pragmas;
    method pragma( $name, $args, $set ) {
        %pragmas{$name} := nqp::hash();
        %pragmas{$name}{$_} := $set for $args;
    }
    method check_variable($/, $var) {
        my $varast := $var.ast;
        if nqp::istype($varast, QAST::Op) && $varast.op eq 'ifnull' {
            $varast := $varast[0];
        }
        my $ok := 0;
        $ok    := $ok || $*IN_DECL;
        $ok    := $ok || !nqp::istype($varast, QAST::Var);
        $ok    := $ok || $varast.scope ne 'lexical';
        $ok    := $ok || ($*IN_SORT && ($varast.name eq '$a' || $varast.name eq '$b'));
        if !$ok {
            # Change the sigil if needed.
            $var<really> := '@' if ~$var<sigil> eq '$#';
            $varast.name( ~$var<really> ~ ~$var<desigilname> ) if $var<really>;
            $varast.name( ~$var<sigil>  ~ ~$var<name> )        if $var<name>;
            my $name := $varast.name;
            if $name ne '%_' && $name ne '@_' && !$*W.is_lexical($name) {
                if $var<sigil> ne '&' {
                    if !%pragmas<strict><vars> || ($*IN_SORT && ($name eq '$a' || $name eq '$b')) {
                        
                        my $BLOCK := $*W.cur_lexpad();
                        
                        # Create a container descriptor. Default to rw and set a
                        # type if we have one; a trait may twiddle with that later.
                        my %cont_info := Perl5::World::container_type_info($/, $var<really> || $var<sigil>, $*OFTYPE ?? [$*OFTYPE.ast] !! []);
                        my $descriptor := $*W.create_container_descriptor(%cont_info<value_type>, 1, $name);

                        $*W.install_lexical_container($BLOCK, $name, %cont_info, $descriptor,
                            :scope('our'), :package($*PACKAGE));
                        
                        # Set scope and type on container, and if needed emit code to
                        # reify a generic type.
                        if $varast.isa(QAST::Var) {
                            $varast.name($name);
                            $varast.scope('lexical');
                            $varast.returns(%cont_info<bind_constraint>);
                            if %cont_info<bind_constraint>.HOW.archetypes.generic {
                                $varast := QAST::Op.new(
                                    :op('callmethod'), :name('instantiate_generic'),
                                    QAST::Op.new( :op('p6var'), $varast ),
                                    QAST::Op.new( :op('curlexpad') ));
                            }
                            
                            $BLOCK[0].push(QAST::Op.new(
                                :op('bind'),
                                $varast,
                                $*W.symbol_lookup([$name], $/, :package_only(1), :lvalue(1))
                            ));
                        }
                    }
                    else  {
                        my @suggestions := $*W.suggest_lexicals($name);
                        $*W.throw($var, ['X', 'Undeclared'], symbol => $varast.name(), suggestions => @suggestions);
                    }
                }
                else {
                    $var.CURSOR.add_mystery($varast.name, $var.to, 'var');
                }
            }
            else {
                my $lex := $*W.cur_lexpad();
                my %sym := $lex.symbol($name);
                if %sym {
                    %sym<used> := 1;
                }
                else {
                    # Add mention-only record (used to poison outer
                    # usages and disambiguate hashes/blocks by use of
                    # $_ when $*IMPLICIT is in force).
                    $lex<also_uses> := {} unless $lex<also_uses>;
                    $lex<also_uses>{$name} := 1;
                }
            }
        }
        self
    }
}

grammar Perl5::Grammar is HLL::Grammar does STD5 {
#    use DEBUG;

#    method TOP ($STOP = 0) {
#        if $STOP {
#            my $*GOAL := $STOP;
#            self.unitstop($STOP).comp_unit;
#        }
#        else {
#            self.comp_unit;
#        }
#    }
    method TOP() {
        # Language braid.
        my %*LANG;
        %*LANG<Regex>           := Perl6::RegexGrammar;
        %*LANG<Regex-actions>   := Perl6::RegexActions;
        %*LANG<P5Regex>         := Perl6::P5RegexGrammar;
        %*LANG<P5Regex-actions> := Perl6::P5RegexActions;
        %*LANG<Q>               := Perl6::P5QGrammar;
        %*LANG<Q-actions>       := Perl6::P5QActions;
        %*LANG<MAIN>            := Perl6::P5Grammar;
        %*LANG<MAIN-actions>    := Perl6::P5Actions;
        
        # Package declarator to meta-package mapping. Starts pretty much empty;
        # we get the mappings either imported or supplied by the setting. One
        # issue is that we may have no setting to provide them, e.g. when we
        # compile the setting, but it still wants some kinda package. We just
        # fudge in knowhow for that.
        my %*HOW;
        %*HOW<knowhow> := nqp::knowhow();
        %*HOW<package> := nqp::knowhow();
        
        # Symbol table and serialization context builder - keeps track of
        # objects that cross the compile-time/run-time boundary that are
        # associated with this compilation unit.
        my $file := nqp::getlexdyn('$?FILES');
        my $source_id := nqp::sha1(self.target());
        my $*W := nqp::isnull($file) ??
            Perl6::P5World.new(:handle($source_id)) !!
            Perl6::P5World.new(:handle($source_id), :description($file));
        $*W.add_initializations();

        my $cursor := self.comp_unit;
        $*W.pop_lexpad(); # UNIT
        $*W.pop_lexpad(); # UNIT_OUTER
        $cursor;
    }

    ##############
    # Precedence #
    ##############

    # The internal precedence levels are *not* part of the public interface.
    # The current values are mere implementation; they may change at any time.
    # Users should specify precedence only in relation to existing levels.

#    my %term           := (:dba('term')            , :prec<z=>);
#    my %methodcall     := (:dba('methodcall')      , :prec<y=>, :assoc<unary>, :uassoc<left>, :fiddly(1));
#    my %autoincrement  := (:dba('autoincrement')   , :prec<x=>, :assoc<unary>, :uassoc<non>);
#    my %exponentiation := (:dba('exponentiation')  , :prec<w=>, :assoc<right>);
#    my %symbolic_unary := (:dba('symbolic unary')  , :prec<v=>, :assoc<unary>, :uassoc<left>);
#    my %binding        := (:dba('binding')         , :prec<u=>, :assoc<non>);
#    my %multiplicative := (:dba('multiplicative')  , :prec<t=>, :assoc<left>);
#    my %additive       := (:dba('additive')        , :prec<s=>, :assoc<left>);
#    my %shift          := (:dba('shift')           , :prec<r=>, :assoc<left>);
#    my %named_unary    := (:dba('named unary')     , :prec<q=>, :assoc<unary>, :uassoc<left>);
#    my %comparison     := (:dba('comparison')      , :prec<p=>, :assoc<non>, :diffy(1));
#    my %equality       := (:dba('equality')        , :prec<o=>, :assoc<chain>, :diffy(1), :iffy(1));
#    my %bitwise_and    := (:dba('bitwise and')     , :prec<n=>, :assoc<left>);
#    my %bitwise_or     := (:dba('bitwise or')      , :prec<m=>, :assoc<left>);
#    my %tight_and      := (:dba('tight and')       , :prec<l=>, :assoc<left>);
#    my %tight_or       := (:dba('tight or')        , :prec<k=>, :assoc<left>);
#    my %range          := (:dba('range')           , :prec<j=>, :assoc<right>, :fiddly(1));
#    my %conditional    := (:dba('conditional')     , :prec<i=>, :assoc<right>, :fiddly(1));
#    my %assignment     := (:dba('assignment')      , :prec<h=>, :assoc<right>);
#    my %comma          := (:dba('comma operator')  , :prec<g=>, :assoc<left>, :nextterm<nulltermish>, :fiddly(1));
#    my %listop         := (:dba('list operator')   , :prec<f=>, :assoc<unary>, :uassoc<left>);
#    my %loose_not      := (:dba('not operator')    , :prec<e=>, :assoc<unary>, :uassoc<left>);
#    my %loose_and      := (:dba('loose and')       , :prec<d=>, :assoc<left>);
#    my %loose_or       := (:dba('loose or')        , :prec<c=>, :assoc<left>);
#    my %LOOSEST        := (:dba('LOOSEST')         , :prec<a=!>);
#    my %terminator     := (:dba('terminator')      , :prec<a=>, :assoc<list>);
    
    
    INIT {
        Perl5::Grammar.O(':prec<z=>',                                                   '%term');
        Perl5::Grammar.O(':prec<y=>, :assoc<unary>, :uassoc<left>, :fiddly<1>',         '%methodcall');
        Perl5::Grammar.O(':prec<x=>, :assoc<unary>, :uassoc<non>',                      '%autoincrement');
        Perl5::Grammar.O(':prec<w=>, :assoc<right>',                                    '%exponentiation');
        Perl5::Grammar.O(':prec<v=>, :assoc<unary>, :uassoc<left>',                     '%symbolic_unary');
        Perl5::Grammar.O(':prec<u=>, :assoc<non>',                                      '%binding');
        Perl5::Grammar.O(':prec<t=>, :assoc<left>',                                     '%multiplicative');
        Perl5::Grammar.O(':prec<s=>, :assoc<left>',                                     '%additive');
        Perl5::Grammar.O(':prec<r=>, :assoc<left>',                                     '%shift');
        Perl5::Grammar.O(':prec<q=>, :assoc<unary>, :uassoc<left>',                     '%named_unary');
        Perl5::Grammar.O(':prec<p=>, :assoc<non>, :diffy<1>',                           '%comparison');
        Perl5::Grammar.O(':prec<o=>, :assoc<chain>, :diffy<1>, :iffy<1>',               '%equality');
        Perl5::Grammar.O(':prec<n=>, :assoc<left>',                                     '%bitwise_and');
        Perl5::Grammar.O(':prec<m=>, :assoc<left>',                                     '%bitwise_or');
        Perl5::Grammar.O(':prec<l=>, :assoc<left>',                                     '%tight_and');
        Perl5::Grammar.O(':prec<k=>, :assoc<left>',                                     '%tight_or');
        Perl5::Grammar.O(':prec<j=>, :assoc<right>, :fiddly<1>',                        '%range');
        Perl5::Grammar.O(':prec<i=>, :assoc<right>, :fiddly<1>',                        '%conditional');
        Perl5::Grammar.O(':prec<h=>, :assoc<right>',                                    '%assignment');
        #Perl5::Grammar.O(':prec<g=>, :assoc<left>, :nextterm<nulltermish>, :fiddly<1>', '%comma');
        Perl5::Grammar.O(':prec<g=>, :assoc<list>, :nextterm<nulltermish>, :fiddly<1>', '%comma');
        Perl5::Grammar.O(':prec<f=>, :assoc<unary>, :uassoc<left>',                     '%listop');
        Perl5::Grammar.O(':prec<e=>, :assoc<unary>, :uassoc<left>',                     '%loose_not');
        Perl5::Grammar.O(':prec<d=>, :assoc<left>',                                     '%loose_and');
        Perl5::Grammar.O(':prec<c=>, :assoc<left>',                                     '%loose_or');
        Perl5::Grammar.O(':prec<a=!>',                                                  '%LOOSEST');
        Perl5::Grammar.O(':prec<a=>, :assoc<list>',                                     '%terminator');
    }

    # "epsilon" tighter than terminator
    #constant $LOOSEST = %LOOSEST<prec>;
#    constant $LOOSEST := 'a=!'; # XXX preceding line is busted
#    my $LOOSEST := 'a=!'; # XXX preceding line is busted

    ##############
    # Categories #
    ##############

    # Categories are designed to be easily extensible in derived grammars
    # by merely adding more rules in the same category.  The rules within
    # a given category start with the category name followed by a differentiating
    # adverbial qualifier to serve (along with the category) as the longer name.

    # The endsym context, if specified, says what to implicitly check for in each
    # rule right after the initial <sym>.  Normally this is used to make sure
    # there's appropriate whitespace.  # Note that endsym isn't called if <sym>
    # isn't called.

    my $*endsym := "null";

    #proto token category { <...> }

    #token category:sym<category> { <sym> }

    #token category:sym<sigil> { <sym> }
    proto token sigil { <...> }

    #token category:sym<special_variable> { <sym> }
    proto token special_variable { <...> }

    #token category:sym<comment> { <sym> }
    proto token comment { <...> }

    #token category:sym<module_name> { <sym> }
    proto token module_name { <...> }

    #token category:sym<value> { <sym> }
    proto token value { <...> }

    #token category:sym<term> { <sym> }
    proto token term { <...> }

    #token category:sym<number> { <sym> }
    proto token number { <...> }

    #token category:sym<quote> { <sym> }
    proto token quote { <...> }

    #token category:sym<prefix> { <sym> }
    #proto token prefix is unary is defequiv(%symbolic_unary) { <...> }
    proto token prefix { <...> }

    #token category:sym<infix> { <sym> }
    #proto token infix is binary is defequiv(%additive) { <...> }
    proto token infix { <...> }

    #token category:sym<postfix> { <sym> }
    #proto token postfix is unary is defequiv(%autoincrement) { <...> }
    proto token postfix { <...> }

    #token category:sym<dotty> { <sym> }
    #proto token dotty( :$*endsym = 'unspacey' ) {
    proto token dotty { <...> }

    #token category:sym<circumfix> { <sym> }
    proto token circumfix { <...> }

    #token category:sym<postcircumfix> { <sym> }
    #proto token postcircumfix is unary { <...> }  # unary as far as EXPR knows...
    proto token postcircumfix { <...> }  # unary as far as EXPR knows...

    #token category:sym<type_declarator> { <sym> }
    #proto token type_declarator (:$*endsym = 'spacey') { <...> }
    proto token type_declarator { <...> }

    #token category:sym<scope_declarator> { <sym> }
    #proto token scope_declarator (:$*endsym = 'nofun') { <...> }
    proto token scope_declarator { <...> }

    #token category:sym<package_declarator> { <sym> }
    #proto token package_declarator (:$*endsym = 'spacey') { <...> }
    proto token package_declarator { <...> }

    #token category:sym<routine_declarator> { <sym> }
    #proto token routine_declarator (:$*endsym = 'nofun') { <...> }
    proto token routine_declarator { <...> }

    #token category:sym<regex_declarator> { <sym> }
    #proto token regex_declarator (:$*endsym = 'spacey') { <...> }
    proto token regex_declarator { <...> }

    #token category:sym<statement_prefix> { <sym> }
    proto rule statement_prefix { <...> }

    #token category:sym<statement_control> { <sym> }
    #proto rule statement_control (:$*endsym = 'spacey') { <...> }
    proto rule statement_control { <...> }

    #token category:sym<statement_mod_cond> { <sym> }
    #proto rule statement_mod_cond (:$*endsym = 'nofun') { <...> }
    proto rule statement_mod_cond { <...> }

    #token category:sym<statement_mod_loop> { <sym> }
    #proto rule statement_mod_loop (:$*endsym = 'nofun') { <...> }
    proto rule statement_mod_loop { <...> }

    #token category:sym<terminator> { <sym> }
    proto token terminator { <...> }

    token unspacey { <.unsp>? }
    token endid { <?before <-[ \- \' \w ]> > }
    token spacey { <?before <[ \s \# ]> > }
    token nofun { <!before '(' | '->(' | '\\' | '\'' | '-' | "'" | \w > }

    ##################
    # Lexer routines #
    ##################

    token end_keyword {
        <!before <[ \( \\ ' \- ]> || \h* '=>'> »
    }

    token ENDSTMT {
        [
        | \h* $$ <.ws> <?MARKER('endstmt')>
        | <.unv>? $$ <.ws> <?MARKER('endstmt')>
        ]?
    }

    method ws() {
        if self.MARKED('ws') {
            self
        }
        else {
            self._ws()
        }
    }
    token _ws {
        :my $old_highexpect := self.'!fresh_highexpect'();
        :dba('whitespace')
        [
        | <.vws> <.heredoc>
        | <.unv>
        ]*
        <?MARKER('ws')>
        :my $stub := self.'!set_highexpect'($old_highexpect);
    }

    token unsp {
        #~ <!>
        \\ <?before [\s|'#'] >
        :dba('unspace')
        [
        | <.vws>
        | <.unv>
        ]*
    }

    token vws {
        :dba('vertical whitespace')
        \v
    }

    # We provide two mechanisms here:
    # 1) define $*moreinput, or
    # 2) override moreinput method
    method moreinput () {
        $*moreinput() if $*moreinput;
    }

    token unv {
       :dba('horizontal whitespace')
       [
       | \h+
       | <?before \h* '=' [ \w | '\\'] > ^^ <.pod_comment>
       | \h* <comment>
       ]
    }

    token comment:sym<#> {
       '#' {} \N*
    }

    token ident {
        <.alpha> \w*
    }

    token identifier {
        <.alpha> \w*
    }

    token pod_comment {
        ^^ \h* '=' <.unsp>?
        [
        | 'begin' \h+ <identifier>
            [
            ||  .*? "\n" \h* '=' <.unsp>? 'end' \h+ $<identifier> » \N*
            ||  <?{ $<identifier>.Str eq 'END'}> .*
            || { my $id := $<identifier>.Str; self.panic("=begin $id without matching =end $id"); }
            ]
        | 'begin' » \h* [ $$ || '#' || <.panic: "Unrecognized token after =begin"> ]
            [ .*? "\n" \h* '=' <.unsp>? 'end' » \N* || { self.panic("=begin without matching =end"); } ]
            
        | 'for' » \h* [ <identifier> || $$ || '#' || <.panic: "Unrecognized token after =for"> ]
            [.*?  ^^ \h* $$ || .*]
        | .*? ^^ '=cut' » \N*
        ]
    }

    ###################
    # Top-level rules #
    ###################

#    # Note: we only check for the stopper.  We don't check for ^ because
#    # we might be embedded in something else.
#    rule comp_unit {
#        :my $*begin_compunit := 1;
#        :my %*LANG;
#        :my $*PKGDECL := "";
#        :my $*IN_DECL;
#        :my $*DECLARAND;
#        :my $*NEWPKG;
#        :my $*NEWLEX;
#        :my $*QSIGIL := '';
#        :my $*IN_META := 0;
#        :my $*QUASIMODO;
#        :my $*SCOPE := "";
#        :my $*LEFTSIGIL;
#        :my %*MYSTERY := ();
#        :my $*INVOCANT_OK;
#        :my $*INVOCANT_IS;
#        :my $*CURLEX;
#        :my $*MULTINESS := '';
#
#        :my $*CURPKG;
#        {{
#            #%*LANG<MAIN>    = ::STD5 ;
#            #%*LANG<Q>       = ::STD5::Q ;
#            #%*LANG<Regex>   = ::STD5::Regex ;
#            #%*LANG<Trans>   = ::STD5::Trans ;
#            %*LANG<Regex>           := Perl6::RegexGrammar;
#            %*LANG<Regex-actions>   := Perl6::RegexActions;
#            %*LANG<P5Regex>         := Perl6::P5RegexGrammar;
#            %*LANG<P5Regex-actions> := Perl6::P5RegexActions;
#            %*LANG<Q>               := Perl6::QGrammar;
#            %*LANG<Q-actions>       := Perl6::QActions;
#            %*LANG<MAIN>            := Perl6::Grammar;
#            %*LANG<MAIN-actions>    := Perl6::Actions;
#
#            @*WORRIES := ();
#            self.load_setting($*SETTINGNAME);
#            my $oid          := $*SETTING.id;
#            my $id           := 'MY:file<' ~ $*FILE<name> ~ '>';
#            #$*CURLEX         := Stash.new( :'OUTER::'([$oid]), :'!file'($*FILE), :'!line'(0), :'!id'([$id]) );
#            #$STD::ALL{$id}   := $*CURLEX;
#            $*UNIT           := $*CURLEX;
#            #$STD::ALL<UNIT>  := $*UNIT;
#            self.finishlex;
#        }}
#        <statementlist>
#        [ <?unitstopper> || <.panic: "Confused"> ]
#
#        # "CHECK" time...
#        {{
#            if @*WORRIES {
#                warn("Potential difficulties:\n  " ~ nqp::join( "\n  ", @*WORRIES) ~ "\n");
#            }
#            my $m := self.explain_mystery();
#            warn($m) if $m;
#        }}
#    }
    token comp_unit {
        # From STD.pm.
        :my $*LEFTSIGIL;                           # sigil of LHS for item vs list assignment
        :my $*SCOPE := '';                         # which scope declarator we're under
        :my $*MULTINESS := '';                     # which multi declarator we're under
        :my $*QSIGIL := '';                        # sigil of current interpolation
        :my $*IN_META := '';                       # parsing a metaoperator like [..]
        :my $*IN_REDUCE := 0;                      # attempting to parse an [op] construct
        :my $*IN_DECL;                             # what declaration we're in
        :my $*HAS_SELF := '';                      # is 'self' available? (for $.foo style calls)
        :my $*MONKEY_TYPING := 0;                  # whether augment/supersede are allowed
        :my $*begin_compunit := 1;                 # whether we're at start of a compilation unit
        :my $*DECLARAND;                           # the current thingy we're declaring, and subject of traits
        :my $*METHODTYPE;                          # the current type of method we're in, if any
        :my $*PKGDECL;                             # what type of package we're in, if any
        :my %*MYSTERY;                             # names we assume may be post-declared functions
        
        # Error related. There are three levels: worry (just a warning), sorry
        # (fatal but not immediately so) and panic (immediately deadly). There
        # is a limit on the number of sorrows also. Unlike STD, which emits the
        # textual messages as it goes, we keep track of the exception objects
        # and, if needed, make a compositite exception group.
        :my @*WORRIES;                             # exception objects resulting from worry
        :my @*SORROWS;                             # exception objects resulting from sorry
        :my $*SORRY_LIMIT := 10;                   # when sorrow turns to panic

        # Extras.
        :my %*METAOPGEN;                           # hash of generated metaops
        :my %*HANDLERS;                            # block exception handlers
        :my $*IMPLICIT;                            # whether we allow an implicit param
        :my $*FORBID_PIR := 0;                     # whether pir::op and Q:PIR { } are disallowed
        :my $*HAS_YOU_ARE_HERE := 0;               # whether {YOU_ARE_HERE} has shown up
        :my $*OFTYPE;
        :my $*VMARGIN    := 0;                     # pod stuff
        :my $*ALLOW_CODE := 0;                     # pod stuff
        :my $*POD_IN_FORMATTINGCODE := 0;          # pod stuff
        :my $*IN_REGEX_ASSERTION := 0;
        :my $*SOFT := 0;                           # is the soft pragma in effect
        :my $*IN_PROTO := 0;                       # are we inside a proto?

        # Various interesting scopes we'd like to keep to hand.
        :my $*GLOBALish;
        :my $*PACKAGE;
        :my $*SETTING;
        :my $*UNIT;
        :my $*UNIT_OUTER;
        :my $*EXPORT;
        # stack of packages, which the 'is export' needs
        :my @*PACKAGES := [];

        # A place for Pod
        :my $*POD_BLOCKS := [];
        :my $*POD_BLOCKS_SEEN := {};
        :my $*POD_PAST;
        :my $*DECLARATOR_DOCS;
        
        # Quasis and unquotes
        :my $*IN_QUASI := 0;                       # whether we're currently in a quasi block

        # Setting loading and symbol setup.
        {
            # Create unit outer (where we assemble any lexicals accumulated
            # from e.g. REPL) and the real UNIT.
            $*UNIT_OUTER := $*W.push_lexpad($/);
            $*UNIT := $*W.push_lexpad($/);
            
            # If we already have a specified outer context, then that's
            # our setting. Otherwise, load one.
            my $have_outer := nqp::defined(%*COMPILING<%?OPTIONS><outer_ctx>);
            if $have_outer {
                $*UNIT<IN_DECL> := 'eval';
            }
            else {
                $*SETTING := $*W.load_setting($/, %*COMPILING<%?OPTIONS><setting> // 'CORE');
                $*UNIT<IN_DECL> := 'mainline';
            }
            $/.CURSOR.unitstart();
            try {
                my $EXPORTHOW := $*W.find_symbol(['EXPORTHOW']);
                for $EXPORTHOW.WHO {
                    %*HOW{$_.key} := $_.value;
                }
            }
            
            # Create GLOBAL(ish), unless we were given one.
            if nqp::existskey(%*COMPILING<%?OPTIONS>, 'global') {
                $*GLOBALish := %*COMPILING<%?OPTIONS><global>;
            }
            elsif $have_outer && $*UNIT_OUTER.symbol('GLOBALish') {
                $*GLOBALish := $*UNIT_OUTER.symbol('GLOBALish')<value>;
            }
            else {
                $*GLOBALish := $*W.pkg_create_mo($/, %*HOW<package>, :name('GLOBAL'));
                $*W.pkg_compose($*GLOBALish);
            }
                
            # Create or pull in existing EXPORT.
            if $have_outer && $*UNIT_OUTER.symbol('EXPORT') {
                $*EXPORT := $*UNIT_OUTER.symbol('EXPORT')<value>;
            }
            else {
                $*EXPORT := $*W.pkg_create_mo($/, %*HOW<package>, :name('EXPORT'));
                $*W.pkg_compose($*EXPORT);
            }
            
            # If there's a self in scope, set $*HAS_SELF.
            if $have_outer && $*UNIT_OUTER.symbol('self') {
                $*HAS_SELF := 'complete';
            }
                
            # Take current package from outer context if any, otherwise for a
            # fresh compilation unit we start in GLOBAL.
            if $have_outer && $*UNIT_OUTER.symbol('$?PACKAGE') {
                $*PACKAGE := $*UNIT_OUTER.symbol('$?PACKAGE')<value>;
            }
            else {
                $*PACKAGE := $*GLOBALish;
            }
            
            # If we're eval'ing in the context of a %?LANG, set up our own
            # %*LANG based on it.
            if $have_outer && $*UNIT_OUTER.symbol('%?LANG') {
                for $*UNIT_OUTER.symbol('%?LANG')<value>.FLATTENABLE_HASH() {
                    %*LANG{$_.key} := $_.value;
                }
            }
            
            # Install unless we've no setting, in which case we've likely no
            # static lexpad class yet either. Also, UNIT needs a code object.
            unless %*COMPILING<%?OPTIONS><setting> eq 'NULL' {
                $*W.install_lexical_symbol($*UNIT, 'GLOBALish', $*GLOBALish);
                $*W.install_lexical_symbol($*UNIT, 'EXPORT', $*EXPORT);
                $*W.install_lexical_symbol($*UNIT, '$?PACKAGE', $*PACKAGE);
                $*W.install_lexical_symbol($*UNIT, '::?PACKAGE', $*PACKAGE);
                $*DECLARAND := $*W.stub_code_object('Block');
            }
            my $M := %*COMPILING<%?OPTIONS><M>;
            if nqp::defined($M) {
                for nqp::islist($M) ?? $M !! [$M] -> $longname {
                    my $module := $*W.load_module($/, $longname, nqp::hash( 'from', 'Perl5' ), $*GLOBALish);
                    do_import($/, $module, $longname);
                    $/.CURSOR.import_EXPORTHOW($module);
                }
            }
        }
        
        <.finishlex>
        <.bom>?
        <statementlist>

        <.install_doc_phaser>
        
        [ $ || <.typed_panic: 'X::Syntax::Confused'> ]
        
        {
            # Emit any errors/worries.
            self.explain_mystery();
            if @*SORROWS {
                if +@*SORROWS == 1 && !@*WORRIES {
                    @*SORROWS[0].throw()
                }
                else {
                    $*W.group_exception(@*SORROWS.pop).throw();
                }
            }
            if @*WORRIES {
                nqp::printfh(nqp::getstderr(), $*W.group_exception().gist());
            }
        
            # Install POD-related variables.
            $*POD_PAST := $*W.add_constant(
                'Array', 'type_new', |$*POD_BLOCKS
            );
            $*W.install_lexical_symbol(
                $*UNIT, '$=pod', $*POD_PAST.compile_time_value
            );
            
            # Tag UNIT with a magical lexical. Also if we're compiling CORE,
            # give it such a tag too.
            if %*COMPILING<%?OPTIONS><setting> eq 'NULL' {
                my $marker := $*W.pkg_create_mo($/, %*HOW<package>, :name('!CORE_MARKER'));
                $marker.HOW.compose($marker);
                $*W.install_lexical_symbol($*UNIT, '!CORE_MARKER', $marker);
            }
            else {
                my $marker := $*W.pkg_create_mo($/, %*HOW<package>, :name('!UNIT_MARKER'));
                $marker.HOW.compose($marker);
                $*W.install_lexical_symbol($*UNIT, '!UNIT_MARKER', $marker);
            }
        }
        
        # CHECK time.
        { $*W.CHECK(); }
    }
    
    method import_EXPORTHOW($UNIT) {    
        # See if we've exported any HOWs.
        if nqp::existskey($UNIT, 'EXPORTHOW') {
            for $*W.stash_hash($UNIT<EXPORTHOW>) {
                %*HOW{$_.key} := nqp::decont($_.value);
            }
        }
    }

    method add_mystery($token, $pos, $ctx) {
        my $name := ~$token;
        unless $name eq '' || $*W.is_lexical('&' ~ $name) || $*W.is_lexical($name) {
            my $lex := $*W.cur_lexpad();
            my $key := $name ~ '-' ~ $lex.cuid;
            if nqp::existskey(%*MYSTERY, $key) {
                nqp::push(%*MYSTERY{$key}<pos>, $pos);
            }
            else {
                %*MYSTERY{$key} := nqp::hash(
                    'lex', $lex,
                    'name', $name,
                    'ctx', $ctx,
                    'pos', [$pos]);
            }
        }
        self;
    }
    
    method explain_mystery() {
        my %post_types;
        my %unk_types;
        my %unk_routines;
        
        sub push_lines(@target, @pos) {
            for @pos {
                nqp::push(@target, HLL::Compiler.lineof(self.orig, $_, :cache(1)));
            }
        }
        
        my %routine_suggestion := hash();
        my %type_suggestion := hash();
        
        for %*MYSTERY {
            my %sym  := $_.value;
            my $name := %sym<name>;
            my $decl := $*W.is_lexically_visible($name, %sym<lex>);
            if $decl == 2 {
                # types may not be post-declared
                %post_types{$name} := [] unless %post_types{$name};
                push_lines(%post_types{$name}, %sym<pos>);
                next;
            }

            next if $decl == 1;
            next if $*W.is_lexically_visible('&' ~ $name, %sym<lex>);

            # just a guess, but good enough to improve error reporting
            if $_ lt 'a' {
                %unk_types{$name} := [] unless %unk_types{$name};
                my @suggs := $*W.suggest_typename($name);
                %type_suggestion{$name} := @suggs;
                push_lines(%unk_types{$name}, %sym<pos>);
            }
            else {
                %unk_routines{$name} := [] unless %unk_routines{$name};
                my @suggs := $*W.suggest_routines($name);
                %routine_suggestion{$name} := @suggs;
                push_lines(%unk_routines{$name}, %sym<pos>);
            }
        }
        
        if %post_types || %unk_types || %unk_routines {
            self.typed_sorry('X::Undeclared::Symbols',
                :%post_types, :%unk_types, :%unk_routines,
                :%routine_suggestion, :%type_suggestion);
        }
        
        self;        
    }

    method add_variable($name) {
        my $categorical := $name ~~ /^'&'((\w+)':<'\s*(\S+?)\s*'>')$/;
        if $categorical {
            self.add_categorical(~$categorical[0][0], ~$categorical[0][1], ~$categorical[0], $name);
        }
    }

    # Called when we add a new choice to an existing syntactic category, for
    # example new infix operators add to the infix category. Augments the
    # grammar as needed.
    method add_categorical($category, $opname, $canname, $subname, $declarand?) {
        my $self := self;
        
        # Ensure it's not a null name.
        if $opname eq '' {
            self.typed_panic('X::Syntax::Extension::Null');
        }
        
        # If we already have the required operator in the grammar, just return.
        if nqp::can(self, $canname) {
            return 1;
        }

        # Work out what default precedence we want, or if it's more special than
        # just an operator.
        my $prec;
        my $is_oper;
        my $is_term := 0;
        if $category eq 'infix' {
            $prec := '%additive';
            $is_oper := 1;
        }
        elsif $category eq 'prefix' {
            $prec := '%symbolic_unary';
            $is_oper := 1;
        }
        elsif $category eq 'postfix' {
            $prec := '%autoincrement';
            $is_oper := 1;
        }
        elsif $category eq 'postcircumfix' {
            $prec := '%methodcall';
            $is_oper := 1;
        }
        elsif $category eq 'circumfix' {
            $is_oper := 0;
        }
        elsif $category eq 'trait_mod' {
            return 0;
        }
        elsif $category eq 'term' {
            $is_term := 1;
        }
        elsif $category eq 'METAOP_TEST_ASSIGN' {
            return 0;
        }
        else {
            self.typed_panic('X::Syntax::Extension::Category', :$category);
        }

        if $is_term {
            my role Term[$meth_name, $op] {
                token ::($meth_name) { $<sym>=[$op] }
            }
            self.HOW.mixin(self, Term.HOW.curry(Term, $canname, $opname));
        }
        # Mix an appropraite role into the grammar for parsing the new op.
        elsif $is_oper {
            my role Oper[$meth_name, $op, $precedence, $declarand] {
                token ::($meth_name) { $<sym>=[$op] <O=.genO($precedence, $declarand)> }
            }
            self.HOW.mixin(self, Oper.HOW.curry(Oper, $canname, $opname, $prec, $declarand));
        }
        else {
            # Find opener and closer and parse an EXPR between them.
            # XXX One day semilist would be nice, but right now that
            # runs us into fun with terminators.
            my @parts := nqp::split(' ', $opname);
            if +@parts != 2 {
                nqp::die("Unable to find starter and stopper from '$opname'");
            }
            my role Circumfix[$meth_name, $starter, $stopper] {
                token ::($meth_name) {
                    :my $*GOAL := $stopper;
                    :my $stub := %*LANG<Perl5> := nqp::getlex('$¢').unbalanced($stopper);
                    $starter ~ $stopper <semilist>
                }
            }
            self.HOW.mixin(self, Circumfix.HOW.curry(Circumfix, $canname, @parts[0], @parts[1]));
        }

        # This also becomes the current MAIN. Also place it in %?LANG.
        %*LANG<Perl5> := self.WHAT;
        $*W.install_lexical_symbol($*W.cur_lexpad(), '%?LANG', $*W.p6ize_recursive(%*LANG));
        
        # Declarand should get precedence traits.
        if $is_oper && nqp::isconcrete($declarand) {
            my $base_prec := self.O($prec).MATCH<prec>;
            $*W.apply_trait(self.MATCH, '&trait_mod:<is>', $declarand,
                :prec(nqp::hash('prec', $base_prec)));
        }

        # May also need to add to the actions.
        if $category eq 'circumfix' {
            my role CircumfixAction[$meth, $subname] {
                method ::($meth)($/) {
                    make QAST::Op.new(
                        :op('call'), :name('&' ~ $subname),
                        $<semilist>.ast
                    );
                }
            };
            %*LANG<Perl5-actions> := $*ACTIONS.HOW.mixin($*ACTIONS,
                CircumfixAction.HOW.curry(CircumfixAction, $canname, $subname));
        }
        elsif $is_term {
            my role TermAction[$meth, $subname] {
                method ::($meth)($/) {
                    make QAST::Op.new(
                        :op('call'), :name('&' ~ $subname),
                    );
                }
            };
            %*LANG<Perl5-actions> := $*ACTIONS.HOW.mixin($*ACTIONS,
                TermAction.HOW.curry(TermAction, $canname, $subname));
        }

        return 1;
    }

    method genO($default, $declarand) {
        my $desc := $default;
        if nqp::can($declarand, 'prec') {
            my %extras := $declarand.prec.FLATTENABLE_HASH;
            for %extras {
                $desc := "$desc, :" ~ $_.key ~ "<" ~ $_.value ~ ">";
            }
        }
        self.O($desc)
    }

    # Look for an expression followed by a required lambda.
    #token xblock {
    #    :my $*GOAL := '{';
    #    :dba('block expression') '(' ~ ')' <EXPR>
    #    <.ws>
    #    <sblock>
    #}
    rule xblock($*IMPLICIT = 0) {
        :my $*GOAL := '{';
        :dba('block expression')
        '(' ~ ')' <EXPR>
        <.ws> <sblock($*IMPLICIT)>
    }

    token sblock($*IMPLICIT = 0, $*FOR_VARIABLE = '') {
        :my $*DECLARAND := $*W.stub_code_object('Block');
#        :my $*CURLEX;
        :dba('statement block')
        [ <?before '{' > || <.panic: "Missing block"> ]
        <.newlex>
        <blockoid>
        #{ @*MEMOS[self.pos]<endstmt> := 2; }
        <.ws>
    }

    token block {
        :my $*CURPAD;
        :my $*DECLARAND := $*W.stub_code_object('Block');
        :dba('scoped block')
        [ <?before '{' > || <.panic: "Missing block"> ]
        <.newlex>
        <blockoid>
        <.ws>
    }

    token newlex { <?> { $*W.push_lexpad($/) } }
    token finishlex { <?> }

    token blockoid {
        # encapsulate braided languages
        #:my %*LANG;
        :my $*CURPAD;
        :my %*HANDLERS;
        <.finishlex>
        [ <?{ $*FOR_VARIABLE }> {
            my $BLOCK := $*W.cur_lexpad();
            $BLOCK.symbol($*FOR_VARIABLE, :scope('lexical'), :lazyinit($*FOR_VARIABLE eq '$_'), :for_variable(1) );
        } ]?
        [
        | '{YOU_ARE_HERE}' <you_are_here>
        | :dba('block') '{' ~ '}' <statementlist> <?ENDSTMT>
        | <?terminator> { $*W.throw($/, 'X::Syntax::Missing', what =>'block') }
        | <?> { $*W.throw($/, 'X::Syntax::Missing', what => 'block') }
        ]
        { $*CURPAD := $*W.pop_lexpad() }
    }

    token slang {
        :my %*LANG    := self.shallow_copy(nqp::getlexdyn('%*LANG'));
        :my %*HOW     := self.shallow_copy(nqp::getlexdyn('%*HOW'));
        :my $*IN_DECL := '';
        :my $*SCOPE   := '';
        {
            my $terms := $*W.load_module($/, 'Perl5::Terms', {}, $*GLOBALish);
            do_import($/, $terms, 'Perl5::Terms');
            $/.CURSOR.import_EXPORTHOW($terms);
        }
        <statementlist>
    }

    # statement semantics
    rule statementlist {
        :my $*INVOCANT_OK := 0;
        :my $*FOR_VARIABLE := '';
        :dba('statement list')
        ''
        [
        | $
        | <?before <[\)\]\}]>>
        | [<statement><.eat_terminator> ]*
        ]
    }

    method shallow_copy(%hash) {
        my %result;
        for %hash {
            %result{$_.key} := $_.value;
        }
        %result
    }

    # embedded semis, context-dependent semantics
    rule semilist {
        :my $*INVOCANT_OK := 0;
        :dba('semicolon list')
        ''
        [
        | <?before <[\)\]\}]> >
        | [<statement><eat_terminator> ]*
        ]
    }


    token label {
        :my $label;
        <identifier> ':' <?before \s> <.ws>

        [ <?{ $label := $<identifier>.Str; $*W.is_name($label) }>
          <.sorry("Illegal redeclaration of '$label'")>
        ]?

        # add label as a pseudo type
        # {{ self.add_my_name($label); }} # XXX How do we do that?

    }

#    token statement {
#        :my $*QSIGIL := 0;
#        :my $*SCOPE := '';
#        :my $*ACTIONS := %*LANG<Perl5-actions>;
#        <!before <[\)\]\}]> >
#
#        # this could either be a statement that follows a declaration
#        # or a statement that is within the block of a code declaration
#        #<!!{ self := %*LANG<Perl5>.bless(self); }>
#        <!!{ nqp::rebless($/.CURSOR, %*LANG<Perl5>) }>
#
#        [
#        | <label> <statement>
#        | <statement_control>
#        | <EXPR>
#            :dba('statement end')
#                <.ws>
#            :dba('statement modifier')
#                [
#                | <statement_mod_loop>
#                | <statement_mod_cond>
#                ]?
#        | <?before ';'>
#        ]
#    }
    token statement {
        :my $*QSIGIL := '';
        :my $*SCOPE := '';
        :my $*ACTIONS := %*LANG<Perl5-actions>;
        :my $*ARGUMENT_WANT := 0;
        :my $*ARGUMENT_HAVE := 0;
        <!before <[\])}]> | $ >
        #~ <!stopper>
        <!!{ nqp::rebless($/.CURSOR, %*LANG<Perl5>) }>
        [
        | <label> <statement>
        | <statement_control>
        | <EXPR> :dba('statement end')
            <.ws>
            [
            || <?MARKED('endstmt')>
            || :dba('statement modifier') <.ws> <statement_mod_cond> <statement_mod_loop>?
            || :dba('statement modifier loop') <.ws> <statement_mod_loop>
            ]?
        | <?before ';'>
        #~ | <?before <stopper> >
        | {} <.panic: "Bogus statement">
        ]
    }

#    token eat_terminator {
#        [
#        #|| ';' [ <?before $> { $*ORIG ~~ s/\;$/ /; } ]?
#        || ';' [ <?before $> ]?
#        || <?{ @*MEMOS[self.pos]<endstmt> }> <.ws>
#        || <?terminator>
#        || $
#        #|| {{ if @*MEMOS[self.pos]<ws> { self.pos := @*MEMOS[self.pos]<ws>; } }}   # undo any line transition
#        #    <.panic: "Confused">
#        ]
#    }
    token eat_terminator {
        || ';'
        || <?MARKED('endstmt')> <.ws>
        || <?before ')' | ']' | '}' >
        || $
        || <?before '__END__'>
        || <?stopper>
        || <.typed_panic: 'X::Syntax::Confused'>
    }

    #####################
    # statement control #
    #####################

    token statement_control:sym<import> {
        <sym> <.ws>
        <module_name> [ <.spacey> <arglist> ]? <.ws>
        :my $*HAS_SELF := '';
        #~ {
            #~ my $longname := $*W.dissect_longname($<module_name><longname>);
            #~ nqp::say(">>" ~ $<module_name><longname>);
            #~ my $module;
            #~ my $found := 0;
            #~ try { $module := $*W.find_symbol($longname.components()); $found := 1; }
            #~ if $found {
                #~ # todo: fix arglist
                #~ my $arglist;
                #~ if $<arglist> {
                    #~ $arglist := $*W.compile_time_evaluate($/, $<arglist><EXPR>.ast);
                    #~ $arglist := nqp::getattr($arglist.list.eager,
                            #~ $*W.find_symbol(['List']), '$!items');
                #~ }
                #~ do_import($/, $module.WHO, ~$<module_name><longname>, $arglist);
            #~ }
            #~ else {
                #~ $/.CURSOR.panic("Could not find module " ~ ~$<module_name> ~
                    #~ " to import symbols from");
            #~ }
        #~ }
    }

    my %pragma_defaults := nqp::hash(
        'base',      [],                       # http://perldoc.perl.org/base.html
        'bytes',     [],                       # http://perldoc.perl.org/bytes.html
        'charnames', [],                       # http://perldoc.perl.org/charnames.html
        'feature',   [],                       # http://perldoc.perl.org/feature.html
        'integer',   [],                       # http://perldoc.perl.org/integer.html
        'open',      [],                       # http://perldoc.perl.org/open.html
        'strict',    ['vars', 'refs', 'subs'], # http://perldoc.perl.org/strict.html
        'utf8',      [],                       # http://perldoc.perl.org/utf8.html
        'warnings',  ['all'],                  # http://perldoc.perl.org/warnings.html
    );
    token statement_control:sym<use> {
        :my $*IN_DECL := 'use';
        :my $*HAS_SELF := '';
        :my $*SCOPE   := 'use';
        :my $OLD_MAIN := ~$*MAIN;
        <sym> <.ws>
        [
        || <versionish> [ <?{ ~$<versionish><version><vnum>[0] eq '6' }> { $*MAIN := 'MAIN' } || <?> ]
        || 'vars' <.ws>? <quote>
            {
                my $vars := $*W.compile_time_evaluate($/, $<quote>.ast);
                $vars := nqp::getattr($vars.list.eager,
                        $*W.find_symbol(['List']), '$!items');
                my $*IN_DECL := 'variable';
                my $*SCOPE := 'our';
                for $vars {
                    my $name := $_;
                    my $sigil := nqp::substr($name, 0, 1);
                    my $varast := QAST::Var.new( :name($name), :node($/), :scope<lexical> );
                    my $BLOCK := $*W.cur_lexpad();
                    
                    # Create a container descriptor. Default to rw and set a
                    # type if we have one; a trait may twiddle with that later.
                    my %cont_info := Perl5::World::container_type_info($/, $sigil, []);
                    my $descriptor := $*W.create_container_descriptor(%cont_info<value_type>, 1, $name);

                    $*W.install_lexical_container($BLOCK, $name, %cont_info, $descriptor,
                        :scope('our'), :package($*PACKAGE));
                    
                    # Set scope and type on container, and if needed emit code to
                    # reify a generic type.
                    $varast.returns(%cont_info<bind_constraint>);
                    if %cont_info<bind_constraint>.HOW.archetypes.generic {
                        $varast := QAST::Op.new(
                            :op('callmethod'), :name('instantiate_generic'),
                            QAST::Op.new( :op('p6var'), $varast ),
                            QAST::Op.new( :op('curlexpad') ));
                    }
                    
                    $BLOCK[0].push(QAST::Op.new(
                        :op('bind'),
                        $varast,
                        $*W.symbol_lookup([$name], $/, :package_only(1), :lvalue(1))
                    ));
                }
            }
        || <module_name> <version=versionish>?
            [ <.spacey> <arglist> <?{ $<arglist><arg>[0]<EXPR> }> ]?
            {
                my $longname := $<module_name><longname>;
                my $lnd      := $*W.dissect_longname($longname);
                my $name     := $lnd.name;
                my $arglist;

                if $<arglist><arg>[0]<EXPR> {
                    $arglist := $*W.compile_time_evaluate($/,
                            $<arglist><arg>[0]<EXPR>.ast);
                    $arglist := nqp::getattr($arglist.list.eager,
                            $*W.find_symbol(['List']), '$!items');
                }
                
                if nqp::existskey(%pragma_defaults, $name) {
                    $arglist := %pragma_defaults{$name} unless $<arglist><arg>[0]<EXPR>;
                    self.pragma($name, $arglist, 1);
                    $name := '' unless $name eq 'warnings';
                }
                
                if $name {
                    my $module := $*W.load_module($/, $name, nqp::hash( 'from', 'Perl5' ), $*GLOBALish);
                    do_import($/, $module, $name, $arglist);
                    $/.CURSOR.import_EXPORTHOW($module);
                }
            }
        ]
        [ <?{ $*MAIN ne $OLD_MAIN }> {
            $*IN_DECL := '';
            $*SCOPE := '';
        } <statementlist=.LANG($*MAIN, 'statementlist')> ]?
        <.ws>
    }

    sub do_import($/, $module, $package_source_name, $arglist?) {
        if nqp::existskey($module, 'EXPORT') {
            my $EXPORT := $*W.stash_hash($module<EXPORT>);
            my @to_import := ['MANDATORY'];
            my @positional_imports := [];
            if nqp::defined($arglist) {
                my $Pair := $*W.find_symbol(['Pair']);
                for $arglist -> $tag {
                    if nqp::istype($tag, $Pair) {
                        $tag := nqp::unbox_s($tag.key);
                        if nqp::existskey($EXPORT, $tag) {
                            $*W.import($/, $*W.stash_hash($EXPORT{$tag}), $package_source_name);
                        }
                        else {
                            nqp::die("Error while importing from '$package_source_name': no such tag '$tag'");
                        }
                    }
                    else {
                        nqp::push(@positional_imports, $tag);
                    }
                }
            }
            else {
                nqp::push(@to_import, 'DEFAULT');
            }
            for @to_import -> $tag {
                if nqp::existskey($EXPORT, $tag) {
                    $*W.import($/, $*W.stash_hash($EXPORT{$tag}), $package_source_name);
                }
            }
            if nqp::existskey($module, '&EXPORT') {
                my $result;
                if nqp::defined($arglist) {
                    @positional_imports := $*W.p6ize_recursive( @positional_imports );
                    $result := $module<&EXPORT>(@positional_imports);
                }
                else {
                    $result := $module<&EXPORT>();
                }
                my $EnumMap := $*W.find_symbol(['EnumMap']);
                if nqp::istype($result, $EnumMap) {
                    my $storage := $result.hash.FLATTENABLE_HASH();
                    Perl5::World::import($/, $storage, $package_source_name);
                }
                else {
                    nqp::die("&EXPORT sub did not return an EnumMap");
                }
            }
            else {
                if +@positional_imports {
                    nqp::die("Error while importing from '$package_source_name': no EXPORT sub, but you provided positional argument in the 'use' statement");
                }
            }
        }
    }

    token statement_control:sym<no> {
        <sym> <.ws>
        <module_name>
        [ <.spacey> <arglist> <?{ $<arglist><arg>[0]<EXPR> }> ]?
        {
            my $longname := ~$<module_name><longname>;
            my $arglist;
            
            if $<arglist><arg>[0]<EXPR> {
                $arglist := $*W.compile_time_evaluate($/,
                        $<arglist><arg>[0]<EXPR>.ast);
                $arglist := nqp::getattr($arglist.list.eager,
                        $*W.find_symbol(['List']), '$!items');
            }
            
            if nqp::existskey(%pragma_defaults, $longname) {
                self.pragma($longname, $<arglist><arg>[0]<EXPR>
                    ?? $arglist
                    !! %pragma_defaults{$longname}, 0);
            }
        }
    }


    #rule statement_control:sym<if> {
    #    $<sym>=['if'|'unless']
    #    <xblock>
    #    [
    #        [ <!before 'else'\s*'if'> || <.panic: "Please use 'elsif'"> ]
    #        'elsif'<?spacey> <elsif=xblock>
    #    ]*
    #    [
    #        'else'<?spacey> <else=sblock>
    #    ]?
    #}
    rule statement_control:sym<if> {
        <sym>
        <xblock>
        [
            [
            | 'else'\h*'if' <.typed_panic: 'X::Syntax::Malformed::Elsif'>
            | 'elif' { $/.CURSOR.typed_panic('X::Syntax::Malformed::Elsif', what => "elif") }
            | 'elsif' <xblock>
            ]
        ]*
        [ 'else' <else=.sblock> ]?
    }

    rule statement_control:sym<unless> {
        <sym>
        <xblock>
        [
            [
            | 'else'\h*'if' <.typed_panic: 'X::Syntax::Malformed::Elsif'>
            | 'elif' { $/.CURSOR.typed_panic('X::Syntax::Malformed::Elsif', what => "elif") }
            | 'elsif' <xblock>
            ]
        ]*
        [ 'else' <else=.sblock> ]?
    }

    rule statement_control:sym<while> {
        <sym> <xblock>
        [ 'continue' <continue=.sblock> ]?
    }

    rule statement_control:sym<until> {
        <sym> <xblock>
        [ 'continue' <continue=.sblock> ]?
    }

    rule statement_control:sym<for> {
        :my $var := '$_';
        :my $*SCOPE;
        ['for'|'foreach']
        [
        ||  '('
                <e1=.EXPR>? ';'
                <e2=.EXPR>? ';'
                <e3=.EXPR>?
            ')'
        ||  [
                [ 'my' { $*SCOPE := 'my' } || 'our' { $*SCOPE := 'our' } ]?
                <variable> { $var := $<variable>.ast.name }
            ]?
            '(' ~ ')' <EXPR>
        ]
        <sblock(1, $var)>
        [ 'continue' <continue=.sblock> ]?
    }

    token statement_control:sym<foreach> {
        <!>
    }

    rule statement_control:sym<given> {
        <sym> <xblock>
    }
    rule statement_control:sym<when> {
        <sym> <xblock>
    }
    rule statement_control:sym<default> {<sym> <sblock> }

    rule statement_prefix:sym<BEGIN>    {<sym> <sblock> }
    rule statement_prefix:sym<CHECK>    {<sym> <sblock> }
    rule statement_prefix:sym<INIT>     {<sym> <sblock> }
    rule statement_control:sym<END>     {<sym> <sblock> }

    #######################
    # statement modifiers #
    #######################

    rule modifier_expr { <EXPR> }

    rule statement_mod_cond:sym<if>     {<sym> <modifier_expr> }
    rule statement_mod_cond:sym<unless> {<sym> <modifier_expr> }
    rule statement_mod_cond:sym<when>   {<sym> <modifier_expr> }

#    rule statement_mod_loop:sym<while> {<sym> <modifier_expr> }
#    rule statement_mod_loop:sym<until> {<sym> <modifier_expr> }
#    rule statement_mod_loop:sym<for>   {<sym> <modifier_expr> }
#    rule statement_mod_loop:sym<given> {<sym> <modifier_expr> }
    token statement_mod_loop:sym<while> { <sym> <.ws> <smexpr=.EXPR> }
    token statement_mod_loop:sym<until> { <sym> <.ws> <smexpr=.EXPR> }
    token statement_mod_loop:sym<for>   { <sym> 'each'? <.ws> <smexpr=.EXPR> }
    token statement_mod_loop:sym<given> { <sym> <.ws> <smexpr=.EXPR> }

    ################
    # module names #
    ################

    token def_module_name {
        <longname>
    }

    token module_name:sym<normal> {
        <longname>
        [ <?before '['> :dba('generic role') '[' ~ ']' <arglist> ]?
    }

    token vnum {
        \d+
    }

    token versionish {
        | <version>
        | <?before \d+'.'\d+> <vnum> +% '.'
    }

    token version {
        [
        | 'v' <?before \d> {} $<vstr>=[<vnum>+ % '.']
        | <?before \d+'.'\d+'.'\d+> {} $<vstr>=[<vnum>+ % '.']
        ]
        <!before '-'|\'> # cheat because of LTM fail
    }

    ###############
    # Declarators #
    ###############

#    token variable_declarator {
#        :my $*IN_DECL := 1;
#        :my $*DECLARAND;
#        <variable>
#        { $*IN_DECL := 0; self.add_variable(~$<variable>) }
#        <.ws>
#
#        <trait>*
#    }
    token variable_declarator {
        :my $*IN_DECL := 'variable';
        :my $var;
        <variable>
        {
            $var := $<variable>.Str;
            $/.CURSOR.add_variable($var);
            $*IN_DECL := '';
        }
        [
            <.unsp>?
            $<shape>=[
            | '(' ~ ')' <signature>
                {
                    my $sigil := nqp::substr($var, 0, 1);
                    if $sigil eq '&' {
                        self.typed_sorry('X::Syntax::Reserved',
                            reserved => '() shape syntax in routine declarations',
                            instead => ' (maybe use :() to declare a longname?)'
                        );
                    }
                    elsif $sigil eq '@' {
                        self.typed_sorry('X::Syntax::Reserved',
                            reserved => '() shape syntax in array declarations');
                    }
                    elsif $sigil eq '%' {
                        self.typed_sorry('X::Syntax::Reserved',
                            reserved => '() shape syntax in hash declarations');
                    }
                    else {
                        self.typed_sorry('X::Syntax::Reserved',
                            reserved => '() shape syntax in variable declarations');
                    }
                }
            | :dba('shape definition') '[' ~ ']' <semilist> <.NYI: "Shaped variable declarations">
            | :dba('shape definition') '{' ~ '}' <semilist>
            | <?before '<'> <postcircumfix> <.NYI: "Shaped variable declarations">
            ]+
        ]?
        <.ws>
        
        <trait>*
#        <post_constraint>*
    }

#    rule scoped($*SCOPE) {
#        :dba('scoped declarator')
#        [
#        | <declarator>
#        | <regex_declarator>
#        | <package_declarator>
#        ]
#        || <?before <[A..Z]>><longname>{{
#                my $t := $<longname>.Str;
#                if !self.is_known($t) {
#                    self.sorry("In \"$*SCOPE\" declaration, typename $t must be predeclared (or marked as declarative with :: prefix)");
#                }
#            }}
#            <!> # drop through
#        || <.panic: "Malformed $*SCOPE">
#    }
    token scoped($*SCOPE) {
        :dba('scoped declarator')
        <.ws>
        [
        | <DECL=declarator>
        | <DECL=regex_declarator>
        | <DECL=package_declarator>
        ]
    }


    token scope_declarator:sym<my>        { <sym> <scoped('my')> }
    token scope_declarator:sym<our>       { <sym> <scoped('our')> }
    token scope_declarator:sym<state>     { <sym> <scoped('state')> }

    #rule package_declarator:sym<package> {
    #    :my $*OUTERPACKAGE := $*PACKAGE;
    #    :my $*PKGDECL := 'package';
    #    <sym> <package_def>
    #}
    token package_declarator:sym<package> {
        :my $*OUTERPACKAGE := $*PACKAGE;
        :my $*PKGDECL := 'class';
        <sym> <.end_keyword> <package_def>
    }

    rule statement_control:sym<require> {   # here because of declarational aspects
        <sym>
        [
        | <versionish>
        | <module_name> <!['(']>
        | <file=.variable>
        | <!before <sigil>> <file=.term>
        ]
        [ <EXPR> ]?
    }

#    rule package_def {
#        :my $longname;
#        :my $*IN_DECL := 'package';
#        :my $*HAS_SELF := '';
#        :my $*DECLARAND;
#        :my $*NEWPKG;
#        :my $*NEWLEX;
#        :my $outer := $*CURLEX;
#        :my $*CURPKG;
#        :my $*CURLEX;
##        { $*SCOPE := $*SCOPE || 'our'; }
#        '' # XXX
#        [
#            [ <longname> { $longname := $<longname>; self.add_name( ~$longname<name> ); } ]?
#            <.newlex>
#            <trait>*
#            <.getdecl>
#            [
#            || <?before '{'>
#                [
#                    {
#                        # figure out the actual full package name (nested in outer package)
#                        if $longname && $*NEWPKG {
#                            my $shortname := ~$longname<name>;
#                            $*CURPKG      := $*NEWPKG // $*CURPKG{$shortname ~ '::'};
#                        }
#                        $*begin_compunit   := 0;
#                        $*UNIT<$?LONGNAME> := $*UNIT<$?LONGNAME> || $longname ?? ~$longname<name> !! '';
#                    }
#                    { $*IN_DECL := ''; }
#                    <blockoid>
#                    <.checkyada>
#                ]
#            || <?before ';'>
#                {
#                $longname || self.panic("Compilation unit cannot be anonymous");
#                my $shortname    := ~$longname<name>;
#                $*CURPKG         := $*NEWPKG // $*CURPKG{$shortname ~ '::'};
#                $*begin_compunit := 0;
#
#                # XXX throws away any role sig above
#                $*CURLEX := $outer;
#
#                $*UNIT<$?LONGNAME> := ~$longname<name>;
#                }
#                { $*IN_DECL := ''; }
#                <statementlist>     # whole rest of file, presumably
#            || <.panic: "Unable to parse $*PKGDECL definition">
#            ]
#        ] || <.panic: "Malformed $*PKGDECL">
#    }
    rule package_def {
        :my $longname;
        :my $outer := $*W.cur_lexpad();
        :my $*DECLARAND;
        :my $*IN_DECL := 'class';
        :my $*HAS_SELF := '';
        :my $*CURPAD;
        :my $*DOC := $*DECLARATOR_DOCS;
        :my $*DOCEE;
#        <.attach_docs>
        ''
        # Meta-object will live in here; also set default REPR (a trait
        # may override this, e.g. is repr('...')).
        :my $*PACKAGE;
        :my $*REPR;
        
        # Default to our scoped.
        { unless $*SCOPE { $*SCOPE := 'our'; } }
        
        [
            [ <longname> { $longname := $*W.dissect_longname($<longname>); } ]?
            <.newlex>
            
            #~ [ :dba('generic role')
            #~ <?{ ($*PKGDECL//'') eq 'role' }>
            #~ { $*PACKAGE := $*OUTERPACKAGE } # in case signature tries to declare a package
            #~ '[' ~ ']' <signature>
            #~ { $*IN_DECL := ''; }
            #~ ]?
            
            <trait>*
            
            {
                # Locate any existing symbol. Note that it's only a match
                # with "my" if we already have a declaration in this scope.
                my $exists := 0;
                my @name := $longname ??
                    $longname.type_name_parts('package name', :decl(1)) !!
                    [];
                if @name && $*SCOPE ne 'anon' {
                    if @name && $*W.already_declared($*SCOPE, $*OUTERPACKAGE, $outer, @name) {
                        $*PACKAGE := $*W.find_symbol(@name);
                        $exists := 1;
                    }
                }

                # If it exists already it is an illegal redecl.
                if $exists && $*PACKAGE.HOW.is_composed($*PACKAGE) {
                    $*W.throw($/, ['X', 'Redeclaration'],
                        symbol => $longname.name(),
                    );
                }
                
                # Construct meta-object for this package.
                my %args;
                if @name {
                    %args<name> := $longname.name();
                }
                if $*REPR ne '' {
                    %args<repr> := $*REPR;
                }
                $*PACKAGE := $*W.pkg_create_mo($/, %*HOW{$*PKGDECL}, |%args);
                
                # Install it in the symbol table if needed.
                if @name {
                    $*W.install_package($/, @name, $*SCOPE, $*PKGDECL, $*OUTERPACKAGE, $outer, $*PACKAGE);
                }
                
                # Install $?PACKAGE, $?ROLE, $?CLASS, and :: variants as needed.
                my $curpad := $*W.cur_lexpad();
                unless $curpad.symbol('$?PACKAGE') {
                    $*W.install_lexical_symbol($curpad, '$?PACKAGE', $*PACKAGE);
                    $*W.install_lexical_symbol($curpad, '::?PACKAGE', $*PACKAGE);
                    $*W.install_lexical_symbol($curpad, '$?CLASS', $*PACKAGE);
                    $*W.install_lexical_symbol($curpad, '::?CLASS', $*PACKAGE);
                }
                
                # Set declarand as the package.
                $*DECLARAND := $*PACKAGE;
                
                # Apply any traits.
                #for $<trait> {
                #    my $applier := $_.ast;
                #    if $applier {
                #        $applier($*DECLARAND);
                #    }
                #}
            }
            
            { nqp::push(@*PACKAGES, $*PACKAGE); }
            [
            || <?[{]> 
                [
                {
                    $*IN_DECL := '';
                    $*begin_compunit := 0;
                }
                <blockoid>
                ]
            
            || ';'
                [ <?{ $*begin_compunit }>
                    {
                        unless $longname {
                            $/.CURSOR.panic("Compilation unit cannot be anonymous");
                        }
                        $*begin_compunit := 0;
                    }
                ] ?
                { $*IN_DECL := ''; }
                <.finishlex>
                <statementlist>     # whole rest of file, presumably
                { $*CURPAD := $*W.pop_lexpad(); }
            || <.panic("Unable to parse $*PKGDECL definition")>
            ]
            { nqp::pop(@*PACKAGES); }
        ] || { $/.CURSOR.malformed($*PKGDECL) }
    }

    token declarator {
        [
        | <variable_declarator>
        | '(' ~ ')' <signature> <trait>* <.ws> <initializer>?
        | <routine_declarator>
        | <regex_declarator>
        | <type_declarator>
        ]
    }

    proto token initializer { <...> }
    token initializer:sym<=> {
        <sym> <.ws> <EXPR('h=')>
    }

    token multi_declarator:sym<null> {
        :my $*MULTINESS := '';
        <declarator>
    }

    #rule routine_declarator:sym<sub>       { <sym> <routine_def> }
    token routine_declarator:sym<sub>       { <sym> <.end_keyword> <.ws> <routine_def> }

    rule parensig {
        :dba('signature')
        '(' ~ ')' <signature>
    }

    method checkyada () {
        try {
            my $startsym := self<blockoid><statementlist><statement>[0]<EXPR><term><sym> // '';
            if $startsym eq '...' || $startsym eq '!!!' || $startsym eq '???' {
                $*DECLARAND<stub> := 1;
            }
        };
        return self;
    }

#    rule routine_def {
#        :my $*CURLEX;
#        :my $*IN_DECL := 1;
#        :my $*DECLARAND;
#        [
#        ||  <deflongname>
#            <.newlex(1)>
#            <parensig>?
#            <trait>*
#            <!{
#                $*IN_DECL := 0;
#            }>
#            <blockoid>:!s
#            { @*MEMOS[self.pos]<endstmt> := 2; }
#            <.checkyada>
#            <.getsig>
#        || <?before \W>
#            <.newlex(1)>
#            <parensig>?
#            <trait>*
#            <!{
#                $*IN_DECL := 0;
#            }>
#            <blockoid>:!s
#            <.checkyada>
#            <.getsig>
#        ] || <.panic: "Malformed routine">
#    }
    my %prototype := nqp::hash(
        'chr',    '$',
        'int',    '$',
        'ord',    '$',
        'ref',    '$',
        'time',   '',
        'not',    '@',
        'unpack', '$@',
        'map',    '$@',
        'grep',   '$@',
        'sort',   '$@',
    );
    rule routine_def {
        :my $*IN_DECL := 'sub';
        :my $*METHODTYPE;
        :my $*IMPLICIT := 0;
        :my $*DOC := $*DECLARATOR_DOCS;
        :my $*DOCEE;
        :my $*DECLARAND := $*W.stub_code_object('Sub');
        :my $*PROTOTYPE;
        [
        ||  <deflongname>
            <.newlex>
            [ <parensig> { %prototype{ ~$<deflongname> } := ~$*PROTOTYPE } ]?
            <trait>*
            { $*IN_DECL := 0; }
            [
            || <?terminator>
            || <blockoid>
            ]
        ||  <?before \W>
            <.newlex>
            [ <parensig> { %prototype{ ~$<deflongname> } := ~$*PROTOTYPE } ]?
            <trait>*
            { $*IN_DECL := 0; }
            <blockoid>
            [ '->' '(' ~ ')' <arglist> ]?
        ]
    }

    rule trait {
        :my $*IN_DECL := 0;
        ':' <identifier>+ % <.ws>
    }

    #########
    # Nouns #
    #########

    # (for when you want to tell EXPR that infix already parsed the term)
    token nullterm {
        <?>
    }

#    token nulltermish {
#        :dba('null term')
#        [
#        | <?stdstopper>
#        | <term=termish>
#            #{
#            #    self<PRE>   := $<term><PRE>;
#            #    self<POST>  := $<term><POST>;
#            #    nqp::deletekey($<term>, 'PRE');
#            #    nqp::deletekey($<term>, 'POST');
#            #    self<~CAPS> := $<term><~CAPS>;
#            #}
#        | <?>
#        ]
#    }

    method EXPR(str $preclim = '') {
        # Override this so we can set $*LEFTSIGIL.
        my $*LEFTSIGIL := '';
        nqp::findmethod(HLL::Grammar, 'EXPR')(self, $preclim, :noinfix($preclim eq 'z='));
    }

#    token termish {
#        :my $*SCOPE := "";
#        :my $*VAR;
#        :dba('prefix or term')
#        [
#        | <PRE> [ <!{
#                my $p   := $<PRE>;
#                my @p   := @( $p );
#                $<term> := nqp::pop( @p ) if @p[-1]<O><term>;
#            }> <PRE> ]*
#            [ <?{ $<term> }> || <term> ]
#        | <term>
#        ]
#
#        # also queue up any postfixes
#        :dba('postfix')
#        [
#        || <?{ $*QSIGIL }>
#            [ <?before '[' | '{' > <POST> ]*!
#        || <!{ $*QSIGIL }>
#            <POST>*
#        ]
#        {
#            self.check_variable($*VAR) if $*VAR;
#            #self<~CAPS> := $<term><~CAPS>;
#        }
#    }
    token termish {
        :my $*SCOPE := "";
        :my $*MULTINESS := "";
        :my $*OFTYPE;
        :my $*VAR;
        :my $*ARGUMENT_WANT := 0;
        :my $*ARGUMENT_HAVE := 0;
        :dba('prefix or term')
        [
            [
            | <prefixish> [ <!{
                    my $p   := $<prefixish>;
                    $<term> := nqp::pop( $p ) if $p[-1]<O><term>;
                }> <!filetest> <prefixish> ]*
                [ <?{ $<term> }> || <term> ]
            | <term>
            ]
            
            :dba('postfix')
            [
            || <?{ $*QSIGIL }>
                [
                || <?{ $*QSIGIL eq '$' }> [ <postfixish>+! <?{ bracket_ending($<postfixish>) }> ]?
                ||                          <postfixish>+! <?{ bracket_ending($<postfixish>) }>
                || { $*VAR := 0 } <!>
                ]
            || <!{ $*QSIGIL }> <postfixish>*
            ]
        || <!{ $*QSIGIL }> <?before <infixish> {
            $/.CURSOR.typed_panic('X::Syntax::InfixInTermPosition', infix => ~$<infixish>); } >
        || <!>
        ]
        { self.check_variable($/, $*VAR) if $*VAR; }
    }

    sub bracket_ending($matches) {
        my $check := $matches[+$matches - 1];
        my $str   := $check.Str;
        my $last  := nqp::substr($str, nqp::chars($check) - 1, 1);
        $last eq ')' || $last eq '}' || $last eq ']' || $last eq '>'
    }

    token term:sym<fatarrow> { <fatarrow> }

    token term:sym<variable> {
        <variable>
        [
#        || <?{ ~$<variable><sigil> ne '$' }>
        || <?before '['> { $<variable><really> := '@' }
        || <?before '{'> { $<variable><really> := '%' }
        ]?
        { $*VAR := $*VAR || $<variable> }
    }

    token term:sym<package_declarator> { <package_declarator> }
    token term:sym<scope_declarator>   { <scope_declarator> }
    token term:sym<routine_declarator> { <routine_declarator> }
    token term:sym<circumfix>          { <circumfix> }
    token term:sym<dotty>              { <dotty> }
    token term:sym<value>              { <value> }
    token term:sym<statement_prefix>   { <statement_prefix> }

    token fatarrow {
        '-'?<key=.identifier> \h* '=>' <.ws> <val=.EXPR('h=')>
    }

    token special_variable:sym<$0> {
        <sym> | '$PROGRAM_NAME'
    }

    token special_variable:sym<$!> {
        <sym> <!before \w> | '$OS_ERROR' | '$ERRNO'
    }

    token special_variable:sym<%!> {
        <sym> <!before \w> | '%OS_ERROR' | '%ERRNO'
    }

    token special_variable:sym<$!{ }> {
        '$!{' ~ '}' <EXPR>
    }

    token special_variable:sym<$/> {
        <sym>
    }

    token special_variable:sym<$~> {
        <sym> | '$FORMAT_NAME'
    }

    token special_variable:sym<$`> {
        <sym> | '$PREMATCH'
    }

    token special_variable:sym<$@> {
        <sym> | '$EVAL_ERROR'
    }

    token special_variable:sym<$#> {
        <sym>
    }
    token special_variable:sym<$$> {
        <sym> <!alpha>
    }
    token special_variable:sym<$%> {
        <sym> | '$FORMAT_PAGE_NUMBER'
    }

    token special_variable:sym<$^X> {
        [
        | $<sigil>='$' '^' $<letter>=[<[A..Z]>]
        | $<sigil>='%' '^' $<letter>='H'
        ]
    }

    token special_variable:sym<$^> {
        <sym> | '$FORMAT_TOP_NAME'
    }

    token special_variable:sym<$&> {
        <sym> | '$MATCH'
    }

    token special_variable:sym<$*> {
        <sym>
    }

    token special_variable:sym<$(> {
        <sym> | '$REAL_GROUP_ID' | '$GID'
    }

    token special_variable:sym<$)> {
        <sym> | '$EFFECTIVE_GROUP_ID' | '$EGID'
    }

    token special_variable:sym<$-> {
        <sym> | '$FORMAT_LINES_LEFT'
    }

    token special_variable:sym<$=> {
        <sym> | '$FORMAT_LINES_PER_PAGE'
    }

    token special_variable:sym<@+> {
        <sym> | '@LAST_MATCH_END'
    }

    token special_variable:sym<%+> {
        <sym> | '%LAST_PAREN_MATCH'
    }

    token special_variable:sym<$+[ ]> {
        '$+[' | '$LAST_PAREN_MATCH'
    }

    token special_variable:sym<@+[ ]> {
        '@+['
    }

    token special_variable:sym<@+{ }> {
        '@+{'
    }

    token special_variable:sym<@-> {
        <sym> | '@LAST_MATCH_START'
    }

    token special_variable:sym<%-> {
        <sym> | '%LAST_MATCH_START'
    }

    token special_variable:sym<$-[ ]> {
        '$-['
    }

    token special_variable:sym<@-[ ]> {
        '@-['
    }

    token special_variable:sym<%-{ }> {
        '@-{'
    }

    token special_variable:sym<$+> {
        <sym>
    }

    token special_variable:sym<${^ }> {
        <sigil> '{^' $<text> = [.*?] '}'
    }

    token special_variable:sym<::{ }> {
        '::' <?before '{'>
    }

    token special_variable:sym<$[> {
        <sym>
    }

    token special_variable:sym<$\\> {
        <sym> | '$OUTPUT_RECORD_SEPARATOR' | '$ORS'
    }

    token special_variable:sym<$:> {
        <sym> | '$FORMAT_LINE_BREAK_CHARACTERS'
    }

    token special_variable:sym<$'> { #'
        <sym> | '$POSTMATCH'
    }

    token special_variable:sym<$"> {
        <sym> <!{ $*QSIGIL }> | '$LIST_SEPARATOR'
    }

    token special_variable:sym<$,> {
        <sym> | '$OUTPUT_FIELD_SEPARATOR' | '$OFS'
    }

    token special_variable:sym['$<'] {
        <sym> | '$REAL_USER_ID' | '$UID'
    }

    token special_variable:sym«\$>» {
        <sym> | '$EFFECTIVE_USER_ID' | '$EUID'
    }

    token special_variable:sym<$.> {
        <sym> | '$INPUT_LINE_NUMBER' | '$NR'
    }

    token special_variable:sym<${ }> {
        <!before { 1; }>
    }

    # desigilname should only follow a sigil

    token desigilname {
        [
        | <?before '$' > <variable> { $*VAR := $<variable>; }
        | <longname>
        | <[\W]-[{]>
        ]
    }

    token variable {
        :my $*IN_META := 0;
        :my $sigil := '';
        :my $name;
        <?before <sigil> {
            $sigil := ~$<sigil>;
        }> {}
        [
        || '&'
            [
            | <subname> { $name := ~$<subname> } [ <.ws> '(' ~ ')' <arglist> ]?
            | :dba('infix noun') '[' ~ ']' <infixish(1)>
            ]
        || [
            | <special_variable>
            | <sigil> <desigilname> { $name := ~$<desigilname> }
            | <sigil> <!before '0'> $<index> = [\d+]
            | <sigil> <?before '{'>
            [
            |	'{' ~ '}' [<name> <postop>?]
            |	<block>
            ]
            | <sigil> <?{ $*IN_DECL }>
            | <?> {{
                if $*QSIGIL {
                    0
                }
                else {
                    self.panic("Anonymous variable requires declarator");
                }
              }}
            ]
        ]

    }



    # Note, don't reduce on a bare sigil unless you don't care what the longest token is.

    token sigil:sym<$>  { <sym> }
    token sigil:sym<@>  { <sym> }
    token sigil:sym<%>  { <sym> }
    token sigil:sym<&>  { <sym> }
    token sigil:sym<*>  { <sym> }
    token sigil:sym<$#> { <sym> }

    token deflongname {
        :dba('new name to be defined')
        <name> <colonpair>*
#        { self.add_routine( ~$<name> ) if $*IN_DECL; }
    }

    token colonpair {
        <!>
    }

    token longname {
        <name> <colonpair>*
    }
    
    token name {
        [
        | <identifier> <morename>*
        | <morename>+
        ]
    }

    token morename {
        :my $*QSIGIL := '';
        '::' <identifier>?
    }

    token subname {
        <desigilname>
    }

    token value:sym<quote>   { <quote> }
    token value:sym<number>  { <number> [ <?before \s+> || <?MARKER('ws')> ] }
    token value:sym<version> { <version> }

    # Note: call this only to use existing type, not to declare type
    token typename {
        [
        | '::?'<identifier>                 # parse ::?CLASS as special case
        | <longname>
          <?{
            my $longname := $*W.dissect_longname($<longname>);
            nqp::substr(~$<longname>, 0, 2) eq '::' ??
                1 !! # ::T introduces a type, so always is one
                $*W.is_name($longname.type_name_parts('type name'))
          }>
        ]
        # parametric type?
        <.unsp>? [ <?before '['> <postcircumfix> ]?
        <.ws> [ 'of' <.ws> <typename> ]?
    }

    #~ token quotepair($*purpose = 'quoteadverb') {
        #~ :my $*key;
        #~ :my $*value;
        #~ ':'
        #~ :dba('colon pair (restricted)')
        #~ [
        #~ | '!' <identifier> [ <?before '('> <.sorry('Argument not allowed on negated pair')> ]?
            #~ { $*key := ~$<identifier>; $*value := 0; }
        #~ | <identifier> 
            #~ { $*key := ~$<identifier> }
            #~ [
            #~ || <?before '('> <circumfix> { $*value := $<circumfix>.ast; }
            #~ || { $*value := 1; }
            #~ ]
        #~ | (\d+) <identifier>
            #~ [ <?before '('> <.circumfix> <.sorry('2nd argument not allowed on pair')> ]?
            #~ { $*key := ~$<identifier>; $*value := +~$/[0] }
        #~ ]
    #~ }

    token numish {
        [
        | <integer>
        | <dec_number>
        | <rad_number>
        | 'NaN' »
        | 'Inf' »
        | '+Inf' »
        | '-Inf' »
        ]
    }

    token number:sym<numish> { <numish> }

    #token integer {
    #    [
    #    | 0 $<VALUE>=[ b <[01]>+           [ _ <[01]>+ ]*
    #        | x <.xdigit>+ [ _ <.xdigit>+ ]*
    #        | d \d+               [ _ \d+]*
    #        | <[0..7]>+         [ _ <[0..7]>+ ]*
    #        ]
    #    | $<VALUE>=[\d+[_\d+]*]
    #    ]
    #}
    token integer {
        [
        || 0 [ <[bB]> '_'? <VALUE=binint>
             | <[oO]> '_'? <VALUE=octint>
             | <[xX]> '_'? <VALUE=hexint>
             | <VALUE=octint>
             ]
        || <VALUE=decint>
        ]
        [ '.' <!before '.'> ]?
        [ <?before '_' '_'+\d> <.sorry: "Only isolated underscores are allowed inside numbers"> ]?
    }

    token rad_number {
        ':' $<radix> = [\d+] <.unsp>?
        {}           # don't recurse in lexer
        :dba('number in radix notation')
        [
        || '<'
                $<intpart> = [ <[ 0..9 a..z A..Z ]>+ [ _ <[ 0..9 a..z A..Z ]>+ ]* ]
                $<fracpart> = [ '.' <[ 0..9 a..z A..Z ]>+ [ _ <[ 0..9 a..z A..Z ]>+ ]* ]?
                [ '*' <base=.radint> '**' <exp=.radint> ]?
           '>'
        || <?before '['> <bracket=circumfix>
        || <?before '('> <circumfix>
        || <.malformed: 'radix number'>
        ]
    }

    token radint {
        [
        | <integer>
        | <?before ':'> <rad_number> <?{
                            nqp::defined($<rad_number><intpart>)
                            &&
                            !nqp::defined($<rad_number><fracpart>)
                        }>
        ]
    }

    token escale {
        #<[Ee]> <[+\-]>? \d+[_\d+]*
        <[Ee]> $<sign>=[<[+\-]>?] <decint>
    }

    # careful to distinguish from both integer and 42.method
    token dec_number {
        :dba('decimal number')
        [
        | $<coeff> = [           '.' \d+[_\d+]* ] <escale>?
        | $<coeff> = [\d+[_\d+]* '.' \d+[_\d+]* ] <escale>?
        | $<coeff> = [\d+[_\d+]*                ] <escale>
        ]
    }

    token octints { [<.ws><octint><.ws>] +% ',' }

    token octint {
        <[ 0..7 ]>+ [ _ <[ 0..7 ]>+ ]*
    }

    ##########
    # Quotes #
    ##########

    proto token backslash {*}
    proto token escape {*}
#    token starter { <!> }
    token escape:sym<none> { <!> }

    token sibble($l, $lang2, @lang2tweaks?) {
        :my $lang;
        :my $start;
        :my $stop;
        <babble($l)>
        { my $B := $<babble><B>.ast; $lang := $B[0]; $start := $B[1]; $stop := $B[2]; }

        $start <left=.nibble($lang)> [ $stop || <.panic("Couldn't find terminator $stop")> ]
        [ <?{ $start ne $stop }>
            <.ws>
            [ <?[ \[ \{ \( \< ]> <.obs('brackets around replacement', 'assignment syntax')> ]?
            [ <infixish> || <.missing: "assignment operator"> ]
            [ <?{ $<infixish>.Str eq '=' }> || <.malformed: "assignment operator"> ]
            # XXX When we support it, above check should add: || $<infixish><infix_postfix_meta_operator>[0]
            <.ws>
            [ <right=.EXPR('h')> || <.panic: "Assignment operator missing its expression"> ]
        ||
            { $lang := self.quote_lang($lang2, $stop, $stop, @lang2tweaks); }
            <right=.nibble($lang)> $stop || <.panic("Malformed replacement part; couldn't find final $stop")>
        ]
    }

    token tribble ($l) {
        :my $lang;
        :my $start;
        :my $stop;
        <babble($l)>
        { my $B := $<babble><B>.ast; $lang := $B[0]; $start := $B[1]; $stop := $B[2]; }

        $start <left=.nibble($lang)> [ $stop || <.panic("Couldn't find terminator $stop")> ]
        [ <?{ $start ne $stop }>
            <.ws>
            [ <?[ \[ \{ \( \< ]> <.obs('brackets around replacement', 'assignment syntax')> ]?
            [ <infixish> || <.missing: "assignment operator"> ]
            [ <?{ $<infixish>.Str eq '=' }> || <.malformed: "assignment operator"> ]
            # XXX When we support it, above check should add: || $<infixish><infix_postfix_meta_operator>[0]
            <.ws>
            [ <right=.EXPR('h')> || <.panic: "Assignment operator missing its expression"> ]
        ||
            { $lang := self.quote_lang($l, $stop, $stop, ['qq']); }
            <right=.nibble($lang)> $stop || <.panic("Malformed replacement part; couldn't find final $stop")>
        ]
    }
 

    token quote:sym<' '>  { :dba('single quotes') "'" ~ "'" <nibble(self.quote_lang(%*LANG<P5Q>, "'", "'", ['q']))> }
    token quote:sym<" ">  { :dba('double quotes') '"' ~ '"' <nibble(self.quote_lang(%*LANG<P5Q>, '"', '"', ['qq']))> }
    token quote:sym<` `>  { :dba('backticks')     '`' ~ '`' <nibble(self.quote_lang(%*LANG<P5Q>, '`', '`', ['qq']))> }
    token quote:sym<__DATA__> { :dba('pseudo filehandle') ^^ '__DATA__' \h* $<text>=[.*] }
    token quote:sym<__END__>  { ^^ '__END__' \h* .* }

    token quote:sym«<<» {
        :my $delim := '';
        <sym>
        [
        ||  [
            || <?before '"'> <quibble(%*LANG<P5Q>, 'qq', 'to')>
            || <?before "'"> <quibble(%*LANG<P5Q>, 'q', 'to')>
            || <identifier> { $delim := ~$<identifier> } <.queue_heredoc( $delim, %*LANG<P5Q> )>
            || \\ <identifier> { $delim := ~$<identifier> } <.queue_heredoc( $delim, %*LANG<P5Q> )>
            ]
        ||  <.panic: "Couldn't parse heredoc construct">
        ]
        <O('%term')>
    }

    token circumfix:sym«< >»   { '<'
                                  <nibble(%*LANG<P5Q>)> '>' }

#    token quote:sym</ />   {
#        '/' <nibble(%*LANG<P5Regex>)> [ '/' || <.panic: "Unable to parse regex; couldn't find final '/'"> ]
#        <rx_mods>?
#    }
    token quote:sym</ />  {
        :my %*RX;
        :my $*INTERPOLATE := 1;
        '/' <nibble(self.quote_lang(%*LANG<P5Regex>, '/', '/'))> [ '/' || <.panic: "Unable to parse regex; couldn't find final '/'"> ]
        <rx_mods>?
    }

    # handle composite forms like qww
    token quote:sym<qq> {
        #'qq' <?before \W> <.ws> <quibble(self.cursor_fresh( %*LANG<Q> ).tweak(:qq))>
        'qq' <?before \W> <.ws> <quibble(%*LANG<P5Q>, 'qq')>
    }
    token quote:sym<q> {
        #'q' <?before \W> <.ws> <quibble(self.cursor_fresh( %*LANG<Q> ).tweak(:q))>
        'q' <?before \W> <.ws> <quibble(%*LANG<P5Q>)>
    }

    token quote:sym<qw> {
        #'qw' <?before \W> <.ws> <quibble(self.cursor_fresh( %*LANG<Q> ).tweak(:q))>
        'qw' <?before \W> <.ws> <quibble(%*LANG<P5Q>, 'w')>
    }

    token quote:sym<qr> {
        :my %*RX;
        :my $*INTERPOLATE := 1;
        <sym> »
        #<quibble( self.cursor_fresh( %*LANG<P5Regex> ) )>
        <quibble(%*LANG<P5Regex>)>
        <rx_mods>?
    }

    token quote:sym<m>  {
        :my %*RX;
        :my $*INTERPOLATE := 1;
        <sym> »
        { %*RX<s> := 1 if $/[0] }
        <quibble(%*LANG<P5Regex>)>
        <rx_mods>?
    }

    token quote:sym<s> {
        <sym> »
        :my %*RX;
        :my $*INTERPOLATE := 1;
        {
            %*RX<s> := 1 if $/[0]
        }
        <sibble(%*LANG<P5Regex>, %*LANG<P5Q>, ['qq'])>
        <rx_mods>?
    }

    token quote:sym<tr> {
        <sym> » <pat=tribble(%*LANG<P5Q>)>
        <tr_mods>?
    }

    token rx_mods {
        <!after \s>
        <[igsmxce]>+
    }

    token tr_mods {
        <[cds\]]>+
    }

    token unitstopper { $ }

    method balanced ($start,$stop) { self.mixin( Perl5::Grammar::startstop5[$start,$stop] ); }
    method unbalanced ($stop)      { self.mixin( Perl5::Grammar::stop5[$stop] ); }
    method unitstop ($stop)        { self.mixin( Perl5::Grammar::unitstop5[$stop] ); }

    token charname {
        [
        | <radint>
        | <[a..z A..Z]><-[ \] , \# ]>*?<[a..z A..Z ) ]> <?before \s*<[ \] , \# ]>>
        ] || <.panic: "Unrecognized character name">
    }

    token charnames { [<.ws><charname><.ws>] +% ',' }

    token charspec {
        [
        | :dba('character name') '[' ~ ']' <charnames>
        | \d+
        | <[ ?..Z \\.._ ]>
        | <?> <.panic: "Unrecognized \\c character">
        ]
    }

    #~ method truly ($bool,$opt) {
        #~ return self if $bool;
        #~ self.panic("Cannot negate $opt adverb");
    #~ }

    ###########################
    # Captures and Signatures #
    ###########################

    rule param_sep { [','|':'|';'|';;'] }

    token proto_arg {
        $<arg>=['$'|'@'|'%'|'&'|'*'|'+'|';'|'_']
    }

    token signature {
        || <?{ $*IN_DECL eq 'sub' }> $<params>=['$'|'@'|'%'|'&'|'*'|'+'|';'|'_']* { $*PROTOTYPE := ~$<params> }
        || <?{ $*IN_DECL ne 'sub' }> <variable_declarator>+ % [ <.ws> ',' <.ws> ]
    }

    token type_constraint {
        <typename>
        <.ws>
    }

    rule statement_prefix:sym<do>   { <sym> [ <?[{]> <block> | <EXPR('q=')> ] }
    rule statement_prefix:sym<eval> { <sym> <.ws> <block> }

    #########
    # Terms #
    #########

    # start playing with the setting stubber

#    token term:sym<undef> {
#        <sym> » <O('%term')>
#    }

    token term:sym<continue>
        { <sym> » <O('%term')> }

    token circumfix:sym<sigil>
        { :dba('contextualizer') <sigil> '(' ~ ')' <semilist> { $*LEFTSIGIL := $*LEFTSIGIL || ~$<sigil> } <O('%term')> }

    token circumfix:sym<( )>
        { :dba('parenthesized expression') '(' ~ ')' <semilist> <O('%term')> }

    token circumfix:sym<[ ]>
        { :dba('array composer') '[' ~ ']' <semilist> <O('%term')> }

    #############
    # Operators #
    #############

#   PRE is prefixish?
#    token PRE {
#        :dba('prefix operator')
#        <prefix>
#            { $<O> := $<prefix><O>; $<sym> := $<prefix><sym> }
#        <.ws>
#    }

    token prefixish { 
        :dba('prefix or meta-prefix')
        <OPER=prefix> { $<O> := $<OPER><O>; $<sym> := $<OPER><sym> }
        <.ws>
    }

    #token infixish ($in_meta = nqp::getlexdyn('$*IN_META')) {
    #    :my $*IN_META := $in_meta;
    #    <!stdstopper>
    #    <!infixstopper>
    #    :dba('infix or meta-infix')
    #    <infix>
    #    { $<O> := $<infix><O>; $<sym> := $<infix><sym>; }
    #}
    token infixish($in_meta = nqp::getlexdyn('$*IN_META')) {
        :my $*IN_META := $in_meta;
        <!stdstopper>
        <!infixstopper>
        :dba('infix or meta-infix')
        <OPER=infix> <![=]>
    }

    token dotty:sym<.> {
        <!>
    }

    token dotty:sym«->» {
        <sym> <dottyop>
        <O('%methodcall')>
    }

    token dottyopish {
        <term=dottyop>
    }

    token dottyop {
        :dba('dotty method or postfix')
        [
        | <methodop>
        | <!alpha> <postcircumfix> { $<O> := $<postcircumfix><O>; $<sym> := $<postcircumfix><sym>; }
        ]
    }

    # Note, this rule mustn't do anything irreversible because it's used
    # as a lookahead by the quote interpolator.

    # POST is postfixish?
#    token POST {
#        <!stdstopper>
#
#        # last whitespace didn't end here
#        <!{ @*MEMOS[self.pos]<ws> }>
#
#        :dba('postfix')
#        [
#        | <dotty>  { $<O> := $<dotty><O>;  $<sym> := $<dotty><sym>;  $<~CAPS> := $<dotty><~CAPS>;  }
#        | <postop> { $<O> := $<postop><O>; $<sym> := $<postop><sym>; $<~CAPS> := $<postop><~CAPS>; }
#        ]
#    }
    token postfixish {
        <!stdstopper>
        
        # last whitespace didn't end here
        <!MARKED('ws')>

        [ <!{ $*QSIGIL }> [ <.unsp> | '\\' ] ]?

        :dba('postfix')
        <postfix_prefix_meta_operator>?
        [
        | <OPER=postfix>
        | <OPER=postcircumfix>
        | <OPER=dotty>
        ]
        { $*LEFTSIGIL := '@'; }
    }

    proto token infix_postfix_meta_operator { <...> }

    proto token infix_prefix_meta_operator { <...> }

    proto token infix_circumfix_meta_operator { <...> }

    proto token postfix_prefix_meta_operator { <...> }

    method copyO($from) {
        my $O   := $from<OPER><O>;
        my $cur := self.'!cursor_start_cur'();
        $cur.'!cursor_pass'(self.pos());
        nqp::bindattr($cur, NQPCursor, '$!match', $O);
        $cur
    }

    method copyOPER($from) {
        my $OPER := $from<OPER>;
        my $cur  := self.'!cursor_start_cur'();
        $cur.'!cursor_pass'(self.pos());
        nqp::bindattr($cur, NQPCursor, '$!match', $OPER);
        $cur
    }

#    token postcircumfix:sym<( )>
#        { :dba('argument list') '(' ~ ')' <semiarglist> <O('%methodcall')> }
    token postcircumfix:sym<( )> {
        :dba('argument list')
        '(' ~ ')' [ <.ws> <arglist> ]
        <O('%methodcall')>
    }

    token postcircumfix:sym<[ ]>
        { :dba('subscript') '[' ~ ']' <semilist>  <O('%methodcall')> }

    token postcircumfix:sym<{ }> {
        :dba('subscript')
        '{' ~ '}'
            [
            || <nibble(self.quote_lang(%*LANG<P5Q>, '{', '}', ['q']))> <?{ ~$<nibble> ~~ /^\s*\w+\s*$/ }>
            || <semilist>
            ]
        <O('%methodcall')> }

    token postop {
        | <postfix>        { $<O> := $<postfix><O>;       $<sym> := $<postfix><sym>; }
        | <postcircumfix>  { $<O> := $<postcircumfix><O>; $<sym> := $<postcircumfix><sym>; }
    }

    token methodop {
        [
        | <longname>
        | <?before '$' | '@' | '&' > <variable> { $*VAR := $<variable> }
        ]

        :dba('method arguments')
        [
        | <?[\\(]> <args>
        ]?
    }

    token semiarglist($prototype = '@') {
        <arglist($prototype, 1)> +% ';'
        <.ws>
    }

#    token arglist {
#        :my $inv_ok  := $*INVOCANT_OK;
#        :my $*GOAL   := 'endargs';
#        :my $*QSIGIL := '';
#        <.ws>
#        :dba('argument list')
#        [
#        | <?stdstopper>
#        | <EXPR('%listop')> {{
#                my $delims := $<EXPR><delims>;
#                for @( $delims ) {
#                    if ($_<sym> // '') eq ':' {
#                        if $inv_ok {
#                            $*INVOCANT_IS := $<EXPR><list>[0];
#                        }
#                    }
#                }
#            }}
#        ]
#    }
    
    token arg($*PROTOTYPE = '@') {
        :dba('argument')
        [
        #~ | <?stdstopper>
        || <?{ $*PROTOTYPE eq '@' }> <EXPR('f=')> { $*ARGUMENT_HAVE := 1 }
        || <?{ $*PROTOTYPE eq '$' }>
            [
            || <?{ $*ARGUMENT_HAVE }> <EXPR('h=')> { $*ARGUMENT_HAVE := $*ARGUMENT_HAVE + 1 }
            ||                        <EXPR('q=')> { $*ARGUMENT_HAVE := $*ARGUMENT_HAVE + 1 }
            ]
        || <?{ $*PROTOTYPE eq ';' }>
        #~ | <?>
        ]
    }

    token arglist($prototype = '@', $is_semiarglist = 0) {
        :my $*GOAL := 'endargs';
        :my $*QSIGIL := '';
        :my $s := $prototype;
        :my $n := '';
        :my $i := 0;
        [ <.ws> <indirect_object> ]?
        :dba('argument list')
        <.ws>
        [
        | <?stdstopper>
        | <?[=]>
        |   [
            || <?{ $is_semiarglist }> <arg> ** 0..1
            || [ <?{ $n := nqp::substr($s, $i, 1); $i := $i + 1; $n }> <arg($n)> ]+ % [ <.ws> ',' <.ws> ]
            ]
        ]
    }

    token circumfix:sym<{ }> {
        <?before '{' >
        <sblock>
        <O('%term')>
    }

    rule statement_control:sym<{ }> {
        :my $*FOR_VARIABLE := QAST::Node.unique('dummy');
        <?before '{' >
        <sblock>
        [ 'continue' <continue=.sblock> ]?
        <O('%term')>
    }

    ## methodcall

#    token postfix:sym«->»
#        { '->' }

    token postfix:sym«->» {
        <sym> <dottyop>
        <O('%methodcall')>
    }

    ## autoincrement
    token postfix:sym<++>
        { <sym> <O('%autoincrement')> }

    token postfix:sym«--»
        { <sym> <O('%autoincrement')> }

    token prefix:sym<++>
        { <sym> <O('%autoincrement')> }

    token prefix:sym«--»
        { <sym> <O('%autoincrement')> }

    ## exponentiation
    token infix:sym<**>
        { <sym> <O('%exponentiation')> }

    ## symbolic unary
    token prefix:sym<!>
        { <sym> <O('%symbolic_unary')> }

    token prefix:sym<+>
        { <sym> <O('%symbolic_unary')> }

    token prefix:sym<->
        { <sym> <O('%symbolic_unary')> }

    token prefix:sym<~>
        { <sym> <O('%symbolic_unary')> }

    token prefix:sym<\\>
        { <sym> <O('%symbolic_unary')> }


    ## binding
    token infix:sym<!~>
        { <sym> <O('%binding')> }

    token infix:sym<=~>
        { <sym> <O('%binding')> }


    ## multiplicative
    token infix:sym<*>
        { <sym> <O('%multiplicative')> }

    token infix:sym</>
        { <sym> <O('%multiplicative')> }

    token infix:sym<%>
        { <sym> <O('%multiplicative')> }

    token infix:sym«<<»
        { <sym> <O('%multiplicative')> }

    token infix:sym«>>»
        { <sym> <O('%multiplicative')> }

    token infix:sym<x>
        { <sym> [ <?before \s+> || <?MARKER('ws')> ] <O('%multiplicative')> }


    ## additive
    token infix:sym<.>
        { <sym> <O('%additive')> }

    token infix:sym<+>
        { <sym> <O('%additive')> }

    token infix:sym<->
        { <sym> <O('%additive')> }

    ## bitwise and (all)
    token infix:sym<&>
        { <sym> <O('%bitwise_and')> }

    token infix:sym<also>
        { <sym> <O('%bitwise_and')> }


    ## bitwise or (any)
    token infix:sym<|>
        { <sym> <O('%bitwise_or')> }

    token infix:sym<^>
        { <sym> <O('%bitwise_or')> }


    ## named unary examples
    # (need \s* to win LTM battle with listops)
#    token term:sym<abs>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<alarm>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<chop>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<chdir>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<close>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<closedir>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<caller>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<cos>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<chroot>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    token term:sym<defined> {
        <sym> <.ws>
        [
        | '(' ~ ')' <EXPR('h=')>
        | <EXPR('h=')>
        ]
    }

#    token term:sym<delete>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<dbmclose>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<exists>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<int>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<exit>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<try>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    token term:sym<eval>
        { <sym> » <?before \s*> <.ws> <!before '{'> <EXPR('q=')>? }

#    token term:sym<eof>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<exp>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<each>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<fileno>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<gmtime>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getc>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getpgrp>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getpbyname>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getpwnam>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getpwuid>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getpeername>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<gethostbyname>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getnetbyname>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getsockname>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getgroupnam>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<getgroupgid>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    token term:sym<goto>
        { <sym> » <?before \s*> <.ws> <?[&]> <EXPR('q=')> }

#    token term:sym<hex>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<keys>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<lc>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<lcfirst>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    token term:sym<length>
        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<localtime>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<log>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<lock>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<lstat>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<ord>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<oct>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<prototype>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<pop>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<pos>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<quotemeta>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<reset>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    #~ rule term:sym<time> { <sym> <.end_keyword> }

#    token term:sym<rand>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    token term:sym<__LINE__> {
        <sym>
    }
    token term:sym<__FILE__> {
        <sym>
    }
    token term:sym<__PACKAGE__> {
        <sym>
    }

#    token term:sym<rmdir>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<readdir>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<readline>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<backtick>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<rewinddir>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<readlink>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<ref>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<chomp>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

    token term:sym<scalar> {
        :my $*ARGUMENT_HAVE := 0;
        <sym> <.ws>
        [
        | '(' ~ ')' [ <arg('$')>+ % [ <.ws> ',' <.ws> ] ]
        | <arg('$')>**0..1
        ]
    }

#    token term:sym<sethostent>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<setnetent>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<setservent>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<setprotoent>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<shift>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<sin>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<sleep>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<sqrt>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<srand>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<stat>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<study>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<tell>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<telldir>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<tied>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<uc>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<ucfirst>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<untie>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<values>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<write>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }

#    token term:sym<local>
#        { <sym> » <?before \s*> <.ws> <EXPR('q=')>? }
    token prefix:sym<local> { <sym> \s+ <O('%named_unary')> { $*W.give_cur_block_temp($/) } }

    token filetest {
        '-'$<letter>=[<[a..zA..Z]>] » <?before \s*> <.ws> <EXPR('q=')>?
    }

    token term:sym<filetest> {
        <filetest>
    }

    ## comparisons
    token infix:sym«<=>»
        { <sym> <O('%comparison')> }

    token infix:sym<cmp>
        { <sym> <O('%comparison')> }


    token infix:sym«<»
        { <sym> <O('%comparison')> }

    token infix:sym«<=»
        { <sym> <O('%comparison')> }

    token infix:sym«>»
        { <sym> <O('%comparison')> }

    token infix:sym«>=»
        { <sym> <O('%comparison')> }

    token infix:sym<eq>
        { <sym> <O('%equality')> }

    token infix:sym<ne>
        { <sym> <O('%equality')> }

    token infix:sym<lt>
        { <sym> <O('%comparison')> }

    token infix:sym<le>
        { <sym> <O('%comparison')> }

    token infix:sym<gt>
        { <sym> <O('%comparison')> }

    token infix:sym<ge>
        { <sym> <O('%comparison')> }

    ## equality
    token infix:sym<==>
        { <sym> <!before '=' > <O('%equality')> }

    token infix:sym<!=>
        { <sym> <O('%equality')> }

    token infix:sym<~~>
        { <sym> <O('%equality')> }

    token infix:sym<!~~>
        { <sym> <O('%equality')> }

    ## tight and
    token infix:sym<&&>
        { <sym>  <O('%tight_and, :pasttype<if>')> }

    ## tight or
    token infix:sym<||>
        { <sym> <O('%tight_or, :assoc<left>, :pasttype<unless>')> }

    token infix:sym<^^>
        { <sym> <O('%tight_or, :pasttype<xor>')> }

    token infix:sym<//>
        { <sym> <O('%tight_or, :assoc<left>, :pasttype<defor>')> }

    ## range
    token infix:sym<..>
        { <sym> <O('%range')> }

    token infix:sym<...>
        { <sym> <O('%range')> }

    ## conditional
    token infix:sym<? :> {
        :my $*GOAL := ':';
        '?'
        <.ws>
        <EXPR('h=')>
        [ ':'
        || <?before '='> <.panic: "Assignment not allowed within ?:">
        || <?before '!!'> <.panic: "Please use : rather than !!">
        || <?before <infixish>>    # Note: a tight infix would have parsed right
           <.panic: "Precedence too loose within ?:; use ?(): instead ">
        || <.panic: "Found ? but no :; possible precedence problem">
        ]
        <O('%conditional, :reducecheck<ternary>, :pasttype<if>')>
    }

    method raise_middle () {
        self<middle> := self<infix><EXPR>;
        self;
    }

    token infix:sym<=> ()
        { <sym> <O('%assignment')> }

    ## multiplicative
    token infix:sym<*=>
        { <sym> <O('%assignment')> }

    token infix:sym</=>
        { <sym> <O('%assignment')> }

    token infix:sym<%=>
        { <sym> <O('%assignment')> }

    token infix:sym«<<=»
        { <sym> <O('%assignment')> }

    token infix:sym«>>=»
        { <sym> <O('%assignment')> }

    token infix:sym<x=>
        { <sym> <O('%assignment')> }


    ## additive
    token infix:sym<.=> ()
        { <sym> <O('%assignment')> }

    token infix:sym<+=>
        { <sym> <O('%additive')> }

    token infix:sym<-=>
        { <sym> <O('%assignment')> }

    ## bitwise and (all)
    token infix:sym<&=>
        { <sym> <O('%assignment')> }

    ## bitwise or (any)
    token infix:sym<|=>
        { <sym> <O('%assignment')> }

    token infix:sym<^=>
        { <sym> <O('%assignment')> }

    ## tight and
    token infix:sym<&&=>
        { <sym> <O('%assignment')> }

    ## tight or
    token infix:sym<||=>
        { <sym> <O('%assignment')> }

    token infix:sym<^^=>
        { <sym> <O('%assignment')> }

    token infix:sym<//=>
        { <sym> <O('%assignment')> }

    ## list item separator
    token infix:sym<,>    {
        <sym> <O('%comma, :fiddly<0>')>
    }

    token infix:sym«=>» {
        <sym> <O('%comma, :fiddly<0>')>
    }

    token term:sym<blocklist> {
        :my $*IN_SORT := 0;
        $<identifier> = [ 'map' |'grep' | 'sort' { $*IN_SORT := 1; } ] <.ws>
        [
        | '(' ~ ')' [ [ <?before '{'> <sblock(1)> <.ws> ] <arglist> ]
        |           [ [ <?before '{'> <sblock(1)> <.ws> ] <arglist> ]
        ]
        <O('%term')>
    }

    token indirect_object {
        :my $name;
        [
        | <?{ $*ALLOW_IOS_VAR }> <variable> <?before \s> <.ws> [ <?term> | <?prefix> | <!infix> ] { $name := ~$<variable> }
        | <?{ $*ALLOW_IOS_NAME }> <name> <!postfix> { $name := ~$<name> } <?{ $*W.is_type([$name]) }>
        ]
        <!{ nqp::defined(%prototype{$name}) }> { $*HAS_INDIRECT_OBJ := 1 }
    }

    token term:sym<...> { <sym> <args> }

    token term:sym<identifier> {
        :my $name;
        :my $*HAS_INDIRECT_OBJ := 0;
        :my $*ALLOW_IOS_VAR := 0;
        :my $*ALLOW_IOS_NAME := 1;
        :my $*IN_SPLIT := 0;
        <identifier> { $name := ~$<identifier> }
        <!{ $name ~~ /^ [ 'm' || 'q' || 'qq' || 'qr' || 'qw' || 'my' ] $/ }>
        <?{ nqp::defined(%prototype{$name}) || !$*W.is_type([$name]) }>
        {
            %prototype{$name} := '@' unless nqp::defined(%prototype{$name});
            $*ALLOW_IOS_VAR := $name ~~ /^ [ 'new' | 'print' | 'say' ] $/;
            $*ALLOW_IOS_NAME := $name ne 'open';
            $*IN_SPLIT := $name eq 'split';
        }
        [\h+ <?[(]>]?
        <args(%prototype{$name})>
        # no compile-time checking for subs
        # { self.add_mystery($<identifier>, $<args>.from, nqp::substr(~$<args>, 0, 1)) unless $<args><invocant>; }
        [ <?{ $name eq 'not' }> <O('%loose_not')> ]?
    }
    

#    token args ($istype = 0) {
#        :my $listopish := 0;
#        :my $*GOAL := '';
#        :my $*INVOCANT_OK := 1;
#        :my $*INVOCANT_IS;
#        [
#    #    | :dba('argument list') '.(' ~ ')' <semiarglist>
#        | :dba('argument list') '(' ~ ')' <semiarglist>
#        | :dba('argument list') <.unsp> '(' ~ ')' <semiarglist>
#        |  { $listopish := 1 } [<?before \s> <!{ $istype }> <.ws> <!infixstopper> <arglist>]?
#        ]
#        { $<invocant> := $*INVOCANT_IS; }
#    }
    token args($prototype = '@') {
        :my $*GOAL := '';
        :dba('argument list')
        [
        | '(' ~ ')' <semiarglist($prototype)>
        #| <.unsp> '(' ~ ')' <semiarglist>
        #| [<?before \s> <!{ $istype }> <.ws> <!infixstopper> <arglist>]?
        | [ <?before \s> <.ws> [ <?term> | <?prefix> | <!infix> ] <arglist($prototype)> ]?
        #~ | [ <?before \s> <.ws> <arglist($prototype)> ]?
        | <?>
        ]
    }

    # names containing :: may or may not be function calls
    # bare identifier without parens also handled here if no other rule parses it
    #token term:sym<name>
    #{
    #    :my $name;
    #    :my $pos;
    #    <longname>
    #    {
    #        $name := $<longname>.Str;
    #        $pos  := self.pos;
    #    }
    #    [\h+ <?before '('>]?
    #    <args> # { self.add_mystery($name,$pos,'termish') unless $<args><invocant>; }
    #    <O('%term')>
    #}
    token term:sym<name> {
        <longname>
        :my $*longname;
        { $*longname := $*W.dissect_longname($<longname>) }
        [
        ||  <?{ nqp::substr($<longname>.Str, 0, 2) eq '::' || $*W.is_name($*longname.components()) }>
            <.unsp>?
            [
                <?{ $*W.is_type($*longname.components()) }>
                <?before '['> :dba('type parameter') '[' ~ ']' <arglist>
            ]?
        || <args> { self.add_mystery($<longname>, $<args>.from, 'termish')
                        unless nqp::index($<longname>.Str, '::') >= 0 }
        ]
        <O('%term')>
    }

    ## loose not
    #~ token prefix:sym<not>
        #~ { <sym> <?before \s*> <O('%loose_not')> }

    ## loose and
    token infix:sym<and>
        { <sym> <O('%loose_and, :pasttype<if>')> }

    ## loose or
    token infix:sym<or>
        { <sym> <O('%loose_or, :assoc<left>, :pasttype<unless>')> }

    token infix:sym<xor>
        { <sym> <O('%loose_or')> }

    ## expression terminator
    # Note: must always be called as <?terminator> or <?before ...<terminator>...>
    
    token terminator:sym<;>
        #{ ';' <O('%terminator')> }
        { ';' <O('%terminator')> }

    token terminator:sym<if>
        { 'if' » <.nofun> <O('%terminator')> }

    token terminator:sym<unless>
        { 'unless' » <.nofun> <O('%terminator')> }

    token terminator:sym<while>
        { 'while' » <.nofun> <O('%terminator')> }

    token terminator:sym<until>
        { 'until' » <.nofun> <O('%terminator')> }

    token terminator:sym<for>
        { 'for' » <.nofun> <O('%terminator')> }

    token terminator:sym<given>
        { 'given' » <.nofun> <O('%terminator')> }

    token terminator:sym<when>
        { 'when' » <.nofun> <O('%terminator')> }

    token terminator:sym<)>
        { <sym> <O('%terminator')> }

    token terminator:sym<]>
        { ']' <O('%terminator')> }

    token terminator:sym<}>
        { '}' <O('%terminator')> }

    token terminator:sym<:>
        { ':' <?{ $*GOAL eq ':' }> <O('%terminator')> }

    regex infixstopper {
        :dba('infix stopper')
        [
        | <?before <stopper> >
        | <?before ':' > <?{ $*GOAL eq ':' }>
        ]
    }

    # overridden in subgrammars
    #token stopper { <!> }

    # hopefully we can include these tokens in any outer LTM matcher
    #regex stdstopper {
    #    { if nqp::existskey(@*MEMOS[self.pos], 'endstmt') { my @*STUB := self; return self } }
    #    :dba('standard stopper')
    #    [
    #    | <?terminator>
    #    | <?unitstopper>
    #    | $                                 # unlikely, check last (normal LTM behavior)
    #    ]
    #    { @*MEMOS[self.pos]<endstmt> := @*MEMOS[self.pos]<endstmt> || 1; }
    #}
    token stdstopper {
        :dba('standard stopper')
        [
        || <?MARKED('endstmt')> <?>
        || [
           | <?terminator>
           | <?unitstopper>
           | $
           ]
       ]
    }
}

grammar Perl5::QGrammar is HLL::Grammar does STD5 {

    token charspec {
        [
        | <[a..z @ A..Z \] ^ _]>
        | '[' <!before \w>
        | '\\\\'
        | $<quest>=['?']
        | :dba('character name') '[' ~ ']' <charnames=.LANG('Perl5','charnames')>
        | $<number>=[\d+]
        | <?> <.panic: 'Unrecognized \c character'>
        ]
    }

    proto token escape {*}
    proto token backslash {*}

    role b1 {
        token escape:sym<\\> { <sym> <item=backslash> }
        token backslash:sym<qq> { <?before 'q'> { $<quote> := <quibble(%*LANG<P5Q>, 'qq')> } }
        token backslash:sym<\\> { <text=sym> }
        token backslash:sym<stopper> { <text=stopper> }
        token backslash:sym<a> { <sym> }
        token backslash:sym<b> { <sym> }
        token backslash:sym<c> { <sym> <charspec> }
        token backslash:sym<e> { <sym> }
        token backslash:sym<f> { <sym> }
        token backslash:sym<n> { <sym> }
        token backslash:sym<N> { <sym> '{' ~ '}' $<charname>=[.*?] }
        token backslash:sym<r> { <sym> }
        token backslash:sym<t> { <sym> }
        token backslash:sym<x> { :dba('hex character') <sym> [ <hexint> | '{' ~ '}' <hexints> ] }
        token backslash:sym<0> { :dba('octal character') [ <octint> ** 1..3 | '{' ~ '}' <octints> ] }
    }

    role b0 {
        token escape:sym<\\> { <!> }
    }

    role c1 {
        token escape:sym<{ }> { <?before '{'> [ <block=.LANG('Perl5','block')> ] }
    }

    role c0 {
        token escape:sym<{ }> { <!> }
    }

    role s1 {
        token escape:sym<$> {
            :my $*QSIGIL := '$';
            <?before '$'>
#            [ <termish=.LANG('MAIN','termish')> ] || <.panic: "Non-variable \$ must be backslashed">
            [ <EXPR=.LANG('Perl5', 'EXPR', 'z=')> || { $*W.throw($/, 'X::Backslash::NonVariableDollar') } ]
        }
    }

    role s0 {
        token escape:sym<$> { <!> }
    }

    role a1 {
        token escape:sym<@> {
            :my $*QSIGIL := '@';
            <?before '@'>
            [ <termish=.LANG('Perl5','termish')> | <!> ] # trap ABORTBRANCH from variable's ::
        }
    }

    role a0 {
        token escape:sym<@> { <!> }
    }

    role h1 {
        token escape:sym<%> {
            :my $*QSIGIL := '%';
            <?before '%'>
            [ <termish=.LANG('Perl5','termish')> | <!> ]
        }
    }

    role h0 {
        token escape:sym<%> { <!> }
    }

    role f1 {
        token escape:sym<&> {
            :my $*QSIGIL := '&';
            <?before '&'>
            <EXPR=.LANG('Perl5', 'EXPR', 'y=')>
        }
    }

    role f0 {
        token escape:sym<&> { <!> }
    }

    role w1 {
        method postprocessor () { 'words' }
    }

    role w0 {
        method postprocessor () { 'null' }
    }

    role ww1 {
        method postprocessor () { 'words' }
    }

    role ww0 {
        method postprocessor () { 'null' }
    }

    role x1 {
        method postprocessor () { 'run' }
    }

    role x0 {
        method postprocessor () { 'null' }
    }

    role to[$herelang] {
        method herelang() { $herelang }
        method postprocessor () { 'heredoc' }
    }

    role q {
        token stopper { \' }

        token escape:sym<\\> { <sym> <item=backslash> }

        #token backslash:sym<qq> { <?before 'q'> { $<quote> := <quibble(%*LANG<P5Q>, 'qq')>: } }
        token backslash:sym<qq> { <?before 'q'> <quote=.LANG('Perl5','quote')> }
        token backslash:sym<\\> { <text=.sym> }
        token backslash:sym<stopper> { <text=.stopper> }

        # in single quotes, keep backslash on random character by default
        #token backslash:sym<misc> { {} (.) { $<text> := "\\" ~ ~$0; } }
        token backslash:sym<miscq> { {} . }

        method tweak_q($v) { self.panic("Too late for :q") }
        method tweak_qq($v) { self.panic("Too late for :qq") }
    } # end role

    role qq does b1 does s1 does a1 {
        token stopper { \" }
        # in double quotes, omit backslash on random \W backslash by default
        #token backslash:sym<misc> { {} [ (\W) { $<text> := ~$0; } | $<x>=(\w) <.panic("Unrecognized backslash sequence: '$<x>'")> ] }
        token backslash:sym<unrec> { {} (\w) { self.throw_unrecog_backslash_seq: $/[0].Str } }
        token backslash:sym<misc> { \W }

        method tweak_q($v) { self.panic("Too late for :q") }
        method tweak_qq($v) { self.panic("Too late for :qq") }
    } # end role

#    role p5 {
#        # begin tweaks (DO NOT ERASE)
#        multi method tweak (:$g!) { self }
#        multi method tweak (:$i!) { self }
#        multi method tweak (:$m!) { self }
#        multi method tweak (:$s!) { self }
#        multi method tweak (:$x!) { self }
#        multi method tweak (:$p!) { self }
#        multi method tweak (:$c!) { self }
#        # end tweaks (DO NOT ERASE)
#    } # end role

    token nibbler {
        :my @*nibbles;
        <.do_nibbling>
    }
    
    token do_nibbling {
        :my $from := self.pos;
        :my $to   := $from;
        [
            <!before <stopper> >
            [
            || <starter> <nibbler> <stopper>
                {
                    my $c := $/.CURSOR;
                    $to   := $<starter>[-1].from;
                    if $from != $to {
                        nqp::push(@*nibbles, nqp::substr($c.orig, $from, $to - $from));
                    }

                    nqp::push(@*nibbles, $<starter>[-1].Str);
                    nqp::push(@*nibbles, $<nibbler>[-1]);
                    nqp::push(@*nibbles, $<stopper>[-1].Str);

                    $from := $to := $c.pos;
                }
            || <escape>
                {
                    my $c := $/.CURSOR;
                    $to   := $<escape>[-1].from;
                    if $from != $to {
                        nqp::push(@*nibbles, nqp::substr($c.orig, $from, $to - $from));
                    }

                    nqp::push(@*nibbles, $<escape>[-1]);

                    $from := $to := $c.pos;
                }
            || .
            ]
        ]*
        {
            my $c := $/.CURSOR;
            $to   := $c.pos;
            if $from != $to || !@*nibbles {
                nqp::push(@*nibbles, nqp::substr($c.orig, $from, $to - $from));
            }
        }
    }

    method truly($bool, $opt) {
        self.sorry("Cannot negate $opt adverb") unless $bool;
        self;
    }
    
    method tweak_q($v)          { self.truly($v, ':q'); self.HOW.mixin(self, Perl5::QGrammar::q) }
    method tweak_single($v)     { self.tweak_q($v) }
    method tweak_qq($v)         { self.truly($v, ':qq'); self.HOW.mixin(self, Perl5::QGrammar::qq); }
    method tweak_double($v)     { self.tweak_qq($v) }

    method tweak_b($v)          { self.HOW.mixin(self, $v ?? b1 !! b0) }
    method tweak_backslash($v)  { self.tweak_b($v) }
    method tweak_s($v)          { self.HOW.mixin(self, $v ?? s1 !! s0) }
    method tweak_scalar($v)     { self.tweak_s($v) }
    method tweak_a($v)          { self.HOW.mixin(self, $v ?? a1 !! a0) }
    method tweak_array($v)      { self.tweak_a($v) }
    method tweak_h($v)          { self.HOW.mixin(self, $v ?? h1 !! h0) }
    method tweak_hash($v)       { self.tweak_h($v) }
    method tweak_f($v)          { self.HOW.mixin(self, $v ?? f1 !! f0) }
    method tweak_function($v)   { self.tweak_f($v) }
    method tweak_c($v)          { self.HOW.mixin(self, $v ?? c1 !! c0) }
    method tweak_closure($v)    { self.tweak_c($v) }

    method tweak_x($v)          { self.HOW.mixin(self, $v ?? x1 !! x0) }
    method tweak_exec($v)       { self.tweak_x($v) }
    method tweak_w($v)          { self.HOW.mixin(self, $v ?? w1 !! w0) }
    method tweak_words($v)      { self.tweak_w($v) }
    method tweak_ww($v)         { self.HOW.mixin(self, $v ?? ww1 !! ww0) }
    method tweak_quotewords($v) { self.tweak_ww($v) }

    method tweak_to($v) {
        self.truly($v, ':to');
        %*LANG<P5Q>.HOW.mixin(%*LANG<P5Q>, to.HOW.curry(to, self))
    }
    method tweak_heredoc($v)    { self.tweak_to($v) }

    method tweak_regex($v) {
        self.truly($v, ':regex');
        return %*LANG<P5Regex>;
    }
} # end grammar

grammar Perl5::RegexGrammar is QRegex::P5Regex::Grammar does STD5 {
    token rxstopper { <stopper> }
    
    token p5metachar:sym<(?{ })> {
        '(?' <?[{]> <codeblock> ')'
    }
    
    token p5metachar:sym<(??{ })> {
        '(??' <?[{]> <codeblock> ')'
    }

    token p5metachar:sym<var> {
        <?[$]> <var=.LANG('Perl5', 'variable')>
    }

    token codeblock {
        <block=.LANG('Perl5','block')>
    }
}

## vim: expandtab sw=4 ft=perl6
