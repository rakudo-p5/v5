use v6;

module DBM_Filter::compress {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &DBM_Filter::compress::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &DBM_Filter::compress::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
