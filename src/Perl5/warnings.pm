
use v6;

# http://perldoc.perl.org/warnings.html

my %cats = (
    'FATAL' => 0,
    'NONFATAL' => 0,
    'all' => 0,
    'closure' => 0,
    'deprecated' => 0,
    'exiting' => 0,
    'glob' => 0,
    'io' => 0,
    '+io' => {
        'closed' => 0,
        'exec' => 0,
        'layer' => 0,
        'newline' => 0,
        'pipe' => 0,
        'unopened' => 0,
    },
    '_closed' => 'io',
    '_exec' => 'io',
    '_layer' => 'io',
    '_newline' => 'io',
    '_pipe' => 'io',
    '_unopened' => 'io',
    'imprecision' => 0,
    'misc' => 0,
    'numeric' => 0,
    'once' => 0,
    'overflow' => 0,
    'pack' => 0,
    'portable' => 0,
    'recursion' => 0,
    'redefine' => 0,
    'regexp' => 0,
    'severe' => 0,
    '+severe' => {
        '_debugging' => 'severe',
        '_inplace' => 'severe',
        '_internal' => 'severe',
        '_malloc' => 'severe',
    },
    '_debugging' => 0,
    '_inplace' => 0,
    '_internal' => 0,
    '_malloc' => 0,
    'signal' => 0,
    'substr' => 0,
    'syntax' => 0,
    '+syntax' => {
        '_ambiguous' => 0,
        '_bareword' => 0,
        '_digit' => 0,
        '_illegalproto' => 0,
        '_parenthesis' => 0,
        '_precedence' => 0,
        '_printf' => 0,
        '_prototype' => 0,
        '_qw' => 0,
        '_reserved' => 0,
        '_semicolon' => 0,
    },
    '_ambiguous' => 'syntax',
    '_bareword' => 'syntax',
    '_digit' => 'syntax',
    '_illegalproto' => 'syntax',
    '_parenthesis' => 'syntax',
    '_precedence' => 'syntax',
    '_printf' => 'syntax',
    '_prototype' => 'syntax',
    '_qw' => 'syntax',
    '_reserved' => 'syntax',
    '_semicolon' => 'syntax',
    'taint' => 0,
    'threads' => 0,
    'uninitialized' => 0,
    'unpack' => 0,
    'untie' => 0,
    'utf8' => 0,
    '+utf8' => {
        '_surrogate' => 0,
        '_non_unicode' => 0,
        '_nonchar' => 0,
    },
    '_surrogate' => 'utf8',
    '_non_unicode' => 'utf8',
    '_nonchar' => 'utf8',
    'void' => 0,
);

sub EXPORT(*@cats) {
    use Perl5::Terms <%*WARNINGS_CATS>;
    my $set = +($*SCOPE eq 'use');
    for @cats -> $cat {
        if %cats{ $cat }.defined && %cats{ "+$cat" }.defined {
            %cats{ $cat } = $set;
            for %cats{ "+$cat" }.keys -> $c {
                %cats{ "+$cat" }{ $c } = $set
            }
        }
        elsif %cats{ $cat }.defined {
            %cats{ $cat } = $set
        }
        elsif %cats{ "_$cat" }.defined {
            %cats{ '+' ~ %cats{ "_$cat" } }{ $cat } = $set # TODO set parent cat if all sub-cats are set
        }
        else {
            die "Unknown warnings category '$cat'"
        }
    }
    %*WARNINGS_CATS = %cats;
    my %ex
}

module warnings {
    our proto enabled(|) { * }
    multi sub enabled($cat) { %cats{$cat} }
}
