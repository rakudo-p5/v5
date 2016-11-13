use v6;

module TAP::Formatter::Color {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &TAP::Formatter::Color::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &TAP::Formatter::Color::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
