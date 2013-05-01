
# This will be mixed in within Perl5.pm.
role Perl5::World {
    method p5dissect_longname( $longname ) {
        $longname<colonpair> := nqp::list();
        self.dissect_longname( $longname )
    }
}

# vim: ft=perl6
