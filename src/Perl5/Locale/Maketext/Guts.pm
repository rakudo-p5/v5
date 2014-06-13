use v6.0.0;

module Locale::Maketext::Guts {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Locale::Maketext::Guts::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Locale::Maketext::Guts::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
