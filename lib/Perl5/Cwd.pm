use v6;
use nqp;

module Cwd {
    our sub cwd             { nqp::p6box_s(nqp::cwd()) }
    our sub getcwd          { nqp::p6box_s(nqp::cwd()) }
    our sub sys_cwd         { nqp::p6box_s(nqp::cwd()) }
    our sub fastcwd         { nqp::p6box_s(nqp::cwd()) }
    our sub fastgetcwd      { nqp::p6box_s(nqp::cwd()) }
    our sub getdcwd($drive) { nqp::p6box_s(nqp::cwd()) }
    
    our sub abs_path($file)      { $file.IO.rel2abs }
    our sub realpath($file)      { $file.IO.rel2abs }
    our sub fast_abs_path($file) { $file.IO.rel2abs }
    our sub fast_realpath($file) { $file.IO.rel2abs }
    
    our sub chdir($dir) { nqp::chdir(nqp::unbox_s($dir)); CALLER::DYNAMIC::<%ENV><PWD> = nqp::p6box_s(nqp::cwd()) }
}

# http://perldoc.perl.org/Cwd.html
multi sub EXPORT() {
    # @EXPORT = qw(cwd getcwd fastcwd fastgetcwd);
    # push @EXPORT, qw(getdcwd) if $^O eq 'MSWin32';
    my %o;
    %o<&cwd>           := &Cwd::cwd;
    %o<&getcwd>        := &Cwd::getcwd;
    %o<&fastcwd>       := &Cwd::fastcwd;
    %o<&fastgetcwd>    := &Cwd::fastgetcwd;
    %o<&getdcwd>       := &Cwd::getdcwd if $*DISTRO.name eq 'MSWin32';

    %o<&abs_path>      := &Cwd::abs_path;
    %o<&realpath>      := &Cwd::realpath;
    %o<&fast_abs_path> := &Cwd::fast_abs_path;
    %o
}

multi sub EXPORT(@ops) {
    # @EXPORT_OK = qw(chdir abs_path fast_abs_path realpath fast_realpath);
    my %o;
    for @ops {
        %o<&cwd>           := &Cwd::cwd           if $_ eq 'cwd';
        %o<&getcwd>        := &Cwd::getcwd        if $_ eq 'getcwd';
        %o<&sys_cwd>       := &Cwd::sys_cwd       if $_ eq 'sys_cwd';
        %o<&fastcwd>       := &Cwd::fastcwd       if $_ eq 'fastcwd';
        %o<&fastgetcwd>    := &Cwd::fastgetcwd    if $_ eq 'fastgetcwd';

        %o<&abs_path>      := &Cwd::abs_path      if $_ eq 'abs_path';
        %o<&realpath>      := &Cwd::realpath      if $_ eq 'realpath';
        %o<&fast_abs_path> := &Cwd::fast_abs_path if $_ eq 'fast_abs_path';
        %o<&fast_realpath> := &Cwd::fast_realpath if $_ eq 'fast_realpath';

        %o<&chdir>         := &Cwd::chdir         if $_ eq 'chdir';
    }
    %o
}

