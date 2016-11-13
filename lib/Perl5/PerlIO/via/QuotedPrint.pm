use v6;

module PerlIO::via::QuotedPrint {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &PerlIO::via::QuotedPrint::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &PerlIO::via::QuotedPrint::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
