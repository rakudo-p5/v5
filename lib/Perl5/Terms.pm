
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
}
class STDERR {
    method say  (*@a) { $*ERR.say(   join('', @a) ) }
    method print(*@a) { $*ERR.print( join('', @a) ) }
}

sub EXPORT(|) {
    my %ex;
    %ex<STDIN>                    := STDIN;
    %ex<STDOUT>                   := STDOUT;
    %ex<STDERR>                   := STDERR;
    %ex<%ENV>                     := %*ENV;
    %ex<@INC>                     := %*CUSTOM_LIB<Perl5>;
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
    %ex<$^M>                       = Mu;
        
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

    %ex
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

multi sub open( $fh is rw, $expr )             is export { open( $fh, $expr.substr(0, 1), $expr.substr(1) ) }
multi sub open( $fh is rw, $m, $expr, *@list ) is export {
    # ($path, :r(:$r), :w(:$w), :a(:$a), :p(:$p), :bin(:$bin), :chomp(:$chomp) = { ... }, :enc(:encoding(:$encoding)) = { ... })
    $fh = $expr.IO.open( :r($m eq '<'), :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) );
}

sub close( IO::Handle $fh ) is export { $fh.close }

sub ref($o) is export {
    $o.^name.uc
}

sub exists( \a ) is export { a:exists ?? 1 !! '' }

# http://perldoc.perl.org/functions/undef.html
multi sub undef()         is export { Nil              }
multi sub undef($a is rw) is export { undefine $a; Nil }

multi prefix:<P5~>(\a)     is export { a.P5Str }
multi infix:<P5~>(*@a)     is export { [~] map { &prefix:<P5~>($_) }, @a }
multi infix:<|=> (\a, \b)  is export { a = a +& b        }
multi infix:<&=> (\a, \b)  is export { a = a +| b        }
multi infix:<||=>(\a, \b)  is export { a = b unless a    }
multi infix:<&&=>(\a, \b)  is export { a = b if a        }
multi infix:<+=> (\a, \b)  is export { a = a + b         }
multi infix:<-=> (\a, \b)  is export { a = a - b         }
multi infix:<*=> (\a, \b)  is export { a = a * b         }
multi infix:</=> (\a, \b)  is export { a = a / b         }

multi trait_mod:<is>(Routine:D $r, :$lvalue!) is export {
    $r.set_rw();
}

use Perl5::warnings ();
use MONKEY_TYPING;

sub _P5do( $file ) is hidden_from_backtrace {
    my $ret;
    if $file {
        if $file.IO.e {
            try {
                $ret = eval slurp $file;
                CATCH {
                    default { warn(CALLER::DYNAMIC::<$!> = .Str) }
                }
            }
        }
    }
    else {
        die 'Null filename used'
    }
    $ret
}

augment class Any {
    method P5Str(Any:) is hidden_from_backtrace {
        if warnings::enabled('all') || warnings::enabled('uninitialized') {
            warn 'Use of uninitialized value in string'
        }
        ''
    }
    method P5do(Any:) is hidden_from_backtrace { _P5do(self) }
    method P5scalar(Any:) { '' }
}

augment class Nil {
    method P5Str(Nil:U:) is hidden_from_backtrace {
        if warnings::enabled('all') || warnings::enabled('uninitialized') {
            warn 'Use of uninitialized value in string'
        }
        ''
    }
    method P5do(Nil:) is hidden_from_backtrace { _P5do(self) }
    method P5scalar(Nil:) { Nil }
}

augment class Bool {
    multi method P5Str(Bool:U:) { '' }
    multi method P5Str(Bool:D:) { ?self ?? 1 !! '' }
    method P5scalar(Bool:) { self.P5Str }
}

augment class Array {
    multi method P5Str(Array:U:) { '' }
    multi method P5Str(Array:D:) { join '', map { $_.defined ?? $_.P5Str !! '' }, @(self) }
    method P5scalar(Array:) { +@(self) }
}

augment class List {
    multi method P5Str(List:U:) { '' }
    multi method P5Str(List:D:) { join '', map { $_.defined ?? $_.P5Str !! '' }, @(self) }
    method P5scalar(List:) { +@(self) }
}

augment class Str {
    multi method P5Str(Str:D:) { self.Str    }
    method P5do(Str:)          { _P5do(self) }
    method P5scalar(Str:) { self.P5Str }
}

augment class Int {
    multi method P5Str(Int:U:) { '' }
    multi method P5Str(Int:D:) { self.Int }
    method P5scalar(Int:) { self.P5Str }
}

augment class Num {
    multi method P5Str(Num:U:) { '' }
    multi method P5Str(Num:D:) { self.Num }
    method P5scalar(Num:) { self.P5Str }
}

augment class Capture {
    multi method P5Str(Capture:D:) { self.Str }
    method P5scalar(Capture:) { self.P5Str }
}

augment class Rat {
    multi method P5Str(Rat:D:) { self.Str }
    method P5scalar(Rat:) { self.P5Str }
}

augment class Parcel {
    multi method P5Str(Parcel:D:) { self.Int }
    method P5scalar(Parcel:) { self.P5Str }
}

augment class Sub {
    multi method P5Str(Sub:D:) { 'CODE(' ~ self.WHERE.fmt('0x%X').lc ~ ')' }
    method P5scalar(Sub:) { self.P5Str }
}
