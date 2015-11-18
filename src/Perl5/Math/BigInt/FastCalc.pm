use v6;

module Math::BigInt::FastCalc {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Math::BigInt::FastCalc::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Math::BigInt::FastCalc::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
