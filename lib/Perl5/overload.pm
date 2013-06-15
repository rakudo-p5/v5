
use v6.0.0;

# http://perldoc.perl.org/overload.html

sub EXPORT(*@ops) {
    my %o;
    for @ops -> $k, $v {
        my $sub := $v ~~ Str
                ?? ::($v)
                !! $v;
        given $k {
            when '""' { %o{'&prefix:<P5~>'} := $sub; }
        }
    }
    %o
}

module overload {
    
}
