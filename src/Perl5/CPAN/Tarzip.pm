use v6;

module CPAN::Tarzip {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &CPAN::Tarzip::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &CPAN::Tarzip::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
