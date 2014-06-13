use v6.0.0;

module Memoize::SDBM_File {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Memoize::SDBM_File::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Memoize::SDBM_File::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
