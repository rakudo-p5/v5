
use v6.0.0;

# http://perldoc.perl.org/constant.html
sub EXPORT(*@ops) {
    my %o;

    for @ops -> $k, $v {
        %o{ '&' ~ $k } := sub { $v };
    }

    %o
}

module constant {
    
}
