
# This will be mixed in within Perl5.pm.
role Perl6::P5World {
    method p5dissect_longname( $longname ) {
        $longname<colonpair> := nqp::list();
        self.dissect_longname( $longname )
    }

    my %ENV;
    my $env := nqp::getenvhash();
    my $enviter := nqp::iterator($env);
    my $key;
    while $enviter {
        $key := nqp::shift_s($enviter);
        %ENV{$key} := nqp::atkey($env, $key);
    }
    method get_env($key) {
        %ENV{$key}
    }
}

# vim: ft=perl6
