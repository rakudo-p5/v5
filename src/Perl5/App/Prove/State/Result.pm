use v6;

module App::Prove::State::Result {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &App::Prove::State::Result::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &App::Prove::State::Result::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
