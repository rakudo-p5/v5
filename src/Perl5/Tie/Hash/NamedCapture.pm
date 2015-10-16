use v6;

module Tie::Hash::NamedCapture {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Tie::Hash::NamedCapture::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Tie::Hash::NamedCapture::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
