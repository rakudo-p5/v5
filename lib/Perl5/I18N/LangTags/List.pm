use v6;

module I18N::LangTags::List {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &I18N::LangTags::List::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &I18N::LangTags::List::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
