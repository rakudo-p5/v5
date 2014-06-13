use v6.0.0;

module CPANPLUS::Internals::Source::Memory {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &CPANPLUS::Internals::Source::Memory::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &CPANPLUS::Internals::Source::Memory::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
