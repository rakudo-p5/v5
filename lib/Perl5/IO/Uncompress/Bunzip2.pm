use v6;

module IO::Uncompress::Bunzip2 {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &IO::Uncompress::Bunzip2::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &IO::Uncompress::Bunzip2::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
