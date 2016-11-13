use v6;

module Package::Constants {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Package::Constants::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Package::Constants::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
