use v6;

module Encode::KR::2022_KR {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Encode::KR::2022_KR::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Encode::KR::2022_KR::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
