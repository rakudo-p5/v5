
use v6.0.0;

my %SIG;
my %INC;
my %STASH; # for ${^SOMETHING} style variables
%STASH<CHILD_ERROR_NATIVE> = 0;

use Perl5::warnings ();

sub P5warn(:$cat, *@a) is hidden_from_backtrace {
    if warnings::enabled('all') || $cat && warnings::enabled($cat) {
        %SIG<__WARN__> ~~ Callable ?? %SIG<__WARN__>( |@a ) !! warn( join('', @a) )
    }
}
sub P5die (:$cat, *@a) is hidden_from_backtrace {
    if warnings::enabled('all') || $cat && warnings::enabled($cat) {
        %SIG<__DIE__>  ~~ Callable ?? %SIG<__DIE__>(  |@a ) !! die(  join('', @a) )
    }
}

# We can't use modules here which will be exposed to user land. So we turn it around.
my $CONFIG_INTSIZE         = 4;
my $INPUT_RECORD_SEPARATOR = "\n";
my $SUBSCRIPT_SEPARATOR    = chr(28);
my $VERSION_MAJOR          = 5;  # well, we have to say something
my $VERSION_MINOR          = 16;
my $VERSION_PATCH          = 0;
my $VERSION_V              = "v$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH";
my $VERSION_FLOAT          = $VERSION_MAJOR + $VERSION_MINOR/1000 + $VERSION_PATCH/1000000;
my $OUTPUT_AUTOFLUSH       = 0;
my $OUTPUT_AUTOFLUSH_P    := Proxy.new(
    FETCH => method ()   { $OUTPUT_AUTOFLUSH },
    STORE => method ($n) { $OUTPUT_AUTOFLUSH = $n; try $*OUT.autoflush( ?$n ); } # XXX there is no IO::Handle.autoflush (yet)
);
my $CHILD_ERROR;
my $FORMAT_TOP_NAME;
my $SYSTEM_FD_MAX;
my $INPLACE_EDIT;
my $BASETIME;
my $LAST_SUBMATCH_RESULT;
my $LAST_REGEXP_CODE_RESULT;
my $ACCUMULATOR;
my $FORMAT_FORMFEED;
my $EXTENDED_OS_ERROR;
my $EXCEPTIONS_BEING_CAUGHT;
my $WARNING;
my $COMPILING;
my $DEBUGGING;
my $PERLDB;

class STDIN {
}
class STDOUT {
    method say  (*@a) { $*OUT.say(   join('', @a) ) }
    method print(*@a) { $*OUT.print( join('', @a) ) }
    method P5open (*@a) { }
    method P5close(*@a) { }
}
class STDERR {
    method say  (*@a) { $*ERR.say(   join('', @a) ) }
    method print(*@a) { $*ERR.print( join('', @a) ) }
    method P5open (*@a) { }
    method P5close(*@a) { }
}

sub EXPORT(|) {
    my %ex;
    %ex<STDIN>                    := STDIN;
    %ex<STDOUT>                   := STDOUT;
    %ex<STDERR>                   := STDERR;
    %ex<@ARGV>                    := @*ARGS;
    %ex<%INC>                     := %INC;
    %ex<%ENV>                     := %*ENV;
    %ex<@INC>                     := %*CUSTOM_LIB<Perl5>;
    %ex<%SIG>                     := %SIG;
    %ex<$$>                       := $*PID;
    %ex<$]>                       := $VERSION_FLOAT;
    %ex<$;>                       := $SUBSCRIPT_SEPARATOR;
    %ex<$|>                       := $OUTPUT_AUTOFLUSH_P;
    %ex<$?>                       := $CHILD_ERROR;

    %ex<$^>                       := $FORMAT_TOP_NAME;
    %ex<$^O>                      := $*OS;
    %ex<$^F>                      := $SYSTEM_FD_MAX;
    %ex<$^I>                      := $INPLACE_EDIT;
    %ex<$^T>                      := $BASETIME;
    %ex<$^V>                      := $VERSION_V;
    %ex<$^X>                      := $*EXECUTABLE_NAME;
    %ex<$^M>                      := Mu;
        
    ## Variables related to regular expressions
    %ex<$^N>                      := $LAST_SUBMATCH_RESULT;
    %ex<$^R>                      := $LAST_REGEXP_CODE_RESULT;
        
    ## Variables related to formats
    %ex<$^A>                      := $ACCUMULATOR;
    %ex<$^L>                      := $FORMAT_FORMFEED;
        
    ## Error Variables
    %ex<$^E>                      := $EXTENDED_OS_ERROR;
    %ex<$^S>                      := $EXCEPTIONS_BEING_CAUGHT;
    %ex<$^W>                      := $WARNING;
        
    ## Variables related to the interpreter state
    %ex<$^C>                      := $COMPILING;
    %ex<$^D>                      := $DEBUGGING;
    %ex<$^H>                      := Mu;
    %ex<%^H>                      := Mu;
    %ex<$^P>                      := $PERLDB;

    # Because Perl6 already has variables like $/ and $! built in, we can't ex-/import them directly.
    # So we need an accessor, the grammar token '$/' can use, and a way to support the English module.
    # I choosed $*-vars, because they can't be used from Perl5 directly because of its grammar.
    %ex<$*INPUT_RECORD_SEPARATOR> := $INPUT_RECORD_SEPARATOR;
    %ex<$*CONFIG_INTSIZE>         := $CONFIG_INTSIZE;
    %ex<%*STASH>                  := %STASH;

    %ex
}

sub fail($a?) is export { use Test; ::('&flunk')( $a // '' ) }

multi sub chop()          is export { chop(CALLER::DYNAMIC::<$_>) }
multi sub chop(*@s is rw) is export {
    my $chopped_of = '';
    for @s -> $s is rw {
        if $s && $s.chars {
            $chopped_of = $s.substr(*-1);
            $s          = $s.substr(0, *-1);
        }
    }
    $chopped_of
}

# http://perldoc.perl.org/functions/chomp.html
multi sub chomp()          is export { chomp(CALLER::DYNAMIC::<$_>) }
multi sub chomp(*@s is rw) is export {
    my $nr_chomped = 0;
    return 0 unless $INPUT_RECORD_SEPARATOR.defined;
    # TODO When in slurp mode ($/ = undef ) or fixed-length record mode
    #      ($/ is a reference to an integer or the like; see perlvar) chomp() won't remove anything
    for @s -> $s is rw {
        if $s && $s.chars {
            my $chomped  = $INPUT_RECORD_SEPARATOR eq ''
                        ?? $s.subst(/\n+$/, '')
                        !! $s.subst(/$INPUT_RECORD_SEPARATOR$/, '');
            $nr_chomped += $s.chars - $chomped.chars;
            $s           = $chomped;
        }
    }
    $nr_chomped
}

multi caller()   is export { caller(1)[0,1,2] }
multi caller($o) is export {
    try my $f = Backtrace.new[$o + 4];
    try my $p = $f.code.package.^name;
    $p = 'main' unless $p;
    $f && [$p, $f.file, $f.line, $p ~ '::' ~ $f.subname] || ['','','']
}

sub exists( \a ) is export { a:exists ?? 1 !! '' }

# http://perldoc.perl.org/functions/undef.html
multi sub undef()         is export { Nil              }
multi sub undef($a is rw) is export { undefine $a; Nil }

# http://perldoc.perl.org/functions/system.html
sub system(*@a) is export { shell(@a).status || '' }

### Operators by precedence

# x=, autoincrement (++ and --)
sub prefix:<P5++> (\a)    is export { ++a }
sub prefix:<P5--> (\a)    is export { --a }
sub postfix:<P5++>(\a)    is export { a++ }
sub postfix:<P5-->(\a)    is export { a-- }

# w= exponentiation (right **)
sub infix:<P5**> (\a, \b) is export { &prefix:<P5+>(a) ** &prefix:<P5+>(b) }

# v=, symbolic unary (right ! ~ \ and unary + and -)
sub prefix:<P5!> (\a)     is export { !P5Bool(a)   }
sub prefix:<P5~> (\a)     is export { 18446744073709551616 - (P5Numeric(a) + 1)   }
sub prefix:<P5.> (\a)     is export {  P5Str(a)    }
sub prefix:<P5+> (\a)     is export {  P5Numeric(a) }
sub prefix:<P5-> (\a)     is export { -P5Numeric(a) }
sub prefix:<P5bs>(\a)     is export { a }

# u=, binding (left =~ !~)
#~ sub infix:<P5=~> (\a, \b) is export { say a; say b; a.match(b)           }
#~ sub infix:<P5!~> (\a, \b) is export { !&infix:<P5=~>(a, b) }

# t=, subplicative (left * / % x)
sub infix:<P5*>  (\a, \b) is export { &prefix:<P5+>(a) * &prefix:<P5+>(b) }
sub infix:<P5/>  (\a, \b) is export { &prefix:<P5+>(a) / &prefix:<P5+>(b) }
sub infix:<P5%>  (\a, \b) is export { &prefix:<P5+>(a) % &prefix:<P5+>(b) }
sub infix:<P5x>  (\a, \b) is export { &prefix:<P5.>(a) x &prefix:<P5+>(b) }

# s=, additive (left + - .)
sub infix:<P5+>  (\a, \b) is export { &prefix:<P5+>(a) + &prefix:<P5+>(b) }
sub infix:<P5->  (\a, \b) is export { &prefix:<P5+>(a) - &prefix:<P5+>(b) }
sub infix:<P5.>  (*@a)    is export { [~] map { &prefix:<P5.>($_) }, @a   }

# r=, shift (left << >>)
sub infix:«P5<<» (\a, \b) is export { &prefix:<P5+>(a) +< &prefix:<P5+>(b) }
sub infix:«P5>>» (\a, \b) is export { &prefix:<P5+>(a) +> &prefix:<P5+>(b) }

# p=, comparison (nonassoc < > <= >= lt gt le ge)
sub infix:«P5<»  (\a, \b) is export { &prefix:<P5+>(a) <  &prefix:<P5+>(b) }
sub infix:«P5>»  (\a, \b) is export { &prefix:<P5+>(a) >  &prefix:<P5+>(b) }
sub infix:«P5<=» (\a, \b) is export { &prefix:<P5+>(a) <= &prefix:<P5+>(b) }
sub infix:«P5>=» (\a, \b) is export { &prefix:<P5+>(a) >= &prefix:<P5+>(b) }

# o=, equality (nonassoc == != <=> eq ne cmp ~~)
sub infix:<P5==> (\a, \b) is export { &prefix:<P5+>(a) == &prefix:<P5+>(b) }
sub infix:<P5!=> (\a, \b) is export { !&infix:<P5==>(a, b)                 }
multi infix:«P5<=>»(\a, \b) is export { nqp::p6box_i(nqp::cmp_I(nqp::decont(&prefix:<P5+>(a)), nqp::decont(&prefix:<P5+>(b)))) }
multi infix:«P5<=>»(int $a, int $b) is export { nqp::p6box_i(nqp::cmp_i($a, $b)) }
sub infix:<P5eq> (\a, \b) is export { &prefix:<P5.>(a) eq &prefix:<P5.>(b) }
sub infix:<P5ne> (\a, \b) is export { !&infix:<P5eq>(a, b)                 }
multi infix:<P5cmp>(\a, \b) is export { +(&prefix:<P5.>(a) cmp &prefix:<P5.>(b)) }
multi infix:<P5cmp>(int $a, int $b) is export { nqp::p6box_i(nqp::cmp_i($a, $b)) }
sub infix:<P5~~> (\a, \b) is export { &prefix:<P5.>(a) ~~ &prefix:<P5.>(b) }

# n=, bitwise and (left &)
multi infix:<P5&>(Str \a, Str \b) is export { &prefix:<P5.>(a) ~& &prefix:<P5.>(b) }
multi infix:<P5&>(\a, \b)         is export { &prefix:<P5+>(a) +& &prefix:<P5+>(b) }

# m=, bitwise or (left | ^)
multi infix:<P5|>(\a, \b)         is export { &prefix:<P5+>(a) +| &prefix:<P5+>(b) }
multi infix:<P5^>(\a, \b)         is export { &prefix:<P5+>(a) +^ &prefix:<P5+>(b) }

# l=, tight and (left &&)

# k=, tight or (left || //)

# j=, range (nonassoc .. ...)
sub infix:<P5..> (\a, \b) is export { a ..  b }
sub infix:<P5...>(\a, \b) is export { a ... b }

# i=, conditional (right ?:)

# h=, assignment (right = += -= *= etc.)
sub infix:<P5|=> (\a, \b)  is rw is export { a = &infix:<P5|>(a, b); a }
sub infix:<P5&=> (\a, \b)  is rw is export { a = &infix:<P5&>(a, b); a }
sub infix:<P5||=>(\a, \b)  is rw is export { (a ~~ Parcel ?? a[*-1] !! a) = b unless P5Bool(a); a }
sub infix:<P5&&=>(\a, \b)  is rw is export { (a ~~ Parcel ?? a[*-1] !! a) = b     if P5Bool(a); a }
sub infix:<P5+=> (\a, \b)  is rw is export { a = &infix:<P5+>(a, b); a }
sub infix:<P5-=> (\a, \b)  is rw is export { a = &infix:<P5->(a, b); a }
sub infix:<P5*=> (\a, \b)  is rw is export { a = &infix:<P5*>(a, b); a }
sub infix:<P5/=> (\a, \b)  is rw is export { a = &infix:<P5/>(a, b); a }
sub infix:<P5.=> (\a, \b)  is rw is export { a = &infix:<P5.>(a, b); a }

# g=, comma (left , =>)
multi infix:«P5=>»(*@a) is export { @a }

# e=, loose not (right not)
multi prefix:<P5not> (*@a) is export { +@a ?? !([&&] map { P5Bool($_) }, @a) !! 1 }

# d=, loose and (left and)

# c=, loose or (left or xor)


multi trait_mod:<is>(Routine:D $r, :$lvalue!) is export {
    $r.set_rw();
}

multi postcircumfix:<P5[ ]>(Any \SELF)                        is export { SELF.list                   }
multi postcircumfix:<P5[ ]>(Any \SELF, int $pos)        is rw is export { SELF.at_pos(P5Numeric($pos)) }
multi postcircumfix:<P5[ ]>(Any \SELF, $pos)            is rw is export { SELF.at_pos(P5Numeric($pos)) }
multi postcircumfix:<P5[ ]>(Any \SELF, Positional \pos) is rw is export {
    if nqp::iscont(pos) {
        return SELF.at_pos(pos)
    }
    my $list = pos.flat;
    $list.gimme(*);
    $list.map($list.infinite
               ?? { last if $_ >= SELF.list.gimme($_ + 1); SELF[P5Numeric($_)] }
               !! { SELF[P5Numeric($_)] }).eager.Parcel;
}

multi P5Bool(Mu     \SELF) is export { SELF ?? 1 !! ''               }
multi P5Bool(Parcel \SELF) is export { ?SELF ?? [&&] SELF.list !! '' }
multi P5Bool(List   \SELF) is export { ?SELF ?? [&&] SELF.list !! '' }
multi P5Bool(Pair   \SELF) is export { SELF.kv.list ?? 1 !! ''       }

sub P5do(Mu \SELF) is export is hidden_from_backtrace {
    my $ret;
    if SELF {
        if SELF.IO.e {
            try {
                $ret = eval slurp SELF;
                CATCH {
                    default { P5warn(CALLER::DYNAMIC::<$!> = .Str) }
                }
            }
        }
    }
    else {
        die 'Null filename used'
    }
    $ret
}

multi P5length(Mu     \SELF) is export { 0 }
multi P5length(Str:D  \SELF) is export { SELF.chars }
multi P5length(Blob:D \SELF) is export {
    if $*USE_BYTES {
        SELF.bytes
    }
    else {
        my $chars;
        try {
            $chars = SELF.decode('utf8').chars;
            CATCH {
                default {
                    try {
                        $chars = SELF.decode('ascii').chars;
                        CATCH {
                            default {
                                $chars = SELF.bytes
                            }
                        }
                    }
                }
            }
        }
        $chars
    }
}

multi P5Numeric(Mu           ) is export { 0 }
multi P5Numeric(Bool    \SELF) is export { ?SELF ?? 1 !! 0 }
multi P5Numeric(Array:D \SELF) is export { +@(SELF) }
multi P5Numeric(List:D  \SELF) is export { +@(SELF) }
multi P5Numeric(Int     \SELF) is export { SELF }
multi P5Numeric(Num     \SELF) is export { SELF }
multi P5Numeric(Rat     \SELF) is export { SELF }
multi P5Numeric(''      \SELF) is export { '' }
multi P5Numeric(Str:D   \SELF) is export {
    my str $str = nqp::unbox_s(SELF);
    my int $eos = nqp::chars($str);

    # S02:3276-3277: Ignore leading and trailing whitespace
    my int $pos = nqp::findnotcclass(nqp::const::CCLASS_WHITESPACE,
                                              $str, 0, $eos);
    my int $end = nqp::sub_i($eos, 1);

    $end = nqp::sub_i($end, 1)
        while nqp::isge_i($end, $pos)
           && nqp::iscclass(nqp::const::CCLASS_WHITESPACE, $str, $end);

    # Return 0 if no non-whitespace characters in string
    return 0 if nqp::islt_i($end, $pos);

    # Reset end-of-string after trimming
    $eos = nqp::add_i($end, 1);

    # Fail all the way out when parse failures occur
    my &parse_fail := -> $msg {
        fail X::Str::Numeric.new(
                source => SELF,
                reason => $msg,
                :$pos,
        );
    };

    my sub parse-simple-number () {
        # Handle NaN here, to make later parsing simpler
        if nqp::iseq_s(nqp::substr($str, $pos, 3), 'NaN') {
            $pos = nqp::add_i($pos, 3);
            return nqp::p6box_n(nqp::nan());
        }

        # Handle any leading +/- sign
        my int $ch  = nqp::ord($str, $pos);
        my int $neg = nqp::iseq_i($ch, 45);                # '-'
        if nqp::iseq_i($ch, 45) || nqp::iseq_i($ch, 43) {  # '-', '+'
            $pos = nqp::add_i($pos, 1);
            $ch  = nqp::islt_i($pos, $eos) && nqp::ord($str, $pos);
        }

        # nqp::radix_I parse results, and helper values
        my Mu  $parse;
        my str $prefix;
        my int $radix;
        my int $p;

        my sub parse-int-frac-exp () {
            # Integer part, if any
            my Int:D $int := 0;
            if nqp::isne_i($ch, 46) {  # '.'
                $parse := nqp::radix_I($radix, $str, $pos, $neg, Int);
                $p      = nqp::atpos($parse, 2);
                #~ parse_fail "base-$radix number must begin with valid digits or '.'"
                return 0
                    if nqp::iseq_i($p, -1);
                $pos    = $p;

                $int   := nqp::atpos($parse, 0);
                $ch     = nqp::islt_i($pos, $eos) && nqp::ord($str, $pos);
            }

            # Fraction, if any
            my Int:D $frac := 0;
            my Int:D $base := 0;
            if nqp::iseq_i($ch, 46) {  # '.'
                $pos    = nqp::add_i($pos, 1);
                $parse := nqp::radix_I($radix, $str, $pos,
                                       nqp::add_i($neg, 4), Int);
                $p      = nqp::atpos($parse, 2);
                #~ parse_fail 'radix point must be followed by one or more valid digits'
                    #~ if nqp::iseq_i($p, -1);
                $pos    = $p;

                $frac  := nqp::atpos($parse, 0);
                $base  := nqp::atpos($parse, 1);
                $ch     = nqp::islt_i($pos, $eos) && nqp::ord($str, $pos);
            }

            # Exponent, if 'E' or 'e' are present (forces return type Num)
            if nqp::iseq_i($ch, 69) || nqp::iseq_i($ch, 101) {  # 'E', 'e'
                parse_fail "'E' or 'e' style exponent only allowed on decimal (base-10) numbers, not base-$radix"
                    unless nqp::iseq_i($radix, 10);

                $pos    = nqp::add_i($pos, 1);
                $parse := nqp::radix_I(10, $str, $pos, 2, Int);
                $p      = nqp::atpos($parse, 2);
                parse_fail "'E' or 'e' must be followed by decimal (base-10) integer"
                    if nqp::iseq_i($p, -1);
                $pos    = $p;

                my num $exp  = nqp::atpos($parse, 0);
                my num $coef = $frac ?? nqp::add_n($int, nqp::div_n($frac, $base)) !! $int;
                return nqp::p6box_n(nqp::mul_n($coef, nqp::pow_n(10, $exp)));
            }

            # Multiplier with exponent, if single '*' is present
            # (but skip if current token is '**', as otherwise we
            # get recursive multiplier parsing stupidity)
            if nqp::iseq_i($ch, 42)
            && nqp::isne_s(substr($str, $pos, 2), '**') {  # '*'
                $pos           = nqp::add_i($pos, 1);
                my $mult_base := parse-simple-number();

                parse_fail "'*' multiplier base must be an integer"
                    unless $mult_base.WHAT === Int;
                parse_fail "'*' multiplier base must be followed by '**' and exponent"
                    unless nqp::iseq_s(nqp::substr($str, $pos, 2), '**');

                $pos           = nqp::add_i($pos, 2);
                my $mult_exp  := parse-simple-number();

                parse_fail "'**' multiplier exponent must be an integer"
                    unless $mult_exp.WHAT === Int;

                my $mult := $mult_base ** $mult_exp;
                $int     := $int  * $mult;
                $frac    := $frac * $mult;
            }

            # Return an Int if there was no radix point
            return $int unless $base;

            # Otherwise, return a Rat
            my Int:D $numerator := $int * $base + $frac;
            return Rat.new($numerator, $base);
        }

        # Look for radix specifiers
        if nqp::iseq_i($ch, 58) {  # ':'
            # A string of the form :16<FE_ED.F0_0D> or :60[12,34,56]
            $pos    = nqp::add_i($pos, 1);
            $parse := nqp::radix_I(10, $str, $pos, 0, Int);
            $p      = nqp::atpos($parse, 2);
            parse_fail "radix (in decimal) expected after ':'"
                if nqp::iseq_i($p, -1);
            $pos    = $p;

            $radix  = nqp::atpos($parse, 0);
            $ch     = nqp::islt_i($pos, $eos) && nqp::ord($str, $pos);
            if    nqp::iseq_i($ch, 60) {  # '<'
                $pos = nqp::add_i($pos, 1);

                my $result := parse-int-frac-exp();

                parse_fail "malformed ':$radix<>' style radix number, expecting '>' after the body"
                    unless nqp::islt_i($pos, $eos)
                        && nqp::iseq_i(nqp::ord($str, $pos), 62);  # '>'

                $pos = nqp::add_i($pos, 1);
                return $result;
            }
            elsif nqp::iseq_i($ch, 171) {  # '«'
                $pos = nqp::add_i($pos, 1);

                my $result := parse-int-frac-exp();

                parse_fail "malformed ':$radix«»' style radix number, expecting '»' after the body"
                    unless nqp::islt_i($pos, $eos)
                        && nqp::iseq_i(nqp::ord($str, $pos), 187);  # '»'

                $pos = nqp::add_i($pos, 1);
                return $result;
            }
            elsif nqp::iseq_i($ch, 91) {  # '['
                $pos = nqp::add_i($pos, 1);
                my Int:D $result := 0;
                my Int:D $digit  := 0;
                while nqp::islt_i($pos, $eos)
                   && nqp::isne_i(nqp::ord($str, $pos), 93) {  # ']'
                    $parse := nqp::radix_I(10, $str, $pos, 0, Int);
                    $p      = nqp::atpos($parse, 2);
                    parse_fail "malformed ':$radix[]' style radix number, expecting comma separated decimal values after opening '['"
                        if nqp::iseq_i($p, -1);
                    $pos    = $p;

                    $digit := nqp::atpos($parse, 0);
                    parse_fail "digit is larger than {$radix - 1} in ':$radix[]' style radix number"
                        if $digit >= $radix;

                    $result := $result * $radix + $digit;
                    $pos     = nqp::add_i($pos, 1)
                        if nqp::islt_i($pos, $eos)
                        && nqp::iseq_i(nqp::ord($str, $pos), 44);  # ','
                }
                parse_fail "malformed ':$radix[]' style radix number, expecting ']' after the body"
                    unless nqp::islt_i($pos, $eos)
                        && nqp::iseq_i(nqp::ord($str, $pos), 93);  # ']'
                $pos = nqp::add_i($pos, 1);

                # XXXX: Handle fractions!
                # XXXX: Handle exponents!
                return $neg ?? -$result !! $result;
            }
            else {
                parse_fail "malformed ':$radix' style radix number, expecting '<' or '[' after the base";
            }
        }
        elsif nqp::iseq_i($ch, 48)  # '0'
          and $radix = nqp::index('  b     o d     x',
                                  nqp::substr($str, nqp::add_i($pos, 1), 1))
          and nqp::isge_i($radix, 2) {
            # A string starting with 0x, 0d, 0o, or 0b,
            # followed by one optional '_'
            $pos   = nqp::add_i($pos, 2);
            $pos   = nqp::add_i($pos, 1)
                if nqp::islt_i($pos, $eos)
                && nqp::iseq_i(nqp::ord($str, $pos), 95);  # '_'

            return parse-int-frac-exp();
        }
        elsif nqp::iseq_s(nqp::substr($str, $pos, 3), 'Inf') {
            # 'Inf'
            $pos = nqp::add_i($pos, 3);
            return $neg ?? -$Inf !! $Inf;
        }
        else {
            # Last chance: a simple decimal number
            $radix = 10;
            return parse-int-frac-exp();
        }
    }

    my sub parse-real () {
        # Parse a simple number or a Rat numerator
        my $result := parse-simple-number();
        return $result if nqp::iseq_i($pos, $eos);

        # Check for '/' indicating Rat denominator
        if nqp::iseq_i(nqp::ord($str, $pos), 47) {  # '/'
            $pos = nqp::add_i($pos, 1);
            parse_fail "denominator expected after '/'"
                unless nqp::islt_i($pos, $eos);

            my $denom := parse-simple-number();

            $result := $result.WHAT === Int && $denom.WHAT === Int
                    ?? Rat.new($result, $denom)
                    !! $result / $denom;
        }

        return $result;
    }

    # Parse a real number, magnitude of a pure imaginary number,
    # or real part of a complex number
    my $result := parse-real();
    return $result if nqp::iseq_i($pos, $eos);

    # Check for 'i' or '\\i' indicating first parsed number was
    # the magnitude of a pure imaginary number
    if nqp::iseq_i(nqp::ord($str, $pos), 105) {  # 'i'
        $pos = nqp::add_i($pos, 1);
        $result := Complex.new(0, $result);
    }
    elsif nqp::iseq_s(nqp::substr($str, $pos, 2), '\\i') {
        $pos = nqp::add_i($pos, 2);
        $result := Complex.new(0, $result);
    }
    # Check for '+' or '-' indicating first parsed number was
    # the real part of a complex number
    elsif nqp::iseq_i(nqp::ord($str, $pos), 45)    # '-'
       || nqp::iseq_i(nqp::ord($str, $pos), 43) {  # '+'
        # Don't move $pos -- we want parse-real() to see the sign
        my $im := parse-real();
        parse_fail "imaginary part of complex number must be followed by 'i' or '\\i'"
            unless nqp::islt_i($pos, $eos);

        if nqp::iseq_i(nqp::ord($str, $pos), 105) {  # 'i'
            $pos = nqp::add_i($pos, 1);
        }
        elsif nqp::iseq_s(nqp::substr($str, $pos, 2), '\\i') {
            $pos = nqp::add_i($pos, 2);
        }
        else {
            parse_fail "imaginary part of complex number must be followed by 'i' or '\\i'"
        }

        $result := Complex.new($result, $im);
    }

    return $result;
}

multi P5ord(Mu         ) is export { 0             }
multi P5ord(Str:D \SELF) is export { SELF.ord || 0 }

multi P5ref(Mu    \SELF) is export { '' }
multi P5ref(Cool  \SELF) is export { '' }
multi P5ref(Any:D \SELF) is export {
    my $name = SELF.^name.uc;
    $name eq 'SUB' ?? 'CODE' !! $name
}

multi P5scalar(Mu      \SELF) is export { SELF     }
multi P5scalar(Array:D \SELF) is export { +@(SELF) }
multi P5scalar(List:D  \SELF) is export { +@(SELF) }

multi P5Str(Mu:U) is export is hidden_from_backtrace {
    if warnings::enabled('all') || warnings::enabled('uninitialized') {
        P5warn 'Use of uninitialized value in string'
    }
    ''
}
multi P5Str(Mu:D     \SELF) is export { SELF.Str }
multi P5Str(Bool:D   \SELF) is export { ?SELF ?? 1 !! '' }
multi P5Str(Array:D  \SELF) is export { join '', map { $_.defined ?? P5Str($_) !! '' }, @(SELF) }
multi P5Str(List:D   \SELF) is export { join '', map { $_.defined ?? P5Str($_) !! '' }, @(SELF) }
multi P5Str(utf8:D   \SELF) is export { try { SELF.decode } // nqp::unbox_s(nqp::decode(nqp::decont(SELF), 'binary')) }
multi P5Str(Int:D    \SELF) is export { SELF.Int }
multi P5Str(Num:D    \SELF) is export { SELF.Num }
multi P5Str(Parcel:D \SELF) is export { SELF.Int }
multi P5Str(Pair:D   \SELF) is export { P5Str(SELF.kv.list) }
multi P5Str(Sub:D    \SELF) is export { 'CODE(' ~ SELF.WHERE.fmt('0x%X').lc ~ ')' }

use MONKEY_TYPING;

augment class Mu { }

augment class Any {
    multi method P5open( \SELF: $expr )             { SELF.P5open( $expr.substr(0, 1), $expr.substr(1) ) }
    multi method P5open( \SELF: $m, $expr, *@list ) {
        # ($path, :r(:$r), :w(:$w), :a(:$a), :p(:$p), :bin(:$bin), :chomp(:$chomp) = { ... }, :enc(:encoding(:$encoding)) = { ... })
        SELF = $expr.IO.open( :r($m eq '<'), :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) );
    }

    method P5close(\SELF:) { SELF && SELF.close }
}

augment class IO::Handle { }
augment class Nil { }
augment class Bool { }
augment class Array { }
augment class List { }
augment class utf8 { }

augment class Str {
    multi method P5pack(*@items) is hidden_from_backtrace {
        my @bytes;
        my $pos = 0;
        my $amount;
        sub next_item {
            my $item = +@items > $pos ?? @items[$pos] !! '';
            $pos++;
            $item
        }
        sub loop( Callable $c ) {
            my $items = $c.signature.count;
            $amount  /= $items;
            for ^$amount {
                @bytes.push: $c( |@items[$pos ..^ ($pos + $items)] );
                $pos += $items
            }
        }
        
        for self.subst(/'#'\N*<?before $$ >/, '', :g).comb(/<[a..zA..Z]>[\d+|'*']?/) -> $unit {
            my $directive = $unit.substr(0, 1);
            $amount       = $unit.substr(1);
            $amount       = +@items - $pos if $amount eq '*';
            $amount       = 1              if $amount eq '';

            given $directive {
                when 'a' { # distinguish between Str and utf8
                    my $binary = next_item;
                    for $binary.comb -> $char {
                        @bytes.push: ord($char);
                    }
                    if $amount > $binary.chars {
                        @bytes.push: 0x00 xx ($amount - $binary.chars);
                    }
                }
                when 'A' {
                    my $ascii = next_item;
                    for $ascii.comb -> $char {
                        X::Buf::Pack::NonASCII.new(:$char).throw if ord($char) > 0x7f;
                        @bytes.push: ord($char);
                    }
                    if $amount > $ascii.chars {
                        @bytes.push: 0x20 xx ($amount - $ascii.chars);
                    }
                }
                when 'Z' {
                    my $ascii = next_item;
                    for $ascii.comb -> $char {
                        X::Buf::Pack::NonASCII.new(:$char).throw if ord($char) > 0x7f;
                        @bytes.push: ord($char);
                    }
                    if $amount > $ascii.chars {
                        @bytes.push: 0x00 xx ($amount - $ascii.chars);
                    }
                }
                when 'H' {
                    my $hexstring = next_item;
                    if $hexstring % 2 {
                        $hexstring ~= '0';
                    }
                    @bytes.push: map { :16($_) }, $hexstring.comb(/../);
                }
                when 'x' {
                    @bytes.push: 0x00 xx $amount;
                }
                # signed char, perl/pp_pack.c#L2972
                when 'c' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            P5warn( :cat<pack>, "Character in 'c' format wrapped in pack" ) if -128 > $a || $a > 127;
                            $a % 0x100
                        } );
                }
                # unsigned char
                when 'C' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            P5warn( :cat<pack>, "Character in 'C' format wrapped in pack" ) if 0 > $a || $a > 256;
                            $a % 0x100
                        } );
                }
                # signed short | unsigned short (16bit, little endian)
                when 's'       | 'S' | 'v' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            ($a, $a +> 0x08) >>%>> 0x100
                        } );
                }
                # signed long | unsigned long (32bit, little endian)
                when 'l'      | 'L' | 'V' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            ($a, $a +> 0x08, $a +> 0x10, $a +> 0x18) >>%>> 0x100
                        } );
                }
                # signed | unsigned integer (%Config<intsize>, little endian)
                when 'i' | 'I' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            my @b;
                            @b.push( ($a +> ($_ * 0x08)) % 0x100 ) for ^$CONFIG_INTSIZE;
                            @b
                        } );
                }
                # signed | unsigned quad (64bit)
                when 'q' | 'Q' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            ($a, $a +> 0x08, $a +> 0x10, $a +> 0x18, $a +> 0x20, $a +> 0x28, $a +> 0x30, $a +> 0x38) >>%>> 0x100
                        } );
                }
                # unsigned short (16bit, big endian)
                when 'n' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            ($a +> 0x08, $a) >>+&>> 0xFF
                        } );
                }
                # unsigned long (32bit, big endian)
                when 'N' {
                    loop( -> $a is copy {
                            $a = &prefix:<P5+>($a);
                            ($a +> 0x18, $a +> 0x10, $a +> 0x08, $a) >>+&>> 0xFF
                        } );
                }
                # Unicode codepoint to utf8 integer sequence
                when 'U' {
                    loop( -> $a {
                            &prefix:<P5+>($a).chr.encode.list.flat
                        } );
                }
                when 'X' {
                    $pos ?? @bytes.pop !! die "'X' outside of string";
                }
                P5die ~X::Buf::Pack.new(:$directive);
            }
        }
        return utf8.new(@bytes);
    }
    multi method P5unpack(Str:D:) { self.P5unpack( CALLER::DYNAMIC::<$_> ) }
    multi method P5unpack(Str:D: Str $string) {
        my $ret;
        try {
            $ret = $string.encode('binary');
            CATCH {
                default { $ret = $string.encode }
            }
        }
        self.P5unpack($ret)
    }
    multi method P5unpack(Str:D: Blob $string) {
        my @bytes = $string.list;
        my $pos   = 0;
        my $amount;
        my @fields;
        sub next_byte {
            my $byte = +@bytes > $pos ?? @bytes[$pos] !! 0;
            $pos++;
            $byte
        }
        sub loop( Callable $c ) {
            my $bytes = $c.signature.count;
            $amount  /= $bytes;
            for ^$amount {
                my @args = @bytes[$pos ..^ ($pos + $bytes)];
                if [&&] @args>>.defined {
                    @fields.push: $c( |@args );
                }
                $pos += $bytes;
            }
        }
        for self.subst(/'#'\N*<?before $$ >/, '', :g).comb(/<[a..zA..Z]>[\d+|'*']?/) -> $unit {
            my $directive = $unit.substr(0, 1);
            $amount       = $unit.substr(1);
            $amount       = +@bytes - $pos if $amount eq '*';
            $amount       = 1              if $amount eq '';

            given $directive {
                when 'a' | 'A' | 'Z' {
                    my $asciistring;
                    $asciistring ~= chr(next_byte) for ^$amount;
                    @fields.push($asciistring);
                }
                when 'H' {
                    my $hexstring;
                    while +@bytes > $pos {
                        my $byte = next_byte;
                        $hexstring ~= ($byte +> 4).fmt('%x')
                                    ~ ($byte % 16).fmt('%x');
                    }
                    @fields.push($hexstring);
                }
                when 'x' {
                    loop( -> $a { } )
                }
                # signed char, perl/pp_pack.c#L1612
                when 'c' {
                    loop( -> $a is copy {
                            $a -= 256 if $a >= 128;
                            $a
                        } )
                }
                # unsigned char
                when 'C' {
                    loop( -> $a { $a } )
                }
                # signed short (16bit, little endian, perl/pp_pack.c#L1728)
                when 's' {
                    loop( -> $a is copy, $b {
                            $a +|= $b +< 0x08;
                            $a -= 65536 if $a > 32767;
                            $a
                        } )
                }
                # unsigned short (16bit, little endian)
                when 'S' | 'v' {
                    loop( -> $a, $b { $a +| $b +< 0x08 } )
                }
                # signed long (32bit, little endian)
                when 'l' {
                    loop( -> $a is copy, $b, $c, $d {
                            $a +|= $b +< 0x08 +| $c +< 0x10 +| $d +< 0x18;
                            $a -= 4294967296 if $a > 2147483647;
                            $a
                        } )
                }
                # unsigned long (32bit, little endian)
                when 'L' | 'V' {
                    loop( -> $a, $b, $c, $d { $a +| $b +< 0x08 +| $c +< 0x10 +| $d +< 0x18 } )
                }
                # signed int
                when 'i' {
                    for ^$amount {
                        my $a = 0;
                        $a +|= next_byte() +< ($_ * 0x08) for ^$CONFIG_INTSIZE;
                        $a -= 2 ** (8 * $CONFIG_INTSIZE) if $a >= (2 ** (8 * $CONFIG_INTSIZE)) / 2;
                        @fields.push($a)
                    }
                }
                # unsigned int
                when 'I' {
                    for ^$amount {
                        my $a = 0;
                        for ^$CONFIG_INTSIZE { # usually 4 or 8
                            $a +|= next_byte() +< ($_ * 0x08);
                        }
                        @fields.push($a)
                    }
                }
                # signed quad
                when 'q' {
                    loop( -> $a is copy, $b, $c, $d, $e, $f, $g, $h {
                            $a +|= $b +< 0x08 +| $c +< 0x10 +| $d +< 0x18
                               +|  $e +< 0x20 +| $f +< 0x28 +| $g +< 0x30 +| $h +< 0x38;
                            $a -= 18446744073709551616 if $a > 9223372036854775807;
                            $a
                        } )
                }
                # unsigned quad
                when 'Q' {
                    loop( -> $a, $b, $c, $d, $e, $f, $g, $h {
                               $a         +| $b +< 0x08 +| $c +< 0x10 +| $d +< 0x18
                            +| $e +< 0x20 +| $f +< 0x28 +| $g +< 0x30 +| $h +< 0x38
                        } )
                }
                # unsigned short (big-endian)
                when 'n' {
                    loop( -> $a, $b { $a +< 0x08 +| $b } )
                }
                # unsigned long (big-endian)
                when 'N' {
                    loop( -> $a, $b, $c, $d { $a +< 0x18 +| $b +< 0x10 +| $c +< 0x08 +| $d } )
                }
                when 'U' {
                    my $shifted = 0;
                    while $shifted < $amount {
                        my $byte = next_byte;
                        if $byte +> 7 == 0 {
                            @fields.push: utf8.new( $byte ).decode.ord;
                            $shifted++;
                        }
                        elsif $byte +> 5 == 0b110 {
                            @fields.push: utf8.new( $byte, next_byte ).decode.ord;
                            $shifted += 2;
                        }
                        elsif $byte +> 4 == 0b1110 {
                            @fields.push: utf8.new( $byte, next_byte, next_byte ).decode.ord;
                            $shifted += 3;
                        }
                        elsif $byte +> 3 == 0b11110 {
                            @fields.push: utf8.new( $byte, next_byte, next_byte, next_byte ).decode.ord;
                            $shifted += 4;
                        }
                        else {
                            P5die "Cannot unpack byte '" ~ sprintf('%#x', $byte) ~ "' using directive 'U'";
                        }
                    }
                }
                when 'X' {
                    $pos ?? $pos-- !! die "'X' outside of string";
                }
                P5die ~X::Buf::Pack.new(:$directive);
            }
        }

        return |@fields;
    }
}

augment class Int { }
augment class Num { }
augment class Capture { }
augment class Match { }
augment class Regex { }
augment class Rat { }
augment class Parcel { }
augment class Pair { }
augment class Sub { }

# class A { method new { bless([], self)}; method a { 42 } }; my $a = A.new; say $a.a; $a[0] = 1; say $a.WHAT
sub bless(*@a) is export {
    my class Dummy { };
    @a[1] := ::(@a[1]) if nqp::istype(@a[1], Str);
    my $d := Dummy.HOW.new_type( :name(@a[1].^name.uc ~ '=' ~ @a[0].^name.uc ~ '(' ~ @a[0].WHERE.fmt('0x%X').lc ~ ')'), :repr(@a[0].REPR) );
    $d.HOW.add_parent( $d, $_.WHAT ) for @a;
    $d.HOW.compose($d)
};
