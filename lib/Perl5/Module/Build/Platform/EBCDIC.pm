use v6;

module Module::Build::Platform::EBCDIC {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Module::Build::Platform::EBCDIC::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Module::Build::Platform::EBCDIC::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
