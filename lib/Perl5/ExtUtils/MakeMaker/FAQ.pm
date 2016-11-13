use v6;

module ExtUtils::MakeMaker::FAQ {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &ExtUtils::MakeMaker::FAQ::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &ExtUtils::MakeMaker::FAQ::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
