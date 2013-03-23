use Perl6::World;

class Perl6::P5World is Perl6::World {
    # Takes a longname and turns it into an object representing the
    # name.
    # We just need that here to override Perl6::World's version of it which
    # relies on the existance of <colonpair>.
    method disect_longname($longname) {
        say("method P5 disect_longname($longname)");
        # Set up basic info about the long name.
        my $result := nqp::create(LongName);
        nqp::bindattr($result, LongName, '$!match', $longname);

        # Pick out the pieces of the name.
        my @components;
        my $name := $longname<name>;
        if $name<identifier> {
            @components.push(~$name<identifier>);
        }
        for $name<morename> {
            if $_<identifier> {
                @components.push(~$_<identifier>[0]);
            }
            elsif $_<EXPR> {
                my $EXPR := $_<EXPR>[0].ast;
                @components.push($EXPR);
            }
            else {
                # Either it's :: as a name entirely, in which case it's anon,
                # or we're ending in ::, in which case it implies .WHO.
                if +@components {
                    nqp::bindattr_i($result, LongName, '$!get_who', 1);
                }
            }
        }
        nqp::bindattr($result, LongName, '@!components', @components);
        
        # Stash colon pairs with names; incorporate non-named one into
        # the last part of the name (e.g. for infix:<+>). Need to be a
        # little cheaty when compiling the setting due to bootstrapping.
        my @pairs;
        nqp::bindattr($result, LongName, '@!colonpairs', @pairs);
        
        $result
    }
}

# vim: ft=perl6
