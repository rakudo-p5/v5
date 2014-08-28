
use v6.0.0;

my %SIG;
my %INC;
my %STASH; # for ${^SOMETHING} style variables
%STASH<CHILD_ERROR_NATIVE> = 0;

our %WARNINGS_CATS;

sub P5warn(:$cat, *@a) is hidden_from_backtrace {
    if %WARNINGS_CATS<all> || ($cat && %WARNINGS_CATS{$cat}) {
        my $*WITHIN_WARN = 1;
        %SIG<__WARN__> ~~ Callable ?? %SIG<__WARN__>( |@a.list.map(P5Str(*)) ) !! warn( P5Str(@a.list) )
    }
}

# TODO get caller's $@ if no args passed
sub P5die (*@a) is hidden_from_backtrace {
    %SIG<__DIE__>  ~~ Callable ?? %SIG<__DIE__>( |@a.list.map(P5Str(*)) ) !! die( P5Str(@a.list) )
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

role P5Bareword {
    method postcircumfix:<( )>(|) is hidden_from_backtrace {
        my $pkg := nqp::getlexrelcaller(nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())), '$?PACKAGE');
        P5die(sprintf('Undefined subroutine &%s::%s called',
            $pkg =:= GLOBAL ?? 'main' !! $pkg.^name,
            nqp::substr(~self, 1)))
    }
};

multi P5open( Str \SELF, $expr is copy, :$pkg ) is export {
    my $m    = ~$expr.match(/^(<[\<\>|]>+)/);
    $expr    = $expr.subst(/^(<[\<\>|]>+)/, '');
    my $r    = $m eq '<' || !$m;
    if (!$r || $expr.IO.e) && SELF !~~ any(STDOUT|STDERR|'STDOUT'|'STDERR') {
        ?( $pkg.WHO{SELF} = $expr.IO.open( :$r, :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) ) );
    }
}
multi P5open( Str \SELF, $m, $expr, *@list, :$pkg ) is export {
    my $r    = $m eq '<' || !$m;
    if (!$r || $expr.IO.e) && SELF !~~ any(STDOUT|STDERR|'STDOUT'|'STDERR') {
        ?( $pkg.WHO{SELF} = $expr.IO.open( :$r, :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) ) );
    }
}
multi P5open( STDIN \SELF, $expr, :$pkg ) is export {
    SELF.P5open( $expr.substr(0, 1), $expr.substr(1) )
}
multi P5open( \SELF, $m, $expr, *@list, :$pkg ) is export {
    my $r = $m eq '<' || !$m;
    if (!$r || $expr.IO.e) && SELF !~~ any(STDOUT|STDERR) {
        ?( SELF = $expr.IO.open( :$r, :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) ) );
    }
}

class Typeglob {
    has $!descriptor;
    has $.value;
    has $.name;

    method Str {
        if $!value.WHO{ '$' ~ $.name }:exists
        or $!value.WHO{ '%' ~ $.name }:exists
        or $!value.WHO{ '@' ~ $.name }:exists {
            '*'  ~ ($!value ~~ GLOBAL ?? 'main' !! $!value.^name) ~
            '::' ~ $.name
        }
    }

    method name {
        $!name // ($!name = nqp::substr($!descriptor.name, 1))
    }

    method STORE($other) {
        $!name = $other.name;
    }

    method item is rw {
        $!value.WHO{ '$' ~ $.name }
    }

    method hash is rw {
        $!value.WHO{ '%' ~ $.name }
    }

    method list is rw {
        $!value.WHO{ '@' ~ $.name }
    }
    
    method at_key($name) {
        Typeglob.new( :$name, :$!value )
    }
}

multi P5close(P5Bareword \SELF, :$pkg) is export {
    $pkg.WHO{SELF} && $pkg.WHO{SELF}.close
}
multi P5close(\SELF, :$pkg) is export {
    SELF && SELF.close
}


role P5MatchPos {
    has $.last-match is rw;
}

sub EXPORT(|) {
    my %ex;
    %ex<Typeglob>                 := Typeglob;
    %ex<STDIN>                    := STDIN;
    %ex<STDOUT>                   := STDOUT;
    %ex<STDERR>                   := STDERR;
    %ex<@ARGV>                    := @*ARGS;
    %ex<%INC>                     := %INC;
    %ex<%ENV>                     := %*ENV;
    %ex<%SIG>                     := %SIG;
    %ex<$$>                       := $*PID;
    %ex<$]>                       := $VERSION_FLOAT;
    %ex<$;>                       := $SUBSCRIPT_SEPARATOR;
    %ex<$|>                       := $OUTPUT_AUTOFLUSH_P;
    %ex<$?>                       := $CHILD_ERROR;

    %ex<$^>                       := $FORMAT_TOP_NAME;
    %ex<$^O>                      := $*DISTRO.name;
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
    %ex<%*WARNINGS_CATS>          := %WARNINGS_CATS;

    %ex<main>                     := GLOBAL;

    %ex
}

sub fail($a?) is export { use Test; ::('&flunk')( $a // '' ) }

sub P5binmode(|) is export { }

# http://perldoc.perl.org/functions/chr.html
sub P5chr($ord) is export is hidden_from_backtrace {
    if $ord < 0 {
        # Negative values give the Unicode replacement character (chr(0xfffd)), except under the bytes
        # pragma, where the low eight bits of the value (truncated to an integer) are used.
        if $*USE_BYTES {
            chr($ord +& 0xFF)
        }
        else {
            P5warn("Invalid negative number ($ord) in chr");
            chr(0xfffd)
        }
    }
    else {
        chr($ord)
    }
}

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
multi sub undef()         is export { Any              }
multi sub undef($a is rw) is export { undefine $a; Any }

# http://perldoc.perl.org/functions/system.html
sub system(*@a) is export { shell(@a).status || '' }

### Operators by precedence

# x=, autoincrement (++ and --)
sub ::('prefix:<P5++>') (\a)    is export { ++a }
sub ::('prefix:<P5-->') (\a)    is export { --a }
sub ::('postfix:<P5++>')(\a)    is export { a++ }
sub ::('postfix:<P5-->')(\a)    is export { a-- }

# w= exponentiation (right **)
sub ::('infix:<P5**>') (\a, \b) is export { &prefix:<P5+>(a) ** &prefix:<P5+>(b) }

# v=, symbolic unary (right ! ~ \ and unary + and -)
sub ::('prefix:<P5!>') (\a)     is export { !P5Bool(a)   }
sub ::('prefix:<P5~>') (\a)     is export { 18446744073709551616 - (P5Numeric(a) + 1)   }
sub ::('prefix:<P5.>') (\a)     is export {  P5Str(a)    }
sub ::('prefix:<P5+>') (\a)     is export {  P5Numeric(a) }
sub ::('prefix:<P5->') (\a)     is export { -P5Numeric(a) }
sub ::('prefix:<P5bs>')(\a)     is export { a }

# u=, binding (left =~ !~)
#~ sub ::('infix:<P5=~>') (\a, \b) is export { say a; say b; a.match(b)           }
#~ sub ::('infix:<P5!~>') (\a, \b) is export { !&infix:<P5=~>(a, b) }

# t=, subplicative (left * / % x)
sub ::('infix:<P5*>')  (\a, \b) is export { &prefix:<P5+>(a) * &prefix:<P5+>(b) }
sub ::('infix:<P5/>')  (\a, \b) is export { &prefix:<P5+>(a) / &prefix:<P5+>(b) }
sub ::('infix:<P5%>')  (\a, \b) is export { &prefix:<P5+>(a) % &prefix:<P5+>(b) }
sub ::('infix:<P5x>')  (\a, \b) is export { &prefix:<P5.>(a) x &prefix:<P5+>(b) }

# s=, additive (left + - .)
sub ::('infix:<P5+>')  (\a, \b) is export { &prefix:<P5+>(a) + &prefix:<P5+>(b) }
sub ::('infix:<P5->')  (\a, \b) is export { &prefix:<P5+>(a) - &prefix:<P5+>(b) }
sub ::('infix:<P5.>')  (*@a)    is export { [~] map { &prefix:<P5.>($_) }, @a   }

# r=, shift (left << >>)
sub ::('infix:<P5<<>') (\a, \b) is export { &prefix:<P5+>(a) +< &prefix:<P5+>(b) }
sub ::('infix:<P5>>>') (\a, \b) is export { &prefix:<P5+>(a) +> &prefix:<P5+>(b) }

# p=, comparison (nonassoc < > <= >= lt gt le ge)
sub ::('infix:<P5<>')  (\a, \b) is export { &prefix:<P5+>(a) <  &prefix:<P5+>(b) }
sub ::('infix:<P5>>')  (\a, \b) is export { &prefix:<P5+>(a) >  &prefix:<P5+>(b) }
sub ::('infix:<P5<=>') (\a, \b) is export { &prefix:<P5+>(a) <= &prefix:<P5+>(b) }
sub ::('infix:<P5>=>') (\a, \b) is export { &prefix:<P5+>(a) >= &prefix:<P5+>(b) }

# o=, equality (nonassoc == != <=> eq ne cmp ~~)
sub ::('infix:<P5==>') (\a, \b) is export { &prefix:<P5+>(a) == &prefix:<P5+>(b) }
sub ::('infix:<P5!=>') (\a, \b) is export { !&infix:<P5==>(a, b)                 }
multi ::('infix:<P5<=>>')(\a, \b) is export { nqp::p6box_i(nqp::cmp_I(nqp::decont(&prefix:<P5+>(a)), nqp::decont(&prefix:<P5+>(b)))) }
multi ::('infix:<P5<=>>')(int $a, int $b) is export { nqp::p6box_i(nqp::cmp_i($a, $b)) }
sub ::('infix:<P5eq>') (\a, \b) is export { &prefix:<P5.>(a) eq &prefix:<P5.>(b) }
sub ::('infix:<P5ne>') (\a, \b) is export { !&infix:<P5eq>(a, b)                 }
multi ::('infix:<P5cmp>')(\a, \b) is export { +(&prefix:<P5.>(a) cmp &prefix:<P5.>(b)) }
multi ::('infix:<P5cmp>')(int $a, int $b) is export { nqp::p6box_i(nqp::cmp_i($a, $b)) }
sub ::('infix:<P5~~>') (\a, \b) is export { &prefix:<P5.>(a) ~~ &prefix:<P5.>(b) }

# n=, bitwise and (left &)
multi ::('infix:<P5&>')(Str \a, Str \b) is export { &prefix:<P5.>(a) ~& &prefix:<P5.>(b) }
multi ::('infix:<P5&>')(\a, \b)         is export { &prefix:<P5+>(a) +& &prefix:<P5+>(b) }

# m=, bitwise or (left | ^)
multi ::('infix:<P5|>')(\a, \b)         is export { &prefix:<P5+>(a) +| &prefix:<P5+>(b) }
multi ::('infix:<P5^>')(\a, \b)         is export { &prefix:<P5+>(a) +^ &prefix:<P5+>(b) }

# l=, tight and (left &&)

# k=, tight or (left || //)

# j=, range (nonassoc .. ...)
sub ::('infix:<P5..>') (\a, \b) is export is hidden_from_backtrace {
    (a.defined ?? a !! P5warn(:cat<uninitialized>, "Use of uninitialized value {a.VAR.?name} in range (or flop)") || 0)
    ..
    (b.defined ?? b !! P5warn(:cat<uninitialized>, "Use of uninitialized value {b.VAR.?name} in range (or flop)") || 0)
}
sub ::('infix:<P5...>')(\a, \b) is export is hidden_from_backtrace {
    (a.defined ?? a !! P5warn(:cat<uninitialized>, "Use of uninitialized value {a.VAR.?name} in range (or flop)") || 0)
    ...
    (b.defined ?? b !! P5warn(:cat<uninitialized>, "Use of uninitialized value {b.VAR.?name} in range (or flop)") || 0)
}

# i=, conditional (right ?:)

# h=, assignment (right = += -= *= etc.)
sub ::('infix:<P5|=>') (\a, \b)  is rw is export { a = &infix:<P5|>(a, b); a }
sub ::('infix:<P5&=>') (\a, \b)  is rw is export { a = &infix:<P5&>(a, b); a }
sub ::('infix:<P5||=>')(\a, \b)  is rw is export { (a ~~ Parcel ?? a[*-1] !! a) = b unless P5Bool(a); a }
sub ::('infix:<P5&&=>')(\a, \b)  is rw is export { (a ~~ Parcel ?? a[*-1] !! a) = b     if P5Bool(a); a }
sub ::('infix:<P5+=>') (\a, \b)  is rw is export { a = &infix:<P5+>(a, b); a }
sub ::('infix:<P5-=>') (\a, \b)  is rw is export { a = &infix:<P5->(a, b); a }
sub ::('infix:<P5*=>') (\a, \b)  is rw is export { a = &infix:<P5*>(a, b); a }
sub ::('infix:<P5/=>') (\a, \b)  is rw is export { a = &infix:<P5/>(a, b); a }
sub ::('infix:<P5.=>') (\a, \b)  is rw is export { a = &infix:<P5.>(a, b); a }

# g=, comma (left , =>)
multi ::('infix:<P5=>>')(*@a) is export { @a }

# e=, loose not (right not)
multi ::('prefix:<P5not>') (*@a) is export { +@a ?? !([&&] map { P5Bool($_) }, @a) !! 1 }

# d=, loose and (left and)

# c=, loose or (left or xor)


multi ::('trait_mod:<is>')(Routine:D $r, :$lvalue!) is export {
    $r.set_rw();
}

multi ::('postcircumfix<P5[ ]>')(Any \SELF)                        is export { SELF.list                   }
multi ::('postcircumfix<P5[ ]>')(Any \SELF, int $pos)        is rw is export { SELF.at_pos(P5Numeric($pos)) }
multi ::('postcircumfix<P5[ ]>')(Any \SELF, $pos)            is rw is export { SELF.at_pos(P5Numeric($pos)) }
multi ::('postcircumfix<P5[ ]>')(Any \SELF, Positional \pos) is rw is export {
    if nqp::iscont(pos) {
        return SELF.at_pos(pos)
    }
    my $list = pos.flat;
    $list.gimme(*);
    $list.map($list.infinite
               ?? { last if $_ >= SELF.list.gimme($_ + 1); SELF[P5Numeric($_)] }
               !! { SELF[P5Numeric($_)] }).eager.Parcel;
}

multi P5Bool(Mu     \SELF) is export { SELF ?? 1                 !! '' }
multi P5Bool(Parcel \SELF) is export { SELF ?? [||] SELF.list    !! '' }
multi P5Bool(List   \SELF) is export { SELF ?? [||] SELF.list    !! '' }
multi P5Bool(Pair   \SELF) is export { SELF ?? [||] SELF.kv.list !! '' }

sub P5can(Mu $pkg, $method, *@a) is export {
    my $p := GLOBAL::{ $pkg.^name };

    # The package has a can method, just all it.
    if $p.HOW.method_table($p)<can> {
        $p.can(~$method, |@a)
    }
    # Do what UNIVERSAL->can does if the package has no 'can' method.
    else {
        if $p.^can(~$method) {
            $p.HOW.method_table($p){~$method}
        }
        else {
            ''
        }
    }
}

multi P5chdir(\SELF) is export { chdir(SELF) }
multi P5chdir()      is export { %*ENV<HOME> ?? chdir(%*ENV<HOME>) !! %*ENV<LOGDIR> ?? chdir(%*ENV<LOGDIR>) !! False }

sub P5do(Mu \SELF) is export is hidden_from_backtrace {
    my $ret;
    if SELF {
        if SELF.IO.e {
            try {
                $ret = EVAL slurp SELF;
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

my role IteratorPosition { has $.iterator-position is rw = 0  }
multi P5each(Mu:U) is export { Nil }
multi P5each(Mu:D) is export {
    P5warn 'Type of argument to each on reference must be unblessed hashref or arrayref';
    Nil
}
multi P5each(List:D \SELF is rw) {
    SELF does IteratorPosition unless SELF ~~ IteratorPosition;
    if SELF.iterator-position > SELF.list.end {
        SELF.iterator-position = 0;
        Nil
    }
    else {
        my @kv = SELF.iterator-position, SELF.list[SELF.iterator-position];
        SELF.iterator-position++;
        @kv
    }
}
multi P5each(Hash:D \SELF is rw) is export {
    SELF does IteratorPosition unless SELF ~~ IteratorPosition;
    SELF.iterator-position > SELF.list.end
        ?? (SELF.iterator-position = 0) || Nil
        !! SELF.list[ SELF.iterator-position++ ].kv
}

sub P5INDIRECT_NAME_LOOKUP($root, *@chunks, :$object is copy, :$method) is export is rw {
    # note that each part of @chunks itself can
    # contain double colons. That's why joining and
    # re-splitting is necessary
    my Str $name = @chunks.join('::');
    my @parts    = $name.split('::');
    my $first    = @parts.shift;
    my $has_sigil;
    if @parts && '$@%&'.index($first.substr(0, 1)).defined {
        $has_sigil = 1;
        # move sigil from first to last chunk, because
        # $Foo::Bar::baz is actually stored as Foo::Bar::$baz
        my $last_idx      = @parts.end;
        @parts[$last_idx] = $first.substr(0, 1) ~ @parts[$last_idx]; 
        $first            = $first.substr(1);
        if $first eq '' {
            $first = @parts.shift;
            $name = @chunks.join('::');
        }
    }
    $object //= $name;
    my Mu $thing := $root.exists_key($first) ?? $root{$first} !!
                    GLOBAL::.exists_key($first) ?? GLOBAL::{$first} !!
                    !$method && !$has_sigil ?? (return $name but P5Bareword) !! # check that we do not have args?
                    !$method ?? X::NoSuchSymbol.new(symbol => $name).fail !!
                    $method eq 'isa' || $method eq 'can' ?? Str !!
                    X::AdHoc.new(payload => "Can't locate object method \"$method\" via package \"$object\" (perhaps you forgot to load \"$object\"?)").fail;
    for @parts {
        unless $thing.WHO.exists_key($_) {
            $method eq 'isa' || $method eq 'can' ?? Str !!
            X::AdHoc.new(payload => "Can't locate object method \"$method\" via package \"$object\" (perhaps you forgot to load \"$object\"?)").fail;
        }
        $thing := $thing.WHO{$_};
    }
    $thing;
}

multi P5isa()           is hidden_from_backtrace is export { P5die "Usage: UNIVERSAL::isa(reference, kind)" }
multi P5isa(\reference) is hidden_from_backtrace is export { P5die "Usage: UNIVERSAL::isa(reference, kind)" }
multi P5isa(\reference, \kind) is export { reference.isa(kind) }

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
                    if nqp::islt_i($p, 0);
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
                $ch     = nqp::isgt_i($pos, -1) && nqp::islt_i($pos, $eos) && nqp::ord($str, $pos);
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

                my num $exp  = nqp::atpos($parse, 0).Num;
                my num $coef = $frac ?? nqp::add_n($int.Num, nqp::div_n($frac.Num, $base.Num)) !! $int.Num;
                return nqp::p6box_n(nqp::mul_n($coef, nqp::pow_n(10e0, $exp)));
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
            return $neg ?? -Inf !! Inf;
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
        return $result if nqp::islt_i($pos, 0) || nqp::iseq_i($pos, $eos);

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
    return $result if nqp::islt_i($pos, 0) || nqp::iseq_i($pos, $eos);

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

sub P5pack(Mu \SELF, *@items) is export is hidden_from_backtrace {
    return buf8.new unless defined SELF;
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
    
    for SELF.subst(/'#'\N*<?before $$ >/, '', :g).comb(/<[a..zA..Z]>[\d+|'*']?/) -> $unit {
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
                if $hexstring.chars % 2 {
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
                        $a = &prefix:<P5+>($a).Int;
                        P5warn( :cat<pack>, "Character in 'c' format wrapped in pack" ) if -128 > $a || $a > 127;
                        $a % 0x100
                    } );
            }
            # unsigned char
            when 'C' {
                loop( -> $a is copy {
                        $a = &prefix:<P5+>($a).Int;
                        P5warn( :cat<pack>, "Character in 'C' format wrapped in pack" ) if 0 > $a || $a > 256;
                        $a % 0x100
                    } );
            }
            # signed short | unsigned short (16bit, little endian)
            when 's'       | 'S' | 'v' {
                loop( -> $a is copy {
                        $a = &prefix:<P5+>($a).Int;
                        ($a, $a +> 0x08) >>%>> 0x100
                    } );
            }
            # signed long | unsigned long (32bit, little endian)
            when 'l'      | 'L' | 'V' {
                loop( -> $a is copy {
                        $a = &prefix:<P5+>($a).Int;
                        ($a, $a +> 0x08, $a +> 0x10, $a +> 0x18) >>%>> 0x100
                    } );
            }
            # signed | unsigned integer (%Config<intsize>, little endian)
            when 'i' | 'I' {
                loop( -> $a is copy {
                        $a = &prefix:<P5+>($a).Int;
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
                        $a = &prefix:<P5+>($a).Int;
                        ($a +> 0x08, $a) >>+&>> 0xFF
                    } );
            }
            # unsigned long (32bit, big endian)
            when 'N' {
                loop( -> $a is copy {
                        $a = &prefix:<P5+>($a).Int;
                        ($a +> 0x18, $a +> 0x10, $a +> 0x08, $a) >>+&>> 0xFF
                    } );
            }
            # Unicode codepoint to utf8 integer sequence
            when 'U' {
                loop( -> $a {
                        &prefix:<P5+>($a).chr.encode.list.flat
                    } );
            }
            when 'w' {
                sub pack-w($int) {
                    if $int > 0x80 {
                        @bytes.push: (($int +> 7) +& 0x7F) +| 0x80;
                        pack-w( $int % 0x80 )
                    }
                    else {
                        @bytes.push: $int;
                    }
                }
                loop( -> $a { pack-w($a) } );
            }
            when 'X' {
                $pos ?? @bytes.pop !! P5warn "'X' outside of string";
            }
            P5die ~X::Buf::Pack.new(:$directive);
        }
    }
    return buf8.new(@bytes);
}

sub P5pop(Mu \SELF) is export {
    my $r;
    try {
        $r = SELF.list.pop;
        CATCH {
            default {
                $r = Any;
            }
        }
    }
    $r = Any if $r ~~ Failure;
    $r
}

# RT #122447
sub P5pos($s is rw) is export {
    #~ Proxy.new(
        #~ FETCH => sub ($) {
            #~ $s ~~ P5MatchPos && $s.last-match ~~ Match ?? $s.last-match.to !! Any
        #~ },
        #~ STORE => sub ($, $) {
            #~ if $s.defined {
                #~ $s does P5MatchPos unless $s ~~ P5MatchPos;
                #~ $s.last-match = Match.new
            #~ }
        #~ }
    #~ )
}

sub P5print(*@a is copy, :$pkg) is export {
    my $fh = +@a && @a[0] ~~ any($*OUT|$*ERR|STDOUT|STDERR|IO::Handle|P5Bareword) ?? @a.shift !! $*OUT;
    $fh    = $pkg.WHO{$fh} if $fh ~~ P5Bareword;
    @a.push: CALLER::DYNAMIC::<$_> unless +@a;

    $fh.print( P5Str(@a) )
}

proto P5push(|) is hidden_from_backtrace { * }
multi P5push(Mu \SELF, *@a) is export is hidden_from_backtrace {
    SELF !~~ Hash && !SELF.VAR.isa(Scalar)
        ?? P5die "Type of arg 1 to push must be array (not constant item)"
        !! P5die "Not an ARRAY reference"
}
multi P5push(Positional \SELF, *@a) is export is hidden_from_backtrace {
    try SELF.list.push: |@a;
    SELF.list.elems // 0
}

multi P5rand(        ) is export { 1.rand           }
multi P5rand(Mu \SELF) is export { (SELF || 1).rand }

# http://perldoc.perl.org/functions/read.html
sub P5read($fh is copy, $target is rw, $length, $offset = 0, :$pkg) is export {
    $fh        = $pkg.WHO{$fh} if $fh ~~ P5Bareword;
    $target  //= '';
    my $read   = P5Str(try $fh.read($length));
    my $tchars = $target.chars;
    if $offset > $tchars {
        $target = $target ~ (0.chr x ($offset - $tchars)) ~ $read;
    }
    elsif $offset >= 0 {
        $target = $target.substr(0, $offset) ~ $read;
    }
    else { # $offset is negetive
        $target = $target.substr(0, $tchars + $offset) ~ $read;
    }
    $read.chars
}


multi P5ref(Mu    \SELF) is export { '' }
multi P5ref(Cool  \SELF) is export { '' }
multi P5ref(Any:D \SELF) is export {
    my $name = SELF.^name.uc;
    $name eq 'SUB' ?? 'CODE' !! $name
}

sub P5say(*@a is copy, :$pkg) is export {
    my $fh = +@a && @a[0] ~~ any($*OUT|$*ERR|STDOUT|STDERR|IO::Handle|P5Bareword) ?? @a.shift !! $*OUT;
    $fh    = $pkg.WHO{$fh} if $fh ~~ P5Bareword;
    @a.push: CALLER::DYNAMIC::<$_> unless +@a;

    $fh.say( P5Str(@a) )
}

multi P5scalar(Mu      \SELF) is export { SELF     }
multi P5scalar(Array:D \SELF) is export { +@(SELF) }
multi P5scalar(List:D  \SELF) is export { +@(SELF) }
multi P5scalar(Hash:D  \SELF) is export {
    SELF.elems && (SELF.elems ~ '/' ~ (SELF.elems < 8 ?? 8 !! (2 ** (1 + SELF.elems.msb))))
}

sub P5shift(Mu \SELF) is export {
    my $r;
    try {
        $r = SELF.list.shift;
        CATCH {
            default {
                $r = Any;
            }
        }
    }
    $r = Any if $r ~~ Failure;
    $r
}

sub P5seek($fh is copy, $pos, $whence, :$pkg) is export {
    $fh = $pkg.WHO{$fh} if $fh ~~ P5Bareword;
    $fh.seek($pos, $whence)
}

sub P5splice(\arr, $off is copy = 0, $len? is copy, *@lst) is export {
    $off  += +@(arr) if $off < 0;
    $len //= +@(arr) - $off;
    $len  += +@(arr) - $off if $len < 0;
    arr.splice($off, $len, @lst)
}

multi P5split(Regex $pattern) is export {
    P5split($pattern, nqp::getlexrelcaller(nqp::ctxcaller(nqp::ctxcaller(nqp::ctx())), '$_'))
}
multi P5split(Cool $delimiter) is export {
    P5split($delimiter, nqp::getlexrelcaller(nqp::ctxcaller(nqp::ctx()), '$_'))
}
multi P5split(Regex $pat, $expr, $limit = *) {
    return ().list
      if $limit ~~ Numeric && $limit <= 0;
    my @matches = nqp::istype($limit, Whatever)
      ?? $expr.match($pat, :g)
      !! $expr.match($pat, :x(1..$limit-1), :g);

    push @matches, Match.new( :from($expr.chars) );
    my $prev-pos = 0;
    if +@matches {
        @matches.shift if .from == .to == 0 given @matches[0]
    }
    my $elems = +@matches;
    my $i = 0;
    @matches = map {
        my $value = $expr.substr($prev-pos, .from - $prev-pos);
        $prev-pos = .to;
        $value
    }, @matches;
    @matches.pop while @matches[*-1] eq "";
    @matches
}

multi P5split(Cool $delimiter, $expr, $limit = *) {
    my $match-string = $delimiter.Str;
    return if $expr eq '' && $delimiter eq '';

    my $l = $limit ~~ Whatever ?? Inf !! $limit;
    return ().list      if $l <= 0;
    return ($expr).list if $l == 1;

    my $c = 0;
    my $done = 0;
    if $match-string eq "" {
        my $chars = $expr.chars;
        map {
            last if $done;

            if --$chars and --$l {
                $expr.substr($c++, 1);
            }
            else {
                $done = 1;
                $expr.substr($c);
            }
        }, 1 .. $l;
    }
    else {
        my $width = $match-string.chars;
        map {
            last if $done;

            my $m = $expr.index($match-string, $c);
            if $m.defined and --$l {
                my $value = $expr.substr($c, $m - $c);
                $c = $m + $width;
                $value;
            }
            else {
                $done = 1;
                $expr.substr($c);
            }
        }, 1 .. $l;
    }
}

multi P5Str(Mu:U, :$joiner) is export is hidden_from_backtrace {
    P5warn(:cat<uninitialized>, 'Use of uninitialized value in string') unless $*WITHIN_WARN;
    ''
}
multi P5Str(Mu:D     \SELF) is export { SELF.Str }
multi P5Str(Bool:D   \SELF) is export { ?SELF ?? 1 !! '' }
multi P5Str(Array:D  \SELF, :$joiner = '') is export { join $joiner, map { $_.defined ?? P5Str($_) !! '' }, @(SELF) }
multi P5Str(List:D   \SELF, :$joiner = '') is export { join $joiner, map { $_.defined ?? P5Str($_) !! '' }, @(SELF) }
multi P5Str(buf8:D   \SELF) is export { try { SELF.decode } // nqp::unbox_s(nqp::decode(nqp::decont(SELF), 'ascii')) }
multi P5Str(utf8:D   \SELF) is export { try { SELF.decode } // nqp::unbox_s(nqp::decode(nqp::decont(SELF), 'ascii')) }
multi P5Str(Int:D    \SELF) is export { SELF.Int }
multi P5Str(Num:D    \SELF) is export { SELF.Num }
multi P5Str(Parcel:D \SELF) is export { SELF.Int }
multi P5Str(Pair:D   \SELF) is export { P5Str(SELF.kv.list) }
multi P5Str(Sub:D    \SELF) is export { 'CODE(' ~ SELF.WHERE.fmt('0x%X').lc ~ ')' }

multi P5substr(\str, $off is copy, $len is copy, $repl) is export {
    P5substr(str, $off, $len) = $repl
}
multi P5substr(\str, $off is copy = 0, $len? is copy) is export {
    $off  += str.chars if $off < 0;
    $len //= str.chars - $off;
    $len  += str.chars - $off if $len < 0;
    substr-rw(str, $off, $len)
}

sub P5unshift(Mu \SELF, *@a) is export {
    try SELF.list.unshift: |@a;
    SELF.list.elems // 0
}

my class LSM {
    has Str $!source;
    has @!substitutions;

    has int $!index;
    has int $!next_match;
    has $!next_substitution;
    has $!substitution_length;

    has str $.unsubstituted_text;
    has str $.substituted_text;
    
    submethod BUILD(:$!source) { }

    method add_substitution($key, $value) {
        push @!substitutions, $key => $value;
    }

    submethod compare_substitution($substitution, Int $pos, Int $length) {
        if $!next_match > $pos
           || $!next_match == $pos && $!substitution_length < $length {

            $!next_match = $pos;
            $!substitution_length = $length;
            $!next_substitution = $substitution;
        }
    }

    proto method triage_substitution(|) {*}
    multi method triage_substitution($_ where { .key ~~ Regex }) {
        my $key = .key;
        return unless $!source.substr($!index) ~~ $key;
        self.compare_substitution($_, $!index + $/.from, $/.to - $/.from);
    }

    multi method triage_substitution($_ where { .key ~~ Cool }) {
        return unless defined index($!source, .key, $!index);
        self.compare_substitution($_,
                                  index($!source, .key, $!index),
                                  .key.chars);
    }

    multi method triage_substitution($_) {
        X::Str::Trans::IllegalKey.new(key => $_).throw;
    }

    proto method increment_index(|) {*}
    multi method increment_index(Regex $s) {
        $!source.substr($!index) ~~ $s;
        $!index = $!next_match + $/.chars;
    }

    multi method increment_index(Cool $s) {
        $!index = $!next_match + nqp::chars($s.Str);
    }

    method next_substitution() {
        $!next_match = $!source.chars;

        for @!substitutions {
            self.triage_substitution($_);
        }

        $!unsubstituted_text # = nqp::substr(nqp::unbox_s($!source), $!index, 
            = $!source.substr($!index, $!next_match - $!index);
        if defined $!next_substitution {
            my $result = $!next_substitution.value;
            $!substituted_text
                = nqp::unbox_s(($result ~~ Callable ?? $result() !! $result).Str);
            self.increment_index($!next_substitution.key);
        }

        return $!next_match < $!source.chars;
    }
}

sub P5trans($self is rw, *@changes) is export {
    my sub expand($s) {
        return $s.list if $s ~~ Iterable|Positional;
        gather for $s.comb(/ (\w) '..' (\w) | . /, :match) {
            if .[0] {
                take $_ for ~.[0] .. ~.[1];
                0;
            } else {
                take ~$_;
            }
        }
    }

    my $lsm     = LSM.new(:source(~$self));
    for (@changes) -> $p {
        X::Str::Trans::InvalidArg.new(got => $p).throw unless $p ~~ Pair;
        if $p.key ~~ Regex {
            $lsm.add_substitution($p.key, $p.value);
        }
        elsif $p.value ~~ Callable {
            my @from = expand $p.key;
            for @from -> $f {
                $lsm.add_substitution($f, $p.value);
            }
        }
        else {
            my @from = expand $p.key;
            my @to = expand $p.value;
            for @from Z (@to ?? @to xx ceiling(@from / @to) !! '' xx @from) -> $f, $t {
                $lsm.add_substitution($f, $t);
            }
        }
    }

    my str $r;
    my $c = 0;
    while $lsm.next_substitution {
        $r = $r ~ nqp::unbox_s($lsm.unsubstituted_text)
                ~ nqp::unbox_s($lsm.substituted_text);
        $c += $lsm.unsubstituted_text.chars;
    }
    try $self = $r ~ nqp::unbox_s($lsm.unsubstituted_text);
    $c += $lsm.unsubstituted_text.chars;

    return $self.chars - $c;
}

multi P5unlink(Str:D \SELF) is export {
    my $abspath = IO::Spec.rel2abs(SELF);
    if 0 == nqp::unlink($abspath) {
        return 1
    }
    else {
        CALLER::DYNAMIC::<$!> = X::IO::Unlink.new( :path(SELF), os-error => $!.Str );
        return 0
    }
}
multi P5unlink(*@a) is export { [+] map { P5unlink($_) }, @a }

multi P5unpack(\SELF, Mu $thing)         is export { P5unpack(SELF, ~$thing ) }
multi P5unpack(Str:D \SELF)              is export { P5unpack(SELF, CALLER::DYNAMIC::<$_> ) }
multi P5unpack(Str:D \SELF, Str $string) is export {
    my $ret;
    try {
        $ret = $string.encode('ascii');
        CATCH {
            default { $ret = $string.encode }
        }
    }
    P5unpack(SELF, $ret)
}
multi P5unpack(Str:D \SELF, Blob $string) is export {
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
    for SELF.subst(/'#'\N*<?before $$ >/, '', :g).comb(/<[a..zA..Z]>[\d+|'*']?/) -> $unit {
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
            when 'w' {
                sub unpack-w($byte, $i=7) {
                    $byte > 0x80 ?? (($byte +& 0x7F) +< $i) + unpack-w(next_byte, $i+7) !! $byte
                }
                for ^$amount {
                    @fields.push: unpack-w(next_byte)
                }
            }
            when 'X' {
                $pos ?? $pos-- !! P5warn "'X' outside of string";
            }
            P5die ~X::Buf::Pack.new(:$directive);
        }
    }

    return |@fields;
}

# class A { method new { bless([], self)}; method a { 42 } }; my $a = A.new; say $a.a; $a[0] = 1; say $a.WHAT
sub bless(*@a) is export {
    my class Dummy { };
    @a[1] := ::(@a[1]) if nqp::istype(@a[1], Str);
    my $d := Dummy.HOW.new_type( :name(@a[1].^name.uc ~ '=' ~ @a[0].^name.uc ~ '(' ~ @a[0].WHERE.fmt('0x%X').lc ~ ')'), :repr(@a[0].REPR) );
    $d.HOW.add_parent( $d, $_.WHAT ) for @a;
    $d.HOW.compose($d)
};
