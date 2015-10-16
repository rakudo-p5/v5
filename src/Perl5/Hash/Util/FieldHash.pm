use v6;

module Hash::Util::FieldHash {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Hash::Util::FieldHash::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Hash::Util::FieldHash::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
