use v6;

module DBM_Filter::int32 {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &DBM_Filter::int32::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &DBM_Filter::int32::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
