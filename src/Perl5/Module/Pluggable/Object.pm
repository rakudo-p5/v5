use v6;

module Module::Pluggable::Object {
    #~ our sub subname { ... }
}

multi sub EXPORT() {
    # @EXPORT goes here
    my %o;
    #~ %o<&subname> := &Module::Pluggable::Object::subname;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK goes here
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        #~ %o<&subname> := &Module::Pluggable::Object::subname if $_ eq 'ALL' || $_ eq 'subname';
    }
    %o
}
