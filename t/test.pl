
use 6.0.0;
use Test;
sub _plan(*@args) { plan(|@args) }
sub _is(*@args)   { is(|@args)   }
sub _ok(*@args)   { ok(|@args)   }
sub _skip(*@args) { skip(|@args) }

{
    use v5;
    sub plan {
        my %args = scalar(@_) == 2 ? @_ : tests => $_[0];
        _plan( $args{'tests'} )
    }
    sub is   { _is( @_ )   }
    sub ok   { _ok( @_ )   }
    sub skip { _skip( @_ ) }
}
