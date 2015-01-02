my $V5MLDEBUG = %*ENV<V5MLDEBUG>;
my $p6ml      = nqp::gethllsym('perl6', 'ModuleLoader');

class Perl5::ModuleLoader {
    my %modules_loaded;

    method ctxsave() {
        $V5MLDEBUG && say("Perl5::ModuleLoader.ctxsave()");
        $*MAIN_CTX := nqp::ctxcaller(nqp::ctx());
        $*CTXSAVE := 0;
    }

    method files($file, :$name, :$auth, :$ver, :@INC) {
        for @INC {
            if $_ ~~ Str ?? CompUnitRepo::Local::File.new($_) !! $_ -> $cur {
                if $cur.files($file, :$name,:$auth,:$ver).list -> @candi {
                    return @candi;
                }
            }
        }
        ();
    }

    method candidates($name, :$file, :$auth, :$ver, :@INC) {
        for @INC {
            if $_ ~~ Str ?? CompUnitRepo::Local::File.new($_) !! $_ -> $cur {
                if $cur.candidates($name, :$file,:$auth,:$ver).list -> @candi {
                    return @candi;
                }
            }
        }
        ();
    }

    method load_module($module_name, %opts, *@GLOBALish, :$line, :$file is copy) {
        $V5MLDEBUG && say("Perl5::ModuleLoader.load_module($module_name, " ~ dump_hash(%opts) ~ ", +\@GLOBALish=" ~  +@GLOBALish ~ ", ...)");
        # Locate all the things that we potentially could load. Choose
        # the first one for now (XXX need to filter by version and auth).
        my $PROCESS := nqp::gethllsym('perl6', 'PROCESS');
        my $INC := ($PROCESS.WHO)<%CUSTOM_LIB>;
        my %INC := $INC.FLATTENABLE_HASH() if nqp::defined($INC);
        my @INC := %INC<Perl5>.FLATTENABLE_LIST() if %INC<Perl5>;
        my %chosen;
        my $path = $file.path if $file;
        if self.candidates($module_name, :$file, :@INC)[0] -> $candi {
            %chosen<pm> = ~$candi.path;
            $candi.has-precomp ??
                ?? (%chosen<load> = %chosen<key> = %chosen<pm> ~ '.' ~ $candi.precomp-ext)
                !! (%chosen<key>  = %chosen<pm>)
        }
        elsif $file && ($path.is-absolute || $file ~~ / './' | '.\\' /) && $path.e { #'
            %chosen<pm> = %chosen<key> = ~$path.absolute;
        }
        elsif $file && self.files($file, :@INC)[0] -> $candi {
            %chosen<pm> = %chosen<key> = $candi<files>{$file};
        }
        elsif nqp::defined($file) {
            nqp::die("Can't locate $file in @INC (@INC contains: @INC[])");
        }
        else {
            nqp::die("Can't locate $module_name in @INC (@INC contains: @INC[])");
        }

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
            my @*MODULES := nqp::gethllsym("nqp", "nqplist")(|@MODULES);
            if +@*MODULES  == 0 {
                my %prev        = nqp::hash();
                %prev<line>     = $line;
                %prev<filename> = nqp::getlexdyn('$?FILES');
                @*MODULES[0]    = %prev;
            }
            else {
                @*MODULES[*-1]<line> := $line;
            }
            my %trace;
            %trace<module>   := $module_name;
            %trace<filename> := %chosen<pm>;
            my Mu $preserve_global := nqp::ifnull(nqp::gethllsym('perl6', 'GLOBAL'), Mu);
            @*MODULES.push(%trace);
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
                if $*VM.name ne 'parrot' {
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
                #~ say $_;
                #~ nqp::rethrow($_);
            }
        }

        # Provided we have a mainline and need to do global merging...
        if nqp::defined($module_ctx) {
            # Merge any globals.
            my $UNIT := nqp::ctxlexpad($module_ctx);
            if +@GLOBALish {
                unless nqp::isnull(nqp::atkey($UNIT, 'GLOBALish')) {
                    merge_globals(@GLOBALish[0], nqp::atkey($UNIT, 'GLOBALish'));
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
    sub merge_globals(Mu $target, Mu $source) {
        $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals(\$target, \$source)");
        # Start off merging top-level symbols. Easy when there's no
        # overlap. Otherwise, we need to recurse.
        my %known_symbols;
        for stash_hash($target) {
            %known_symbols{$_.key} := 1;
            $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: \%known_symbols<{$_.key()}> := 1;");
        }
        for stash_hash($source) {
            my $sym := $_.key;
            if !%known_symbols{$sym} {
                ($target.WHO){$sym} := $_.value;
                $V5MLDEBUG && say("Perl5::ModuleLoader.merge_globals: (\$target.WHO)<{$sym}> := \$_.value;");
            }
            elsif nqp::decont($target.WHO{$sym}) =:= nqp::decont($_.value) {
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
    
    sub stash_hash(Mu $pkg) {
        my $hash := $pkg.WHO;
        unless nqp::ishash($hash) {
            $hash := $hash.FLATTENABLE_HASH();
        }
        $hash
    }

    sub dump_hash($hash) {
        my $dump := '{ ';
        for $hash.kv -> $k, $v {
            $dump := $dump ~ $k ~ ' => ' ~ $v ~ ' ';
        }
        $dump ~ '}'
    }
}

$p6ml.p6ml.register_language_module_loader('Perl5', Perl5::ModuleLoader);
nqp::bindhllsym('perl6', 'Perl5ModuleLoader', Perl5::ModuleLoader);
