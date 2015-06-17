use v6.0.0;
use nqp;

# http://perldoc.perl.org/constant.html
sub EXPORT(*@ops) {
    my %o;

    for @ops -> $k, $v {
        %o{ '&' ~ $k }  := -> { $v };
        # constants do not swallow arguments
        nqp::getlexrelcaller(nqp::ctx(), '%prototype'){$k} := '';
    }

    %o
}

module constant {
    
}
