use v6.0.0;

module Compress::Raw::Zlib {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Compress::Raw::Zlib::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Compress::Raw::Zlib::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
