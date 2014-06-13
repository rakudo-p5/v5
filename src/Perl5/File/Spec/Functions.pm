
use v6.0.0;

module File::Spec::Functions {
    our sub canonpath(*@a)             { IO::Spec.canonpath(|@a) }
    our sub catdir(*@a)                { IO::Spec.catdir(|@a) }
    our sub catfile(*@a)               { IO::Spec.catfile(|@a) }
    our sub curdir(*@a)                { IO::Spec.curdir(|@a) }
    our sub rootdir(*@a)               { IO::Spec.rootdir(|@a) }
    our sub updir(*@a)                 { IO::Spec.updir(|@a) }
    our sub no_upwards(*@a)            { IO::Spec.no_upwards(|@a) }
    our sub file_name_is_absolute(*@a) { IO::Spec.file_name_is_absolute(|@a) }
    our sub path(*@a)                  { IO::Spec.path(|@a) }
    our sub devnull(*@a)               { IO::Spec.devnull(|@a) }
    our sub tmpdir(*@a)                { IO::Spec.tmpdir(|@a) }
    our sub splitpath(*@a)             { IO::Spec.splitpath(@a[0], :nofile(?@a[1]) ) }
    our sub splitdir(*@a)              { IO::Spec.splitdir(|@a) }
    our sub catpath(*@a)               { IO::Spec.catpath(|@a) }
    our sub abs2rel(*@a)               { IO::Spec.abs2rel(|@a) }
    our sub rel2abs(*@a)               { IO::Spec.rel2abs(|@a) }
    our sub case_tolerant(*@a)         { IO::Spec.case_tolerant(|@a) }
}

multi sub EXPORT() {
    # @EXPORT = qw(canonpath catdir catfile curdir rootdir updir no_upwards file_name_is_absolute path);
    my %o;
    %o<&canonpath>             := &File::Spec::Functions::canonpath;
    %o<&catdir>                := &File::Spec::Functions::catdir;
    %o<&catfile>               := &File::Spec::Functions::catfile;
    %o<&curdir>                := &File::Spec::Functions::curdir;
    %o<&rootdir>               := &File::Spec::Functions::rootdir;
    %o<&updir>                 := &File::Spec::Functions::updir;
    %o<&no_upwards>            := &File::Spec::Functions::no_upwards;
    %o<&file_name_is_absolute> := &File::Spec::Functions::file_name_is_absolute;
    %o<&path>                  := &File::Spec::Functions::path;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK = qw(devnull tmpdir splitpath splitdir catpath abs2rel rel2abs case_tolerant);
    my %o = &EXPORT() if @ops.grep('ALL') || @ops.grep(':DEFAULT');
    for @ops {
        %o<&devnull>       := &File::Spec::Functions::devnull       if $_ eq 'ALL' || $_ eq 'devnull';
        %o<&tmpdir>        := &File::Spec::Functions::tmpdir        if $_ eq 'ALL' || $_ eq 'tmpdir';
        %o<&splitpath>     := &File::Spec::Functions::splitpath     if $_ eq 'ALL' || $_ eq 'splitpath';
        %o<&splitdir>      := &File::Spec::Functions::splitdir      if $_ eq 'ALL' || $_ eq 'splitdir';
        %o<&catpath>       := &File::Spec::Functions::catpath       if $_ eq 'ALL' || $_ eq 'catpath';
        %o<&abs2rel>       := &File::Spec::Functions::abs2rel       if $_ eq 'ALL' || $_ eq 'abs2rel';
        %o<&rel2abs>       := &File::Spec::Functions::rel2abs       if $_ eq 'ALL' || $_ eq 'rel2abs';
        %o<&case_tolerant> := &File::Spec::Functions::case_tolerant if $_ eq 'ALL' || $_ eq 'case_tolerant';
    }
    %o
}

