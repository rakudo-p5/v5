
use 6.0.0;
use Test;
sub _plan($plan) { plan($plan) }

{
    use v5;
    sub plan {
        my %args = scalar(@_) == 2 ? @_ : ('tests' => $_[0]);
        say %args;
        _plan( $args{'tests'} )
    }
}
