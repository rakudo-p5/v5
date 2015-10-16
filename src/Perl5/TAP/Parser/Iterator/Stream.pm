use v6;

module TAP::Parser::Iterator::Stream {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &TAP::Parser::Iterator::Stream::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &TAP::Parser::Iterator::Stream::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
