use Perl5::Actions;
use QRegex:from<NQP>;
use Perl5::World;

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
        self.HOW.mixin(self, startstop5[$start, $stop]);
    }
    method unbalanced($stop) {
        self.HOW.mixin(self, stop5[$stop]);
    }

    # overridden in subgrammars
    token starter { <!> }
    token stopper { <!> }

    my %quote_lang_cache;
    method quote_lang(Mu $l, $start, $stop, @base_tweaks?, @extra_tweaks?) {
        sub lang_key {
            my @keybits = $l.HOW.name($l), $start, $stop;
            for @base_tweaks {
                @keybits.push($_);
            }
            for @extra_tweaks {
                if $_[0] eq 'to' {
                    return 'NOCACHE';
                }
                @keybits.push($_[0] ~ '=' ~ $_[1]);
            }
            @keybits.join: "\0"
        }
        sub con_lang {
            my $lang = $l;
            for @base_tweaks {
                $lang = $lang."tweak_$_"(1);
            }
            for @extra_tweaks {
                my $t = $_[0];
                if nqp::can($lang, "tweak_$t") {
                    $lang = $lang."tweak_$t"($_[1]);
                }
                else {
                    self.sorry("Unrecognized adverb: :$t");
                }
            }
            $start ne $stop ?? $lang.balanced($start, $stop)
                            !! $lang.unbalanced($stop);
        }

        # Get language from cache or derive it.
        my $key = lang_key();
        if %quote_lang_cache {
            %quote_lang_cache = ();
        }
        if %quote_lang_cache{$key} && $key ne 'NOCACHE' {
            %quote_lang_cache{$key};
        }
        else {
            %quote_lang_cache{$key} = con_lang();
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
            $<B>.make([$lang, $start, $stop]);
        }
    }

    my @herestub_queue;

    my class Herestub {
        has $.delim;
        has $.orignode;
        has $.lang;
    }

    role herestop {
        token stopper { ^^ {} $<ws>=(\h*?) $*DELIM \h* <.unv>?? $$ <+[\v]-[\x85]>? }
        #~ token stopper { ^^ {} $<ws>=(\h*?) $*DELIM \h* <.unv>?? $$ \v? }
    }

    method heredoc () {
        my $here := self.'!cursor_start_cur'();
        $here.'!cursor_pos'(self.pos);
        while @herestub_queue {
            my $herestub := @herestub_queue.shift;
            my $*DELIM := $herestub.delim;
            my $lang := $herestub.lang.HOW.mixin($herestub.lang, herestop);
            my $doc := $here.nibble($lang);
            if $doc {
                # Match stopper.
                #~ my $stop := $lang.'!cursor_init'(self.orig(), :p($doc.pos), :shared(self.'!shared'())).stopper();
                my $stop := $lang.'!cursor_init'(self.orig(), :p($doc.pos)).stopper();
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
        @herestub_queue = ();
        @herestub_queue.push: Herestub.new(:$delim, :$lang, :orignode(self));
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

    method nibble(Mu $lang) {
        #~ my $lang_cursor := $lang.'!cursor_init'(self.orig(), :p(self.pos()), :shared(self.'!shared'()));
        my $lang_cursor := $lang.'!cursor_init'(self.orig(), :p(self.pos()));
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
        self.typed_panic('X::Comp::AdHoc', payload => @args.join)
    }
    method sorry(*@args) {
        self.typed_sorry('X::Comp::AdHoc', payload => @args.join)
    }
    method worry(*@args) {
        self.typed_worry('X::Comp::AdHoc', payload => @args.join)
    }

    method typed_panic($type_str, *%opts) {
        $*W.throw(self.MATCH(), $type_str, |%opts);
    }
    method typed_sorry($type_str, *%opts) {
        if +@*SORROWS + 1 == $*SORRY_LIMIT {
            $*W.throw(self.MATCH(), $type_str, |%opts);
        }
        else {
            @*SORROWS.push($*W.typed_exception(self.MATCH(), $type_str, |%opts));
        }
        self
    }
    method typed_worry($type_str, *%opts) {
        @*WORRIES.push($*W.typed_exception(self.MATCH(), $type_str, |%opts));
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
    method throw_unrecog_backslash_seq ($sequence) {
        self.panic("Unrecognized backslash sequence: '\\" ~ $sequence ~ "'");
    }

    method EXPR_nonassoc($cur, $left, $right) {
        self.typed_panic('X::Syntax::NonAssociative', :left(~$left), :right(~$right));
    }

    my %pragmas;
    method pragma( $name, $args, $set ) {
        %pragmas{$name}   //= {};
        %pragmas{$name}{$_} = $set for $args;
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
            $var<really>.make('@') if $var<sigil> && ~$var<sigil> eq '$#';
            $varast.name( $var<really>.made ~ ~$var<desigilname> ) if $var<really>.made;
            $varast.name( ~$var<sigil>      ~ ~$var<name> )        if $var<name>;
            my $name := $varast.name;
            my $is_global := nqp::substr(~$var<desigilname>, 0, 2) eq '::' if $var<desigilname>;
            if $name ne '@_' && $name ne '@INC' && !$*W.is_lexical($name) {
                if !$var<sigil> || $var<sigil> ne '&' {
                    if !%pragmas<strict><vars> || ($*IN_SORT && ($name eq '$a' || $name eq '$b')) || $name eq '%_'
                    || $is_global {

                        my $BLOCK := $*W.cur_lexpad();

                        # Create a container descriptor. Default to rw and set a
                        # type if we have one; a trait may twiddle with that later.
                        my %cont_info  := container_type_info($/, $var<really> || $var<sigil>, $*OFTYPE ?? [$*OFTYPE] !! []);
                        my $descriptor := $*W.create_container_descriptor(%cont_info<value_type>, 1, $name);
                        my $package := $is_global ?? symbol_lookup(['GLOBAL'], $/) !! $*PACKAGE;

                        $*W.install_lexical_container($BLOCK, $name, %cont_info, $descriptor,
                            :scope('our'), :$package);

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

                            nqp::push($BLOCK[0], QAST::Op.new(
                                :op('bind'),
                                $varast,
                                symbol_lookup([$name], $/, :package_only(1), :lvalue(1))
                            ));
                        }
                    }
                    else  {
                        my @suggestions := $*W.suggest_lexicals($name);
                        throw($var, <X Undeclared>, symbol => $varast.name(), suggestions => @suggestions);
                    }
                }
                else {
                    $var.CURSOR.add_mystery($varast.name, $var.to, 'var');
                }
            }
            else {
                my $lex := $*W.cur_lexpad();
                my $sym := $lex.symbol($name);
                if $sym {
                    $sym<used> := 1;
                }
                else {
                    # Add mention-only record (used to poison outer
                    # usages and disambiguate hashes/blocks by use of
                    # $_ when $*IMPLICIT is in force).
                    my Mu $au := $lex.ann('also_uses');
                    $lex.annotate('also_uses', ($au := {})) unless $au;
                    $au{$name} := 1;
                }
            }
        }
        self
    }

    method LANG($lang, $regex, *@args) {
        #~ my $lang_cursor = %*LANG{$lang}.'!cursor_init'(self.orig(), :p(self.pos()), :shared(self.'!shared'()));
        my $lang_cursor = %*LANG{$lang}.'!cursor_init'(self.orig(), :p(self.pos()));
        my $*ACTIONS   := %*LANG{$lang ~ '-actions'};
        $lang_cursor."$regex"(|@args);
    }

    token decint  { [\d+]+ % '_' }
    token decints { [<.ws><decint><.ws>]+ % ',' }

    token hexint  { [<[ 0..9 a..f A..F ]>+]+ % '_' }
    token hexints { [<.ws><hexint><.ws>]+ % ',' }

    token binint  { [<[ 0..1 ]>+]+ % '_' }
    token binints { [<.ws><binint><.ws>]+ % ',' }

    token octints { [<.ws><octint><.ws>] +% ',' }
    token octint  { <[ 0..7 ]>+ [ _ <[ 0..7 ]>+ ]* }
}

grammar Perl5::Grammar does STD5 {
    my $brackets := "<>[]()\{}\x[0028]\x[0029]\x[003C]\x[003E]\x[005B]\x[005D]\x[007B]\x[007D]\x[00AB]\x[00BB]\x[0F3A]\x[0F3B]\x[0F3C]\x[0F3D]\x[169B]\x[169C]\x[2018]\x[2019]\x[201A]\x[2019]\x[201B]\x[2019]\x[201C]\x[201D]\x[201E]\x[201D]\x[201F]\x[201D]\x[2039]\x[203A]\x[2045]\x[2046]\x[207D]\x[207E]\x[208D]\x[208E]\x[2208]\x[220B]\x[2209]\x[220C]\x[220A]\x[220D]\x[2215]\x[29F5]\x[223C]\x[223D]\x[2243]\x[22CD]\x[2252]\x[2253]\x[2254]\x[2255]\x[2264]\x[2265]\x[2266]\x[2267]\x[2268]\x[2269]\x[226A]\x[226B]\x[226E]\x[226F]\x[2270]\x[2271]\x[2272]\x[2273]\x[2274]\x[2275]\x[2276]\x[2277]\x[2278]\x[2279]\x[227A]\x[227B]\x[227C]\x[227D]\x[227E]\x[227F]\x[2280]\x[2281]\x[2282]\x[2283]\x[2284]\x[2285]\x[2286]\x[2287]\x[2288]\x[2289]\x[228A]\x[228B]\x[228F]\x[2290]\x[2291]\x[2292]\x[2298]\x[29B8]\x[22A2]\x[22A3]\x[22A6]\x[2ADE]\x[22A8]\x[2AE4]\x[22A9]\x[2AE3]\x[22AB]\x[2AE5]\x[22B0]\x[22B1]\x[22B2]\x[22B3]\x[22B4]\x[22B5]\x[22B6]\x[22B7]\x[22C9]\x[22CA]\x[22CB]\x[22CC]\x[22D0]\x[22D1]\x[22D6]\x[22D7]\x[22D8]\x[22D9]\x[22DA]\x[22DB]\x[22DC]\x[22DD]\x[22DE]\x[22DF]\x[22E0]\x[22E1]\x[22E2]\x[22E3]\x[22E4]\x[22E5]\x[22E6]\x[22E7]\x[22E8]\x[22E9]\x[22EA]\x[22EB]\x[22EC]\x[22ED]\x[22F0]\x[22F1]\x[22F2]\x[22FA]\x[22F3]\x[22FB]\x[22F4]\x[22FC]\x[22F6]\x[22FD]\x[22F7]\x[22FE]\x[2308]\x[2309]\x[230A]\x[230B]\x[2329]\x[232A]\x[23B4]\x[23B5]\x[2768]\x[2769]\x[276A]\x[276B]\x[276C]\x[276D]\x[276E]\x[276F]\x[2770]\x[2771]\x[2772]\x[2773]\x[2774]\x[2775]\x[27C3]\x[27C4]\x[27C5]\x[27C6]\x[27D5]\x[27D6]\x[27DD]\x[27DE]\x[27E2]\x[27E3]\x[27E4]\x[27E5]\x[27E6]\x[27E7]\x[27E8]\x[27E9]\x[27EA]\x[27EB]\x[2983]\x[2984]\x[2985]\x[2986]\x[2987]\x[2988]\x[2989]\x[298A]\x[298B]\x[298C]\x[298D]\x[298E]\x[298F]\x[2990]\x[2991]\x[2992]\x[2993]\x[2994]\x[2995]\x[2996]\x[2997]\x[2998]\x[29C0]\x[29C1]\x[29C4]\x[29C5]\x[29CF]\x[29D0]\x[29D1]\x[29D2]\x[29D4]\x[29D5]\x[29D8]\x[29D9]\x[29DA]\x[29DB]\x[29F8]\x[29F9]\x[29FC]\x[29FD]\x[2A2B]\x[2A2C]\x[2A2D]\x[2A2E]\x[2A34]\x[2A35]\x[2A3C]\x[2A3D]\x[2A64]\x[2A65]\x[2A79]\x[2A7A]\x[2A7D]\x[2A7E]\x[2A7F]\x[2A80]\x[2A81]\x[2A82]\x[2A83]\x[2A84]\x[2A8B]\x[2A8C]\x[2A91]\x[2A92]\x[2A93]\x[2A94]\x[2A95]\x[2A96]\x[2A97]\x[2A98]\x[2A99]\x[2A9A]\x[2A9B]\x[2A9C]\x[2AA1]\x[2AA2]\x[2AA6]\x[2AA7]\x[2AA8]\x[2AA9]\x[2AAA]\x[2AAB]\x[2AAC]\x[2AAD]\x[2AAF]\x[2AB0]\x[2AB3]\x[2AB4]\x[2ABB]\x[2ABC]\x[2ABD]\x[2ABE]\x[2ABF]\x[2AC0]\x[2AC1]\x[2AC2]\x[2AC3]\x[2AC4]\x[2AC5]\x[2AC6]\x[2ACD]\x[2ACE]\x[2ACF]\x[2AD0]\x[2AD1]\x[2AD2]\x[2AD3]\x[2AD4]\x[2AD5]\x[2AD6]\x[2AEC]\x[2AED]\x[2AF7]\x[2AF8]\x[2AF9]\x[2AFA]\x[2E02]\x[2E03]\x[2E04]\x[2E05]\x[2E09]\x[2E0A]\x[2E0C]\x[2E0D]\x[2E1C]\x[2E1D]\x[2E20]\x[2E21]\x[3008]\x[3009]\x[300A]\x[300B]\x[300C]\x[300D]\x[300E]\x[300F]\x[3010]\x[3011]\x[3014]\x[3015]\x[3016]\x[3017]\x[3018]\x[3019]\x[301A]\x[301B]\x[301D]\x[301E]\x[FD3E]\x[FD3F]\x[FE17]\x[FE18]\x[FE35]\x[FE36]\x[FE37]\x[FE38]\x[FE39]\x[FE3A]\x[FE3B]\x[FE3C]\x[FE3D]\x[FE3E]\x[FE3F]\x[FE40]\x[FE41]\x[FE42]\x[FE43]\x[FE44]\x[FE47]\x[FE48]\x[FE59]\x[FE5A]\x[FE5B]\x[FE5C]\x[FE5D]\x[FE5E]\x[FF08]\x[FF09]\x[FF1C]\x[FF1E]\x[FF3B]\x[FF3D]\x[FF5B]\x[FF5D]\x[FF5F]\x[FF60]\x[FF62]\x[FF63]";
    my $cursor_class := Cursor;

    proto token term { * }
    proto token infix { * }
    proto token prefix { * }
    proto token postfix { * }
    proto token circumfix { * }
    proto token postcircumfix { * }

    token term:sym<circumfix> { <circumfix> }

    token nullterm { <?> }
    token nullterm_alt { <term=.nullterm> }

    # Return <termish> if it matches, <nullterm_alt> otherwise.
    method nulltermish() { self.termish || self.nullterm_alt }

    token quote_delimited {
        <starter> <quote_atom>* <stopper>
    }

    token quote_atom {
        <!stopper>
        [
        | <quote_escape>
        | [ <-quote_escape-stopper-starter> ]+
        | <starter> <quote_atom>* <stopper>
        ]
    }

    proto token quote_escape { * }
    token quote_escape:sym<backslash> { \\ \\ <?quotemod_check('q')> }
    token quote_escape:sym<stopper>   { \\ <?quotemod_check('q')> <stopper> }

    token quote_escape:sym<bs>  { \\ b <?quotemod_check('b')> }
    token quote_escape:sym<nl>  { \\ n <?quotemod_check('b')> }
    token quote_escape:sym<cr>  { \\ r <?quotemod_check('b')> }
    token quote_escape:sym<tab> { \\ t <?quotemod_check('b')> }
    token quote_escape:sym<ff>  { \\ f <?quotemod_check('b')> }
    token quote_escape:sym<esc> { \\ e <?quotemod_check('b')> }
    token quote_escape:sym<hex> {
        \\ x <?quotemod_check('b')>
        [ <hexint> | '[' <hexints> ']' ]
    }
    token quote_escape:sym<oct> {
        \\ o <?quotemod_check('b')>
        [ <octint> | '[' <octints> ']' ]
    }
    token quote_escape:sym<chr> { \\ c <?quotemod_check('b')> <charspec> }
    token quote_escape:sym<0> { \\ <sym> <?quotemod_check('b')> }
    token quote_escape:sym<misc> {
        \\ {}
        [
        || <?quotemod_check('b')>
             [
             | $<textqq>=(\W)
             | (\w) { self.throw_unrecog_backslash_seq: $/[0].Str }
             ]
        || $<textq>=[.]
        ]
    }

    # This lexical holds the hash cache. Right now we have one
    # cache for all grammars; eventually we may need a way to
    # separate them out by cursor type.
    my %ohash;

    method O(str $spec, $save?) {
        # See if we've already created a Hash for the current
        # specification string -- if so, use that.
        my $hash = %ohash{$spec} || {};
        unless $hash {
            # Otherwise, we need to build a new one.
            $hash       = {};
            my int $eos = nqp::chars($spec);
            my int $pos = 0;
            while ($pos = nqp::findnotcclass(nqp::const::CCLASS_WHITESPACE,
                                              $spec, $pos, $eos)) < $eos
            {
                my int $lpos;
                my str $s = nqp::substr($spec, $pos, 1);
                if $s eq ',' { # Ignore commas between elements for now.
                    $pos = $pos + 1;
                }
                elsif $s eq ':' { # Parse whatever comes next like a pair.
                    $pos = $pos + 1;

                    # If the pair is of the form :!name, then reverse the value
                    # and skip the exclamation mark.
                    my $value = 1;
                    if nqp::substr($spec, $pos, 1) eq '!' {
                        $pos = $pos + 1;
                        $value = 0;
                    }

                    # Get the name of the pair.
                    $lpos    = nqp::findnotcclass(nqp::const::CCLASS_WORD,
                                                   $spec, $pos, $eos);
                    my $name = nqp::substr($spec, $pos, $lpos - $pos);
                    $pos     = $lpos;

                    # Look for a <...> that follows.
                    if nqp::substr($spec, $pos, 1) eq '<' {
                        $pos   = $pos + 1;
                        $lpos  = nqp::index($spec, '>', $pos);
                        $value = nqp::substr($spec, $pos, $lpos - $pos);
                        $pos   = $lpos + 1;
                    }
                    # Done processing the pair, store it in the hash.
                    $hash{$name} = $value;
                }
                else {
                    # If whatever we found doesn't start with a colon, treat it
                    # as a lookup of a previously saved hash to be merged in.
                    # Find the first whitespace or comma
                    $lpos      = nqp::findcclass(nqp::const::CCLASS_WHITESPACE,
                                                  $spec, $pos, $eos);
                    my $index  = nqp::index($spec, ',', $pos);
                    $lpos      = $index unless $index < 0 || $index >= $lpos;
                    my $lookup = nqp::substr($spec, $pos, $lpos - $pos);
                    my %lhash  = %ohash{$lookup}.hash;
                    self.'panic'('Unknown operator precedence specification "',
                                 $lookup, '"') unless %lhash;
                    for %lhash {
                        $hash{$_.key} = $_.value;
                    }
                    $pos = $lpos;
                }
            }
            # Done processing the spec string, cache the hash for later.
            %ohash{$spec} = $hash.hash;
        }

        if $save {
            %ohash{$save} = $hash.hash;
            self;
        }
        else {
            # If we've been called as a subrule, then build a pass-cursor
            # to indicate success and set the hash as the subrule's match object.
            my $cur := self.'!cursor_start_cur'();
            $cur.'!cursor_pass'(nqp::getattr_i($cur, $cursor_class, '$!from'));
            nqp::bindattr($cur, $cursor_class, '$!match', $hash);
            $cur;
        }
    }

    method MATCH() {
        my $match := nqp::getattr(self, Cursor, '$!match');
        return $match if $match ~~ Associative;
        return $match if nqp::istype($match, Match) && nqp::isconcrete($match);
        $match := nqp::create(Match);
        nqp::bindattr($match, Match, '$!orig', nqp::findmethod(self, 'orig')(self));
        nqp::bindattr_i($match, Match, '$!from', nqp::getattr_i(self, Cursor, '$!from'));
        nqp::bindattr_i($match, Match, '$!to', nqp::getattr_i(self, Cursor, '$!pos'));
        nqp::bindattr($match, Match, '$!made', nqp::getattr(self, Cursor, '$!made'));
        nqp::bindattr($match, Match, '$!CURSOR', self);
        my Mu $list := nqp::list();
        my Mu $hash := nqp::hash();
        if $match.Bool {
            my Mu $caphash := nqp::findmethod(Cursor, 'CAPHASH')(self);
            my Mu $capiter := nqp::iterator($caphash);
            while $capiter {
                my Mu $kv := nqp::shift($capiter);
                my str $key = nqp::iterkey_s($kv);
                my Mu $value := nqp::hllize(nqp::atkey($caphash, $key));
                if $key eq '$!from' || $key eq '$!to' {
                    nqp::bindattr_i($match, Match, $key, $value.from);
                }
                else {
                    $value := nqp::islist($value)
                        ?? nqp::p6list($value, Array, Mu)
                        !! nqp::istype($value, Match) || nqp::istype($value, Hash)
                            ?? $value
                            !! [$value];
                    nqp::iscclass(nqp::const::CCLASS_NUMERIC, $key, 0)
                      ?? nqp::bindpos($list, $key, $value)
                      !! nqp::bindkey($hash, $key, $value);
                }
            }
        }
        nqp::bindattr($match, Capture, '$!list', $list);
        nqp::bindattr($match, Capture, '$!hash', $hash);
        nqp::bindattr(self, Cursor, '$!match', $match);
        $match;
    }

    method panic(*@args) {
        my $pos := self.pos();
        my $target := self.target();
        @args.push(' at line ');
        @args.push(HLL::Compiler.lineof($target, $pos) + 1);
        @args.push(', near "');
        @args.push(nqp::escape(nqp::substr($target, $pos, 10)));
        @args.push('"');
        nqp::die(join('', @args))
    }

    method FAILGOAL($goal, $dba? is copy) {
        unless $dba {
            $dba = nqp::getcodename(nqp::callercode());
        }
        self.panic("Unable to parse expression in $dba; couldn't find final $goal");
    }

    method peek_delimiters(str $target, $pos is copy) {
        # peek at the next character
        my str $start = nqp::substr($target, $pos, 1);

        # colon, word and whitespace characters aren't valid delimiters
        if $start eq ':' {
            self.panic('Colons may not be used to delimit quoting constructs');
        }
        if nqp::iscclass(nqp::const::CCLASS_WORD, $start, 0) {
            self.panic('Alphanumeric character is not allowed as a delimiter');
        }
        if nqp::iscclass(nqp::const::CCLASS_WHITESPACE, $start, 0) {
            my $code := nqp::sprintf('%X', [nqp::ord($start)]);
            self.panic('Whitespace character (0x' ~ $code ~ ') is not allowed as a delimiter');
        }

        # assume stop delim is same as start, for the moment
        my str $stop = $start;
        my int $brac = nqp::index($brackets, $start);
        if $brac >= 0 {
            # if it's a closing bracket, that's an error also
            if $brac % 2 {
                self.panic('Use of a closing delimiter for an opener is reserved');
            }

            # it's an opener, so get the closing bracket
            $stop = nqp::substr($brackets, $brac + 1, 1);

            # see if the opening bracket is repeated
            my int $len = 1;
            while nqp::substr($target, ++$pos, 1) eq $start {
                $len = $len + 1;
            }
            if $len > 1 {
                $start = nqp::x($start, $len);
                $stop  = nqp::x($stop, $len);
            }
          }
          [$start, $stop]
    }

    my $TRUE = 1;
    token quote_EXPR(*@args) {
        :my %*QUOTEMOD;
        :my $*QUOTE_START;
        :my $*QUOTE_STOP;
        {
            for @args -> $mod is copy {
                $mod = nqp::substr($mod, 1);
                %*QUOTEMOD{$mod} = $TRUE;
                if $mod eq 'qq' {
                    %*QUOTEMOD{'s'} = $TRUE;
                    %*QUOTEMOD{'a'} = $TRUE;
                    %*QUOTEMOD{'h'} = $TRUE;
                    %*QUOTEMOD{'f'} = $TRUE;
                    %*QUOTEMOD{'c'} = $TRUE;
                    %*QUOTEMOD{'b'} = $TRUE;
                }
                elsif $mod eq 'b' {
                    %*QUOTEMOD{'q'} = $TRUE;
                }
            }

            my @delims    = self.peek_delimiters(self.target, self.pos);
            $*QUOTE_START = @delims[0];
            $*QUOTE_STOP  = @delims[1];
        }
        <quote_delimited>
    }

    token quotemod_check(str $mod) {
        <?{ %*QUOTEMOD{$mod} }>
    }

    method starter() {
        my $start := $*QUOTE_START;
        $start
            ?? self.'!LITERAL'($start)
            !! self.'!cursor_start_fail'()
    }

    method stopper() {
        my $stop := $*QUOTE_STOP;
        $stop
            ?? self.'!LITERAL'($stop)
            !! self.'!cursor_start_fail'()
    }

    our method split_words(str $words) {
        my @result;
        my int $pos = 0;
        my int $eos = nqp::chars($words);
        my int $ws;
        while ($pos = nqp::findnotcclass(nqp::const::CCLASS_WHITESPACE, $words, $pos, $eos)) < $eos {
            $ws = nqp::findcclass(nqp::const::CCLASS_WHITESPACE, $words, $pos, $eos);
            nqp::push(@result, nqp::substr($words, $pos, $ws - $pos));
            $pos = $ws;
        }
        @result
    }

    method EXPR2($preclim = '', int :$noinfix = 0) {
        my $here         := self.'!cursor_start_cur'();
        my $pos           = nqp::getattr_i($here, $cursor_class, '$!from');
        my str $termishrx = 'termish';
        my @opstack;
        my @termstack;
        my @prefixish;
        my @postfixish;
        my $infixcur;
        my $infix;
        my $inO;
        my str $inprec;
        my str $opprec;
        my str $inassoc;
        my int $more_infix;
        my int $term_done;

        while 1 {
            nqp::bindattr_i($here, $cursor_class, '$!pos', $pos);
            my $termcur := $here."$termishrx"();
            $pos         = nqp::getattr_i($termcur, $cursor_class, '$!pos');
            nqp::bindattr_i($here, $cursor_class, '$!pos', $pos);
            return $here if $pos < 0;

            my $match    = nqp::getattr($termcur, $cursor_class, '$!match');
            my %termish  = $match ~~ Associative ?? $match.hash !! $termcur.MATCH().hash;

            # Interleave any prefix/postfix we might have found.
            my $termOPER = %termish;
            $termOPER    = $termOPER<OPER> while $termOPER<OPER>:exists;
            @prefixish   = $termOPER<prefixish>.list;
            @postfixish  = $termOPER<postfixish>.list;

            while @prefixish && @postfixish {
                my $preO     = @prefixish[0]<OPER><O>;
                my $postO    = @postfixish[*-1]<OPER><O>;
                my $preprec  = $preO<prec>  // '';
                my $postprec = $postO<prec> // '';

                if $postprec gt $preprec
                || $postprec eq $preprec && $postO<uassoc> eq 'right' {
                    @opstack[+@opstack] := @prefixish.shift;
                }
                else {
                    @opstack[+@opstack] := @postfixish.pop;
                }
            }
            @opstack[+@opstack] := @prefixish.shift while @prefixish;
            @opstack[+@opstack] := @postfixish.pop  while @postfixish;
            %termish<prefixish>:delete;
            %termish<postfixish>:delete;
            @termstack.push: %termish<term>;

            last if $noinfix;

            $more_infix = 1;
            $term_done  = 0;
            while $more_infix {
                # Now see if we can fetch an infix operator
                # First, we need ws to match.
                nqp::bindattr_i($here, $cursor_class, '$!pos', $pos);
                my $wscur := $here.ws();
                $pos       = nqp::getattr_i($wscur, $cursor_class, '$!pos');
                if $pos < 0 {
                    $term_done = 1;
                    last;
                }

                # Next, try the infix itself.
                nqp::bindattr_i($here, $cursor_class, '$!pos', $pos);
                $infixcur := $here.infixish();
                $pos       = nqp::getattr_i($infixcur, $cursor_class, '$!pos');
                if $pos < 0 {
                    $term_done = 1;
                    last;
                }
                $infix := $infixcur.MATCH();

                # We got an infix.
                $inO       = $infix<OPER><O>;
                $termishrx = $inO<nextterm> // 'termish';
                $inprec    = ~$inO<prec>;
                $infixcur.panic('Missing infixish operator precedence')
                    unless $inprec;
                if $inprec lt $preclim {
                    $term_done = 1;
                    last;
                }
                $inO<prec> = $inO<sub> // $inO<prec>;

                while @opstack {
                    $opprec = ~@opstack[*-1]<OPER><O><prec>;
                    last unless $opprec gt $inprec;
                    self.EXPR_reduce(@termstack, @opstack);
                }

                if !$inO<fake> {
                    $more_infix = 0;
                }
                else {
                    @opstack[+@opstack] := $infix;
                    self.EXPR_reduce(@termstack, @opstack);
                }
            }
            last if $term_done;

            # if equal precedence, use associativity to decide
            if $opprec eq $inprec {
                $inassoc = $inO<assoc>;
                if $inassoc eq 'non' {
                    self.EXPR_nonassoc($infixcur,
                        @opstack[*-1]<OPER><sym>,
                        $infix.Str());
                }
                if $inassoc eq 'left' {
                    # left associative, reduce immediately
                    self.EXPR_reduce(@termstack, @opstack);
                }
            }

            @opstack[+@opstack] := $infix; # The Shift
            nqp::bindattr_i($here, $cursor_class, '$!pos', $pos);
            my $wscur := $here.ws();
            $pos       = nqp::getattr_i($wscur, $cursor_class, '$!pos');
            nqp::bindattr_i($here, $cursor_class, '$!pos', $pos);
            return $here if $pos < 0;
        }

        self.EXPR_reduce(@termstack, @opstack) while @opstack;
        $pos       = nqp::getattr_i($here, $cursor_class, '$!pos');
        my $here2 := self.'!cursor_start_cur'();
        $here2.'!cursor_pass'($pos);
        nqp::bindattr_i($here2, $cursor_class, '$!pos', $pos);
        nqp::bindattr($here2, $cursor_class, '$!match', @termstack.pop);
        $here2.'!reduce'('EXPR');
        $here2
    }

    method EXPR_reduce(@termstack, @opstack) {
        my $op := nqp::decont(@opstack.pop);

        my %opOPER      = $op<OPER>.hash  if $op<OPER>.defined;
        my %opO         = %opOPER<O>.hash if %opOPER<O>.defined;
        my str $opassoc = ~%opO<assoc>;
        my str $key;
        my $sym;
        my $reducecheck;

        if $opassoc eq 'unary' {
            my $arg = @termstack.pop;
            $key    = $arg.from() < $op.from() ?? 'POSTFIX' !! 'PREFIX';
            nqp::bindattr($op, Capture, '$!list',
                nqp::getattr(nqp::decont([$arg].Parcel), Parcel, '$!storage'));
        }
        elsif $opassoc eq 'list' {
            $sym = %opOPER<sym> // '';
            my @list;
            @list.unshift: @termstack.pop;
            while @opstack {
                last if $sym ne (@opstack[*-1]<OPER><sym> // '');
                @list.unshift: @termstack.pop;
                @opstack.pop;
            }
            @list.unshift: @termstack.pop;
            nqp::bindattr($op, Capture, '$!list',
                nqp::getattr(nqp::decont(@list.Parcel), Parcel, '$!storage'));
            $key = 'LIST';
        }
        else { # infix op assoc: left|right|ternary|...
            my @list;
            @list.unshift: @termstack.pop; # right
            @list.unshift: @termstack.pop; # left
            $reducecheck = %opO<reducecheck>;
            nqp::bindattr($op, Capture, '$!list',
                nqp::getattr(nqp::decont(@list.Parcel), Parcel, '$!storage'));
            self."$reducecheck"($op) if $reducecheck;
            $key = 'INFIX';
        }
        self.reduce_with_match('EXPR', $key, $op);
        @termstack.push: $op;
    }

    method reduce_with_match(str $name, str $key, $match) {
        my $actions := $*ACTIONS;
        nqp::findmethod($actions, $name)($actions, $match, $key)
            if !nqp::isnull($actions) && nqp::can($actions, $name);
    }

    method EXPR_nonassoc($cur, $op1, $op2) {
        $cur.panic('"' ~ $op1 ~ '" and "' ~ $op2 ~ '" are non-associative and require parens');
    }

    method ternary($match is rw) {
        my $decont  := nqp::decont($match);
        my Mu $list := nqp::getattr($decont, Capture, '$!list');
        nqp::bindpos($list, 2, $list[1]);
        nqp::bindpos($list, 1, $decont<infix><EXPR>);
        nqp::bindattr($decont, Capture, '$!list', $list);
    }

    method MARKER(str $markname) {
        my Mu $markhash := nqp::getattr(
            nqp::getattr(self, $cursor_class, '$!shared'), ParseShared, '%!marks');
        my Mu $cur := nqp::atkey($markhash, $markname);
        if nqp::isnull($cur) {
            $cur := self."!cursor_start_cur"();
            $cur."!cursor_pass"(self.pos());
            nqp::bindkey($markhash, $markname, $cur);
        }
        else {
            $cur."!cursor_pos"(self.pos());
            $cur
        }
    }

    method MARKED(str $markname) {
        my Mu $markhash := nqp::getattr(
            nqp::getattr(self, $cursor_class, '$!shared'), ParseShared, '%!marks');
        my Mu $cur := nqp::atkey($markhash, $markname);
        unless nqp::istype($cur, Cursor) && $cur.pos() == self.pos() {
            $cur := self.'!cursor_start_fail'();
        }
        $cur
    }

    ##############
    # Precedence #
    ##############

    # The internal precedence levels are *not* part of the public interface.
    # The current values are mere implementation; they may change at any time.
    # Users should specify precedence only in relation to existing levels.

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

    proto token sigil { * }
    proto token special_variable { * }
    proto token comment { * }
    proto token module_name { * }
    proto token value { * }
    proto token number { * }
    proto token quote { * }
    proto token dotty { * }
    proto token type_declarator { * }
    proto token scope_declarator { * }
    proto token package_declarator { * }
    proto token regex_declarator { * }
    proto rule statement_prefix { * }
    proto rule statement_control { * }
    proto rule statement_mod_cond { * }
    proto rule statement_mod_loop { * }
    proto token terminator { * }

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

    token ws {
        #~ :my $old_highexpect := self.'!fresh_highexpect'();
        #~ :dba('whitespace')
        [
        ||  <?MARKED('ws')> <?>
        ||  <!ww>
            [
            | <.vws> <.heredoc>
            | <.unv>
            ]*
            <?MARKER('ws')>
        ]
        #~ :my $stub := self.'!set_highexpect'($old_highexpect);
    }

    token unsp {
        #~ <!>
        \\ <?before \s | '#'>
        #~ :dba('unspace')
        [
        | <.vws>
        | <.unv>
        ]*
    }

    token vws {
        #~ :dba('vertical whitespace')
        <[\v]-[\x85]>
    }

    # We provide two mechanisms here:
    # 1) define $*moreinput, or
    # 2) override moreinput method
    method moreinput () {
        $*moreinput() if $*moreinput;
    }

    token unv {
       #~ :dba('horizontal whitespace')
       [
       | \h+
       | <?before \h* '=' [ \w | '\\'] > ^^ <.pod_comment>
       | \h* <comment>
       ]
    }

    token comment:sym<#> {
       '#' {} <[\N\x85]>*
    }

    token ident {
        <.alpha> \w*
    }

    token identifier {
        '::'? <.alpha> \w*
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

    method import_EXPORTHOW(Mu \UNIT) {
        my $UNIT := UNIT;
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

    # Called when we add a new choice to an existing syntactic category, for
    # example new infix operators add to the infix category. Augments the
    # grammar as needed.
    method add_categorical($category, $opname, $canname, $subname, $declarand?) {
        return;
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
        #~ :dba('block expression')
        '(' ~ ')' <EXPR>
        <.ws> <sblock($*IMPLICIT)>
    }

    token sblock($*IMPLICIT = 0, $*FOR_VARIABLE = '') {
        :my $*DECLARAND := $*W.stub_code_object('Block');
#        :my $*CURLEX;
        #~ :dba('statement block')
        [ <?before '{' > || <.panic: "Missing block"> ]
        <.newlex>
        <blockoid>
        #{ @*MEMOS[self.pos]<endstmt> := 2; }
        <.ws>
    }

    token block {
        :my $*CURPAD;
        :my $*DECLARAND := $*W.stub_code_object('Block');
        #~ :dba('scoped block')
        [ <?before '{' > || <.panic: "Missing block"> ]
        <.newlex>
        <blockoid>
        <.ws>
    }

    token newlex { <?> <?{ $*W.push_lexpad($/) }> }
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
            $BLOCK[0].push(QAST::Var.new( :name($*FOR_VARIABLE), :scope('lexical'), :decl('var') ))
        } ]?
        [
        #~ | :dba('block') '{' ~ '}' <statementlist(1)> <?ENDSTMT>
        | '{' ~ '}' <statementlist(1)> <?ENDSTMT>
        | <?terminator> { throw($/, <X Syntax Missing>, what =>'block') }
        | <?> { throw($/, <X Syntax Missing>, what => 'block') }
        ]
        { $*CURPAD := $*W.pop_lexpad() }
    }

    # statement semantics
    rule statementlist($*statement_level = 0) {
        :my %*LANG        := self.shallow_copy(nqp::getlexdyn('%*LANG'));
        :my %*HOW         := self.shallow_copy(nqp::getlexdyn('%*HOW'));
        :my $*IN_DECL      = '';
        :my $*SCOPE        = '';
        :my $*INVOCANT_OK  = 0;
        :my $*FOR_VARIABLE = '';
        #~ :dba('statement list')
        {
            # Not very nice, but it works for the cases, that:
            # 1) This is the mainline, Perl5::Terms needs to be loaded.
            # 2) We are in an eval, Perl5::Terms should already be there.
            # 3) We are in a use'd Perl5 module, load Perl5::Terms.
            unless $*W.is_lexical('&P5Str') {
                my $terms := $*W.load_module($/, 'Perl5::Terms', nqp::hash(), $*GLOBALish);
                do_import($/, $terms, 'Perl5::Terms');
                #~ $/.CURSOR.import_EXPORTHOW($terms);
            }
        }
        ''
        [
        | $
        | <?before <[\)\]\}]>>
        | [ <statement> <.eat_terminator> ]*
        ]
    }

    method shallow_copy(Mu $hash) {
        my %result;
        return %result unless nqp::p6bool($hash);
        if nqp::istype($hash, Hash) {
            for $hash.keys {
                %result{$_} := $hash{$_};
            }
        }
        else {
            my Mu $iter := nqp::iterator($hash);
            while $iter {
                my $elem      := nqp::shift($iter);
                my $key        = nqp::p6box_s(nqp::iterkey_s($elem));
                %result{$key} := nqp::p6box_s(nqp::iterval($elem));
            }
        }
        %result
    }

    method lower_hash(Mu $hash) {
        my Mu $result := nqp::hash();
        if nqp::istype($hash, Hash) {
            for $hash.keys {
                nqp::bindkey($result, nqp::unbox_s($_), nqp::decont($hash{$_}));
            }
        }
        else {
            #~ my Mu $iter := nqp::iterator($hash);
            #~ while $iter {
                #~ my $elem      := nqp::shift($iter);
                #~ my $key        = nqp::p6box_s(nqp::iterkey_s($elem));
                #~ %result{$key} := nqp::p6box_s(nqp::iterval($elem));
            #~ }
        }
        $result
    }

    # embedded semis, context-dependent semantics
    rule semilist {
        :my $*INVOCANT_OK := 0;
        #~ :dba('semicolon list')
        ''
        [
        | <?before <[\)\]\}]> >
        | [<statement><eat_terminator> ]*
        ]
    }


    token label {
        :my $label;
        <identifier> ':' <?before \s> <.ws>

        [ <?{ $label := $<identifier>.Str; is_name([$label]) }>
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
        :my $*QSIGIL        = '';
        :my $*SCOPE         = '';
        :my $*ACTIONS      := %*LANG<Perl5-actions>;
        :my $*ARGUMENT_WANT = 0;
        :my $*ARGUMENT_HAVE = 0;
        <!before <[\])}]> | $ >
        <!stopper>
        <!!{ nqp::rebless($/.CURSOR, %*LANG<Perl5>) }>
        [
        | <label> <statement>
        | <statement_control>
        | <EXPR> #:dba('statement end')
            #~ <.ws>
            [
            || <?MARKED('endstmt')>
            #~ || :dba('statement modifier') <.ws> <statement_mod_cond> <statement_mod_loop>?
            #~ || :dba('statement modifier loop') <.ws> <statement_mod_loop>
            || <.ws> <statement_mod_cond> <statement_mod_loop>?
            || <.ws> <statement_mod_loop>
            ]?
        | <?[;]>
        | <?stopper>
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
            #~ my $longname := dissect_longname($<module_name><longname>);
            #~ nqp::say(">>" ~ $<module_name><longname>);
            #~ my $module;
            #~ my $found := 0;
            #~ try { $module := $*W.find_symbol($longname.components().list); $found := 1; }
            #~ if $found {
                #~ # todo: fix arglist
                #~ my $arglist;
                #~ if $<arglist> {
                    #~ $arglist := $*W.compile_time_evaluate($/, $<arglist><EXPR>.ast);
                    #~ $arglist := nqp::getattr($arglist.list.eager,
                            #~ find_symbol(['List']), '$!items');
                #~ }
                #~ do_import($/, $module.WHO, ~$<module_name><longname>, $arglist);
            #~ }
            #~ else {
                #~ $/.CURSOR.panic("Could not find module " ~ ~$<module_name> ~
                    #~ " to import symbols from");
            #~ }
        #~ }
    }

    my %pragma_defaults = nqp::hash(
        'base',      [],                       # http://perldoc.perl.org/base.html
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
                        find_symbol(['List']), '$!items');
                my $*IN_DECL := 'variable';
                my $*SCOPE := 'our';
                for $vars {
                    my $name := $_;
                    my $sigil := nqp::substr($name, 0, 1);
                    my $varast := QAST::Var.new( :name($name), :node($/), :scope<lexical> );
                    my $BLOCK := $*W.cur_lexpad();

                    # Create a container descriptor. Default to rw and set a
                    # type if we have one; a trait may twiddle with that later.
                    my %cont_info  := container_type_info($/, $sigil, []);
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
                        symbol_lookup([$name], $/, :package_only(1), :lvalue(1))
                    ));
                }
            }
        || <module_name> <version=versionish>?
            [ <.spacey> <arglist> <?{ $<arglist><arg>[0]<EXPR> }> ]?
            {
                my $longname := $<module_name><longname>;
                my $lnd      := dissect_longname($longname);
                my $name     := $lnd.name;
                my $arglist;

                if $<arglist><arg>[0]<EXPR> {
                    $arglist := $*W.compile_time_evaluate($/,
                            $<arglist><arg>[0]<EXPR>.ast);
                    $arglist := nqp::getattr($arglist.list.eager,
                            find_symbol(['List']), '$!items');
                }

                if nqp::existskey(%pragma_defaults, $name) {
                    $arglist := %pragma_defaults{$name} unless $<arglist><arg>[0]<EXPR>;
                    self.pragma($name, $arglist, 1);
                    $name := '' unless $name eq 'warnings';
                }

                if $name {
                    my $module := $*W.load_module($/, $name, nqp::hash( 'from', 'Perl5' ), $*GLOBALish);
                    do_import($/, $module, $name, $arglist);
                    #~ $/.CURSOR.import_EXPORTHOW($module);
                }
            }
        ]
        [ <?{ $*MAIN ne $OLD_MAIN }> {
            $*IN_DECL := '';
            $*SCOPE := '';
        } <statementlist=.FOREIGN_LANG($*MAIN, 'statementlist', 734)> || <?> ]
        <.ws>
    }

    # This is like HLL::Grammar.LANG but it allows to call a token of a Perl 6 level grammar.
    method FOREIGN_LANG($lang, $regex, *@args) {
        if !nqp::istype(%*LANG{$lang}, NQPCursor) {
            return self.LANG($lang, $regex, @args)
        }
        else {
            nqp::bindlexdyn('%*LANG', nqp::findmethod(self, 'lower_hash')(self, nqp::getlexdyn('%*LANG')));
            nqp::bindlexdyn('%*HOW',  nqp::findmethod(self, 'lower_hash')(self, nqp::getlexdyn('%*HOW')));
            my $lang_cursor := %*LANG{$lang}.'!cursor_init'(nqp::unbox_s(self.orig()), :p(self.pos()));
            my $*ACTIONS    := %*LANG{$lang ~ '-actions'};
            my $ret         := $lang_cursor."$regex"(nqp::gethllsym("nqp", "nqplist")(|@args));

            # Build up something Perl6-levelish we can return.
            my $new := Cursor.'!cursor_init'(self.orig(), :p(self.pos()));
            nqp::bindattr_i($new, Cursor, '$!from',  nqp::getattr_i($ret, NQPCursor, '$!from'));
            nqp::bindattr_i($new, Cursor, '$!pos',   nqp::getattr_i($ret, NQPCursor, '$!pos'));
            nqp::bindattr($new,   Cursor, '$!name',  nqp::getattr($ret,   NQPCursor, '$!name'));

            my $match    := nqp::create(Match);
            my $nqpmatch := nqp::getattr($ret, NQPCursor, '$!match');
            nqp::bindattr($match, Match, '$!made', nqp::getattr($nqpmatch, NQPMatch, '$!made'));
            nqp::bindattr($new, Cursor, '$!match', $match);
            $new;
        }
    }

    sub do_import($/, Mu \module_context, $package_source_name, $arglist?) {
        if nqp::existskey(module_context, 'EXPORT') {
            my $EXPORT := $*W.stash_hash(nqp::atkey(module_context, 'EXPORT'));
            my @to_import = 'MANDATORY';
            my @positional_imports;
            if nqp::defined($arglist) {
                my $Pair := find_symbol(['Pair']);
                for $arglist.list -> $tag {
                    if nqp::istype($tag, $Pair) {
                        $tag = nqp::unbox_s($tag.key);
                        if nqp::existskey($EXPORT, $tag) {
                            $*W.import($/, $*W.stash_hash($EXPORT{$tag}), $package_source_name);
                        }
                        else {
                            nqp::die("Error while importing from '$package_source_name': no such tag '$tag'");
                        }
                    }
                    else {
                        @positional_imports.push: $tag;
                    }
                }
            }
            else {
                @to_import.push: 'DEFAULT';
            }
            for @to_import -> $tag {
                if nqp::existskey($EXPORT, $tag) {
                    my Mu $hash := nqp::findmethod($*W, 'stash_hash')($*W, $EXPORT{$tag});
                    $*W.import($/, $hash, $package_source_name);
                }
            }
            if nqp::existskey(module_context, '&EXPORT') {
                my $result;
                if $arglist {
                    $result := nqp::atkey(module_context, '&EXPORT')(@positional_imports);
                }
                else {
                    $result := nqp::atkey(module_context, '&EXPORT')();
                }
                if nqp::istype($result, EnumMap) {
                    my $storage := $result.hash.FLATTENABLE_HASH();
                    import_symbols($/, $storage, $package_source_name);
                }
                else {
                    nqp::die("&EXPORT sub did not return an EnumMap");
                }
            }
            elsif nqp::existskey(module_context, $package_source_name) # sub import in package
               && nqp::existskey($*W.stash_hash(nqp::atkey(module_context, $package_source_name)), '&import') {
                @positional_imports.unshift: $package_source_name;
                my $result := $*W.stash_hash(nqp::atkey(module_context, $package_source_name))<&import>(
                    @positional_imports );
                if nqp::istype($result, EnumMap) {
                    my $storage := $result.hash.FLATTENABLE_HASH();
                    import_symbols($/, $storage, $package_source_name);
                }
            }
            else {
                if +@positional_imports {
                    nqp::die("Error while importing from '$package_source_name': no EXPORT or import sub, but you provided positional argument in the 'use' statement");
                }
            }
        }
    }

    # Imports symbols from the specified stash into the current package.
    sub import_symbols($/, %stash, $source_package_name) is export {
        # What follows is a two-pass thing for historical reasons.
        my $target := $*W.cur_lexpad();

        # First pass: QAST::Block symbol table installation. Also detect any
        # outright conflicts, and handle any situations where we need to merge.
        my $to_install := nqp::hash;
        my @clash;
        my @clash_onlystar;
        for %stash {
            if $target.symbol($_.key) -> %sym {
                # There's already a symbol. However, we may be able to merge
                # if both are multis and have onlystar dispatchers.
                my $installed := %sym<value>;
                my $foreign := $_.value;
                if $installed =:= $foreign {
                    next;
                }
                if nqp::can($installed, 'is_dispatcher') && $installed.is_dispatcher
                && nqp::can($foreign, 'is_dispatcher') && $foreign.is_dispatcher {
                    # Both dispatchers, but are they onlystar? If so, we can
                    # go ahead and merge them.
                    if $installed.onlystar && $foreign.onlystar {
                        # Replace installed one with a derived one, to avoid any
                        # weird action at a distance.
                        $installed := $*W.derive_dispatcher($installed);
                        $*W.install_lexical_symbol($target, $_.key, $installed, :clone(1));

                        # Incorporate dispatchees of foreign proto, avoiding
                        # duplicates.
                        my %seen;
                        for $installed.dispatchees {
                            %seen{$_.static_id} := $_;
                        }
                        for $foreign.dispatchees {
                            unless nqp::existskey(%seen, $_.static_id) {
                                $*W.add_dispatchee_to_proto($installed, $_);
                            }
                        }
                    }
                    else {
                        nqp::push(@clash_onlystar, $_.key);
                    }
                }
                else {
                    nqp::push(@clash, $_.key);
                }
            }
            else {
                $target.symbol($_.key, :scope('lexical'), :value($_.value));
                $target.list[0].push(QAST::Var.new(
                    :scope('lexical'), :name($_.key), :decl('static'), :value($_.value)
                ));
                # Otherwise @INC from Perl5::Terms will clobber @*INC for some reason...
                $*W.install_package_symbol($*PACKAGE, $_.key, $_.value);
                $target.list[0].push(QAST::Op.new(
                    :op('bindkey'),
                    QAST::Op.new( :op('who'), QAST::WVal.new( :value($*PACKAGE) ) ),
                    QAST::SVal.new( :value($_.key) ),
                    QAST::Var.new( :name($_.key), :scope('lexical') )
                ));
                $to_install{$_.key} := $_.value;

            }
        }

        if +@clash_onlystar {
            throw($/, <X Import OnlystarProto>,
                symbols             => @clash_onlystar,
                source-package-name => $source_package_name,
            );
        }

        if +@clash {
            throw($/, <X Import Redeclaration>,
                symbols             => @clash,
                source-package-name => $source_package_name,
            );
        }

        # Second pass: make sure installed things are in an SC and handle
        # categoricals.
        my Mu $iter := nqp::iterator($to_install);
        my $elem;
        my $key;
        my $val;
        while $iter {
            $elem := nqp::shift($iter);
            $key  := nqp::p6box_s(nqp::iterkey_s($elem));
            $val  := nqp::iterval($elem);
            my $/;

            if nqp::isnull(nqp::getobjsc($val)) {
                $*W.add_object($val);
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
                        find_symbol(['List']), '$!items');
            }

            if nqp::existskey(%pragma_defaults, $longname) {
                self.pragma($longname, $<arglist><arg>[0]<EXPR>
                    ?? $arglist
                    !! %pragma_defaults{$longname}, 0);
            }
        }
    }

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
        :my $*SCOPE;
        ['for'|'foreach']
        [
        ||  '('
                <e1=.EXPR>? ';'
                <e2=.EXPR>? ';'
                <e3=.EXPR>?
            ')'
            <sblock>
        ||  :my $var := '$_';
            [
                [ 'my' { $*SCOPE := 'my' } || 'our' { $*SCOPE := 'our' } ]?
                <variable> { $var := $<variable>.ast.name }
            ]?
            '(' ~ ')' <EXPR>
            <sblock(1, $var)>
        ]
        [ 'continue' <continue=.sblock> ]?
    }

    rule statement_control:sym<given> {
        <sym> <xblock>
    }
    rule statement_control:sym<when> {
        <sym> <xblock>
    }
    rule statement_control:sym<default> { <sym> <sblock> }

    rule statement_prefix:sym<BEGIN>     { :my $*SHIFT_FROM := '@ARGV'; <sym> <sblock> }
    rule statement_prefix:sym<CHECK>     { :my $*SHIFT_FROM := '@ARGV'; <sym> <sblock> }
    rule statement_prefix:sym<INIT>      { :my $*SHIFT_FROM := '@ARGV'; <sym> <sblock> }
    rule statement_prefix:sym<UNITCHECK> { :my $*SHIFT_FROM := '@ARGV'; <sym> <sblock> }
    rule statement_control:sym<END>      { :my $*SHIFT_FROM := '@ARGV'; <sym> <sblock> }

    #######################
    # statement modifiers #
    #######################

    rule modifier_expr { <EXPR> }

    rule statement_mod_cond:sym<if>     { <sym> <modifier_expr> }
    rule statement_mod_cond:sym<unless> { <sym> <modifier_expr> }
    rule statement_mod_cond:sym<when>   { <sym> <modifier_expr> }

    token statement_mod_loop:sym<while> { <sym>         <.ws> <smexpr=.EXPR> }
    token statement_mod_loop:sym<until> { <sym>         <.ws> <smexpr=.EXPR> }
    token statement_mod_loop:sym<for>   { <sym> 'each'? <.ws> <smexpr=.EXPR> }
    token statement_mod_loop:sym<given> { <sym>         <.ws> <smexpr=.EXPR> }

    ################
    # module names #
    ################

    token def_module_name {
        <longname>
    }

    token module_name:sym<normal> {
        <longname>
        #~ [ <?before '['> :dba('generic role') '[' ~ ']' <arglist> ]?
        [ <?before '['> '[' ~ ']' <arglist> ]?
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

    token variable_declarator {
        :my $*IN_DECL := 'variable';
        :my $var;
        <variable>
        {
            $var := $<variable>.Str;
            $*IN_DECL := '';
        }
        <.ws>
        <trait>*
    }

    rule scoped($*SCOPE) {
        #~ :dba('scoped declarator')
        <?>
        [
        | <DECL=declarator>
        | <DECL=regex_declarator>
        | <DECL=package_declarator>
        ]
    }

    token scope_declarator:sym<my>        { <sym> <scoped('my')> }
    token scope_declarator:sym<local>     { <sym> <scoped('local')> }
    token scope_declarator:sym<our>       { <sym> <scoped('our')> }
    token scope_declarator:sym<state>     { <sym> <scoped('state')> }

    token package_declarator:sym<package> {
        :my $*OUTERPACKAGE := $*PACKAGE;
        :my $*PKGDECL := 'class';
        <sym> <.end_keyword> <package_def>
    }

    rule statement_control:sym<require> {   # here because of declarational aspects
        <sym>
        [
        | <versionish>
        | <module_name> <![(]>
        | <file=.variable>
        | <!before <sigil>> <file=.term>
        ]
        [ <EXPR> ]?
    }

    rule package_def {
        :my $longname;
        :my $outer := $*W.cur_lexpad();
        :my $*DECLARAND;
        :my $*IN_DECL := 'class';
        :my $*HAS_SELF := '';
        :my $*CURPAD;
        :my $*DOC := $*DECLARATOR_DOCS;
        :my $*DOCEE;
        ''
        # Meta-object will live in here; also set default REPR (a trait
        # may override this, e.g. is repr('...')).
        :my $*PACKAGE;
        :my $*REPR;

        # Default to our scoped.
        { $*SCOPE := 'our' unless $*SCOPE }

        [
            [ <longname> { $longname := dissect_longname($<longname>); } ]?
            <.newlex>
            <trait>*

            {
                # Locate any existing symbol. Note that it's only a match
                # with "my" if we already have a declaration in this scope.
                my $exists := 0;
                my @name := $longname ??
                    $longname.type_name_parts('package name', :decl(1)) !!
                    [];
                if @name && $*SCOPE ne 'anon'
                && $*W.already_declared($*SCOPE, $*OUTERPACKAGE, $outer, nqp::gethllsym("nqp", "nqplist")(|@name)) {
                    $*PACKAGE := find_symbol(@name);
                    $exists   := 1;
                }

                # If it exists already it is an illegal redecl.
                if $exists && $*PACKAGE.HOW.is_composed($*PACKAGE) {
                    throw($/, <X Redeclaration>, symbol => $longname.name());
                }

                # Construct meta-object for this package.
                my %args;
                %args<name> = $longname.name() if @name;
                %args<repr> = $*REPR if $*REPR;
                $*PACKAGE  := $*W.pkg_create_mo($/, %*HOW{$*PKGDECL}, |%args);

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
                ]?
                { $*IN_DECL := ''; }
                <.finishlex>
                <statementlist(1)>     # whole rest of file, presumably
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

    proto token initializer { * }
    token initializer:sym<=> {
        <sym> <.ws> <EXPR('h=')>
    }

    token routine_declarator {
        'sub' <.end_keyword> <.ws> <routine_def>
    }

    rule parensig {
        #~ :dba('signature')
        '(' ~ ')' <signature>
    }

    method checkyada () {
        try {
            my $startsym := self<blockoid><statementlist><statement>[0]<EXPR><term><sym> // '';
            if $startsym eq '...' || $startsym eq '!!!' || $startsym eq '???' {
                $*DECLARAND<stub> = 1;
            }
        };
        return self;
    }

    # perl -E 'say prototype "CORE::seek"'
    my %prototype =
        'binmode' => '*;$',
        'chr'     => '$',
        'chdir'   => '$',
        'close'   => '*',
        'each'    => '$',
        'int'     => '$',
        'keys'    => '$',
        'length'  => '$',
        'ord'     => '$',
        'ref'     => '$',
        'time'    => '',
        'not'     => '@',
        'unlink'  => '@',
        'unpack'  => '$@',
        'map'     => '$@',
        'grep'    => '$@',
        'open'    => '*@',
        'pos'     => '$',
        'print'   => '*@',
        'rand'    => '$',
        'read'    => '*\\$$;$',
        'say'     => '*@',
        'seek'    => '*$$',
        'sort'    => '$@',
        'splice'  => '@',
        'split'   => '$$$',
        'substr'  => '$$$$',
        'values'  => '$';
    rule routine_def {
        :my $*IN_DECL := 'sub';
        :my $*METHODTYPE;
        :my $*IMPLICIT := 0;
        :my $*DOC := $*DECLARATOR_DOCS;
        :my $*DOCEE;
        :my $*DECLARAND := $*W.stub_code_object('Sub');
        :my $*PROTOTYPE;
        :my $*SHIFT_FROM;
        :my $*ROUTINE_NAME := '';
        [
        ||  <deflongname>
            <.newlex>
            [ <parensig> { %prototype{ ~$<deflongname> } = ~$*PROTOTYPE } ]?
            <trait>*
            { $*IN_DECL := 0; $*ROUTINE_NAME := ~$<deflongname>; }
            [
            || <?terminator>
            || <blockoid>
            ]
        ||  <?before \W>
            <.newlex>
            [ <parensig> ]?
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

    method EXPR($preclim = '') {
        # Override this so we can set $*LEFTSIGIL.
        my $*LEFTSIGIL := '';
        self.EXPR2($preclim, :noinfix($preclim eq 'z='));
    }

    token termish {
        :my $*SCOPE         := "";
        :my $*MULTINESS     := "";
        :my $*ARGUMENT_WANT := 0;
        :my $*ARGUMENT_HAVE := 0;
        :my $*OFTYPE;
        :my $*VAR;
        #~ :dba('prefix or term')
        [
            [
            | <!filetest> <prefixish> [ <!{
                    my $p   = $<prefixish>;
                    $<term> = $p.pop if $p[*-1]<O><term>;
                }> <!filetest> <prefixish> ]*
                [ <?{ $<term> }> || <term> ]
            | <term>
            ]

            #~ :dba('postfix')
            [
            || <?{ $*QSIGIL && $*QSIGIL eq '$' }> [ <postfixish>+! <?{ bracket_ending($<postfixish>) }> ]?
            || <postfixish>*
            ]
        || <!{ $*QSIGIL }> <?before <infixish> {
            $/.CURSOR.typed_panic('X::Syntax::InfixInTermPosition', infix => ~$<infixish>); } >
        || <!>
        ]
        { self.check_variable($/, $*VAR) if $*VAR; }
    }

    sub bracket_ending($matches) {
        my $check = $matches[*-1];
        my $str   = $check.Str;
        my $last  = $str.substr($check.chars - 1, 1);
        $last eq ')' || $last eq '}' || $last eq ']'
    }

    token term:sym<fatarrow> { <fatarrow> }

    token term:sym<variable> {
        <variable>
        [
        ||  <!{ $*QSIGIL }>
            [
            || <?before <ws> \s* '['> { $<variable><really>.make('@') }
            || <?before <ws> \s* '{'> { $<variable><really>.make('%') }
            ]
        ||  [
            || <?[\[]> { $<variable><really>.make('@') }
            || <?[\{]> { $<variable><really>.make('%') }
            ]
        ]?
        { $*VAR := $*VAR || $<variable> }
    }

    token term:sym<package_declarator> { <package_declarator> }
    token term:sym<scope_declarator>   { <?before my | our | local | state> <scope_declarator> }
    token term:sym<routine_declarator> { <routine_declarator> }
    token term:sym<dotty>              { <dotty> }
    token term:sym<value>              { <value> }
    token term:sym<statement_prefix>   { <statement_prefix> }

    token fatarrow {
        '-'?<key=.identifier> \h* '=>' <.ws> <val=.EXPR('h=')>
    }

    token special_variable:sym<$0>    { <sym> | '$PROGRAM_NAME' }
    token special_variable:sym<$!>    { <sym> <![\w]> | '$OS_ERROR' | '$ERRNO' }
    token special_variable:sym<%!>    { <sym> <![\w]> | '%OS_ERROR' | '%ERRNO' }
    token special_variable:sym<$!{ }> { '$!{' ~ '}' <EXPR> }
    token special_variable:sym<$/>    { <sym> }
    token special_variable:sym<$~>    { <sym> | '$FORMAT_NAME' }
    token special_variable:sym<$`>    { <sym> | '$PREMATCH' }
    token special_variable:sym<$@>    { <sym> | '$EVAL_ERROR' }
    token special_variable:sym<$#>    { <sym> <!alpha> }
    token special_variable:sym<$$>    { <sym> <!alpha> <![$]> }
    token special_variable:sym<$%>    { <sym> | '$FORMAT_PAGE_NUMBER' }
    token special_variable:sym<$^>    { <sym> | '$FORMAT_TOP_NAME' }
    token special_variable:sym<$&>    { <sym> | '$MATCH' }
    token special_variable:sym<$*>    { <sym> }
    token special_variable:sym<$(>    { <sym> | '$REAL_GROUP_ID' | '$GID' }
    token special_variable:sym<$)>    { <sym> | '$EFFECTIVE_GROUP_ID' | '$EGID' }
    token special_variable:sym<$->    { <sym> | '$FORMAT_LINES_LEFT' }
    token special_variable:sym<$=>    { <sym> | '$FORMAT_LINES_PER_PAGE' }
    token special_variable:sym<@+>    { <sym> | '@LAST_MATCH_END' }
    token special_variable:sym<%+>    { <sym> | '%LAST_PAREN_MATCH' }
    token special_variable:sym<$+[ ]> { '$+[' | '$LAST_PAREN_MATCH' }
    token special_variable:sym<@+[ ]> { '@+[' }
    token special_variable:sym<@+{ }> { '@+{' }
    token special_variable:sym<@->    { <sym> | '@LAST_MATCH_START' }
    token special_variable:sym<%->    { <sym> | '%LAST_MATCH_START' }
    token special_variable:sym<$-[ ]> { '$-[' }
    token special_variable:sym<@-[ ]> { '@-[' }
    token special_variable:sym<%-{ }> { '@-{' }
    token special_variable:sym<$+>    { <sym> }
    token special_variable:sym<${^ }> { <sigil> '{^' $<text> = [.*?] '}' }
    token special_variable:sym<::{ }> { '::' <?before '{'> }
    token special_variable:sym<$[>    { <sym> }
    token special_variable:sym<$\\>   { <sym> | '$OUTPUT_RECORD_SEPARATOR' | '$ORS' }
    token special_variable:sym<$:>    { <sym> <![:]> | '$FORMAT_LINE_BREAK_CHARACTERS' }
    token special_variable:sym<$'>    { <sym> | '$POSTMATCH' }
    token special_variable:sym<$">    { <sym> <!{ $*QSIGIL }> | '$LIST_SEPARATOR' }
    token special_variable:sym<$,>    { <sym> | '$OUTPUT_FIELD_SEPARATOR' | '$OFS' }
    token special_variable:sym«\$<»   { <sym> | '$REAL_USER_ID' | '$UID' }
    token special_variable:sym«\$>»   { <sym> | '$EFFECTIVE_USER_ID' | '$EUID' }
    token special_variable:sym<$.>    { <sym> | '$INPUT_LINE_NUMBER' | '$NR' }
    token special_variable:sym<${ }>  { <!before { 1; }> }
    token special_variable:sym<$^X> {
        [
        | $<sigil>='$' '^' $<letter>=[<[A..Z]>]
        | $<sigil>='%' '^' $<letter>='H'
        ]
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
            #~ | :dba('infix noun') '[' ~ ']' <infixish(1)>
            | '[' ~ ']' <infixish(1)>
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
        $<really>=''
    }

    # Note, don't reduce on a bare sigil unless you don't care what the longest token is.
    token sigil:sym<$>  { <sym> }
    token sigil:sym<@>  { <sym> }
    token sigil:sym<%>  { <sym> }
    token sigil:sym<&>  { <sym> }
    token sigil:sym<*>  { <sym> }
    token sigil:sym<$#> { <sym> }

    token deflongname {
        #~ :dba('new name to be defined')
        <name>
#        { self.add_routine( ~$<name> ) if $*IN_DECL; }
    }

    token longname {
        <name>
    }

    token name {
        [
        | <identifier> <morename>*
        | <morename>+
        ]
        $<barename>=''
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
            my $longname := dissect_longname($<longname>);
            nqp::substr(~$<longname>, 0, 2) eq '::' ??
                1 !! # ::T introduces a type, so always is one
                is_name($longname.type_name_parts('type name').list)
          }>
        ]
        # parametric type?
        <.unsp>? [ <?before '['> <postcircumfix> ]?
        <.ws> [ 'of' <.ws> <typename> ]?
    }

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
        #~ :dba('number in radix notation')
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
        | <?before ':'> <rad_number>
          <?{ nqp::defined($<rad_number><intpart>) && !nqp::defined($<rad_number><fracpart>) }>
        ]
    }

    token escale {
        <[Ee]> $<sign>=[<[+\-]>?] <decint>
    }

    # careful to distinguish from both integer and 42.method
    token dec_number {
        #~ :dba('decimal number')
        [
        | $<coeff> = [           '.' \d+[_\d+]* ] <escale>?
        | $<coeff> = [\d+[_\d+]* '.' \d+[_\d+]* ] <escale>?
        | $<coeff> = [\d+[_\d+]*                ] <escale>
        ]
    }

    ##########
    # Quotes #
    ##########

    proto token backslash {*}
    proto token escape {*}
    token escape:sym<none> { <!> }

    token sibble($l, $lang2, @lang2tweaks?) {
        :my $lang;
        :my $start;
        :my $stop;
        <babble($l)>
        { my $B := $<babble><B>.ast; $lang := $B[0]; $start := $B[1]; $stop := $B[2]; }

        $start <left=.nibble($lang)> [ $stop || <.panic("Couldn't find terminator $stop")> ]
        [ <?{ $start ne $stop }>
            { $lang := self.quote_lang($lang2, $start, $stop, @lang2tweaks); }
            $start <right=.nibble($lang)> [ $stop || <.panic("Malformed replacement part; couldn't find final $stop")> ]
        ||
            { $lang := self.quote_lang($lang2, $stop, $stop, @lang2tweaks); }
            <right=.nibble($lang)> [ $stop || <.panic("Malformed replacement part; couldn't find final $stop")> ]
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
            { $lang := self.quote_lang($l, $start, $stop, ['qq']); }
            $start <right=.nibble($lang)> [ $stop || <.panic("Malformed replacement part; couldn't find final $stop")> ]
        ||
            { $lang := self.quote_lang($l, $stop, $stop, ['qq']); }
            <right=.nibble($lang)> [ $stop || <.panic("Malformed replacement part; couldn't find final $stop")> ]
        ]
    }


    #~ token quote:sym<' '>  { :dba('single quotes') "'" ~ "'" <nibble(self.quote_lang(%*LANG<P5Q>, "'", "'", ['q']))> }
    #~ token quote:sym<" ">  { :dba('double quotes') '"' ~ '"' <nibble(self.quote_lang(%*LANG<P5Q>, '"', '"', ['qq']))> }
    #~ token quote:sym<` `>  { :dba('backticks')     '`' ~ '`' <nibble(self.quote_lang(%*LANG<P5Q>, '`', '`', ['qq']))> }
    #~ token quote:sym<__DATA__> { :dba('pseudo filehandle') ^^ '__DATA__' \h* $<text>=[.*] }
    token quote:sym<' '>  { "'" ~ "'" <nibble(self.quote_lang(%*LANG<P5Q>, "'", "'", ['q']))> }
    token quote:sym<" ">  { '"' ~ '"' <nibble(self.quote_lang(%*LANG<P5Q>, '"', '"', ['qq']))> }
    token quote:sym<` `>  { '`' ~ '`' <nibble(self.quote_lang(%*LANG<P5Q>, '`', '`', ['qq']))> }
    token quote:sym<__DATA__> { ^^ '__DATA__' \h* $<text>=[.*] }
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
        #~ { nqp::bindlexdyn('%*RX', nqp::hash()) }
        '/' <nibble(self.quote_lang(%*LANG<P5Regex>, '/', '/'))> [ '/' || <?{ say self.orig.substr(self.pos) }> <.panic: "Unable to parse regex; couldn't find final '/'" ~ $<thing> > ]
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
        :my $*INTERPOLATE = 1;
        <sym> »
        { nqp::bindlexdyn('%*RX', nqp::hash('s', $/[0] ?? 1 !! 0)) }
        [
        | '#' <quibble=.nibble(self.quote_lang(%*LANG<P5Regex>, '#', '#'))> '#'
        | <quibble(%*LANG<P5Regex>)>
        ]
        <rx_mods>?
    }

    token quote:sym<s> {
        <sym> »
        :my %*RX;
        :my $*INTERPOLATE = 1;
        {
            %*RX<s> = 1 if $/[0]
        }
        <sibble(%*LANG<P5Regex>, %*LANG<P5Q>, ['qq'])>
        <rx_mods>?
    }

    token quote:sym<tr> {
        [ <sym> | 'y' ] » <pat=tribble(%*LANG<P5Q>)>
        <tr_mods>?
    }

    token rx_mods {
        <!after \s>
        <[igsmxce]>+
    }

    token tr_mods {
        <[cdsr]>+
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
        #~ | :dba('character name') '[' ~ ']' <charnames>
        | '[' ~ ']' <charnames>
        | \d+
        | <[ ?..Z \\.._ ]>
        | <?> <.panic: "Unrecognized \\c character">
        ]
    }

    ###########################
    # Captures and Signatures #
    ###########################

    rule param_sep { [','|':'|';'|';;'] }

    token proto_arg {
        $<arg>=['$'|'@'|'%'|'&'|'*'|'+'|';'|'_']
    }

    token signature {
        || <?{ $*IN_DECL eq 'sub' }> $<params>=['$'|'@'|'%'|'&'|'*'|'+'|';'|'_']* { $*PROTOTYPE := ~$<params> }
        || <?{ $*IN_DECL ne 'sub' }> ( 'undef' | <variable_declarator> )+ % [ <.ws> ',' <.ws> ]
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

    token term:sym<continue> { <sym> » <O('%term')> }

    token circumfix:sym<( )> {
        #~ :dba('parenthesized expression')
        '(' ~ ')'
        <semilist>
        <O('%term')>
    }

    token circumfix:sym<[ ]> {
        #~ :dba('array composer')
        '[' ~ ']'
        <semilist>
        <O('%term')>
    }

    #############
    # Operators #
    #############

    token prefixish {
        #~ :dba('prefix or meta-prefix')
        <OPER=prefix> {} <O=copyOPERx($/, 'O')> <sym=copyOPERx($/, 'sym')>
        <.ws>
    }

    token infixish($in_meta = nqp::getlexdyn('$*IN_META')) {
        :my $*IN_META := $in_meta;
        <!stdstopper>
        <!infixstopper>
        #~ :dba('infix or meta-infix')
        <OPER=infix> <![=]>
    }

    token dotty:sym«->» {
        <sym> <dottyop>
        <O('%methodcall')>
    }

    token dottyopish {
        <term=dottyop>
    }

    token dottyop {
        #~ :dba('dotty method or postfix')

        [ <!{ $*QSIGIL }> <.ws> \s* ]?

        [
        | <methodop>
        | <!alpha> <OPER=postcircumfix> {} <O=copyOPERx($/, 'O')> <sym=copyOPERx($/, 'sym')>
        ]
    }

    # Note, this rule mustn't do anything irreversible because it's used
    # as a lookahead by the quote interpolator.
    token postfixish {
        <!stdstopper>

        [ <!{ $*QSIGIL }> <.ws> \s* ]?

        #~ :dba('postfix')
        [
        | <OPER=postfix>
        | <OPER=postcircumfix>
        | <OPER=dotty>
        ]
        { $*LEFTSIGIL := '@'; }
    }

    method copyO($from) {
        my $O   := $from<OPER><O>;
        my $cur := self.'!cursor_start_cur'();
        $cur.'!cursor_pass'(self.pos());
        nqp::bindattr($cur, Cursor, '$!match', $O);
        $cur
    }

    method copyOPERx($from, $key) {
        my $v   := $from<OPER>{$key};
        my $cur := self.'!cursor_start_cur'();
        $cur.'!cursor_pass'(self.pos());
        nqp::bindattr($cur, Cursor, '$!match', $v);
        $cur
    }

    method copyOPER($from) {
        my $OPER := $from<OPER>;
        my $cur  := self.'!cursor_start_cur'();
        $cur.'!cursor_pass'(self.pos());
        nqp::bindattr($cur, Cursor, '$!match', $OPER);
        $cur
    }

    token postcircumfix:sym<( )> {
        #~ :dba('argument list')
        '(' ~ ')' [ <.ws> <arglist> ]
        <O('%methodcall')>
    }

    token postcircumfix:sym<[ ]> {
        #~ :dba('subscript')
        '[' ~ ']'
        <semilist>
        <O('%methodcall')>
    }

    token postcircumfix:sym<{ }> {
        #~ :dba('subscript')
        '{' ~ '}'
            [
            || <nibble(self.quote_lang(%*LANG<P5Q>, '{', '}', ['q']))> <?{ ~$<nibble> ~~ /^\s*\w+\s*$/ }>
            || <semilist>
            ]
        <O('%methodcall')>
    }

    token postop {
        | <postfix>        { $<O> = $<postfix><O>;       $<sym> = $<postfix><sym>; }
        | <postcircumfix>  { $<O> = $<postcircumfix><O>; $<sym> = $<postcircumfix><sym>; }
    }

    token methodop {
        [
        | <longname>
        | <?before '$' | '@' | '&' > <variable> { $*VAR := $<variable> }
        ]

        #~ :dba('method arguments')
        [
        | <?[\\(]> <args>
        ]?
    }

    token semiarglist($prototype = '@') {
        <arglist($prototype, 1)> +% ';'
        <.ws>
    }

    token arg($*PROTOTYPE = '@', $prec = 'f=') {
        #~ :dba('argument')
        [
        #~ | <?stdstopper>
        || <?{ $*ARGUMENT_HAVE == 0 && $*IN_OPEN }> [ <name> <?{ !(~$<name> ~~ /'my'|'our'/) }> {
                my $BLOCK := $*W.cur_lexpad();
                unless $BLOCK.symbol(~$<name>) {
                    $BLOCK.symbol(~$<name>, :scope('lexical'), :barename(1) );
                    $BLOCK[0].push(QAST::Var.new( :name(~$<name>), :scope('lexical'), :decl('var') ));
                }
            } || <EXPR('q=')> ] { $*ARGUMENT_HAVE := 1 }
        || <?{ $*PROTOTYPE eq '*' }>
            [
            || <barename=.name> <?{ !(~$<barename> ~~ /'my'|'our'/) && (my Mu $h := $*W.cur_lexpad().symbol(~$<barename>)) && $h<barename> }>
            || <EXPR($prec)>
            ]
            { $*ARGUMENT_HAVE := 1 }
        || <?{ $*PROTOTYPE eq '@' }> <EXPR($prec)> { $*ARGUMENT_HAVE := 1 }
        || <?{ $*PROTOTYPE eq '$' }>
            [
            || <?{ $*ARGUMENT_HAVE }> <EXPR('h=')> { $*ARGUMENT_HAVE := $*ARGUMENT_HAVE + 1 }
            ||                        <EXPR('q=')> { $*ARGUMENT_HAVE := $*ARGUMENT_HAVE + 1 }
            ]
        #~ || <?{ $*PROTOTYPE eq ';' }>
        #~ | <?>
        ]
    }

    token arglist($prototype = '@', $is_semiarglist = 0) {
        :my $*GOAL := 'endargs';
        :my $*QSIGIL := '';
        :my $s := $prototype;
        :my $n := '';
        :my $i := 0;
        [ <!{ $is_semiarglist }> <.ws> <indirect_object> ]?
        #~ :dba('argument list')
        \s*
        [
        | <?stdstopper>
        | <?[=]>
        | [
            ||  <?{ $is_semiarglist }>
                [
                || <?{ nqp::substr($s, 0, 1) eq '*' }> <arg('*')> [ <.ws> ',' <.ws> <arg('@', 'a=')> ] ** 0..1
                || <arg('@', 'a=')> ** 0..1
                ]
            ||  [ <?{ $n := nqp::substr($s, $i, 1); $i := $i + 1; $n }> <arg($n)> ]+ % [ <.ws> ',' <.ws> ]
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
        :my $*SHIFT_FROM;
        <?before '{' >
        <sblock>
        [ 'continue' <continue=.sblock> ]?
        <O('%term')>
    }

    ## methodcall
    token postfix:sym«->» {
        <sym> <dottyop>
        <O('%methodcall')>
    }

    ## autoincrement
    token postfix:sym<++> { <sym> <O('%autoincrement')> }
    token postfix:sym«--» { <sym> <O('%autoincrement')> }
    token prefix:sym<++>  { <sym> <O('%autoincrement')> }
    token prefix:sym«--»  { <sym> <O('%autoincrement')> }

    ## exponentiation
    token infix:sym<**>  { <sym> <O('%exponentiation')> }

    ## symbolic unary
    token prefix:sym<!>  { <sym> <O('%symbolic_unary')> }
    token prefix:sym<+>  { <sym> <O('%symbolic_unary')> }
    token prefix:sym<->  { <sym> <O('%symbolic_unary')> }
    token prefix:sym<~>  { <sym> <O('%symbolic_unary')> }
    token prefix:sym<\\> { <sym> <O('%symbolic_unary')> }

    ## binding
    token infix:sym<!~> { <sym> <O('%binding')> }
    token infix:sym<=~> { <sym> <O('%binding')> }

    ## multiplicative
    token infix:sym<*>  { <sym> <O('%multiplicative')> }
    token infix:sym</>  { <sym> <O('%multiplicative')> }
    token infix:sym<%>  { <sym> <O('%multiplicative')> }
    token infix:sym«<<» { <sym> <O('%multiplicative')> }
    token infix:sym«>>» { <sym> <O('%multiplicative')> }
    token infix:sym<x> {
        <sym> [ <?before \s+> || <?MARKER('ws')> ]
        <O('%multiplicative')>
    }

    ## additive
    token infix:sym<.> { <sym> <O('%additive')> }
    token infix:sym<+> { <sym> <O('%additive')> }
    token infix:sym<-> { <sym> <O('%additive')> }

    ## bitwise and (all)
    token infix:sym<&>    { <sym> <O('%bitwise_and')> }
    token infix:sym<also> { <sym> <O('%bitwise_and')> }

    ## bitwise or (any)
    token infix:sym<|> { <sym> <O('%bitwise_or')> }
    token infix:sym<^> { <sym> <O('%bitwise_or')> }

    ## named unary examples
    token term:sym<defined> {
        <sym> <.ws>
        [
        | '(' ~ ')' <EXPR('h=')>
        | <EXPR('h=')>
        ]
    }

    token term:sym<eval> {
        :my $*SHIFT_FROM := '@ARGV';
        <sym> » <?before \s*> <.ws> <!before '{'> <EXPR('q=')>?
    }

    token term:sym<goto> { <sym> » <?before \s*> <.ws> <?[&]> <EXPR('q=')> }

    token term:sym<__LINE__>    { <sym> }
    token term:sym<__FILE__>    { <sym> }
    token term:sym<__PACKAGE__> { <sym> }

    token term:sym<filehandle> {
        '<'
        [
        | <longname>
        | <variable>
        | ''
        ]
        '>'
    }

    token term:sym<scalar> {
        :my $*ARGUMENT_HAVE := 0;
        <sym> <.ws>
        [
        | '(' ~ ')' [ <arg('$')>+ % [ <.ws> ',' <.ws> ] ]
        | <arg('$')>**0..1
        ]
    }

    token filetest {
        '-'$<letter>=[<[a..zA..Z]>] » [ <!before <infix>> <?before \s*> <.ws> <EXPR('q=')> ]?
    }

    token term:sym<filetest> { <filetest> }

    ## comparisons
    token infix:sym«<=>» { <sym> <O('%comparison')> }
    token infix:sym<cmp> { <sym> <O('%comparison')> }
    token infix:sym«<»   { <sym> <O('%comparison')> }
    token infix:sym«<=»  { <sym> <O('%comparison')> }
    token infix:sym«>»   { <sym> <O('%comparison')> }
    token infix:sym«>=»  { <sym> <O('%comparison')> }
    token infix:sym<eq>  { <sym> <O('%equality')> }
    token infix:sym<ne>  { <sym> <O('%equality')> }
    token infix:sym<lt>  { <sym> <O('%comparison')> }
    token infix:sym<le>  { <sym> <O('%comparison')> }
    token infix:sym<gt>  { <sym> <O('%comparison')> }
    token infix:sym<ge>  { <sym> <O('%comparison')> }

    ## equality
    token infix:sym<==>  { <sym> <!before '=' > <O('%equality')> }
    token infix:sym<!=>  { <sym> <O('%equality')> }
    token infix:sym<~~>  { <sym> <O('%equality')> }
    token infix:sym<!~~> { <sym> <O('%equality')> }

    ## tight and
    token infix:sym<&&> { <sym>  <O('%tight_and, :pasttype<if>')> }

    ## tight or
    token infix:sym<||> { <sym> <O('%tight_or, :assoc<left>, :pasttype<unless>')> }

    token infix:sym<^^> { <sym> <O('%tight_or, :pasttype<xor>')> }

    token infix:sym<//> { <sym> <O('%tight_or, :assoc<left>, :pasttype<defor>')> }

    ## range
    token infix:sym<..>  { <sym> <O('%range')> }
    token infix:sym<...> { <sym> <O('%range')> }

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

    token infix:sym<=> { <sym> <O('%assignment')> }

    ## multiplicative
    token infix:sym<*=>  { <sym> <O('%assignment')> }
    token infix:sym</=>  { <sym> <O('%assignment')> }
    token infix:sym<%=>  { <sym> <O('%assignment')> }
    token infix:sym«<<=» { <sym> <O('%assignment')> }
    token infix:sym«>>=» { <sym> <O('%assignment')> }
    token infix:sym<x=>  { <sym> <O('%assignment')> }

    ## additive
    token infix:sym<.=> { <sym> <O('%assignment')> }
    token infix:sym<+=> { <sym> <O('%additive')> }
    token infix:sym<-=> { <sym> <O('%assignment')> }

    ## bitwise and (all)
    token infix:sym<&=> { <sym> <O('%assignment')> }

    ## bitwise or (any)
    token infix:sym<|=> { <sym> <O('%assignment')> }
    token infix:sym<^=> { <sym> <O('%assignment')> }

    ## tight and
    token infix:sym<&&=> { <sym> <O('%assignment')> }

    ## tight or
    token infix:sym<||=> { <sym> <O('%assignment')> }
    token infix:sym<^^=> { <sym> <O('%assignment')> }
    token infix:sym<//=> { <sym> <O('%assignment')> }

    ## list item separator
    token infix:sym<,>  { <sym> [\s* ','| \s* '=>']* <O('%comma, :fiddly<0>')> }
    token infix:sym«=>» { <sym> [\s* ','| \s* '=>']* <O('%comma, :fiddly<0>')> }

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
        |   <?{ $*ALLOW_IOS_VAR }>
            [
            | <variable> <?before \s> <.ws> [ <?term> | <?prefix> | <!infix> ] { $name := ~$<variable> }
            | <?[{]> <sblock>
            ]
        |   <?{ $*ALLOW_IOS_NAME }> <name> <!postfix> <![,]> { $name := ~$<name> }
            <?{ (nqp::atkey($*W.cur_lexpad().symbol($name), 'barename') && ($<name><barename>.make(1))) || $*W.is_type([$name]) }>
        ]
        { $*HAS_INDIRECT_OBJ := 1 }
    }

    token term:sym<...> { <sym> <args> }

    token term:sym<identifier> {
        :my $name;
        :my $*HAS_INDIRECT_OBJ = 0;
        :my $*ALLOW_IOS_VAR    = 0;
        :my $*ALLOW_IOS_NAME   = 1;
        :my $*IN_SPLIT         = 0;
        :my $*IN_OPEN          = 0;
        <identifier> { $name := ~$<identifier> }
        <!{ $name ~~ /^ [ 'm' || 'q' || 'qq' || 'qr' || 'qw' || 'my' ] $/ }>
        <?{ %prototype{$name}.defined || !nqp::p6bool($*W.is_type([$name])) }>
        {
            %prototype{$name} = '@' unless %prototype{$name}.defined;
            $*ALLOW_IOS_VAR   = $name ~~ /^ [ 'new' | 'print' | 'say' ] $/;
            $*IN_OPEN         = $name eq 'open';
            $*IN_SPLIT        = $name eq 'split' || $name eq 'grep';
        }
        [\h+ <?[(]>]?
        <args(%prototype{$name})>
        # no compile-time checking for subs
        # { self.add_mystery($<identifier>, $<args>.from, nqp::substr(~$<args>, 0, 1)) unless $<args><invocant>; }
        [ <?{ $name eq 'not' }> <O('%loose_not')> ]?
    }


    token args($prototype = '@') {
        :my $*GOAL := '';
        #~ :dba('argument list')
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
    token term:sym<name> {
        <longname>
        :my $*longname;
        { $*longname := dissect_longname($<longname>); }
        [
        ||  <?{ nqp::substr($<longname>.Str, 0, 2) eq '::' || is_name($*longname.components().list) }>
            <.unsp>?
            [
                <?{ $*W.is_type($*longname.components()) }>
                #~ <?before '['> :dba('type parameter') '[' ~ ']' <arglist>
                <?before '['> '[' ~ ']' <arglist>
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
    token infix:sym<and> { <sym> <O('%loose_and, :pasttype<if>')> }

    ## loose or
    token infix:sym<or>  { <sym> <O('%loose_or, :assoc<left>, :pasttype<unless>')> }
    token infix:sym<xor> { <sym> <O('%loose_or')> }

    ## expression terminator
    # Note: must always be called as <?terminator> or <?before ...<terminator>...>

    token terminator:sym<;>      { <sym> <O('%terminator')> }
    token terminator:sym<}>      { <sym> <O('%terminator')> }
    token terminator:sym<)>      { <sym> <O('%terminator')> }
    token terminator:sym<]>      { <sym> <O('%terminator')> }
    token terminator:sym<if>     { 'if'     » <.nofun> <O('%terminator')> }
    token terminator:sym<unless> { 'unless' » <.nofun> <O('%terminator')> }
    token terminator:sym<while>  { 'while'  » <.nofun> <O('%terminator')> }
    token terminator:sym<until>  { 'until'  » <.nofun> <O('%terminator')> }
    token terminator:sym<for>    { 'for'    » <.nofun> <O('%terminator')> }
    token terminator:sym<given>  { 'given'  » <.nofun> <O('%terminator')> }
    token terminator:sym<when>   { 'when'   » <.nofun> <O('%terminator')> }
    token terminator:sym<:>      { ':' <?{ $*GOAL && $*GOAL eq ':' }> <O('%terminator')> }

    regex infixstopper {
        #~ :dba('infix stopper')
        [
        | <?before <stopper> >
        | <?before ':' > <?{ $*GOAL && $*GOAL eq ':' }>
        ]
    }

    token stdstopper {
        #~ :dba('standard stopper')
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

grammar Perl5::QGrammar does STD5 {

    token charspec {
        [
        | <[a..z @ A..Z \] ^ _]>
        | '[' <!before \w>
        | '\\\\'
        | $<quest>=['?']
        #~ | :dba('character name') '[' ~ ']' <charnames=.LANG('Perl5','charnames')>
        | '[' ~ ']' <charnames=.LANG('Perl5','charnames')>
        | $<number>=[\d+]
        | <?> <.panic: 'Unrecognized \c character'>
        ]
    }

    proto token escape {*}
    proto token backslash {*}

    role b1 {
        token escape:sym<\\> { <sym> <item=backslash> <?{ make $<item>.ast }> }
        token backslash:sym<qq> { <?before 'q'> { $<quote> = <quibble(%*LANG<P5Q>, 'qq')> } }
        token backslash:sym<\\> { <text=sym> }
        token backslash:sym<stopper> { <text=stopper> }
        token backslash:sym<a> { <sym> }
        token backslash:sym<b> { <sym> }
        token backslash:sym<c> { <sym> <charspec> }
        token backslash:sym<e> { <sym> }
        token backslash:sym<f> { <sym> }
        token backslash:sym<n> { <sym> }
        token backslash:sym<N> { <sym> '{' ~ '}' $<charname>=[ <-[\}]>* ] }
        token backslash:sym<r> { <sym> }
        token backslash:sym<t> { <sym> }
        #~ token backslash:sym<x> { :dba('hex character') <sym> [ <hexint> | '{' ~ '}' <hexints> ] }
        #~ token backslash:sym<0> { :dba('octal character') [ <octint> ** 1..3 | '{' ~ '}' <octints> ] }
        token backslash:sym<x> { <sym> [ <hexint> | '{' ~ '}' <hexints> ] }
        token backslash:sym<0> { [ <octint> ** 1..3 | '{' ~ '}' <octints> ] }
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
            [ <EXPR=.LANG('Perl5', 'EXPR', 'z=')> || { throw($/, <X Backslash NonVariableDollar>) } ]
        }
    }

    role s0 {
        token escape:sym<$> { <!> }
    }

    role a1 {
        token escape:sym<@> {
            :my $*QSIGIL := '@';
            <?before '@' <!stopper> <[\w+-]> >
            [ <termish=.LANG('Perl5','termish')> | <!> ]
        }
    }

    role a0 {
        token escape:sym<@> { <!> }
    }

    role h1 {
        token escape:sym<%> {
            :my $*QSIGIL := '%';
            <?before '%' <!stopper> <[\w+-]> >
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

    token nibbler {
        :my @*nibbles;
        <.do_nibbling>
    }

    token do_nibbling {
        :my $from = self.pos;
        :my $to   = $from;
        [
            <!before <stopper> >
            [
            || <starter> <nibbler> <stopper>
                {
                    my $c = $/.CURSOR;
                    $to   = $<starter>[*-1].from;
                    if $from != $to {
                        @*nibbles.push: $c.orig.substr($from, $to - $from);
                    }

                    @*nibbles.push: $<starter>[*-1].Str;
                    @*nibbles.push: $<nibbler>[*-1];
                    @*nibbles.push: $<stopper>[*-1].Str;

                    $from = $to = $c.pos;
                }
            || <escape>
                {
                    my $c = $/.CURSOR;
                    $to   = $<escape>[*-1].from;
                    if $from != $to {
                        @*nibbles.push: $c.orig.substr($from, $to - $from);
                    }

                    @*nibbles.push: $<escape>[*-1];

                    $from = $to = $c.pos;
                }
            || .
            ]
        ]*
        {
            my $c = $/.CURSOR;
            $to   = $c.pos;
            if $from != $to || !@*nibbles {
                @*nibbles.push: $c.orig.substr($from, $to - $from);
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
        %*LANG<P5Q>.HOW.mixin(%*LANG<P5Q>, to[self])
    }
    method tweak_heredoc($v)    { self.tweak_to($v) }

    method tweak_regex($v) {
        self.truly($v, ':regex');
        return %*LANG<P5Regex>;
    }
} # end grammar

grammar Perl5::RegexGrammar does STD5 {
    token nibbler {
        :my $OLDRX := nqp::getlexdyn('%*RX');
        :my %*RX;
        {
            for $OLDRX { %*RX{$_.key} := $_.value }
        }
        <alternation>
    }

    token alternation {
        <sequence>+ % '|'
    }

    token sequence {
        <.ws>  # XXX assuming old /x here?
        <quantified_atom>*
    }

    token quantified_atom {
        <![|)]>
        <!stopper>
        <atom>
        [ <.ws> <!before <stopper> > <quantifier=p5quantifier> ]**0..1
        <.ws>
    }

    token atom {
        [
        | \w
        | <metachar=p5metachar>
        | {} \W
        ]
    }

    proto token p5metachar { * }

    token p5metachar:sym<quant> {
        <![(?]>
        <quantifier=p5quantifier>
        <.panic: "quantifier quantifies nothing">
    }
    token p5metachar:sym<bs> { \\ <backslash=p5backslash> }
    token p5metachar:sym<.>  { <sym> }
    token p5metachar:sym<^>  { <sym> }
    token p5metachar:sym<$>  {
        '$' <?before \W | $>
    }
    token p5metachar:sym<(? )> {
        '(?' <![?]>
            [
            | <?[<]> '<' $<name>=[<-[>]>+] '>' {} <nibbler>
            | <?[']> "'" $<name>=[<-[']>+] "'" {} <nibbler>
            | <assertion=p5assertion>
            ]
        [ ')' || <.panic: "Perl 5 named capture group not terminated by parenthesis"> ]
    }
    token p5metachar:sym<(?: )> { '(?:' {} <nibbler> ')' }
    token p5metachar:sym<( )> { '(' {} <nibbler> ')' }
    token p5metachar:sym<[ ]> { <?before '['> <cclass> }
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

    token cclass {
        :my $astfirst = 0;
        '['
        $<sign>=['^'|<?>]
        [
        || $<charspec>=(
               ( '\\' <backslash=p5backslash> || (<?{ $astfirst == 0 }> <-[\\]> || <-[\]\\]>) )
               [
                   \s* '-' \s*
                   ( '\\' <backslash=p5backslash> || (<-[\]\\]>) )
               ]**0..1
               { $astfirst++ }
           )+
           ']'
        || <.panic: "failed to parse character class; unescaped ']'?">
        ]
    }

    proto token p5backslash { <...> }
    token p5backslash:sym<A> { <sym> }
    token p5backslash:sym<b> { $<sym>=[<[bB]>] }
    token p5backslash:sym<r> { <sym> }
    token p5backslash:sym<R> { <sym> }
    token p5backslash:sym<s> { $<sym>=[<[dDnNsSwW]>] }
    token p5backslash:sym<t> { <sym> }
    token p5backslash:sym<x> {
        <sym>
        [
        |           $<hexint>=[ <[ 0..9 a..f A..F ]>**0..2 ]
        | '{' ~ '}' $<hexint>=[ <[ 0..9 a..f A..F ]>* ]
        ]
    }
    token p5backslash:sym<z> { <sym> }
    token p5backslash:sym<Z> { <sym> }
    token p5backslash:sym<Q> { <sym> <!!{ $*INTERPOLATE := 0; 1 }> }
    token p5backslash:sym<E> { <sym> <!!{ $*INTERPOLATE := 1; 1 }> }
    token p5backslash:sym<misc> { $<litchar>=(\W) | $<number>=(\d+) }
    token p5backslash:sym<oops> { <.panic: "Unrecognized Perl 5 regex backslash sequence"> }

    proto token p5assertion { <...> }
    token p5assertion:sym«<» { <sym> $<neg>=['='|'!'] [ <?before ')'> | <nibbler> ] }
    token p5assertion:sym<=> { <sym> [ <?before ')'> | <nibbler> ] }
    token p5assertion:sym<!> { <sym> [ <?before ')'> | <nibbler> ] }

    token p5mod  { <[imsox]>* }
    token p5mods { <on=p5mod> [ '-' <off=p5mod> ]**0..1 }
    #~ token p5assertion:sym<mod> {
        #~ :my %*OLDRX := nqp::getlexdyn('%*RX');
        #~ :my %*RX;
        #~ {
            #~ for %*OLDRX { %*RX{$_.key} := $_.value; }
        #~ }
        #~ <mods=p5mods>
        #~ [
        #~ | ':' <nibbler>**0..1
        #~ | <?before ')' >
        #~ ]
    #~ }

    proto token p5quantifier { <...> }

    token p5quantifier:sym<*>  { <sym> <quantmod> }
    token p5quantifier:sym<+>  { <sym> <quantmod> }
    token p5quantifier:sym<?>  { <sym> <quantmod> }
    token p5quantifier:sym<{ }> {
        '{'
        $<start>=[\d+]
        [ $<comma>=',' $<end>=[\d*] ]**0..1
        '}' <quantmod>
    }

    token quantmod { [ '?' | '+' ]? }

    token ws {
        [
        | '(?#' ~ ')' <-[)]>*
        | <?{ %*RX<x> }> [ \s+ | '#' \N* ]
        ]*
    }
}

## vim: expandtab sw=4 ft=perl6
