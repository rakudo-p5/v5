use v6.0.0;

module CPAN::Kwalify {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &CPAN::Kwalify::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &CPAN::Kwalify::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
