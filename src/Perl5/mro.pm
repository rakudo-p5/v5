
use v6;

module mro {
    our sub get_linear_isa($pkg) {
        ::($pkg).^mro
    }
}

# http://perldoc.perl.org/mro.html
sub EXPORT(*@ops) {
    my %o;
    %o<&get_linear_isa> := &mro::get_linear_isa;
    %o
}

