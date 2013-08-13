
use Perl6::ModuleLoader;

class Perl5::ModuleLoader {
    my %modules_loaded := Perl6::ModuleLoader.modules_loaded();
    method search_path(%opts) {
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
                        my %conf := pir::getinterp__P()[pir::const::IGLOBALS_CONFIG_HASH];
                        nqp::push(@INC, %conf<libdir> ~ %conf<versiondir> ~ '/languages/' ~ nqp::lc(%opts<from>) ~ '/lib');
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
    
    method load_module($module_name, %opts, *@GLOBALish, :$line, :$file?) {
        # Locate all the things that we potentially could load. Choose
        # the first one for now (XXX need to filter by version and auth).
        my @prefixes   := self.search_path(%opts);
        my @candidates := Perl6::ModuleLoader.locate_candidates($module_name, @prefixes, :$file);
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
#?if parrot
                my $fh := nqp::open(%chosen<pm>, 'r');
                $fh.encoding('utf8');
                my $source := $fh.readall();
                $fh.close();
#?endif
#?if jvm
                #~ my $fh := nqp::open(%chosen<pm>, 'r');
                #~ nqp::setencoding($fh, 'utf8');
                #~ my $source := nqp::readallfh($fh);
                #~ nqp::closefh($fh);
#?endif
                
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
}

Perl6::ModuleLoader.register_language_module_loader('Perl5', Perl5::ModuleLoader);
nqp::bindhllsym('perl6', 'Perl5ModuleLoader', Perl5::ModuleLoader);
