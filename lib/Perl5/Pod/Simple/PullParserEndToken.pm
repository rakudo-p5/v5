use v6;

module Pod::Simple::PullParserEndToken {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Pod::Simple::PullParserEndToken::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Pod::Simple::PullParserEndToken::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
