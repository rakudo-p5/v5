use v6.0.0;

module App::Prove::State::Result::Test {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &App::Prove::State::Result::Test::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &App::Prove::State::Result::Test::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
