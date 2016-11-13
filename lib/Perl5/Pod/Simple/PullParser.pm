use v6;

module Pod::Simple::PullParser {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Pod::Simple::PullParser::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Pod::Simple::PullParser::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
