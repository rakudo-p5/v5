use v6;

module Test::Builder::Tester::Color {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Test::Builder::Tester::Color::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Test::Builder::Tester::Color::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
