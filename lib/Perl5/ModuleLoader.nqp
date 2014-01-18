
use Perl6::ModuleLoader;

my $V5MLDEBUG := +nqp::getenvhash()<V5MLDEBUG>;

class Perl5::ModuleLoader does Perl6::ModuleLoaderVMConfig {
    my %modules_loaded;

    method ctxsave() {
        $V5MLDEBUG && say("Perl5::ModuleLoader.ctxsave()");
        $*MAIN_CTX := nqp::ctxcaller(nqp::ctx());
        $*CTXSAVE := 0;
    }
    
    method search_path(%opts) {
        $V5MLDEBUG && say("Perl5::ModuleLoader.search_path(" ~ dump_hash(%opts) ~ ")");
        # See if we have an @*INC set up, and if so just use that.
        my $PROCESS := nqp::gethllsym('perl6', 'PROCESS');
        
        if %opts<from> && !nqp::isnull($PROCESS) && nqp::existskey($PROCESS.WHO, '%CUSTOM_LIB') {
            my $INC := ($PROCESS.WHO)<%CUSTOM_LIB>;
            if nqp::defined($INC) {
                my %INC := $INC.FLATTENABLE_HASH();
                if nqp::existskey(%INC, %opts<from>) {
                    my @INC := %INC<Perl5>.FLATTENABLE_LIST();
                    if +@INC {
                        return @INC;
                    }
                }
            }
        }
        
        if !nqp::isnull($PROCESS) && nqp::existskey($PROCESS.WHO, '@INC') {
            my $INC := ($PROCESS.WHO)<@INC>;
            if nqp::defined($INC) {
                my @INC := $INC.FLATTENABLE_LIST();
                if +@INC {
                    if %opts<from> {
                        my %conf := nqp::backendconfig();
                        nqp::push(@INC, %conf<libdir> ~ %conf<versiondir> ~ '/languages/' ~ nqp::lc(%opts<from>) ~ '/lib') if %conf<libdir>;
                        nqp::push(@INC, %conf<prefix> ~ '/languages/' ~ nqp::lc(%opts<from>) ~ '/lib') if %conf<prefix>;
                    }
                    return @INC;
                }
            }
        }
        
        # Too early to have @*INC; probably no setting yet loaded to provide
        # the PROCESS initialization.
        my @search_paths;
        @search_paths.push('.');
        @search_paths.push('blib');
        for Perl6::ModuleLoader.vm_search_paths() {
            @search_paths.push($_);
        }
        @search_paths
    }
    
    method load_module($module_name, %opts, *@GLOBALish, :$line, :$file) {
        $V5MLDEBUG && say("Perl5::ModuleLoader.load_module($module_name, " ~ dump_hash(%opts) ~ ", +\@GLOBALish=" ~  +@GLOBALish ~ ", :\$line=$line, :\$file=$file)");
        # Locate all the things that we potentially could load. Choose
        # the first one for now (XXX need to filter by version and auth).
        my @prefixes   := self.search_path( %opts );
        if nqp::defined($file) {
            for @prefixes {
                $file := "$_/$file" if nqp::stat("$_/$file", 0)
            }
        }
        my @candidates := self.locate_candidates($module_name, @prefixes, :$file);
        if +@candidates == 0 {
            if nqp::defined($file) {
                nqp::die("Could not find file '$file' for module $module_name");
            }
            else {
                nqp::die("Could not find $module_name in any of: " ~
                    join(', ', @prefixes));
            }
        }
        my %chosen := @candidates[0];
        
        my @MODULES := nqp::clone(@*MODULES // []);
        for @MODULES -> $m {
            if $m<module> eq $module_name {
                nqp::die("Circular module loading detected involving module '$module_name'");
            }
        }

        # If we didn't already do so, load the module and capture
        # its mainline. Otherwise, we already loaded it so go on
        # with what we already have.
        my $module_ctx;
        if nqp::defined(%modules_loaded{%chosen<key>}) {
            $module_ctx := %modules_loaded{%chosen<key>};
        }
        else {
            my @*MODULES := @MODULES;
            if +@*MODULES  == 0 {
                my %prev        := nqp::hash();
                %prev<line>     := $line;
                %prev<filename> := nqp::getlexdyn('$?FILES');
                @*MODULES[0]    := %prev;
            }
            else {
                @*MODULES[-1]<line> := $line;
            }
            my %trace := nqp::hash();
            %trace<module>   := $module_name;
            %trace<filename> := %chosen<pm>;
            my $preserve_global := nqp::ifnull(nqp::gethllsym('perl6', 'GLOBAL'), NQPMu);
            nqp::push(@*MODULES, %trace);
            if %chosen<load> {
                %trace<precompiled> := %chosen<load>;
                my %*COMPILING := {};
                my $*CTXSAVE := self;
                my $*MAIN_CTX;
                nqp::loadbytecode(%chosen<load>);
                %modules_loaded{%chosen<key>} := $module_ctx := $*MAIN_CTX;
            }
            else {
                # If we're doing module pre-compilation, we should only
                # allow the modules we load to be pre-compiled also.
                my $precomp := 0;
                try $precomp := $*W.is_precompilation_mode();
                if $precomp {
                    nqp::die(
                        "When pre-compiling a module, its dependencies must be pre-compiled first.\n" ~
                        "Please pre-compile " ~ %chosen<pm>);
                }

                # Read source file.
                my $source;
                if nqp::backendconfig<runtime.jars> || nqp::backendconfig<moar> {
                    my $fh := nqp::open(%chosen<pm>, 'r');
                    nqp::setencoding($fh, 'utf8');
                    $source := nqp::readallfh($fh);
                    nqp::closefh($fh);
                }
                else {
                    my $fh := nqp::open(%chosen<pm>, 'r');
                    $fh.encoding('utf8');
                    $source := $fh.readall();
                    $fh.close();
                }

                # Get the compiler and compile the code, then run it
                # (which runs the mainline and captures UNIT).
                my $?FILES   := %chosen<pm>;
                my $eval     := nqp::getcomp('perl6').compile($source, :M<Perl5>);
                my $*CTXSAVE := self;
                my $*MAIN_CTX;
                $eval();
                %modules_loaded{%chosen<key>} := $module_ctx := $*MAIN_CTX;
            }
            nqp::bindhllsym('perl6', 'GLOBAL', $preserve_global);
            CATCH {
                nqp::bindhllsym('perl6', 'GLOBAL', $preserve_global);
                nqp::rethrow($_);
            }
        }

        # Provided we have a mainline and need to do global merging...
        if nqp::defined($module_ctx) {
            # Merge any globals.
            my $UNIT := nqp::ctxlexpad($module_ctx);
            if +@GLOBALish {
                unless nqp::isnull($UNIT<GLOBALish>) {
                    merge_globals(@GLOBALish[0], $UNIT<GLOBALish>);
                }
            }
            return $UNIT;
        }
        else {
            return {};
        }
    }

    # This is a first cut of the globals merger. For another approach,
    # see sorear++'s work in Niecza. That one is likely more "pure"
    # than this, but that would seem to involve copying too, and the
    # details of exactly what that entails are a bit hazy to me at the
    # moment. We'll see how far this takes us.
    my $stub_how := 'Perl6::Metamodel::PackageHOW';
    sub merge_globals($target, $source) {
        $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals(\$target, \$source)");
        # Start off merging top-level symbols. Easy when there's no
        # overlap. Otherwise, we need to recurse.
        my %known_symbols;
        for stash_hash($target) {
            %known_symbols{$_.key} := 1;
            $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: %known_symbols<{$_.key}> := 1;");
        }
        for stash_hash($source) {
            my $sym := $_.key;
            if !%known_symbols{$sym} {
                ($target.WHO){$sym} := $_.value;
                $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: (\$target.WHO)<{$sym}> := \$_.value;");
            }
            elsif ($target.WHO){$sym} =:= $_.value {
                # No problemo; a symbol can't conflict with itself.
            }
            else {
                my $source_mo := $_.value.HOW;
                my $source_is_stub := $source_mo.HOW.name($source_mo) eq $stub_how;
                my $target_mo := ($target.WHO){$sym}.HOW;
                my $target_is_stub := $target_mo.HOW.name($target_mo) eq $stub_how;
                if $source_is_stub && $target_is_stub {
                    # Both stubs. We can safely merge the symbols from
                    # the source into the target that's importing them.
                    $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: merge_globals((\$target.WHO)<{$sym}>, \$_.value);");
                    merge_globals(($target.WHO){$sym}, $_.value);
                }
                elsif $source_is_stub {
                    # The target has a real package, but the source is a
                    # stub. Also fine to merge source symbols into target.
                    $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: merge_globals((\$target.WHO)<{$sym}>, \$_.value);");
                    merge_globals(($target.WHO){$sym}, $_.value);
                }
                elsif $target_is_stub {
                    # The tricky case: here the interesting package is the
                    # one in the module. So we merge the other way around
                    # and install that as the result.
                    $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: merge_globals(\$_.value, (\$target.WHO)<$sym>);");
                    merge_globals($_.value, ($target.WHO){$sym});
                    ($target.WHO){$sym} := $_.value;
                    $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: (\$target.WHO)<{$sym}> := \$_.value;");
                }
                else {
                    nqp::die("Merging GLOBAL symbols failed: duplicate definition of symbol $sym");
                }
            }
        }
    }
    
    sub stash_hash($pkg) {
        my $hash := $pkg.WHO;
        unless nqp::ishash($hash) {
            $hash := $hash.FLATTENABLE_HASH();
        }
        $hash
    }

    sub dump_hash($hash) {
        my $dump := '{ ';
        for $hash {
            $dump := $dump ~ $_.key ~ ' => ' ~ $_.value ~ ' ';
        }
        $dump ~ '}'
    }
}

Perl6::ModuleLoader.register_language_module_loader('Perl5', Perl5::ModuleLoader);
nqp::bindhllsym('perl6', 'Perl5ModuleLoader', Perl5::ModuleLoader);
