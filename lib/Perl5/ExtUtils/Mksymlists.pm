use v6;

module ExtUtils::Mksymlists {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &ExtUtils::Mksymlists::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &ExtUtils::Mksymlists::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
