use v6;

module IO::Uncompress::Base {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &IO::Uncompress::Base::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &IO::Uncompress::Base::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
