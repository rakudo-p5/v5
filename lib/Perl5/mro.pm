
use v6.0.0;

module mro {
    sub get_linear_isa($pkg) is export {
        ::($pkg).^mro
    }
}

# http://perldoc.perl.org/mro.html
sub EXPORT(*@ops) {
    my %o;
    %o<&get_linear_isa> := -> $pkg { ::($pkg).^mro };
    %o
}

