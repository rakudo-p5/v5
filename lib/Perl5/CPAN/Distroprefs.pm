use v6;

module CPAN::Distroprefs {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &CPAN::Distroprefs::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &CPAN::Distroprefs::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
