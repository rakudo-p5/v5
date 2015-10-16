use v6;

module CPANPLUS::Dist::Build::Constants {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &CPANPLUS::Dist::Build::Constants::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &CPANPLUS::Dist::Build::Constants::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
