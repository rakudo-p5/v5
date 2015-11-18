use v6;

module Module::Build::ModuleInfo {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Module::Build::ModuleInfo::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Module::Build::ModuleInfo::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
