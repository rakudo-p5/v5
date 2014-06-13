use v6.0.0;

module Exporter::Heavy {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Exporter::Heavy::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Exporter::Heavy::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
