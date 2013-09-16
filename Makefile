NQP        = nqp
PARROT     = parrot
PERL       = perl
PERL6      = PERL6LIB=blib perl6
RM_F       = $(PERL) -MExtUtils::Command -e rm_f
CP         = $(PERL) -MExtUtils::Command -e cp
MKPATH     = $(PERL) -MExtUtils::Command -e mkpath
NQPLIB     = $(shell $(NQP) -e 'my %conf := pir::getinterp__P()[pir::const::IGLOBALS_CONFIG_HASH]; print(%conf<libdir> ~ %conf<versiondir> ~ "/languages/nqp");')
P6LIB      = $(shell $(PERL6) -e 'print %*CUSTOM_LIB<perl>')

# We need to tweak that some day
HAS_ICU    = 0

# NOTE: eventually, we should remove --keep-exit-code and --fudge
#       as the goal is that all tests must pass without fudge
HARNESS_WITH_FUDGE = $(PERL) t/harness --fudge --keep-exit-code --add_use_v5 --icu=$(HAS_ICU)

all: blib blib/Perl5.pbc blib/Perl5/Config.pbc blib/Perl5/Terms.pbc blib/Perl5/ModuleLoader.pbc

blib/Perl5/World.pbc: lib/Perl5/World.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --stagestats --output=blib/Perl5/World.pir lib/Perl5/World.nqp
	$(PARROT) -o blib/Perl5/World.pbc blib/Perl5/World.pir

blib/Perl5/Actions.pbc: blib/Perl5/World.pbc lib/Perl5/Actions.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --stagestats --output=blib/Perl5/Actions.pir lib/Perl5/Actions.nqp
	$(PARROT) -o blib/Perl5/Actions.pbc blib/Perl5/Actions.pir

blib/Perl5/Grammar.pbc: blib/Perl5/Actions.pbc lib/Perl5/Grammar.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --stagestats --output=blib/Perl5/Grammar.pir lib/Perl5/Grammar.nqp
	$(PARROT) -o blib/Perl5/Grammar.pbc blib/Perl5/Grammar.pir

blib/Perl5/ModuleLoader.pbc: lib/Perl5/ModuleLoader.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --output=blib/Perl5/ModuleLoader.pir lib/Perl5/ModuleLoader.nqp
	$(PARROT) -o blib/Perl5/ModuleLoader.pbc blib/Perl5/ModuleLoader.pir

blib/Perl5.pbc: lib/Perl5.nqp blib/Perl5/World.pbc blib/Perl5/Actions.pbc blib/Perl5/Grammar.pbc blib/Perl5/ModuleLoader.pbc
	$(NQP) --vmlibs=perl6_ops --target=pir --output=blib/Perl5.pir lib/Perl5.nqp
	$(PARROT) -o blib/Perl5.pbc blib/Perl5.pir

blib/Perl5/Config.pbc: blib/Perl5/Terms.pbc lib/Perl5/Config.pm
	$(PERL6) --target=pir --stagestats --output=blib/Perl5/Config.pir lib/Perl5/Config.pm
	$(PARROT) -o blib/Perl5/Config.pbc blib/Perl5/Config.pir

blib/Perl5/warnings.pbc: lib/Perl5/warnings.pm
	$(PERL6) --target=pir --output=blib/Perl5/warnings.pir lib/Perl5/warnings.pm
	$(PARROT) -o blib/Perl5/warnings.pbc blib/Perl5/warnings.pir

blib/Perl5/Terms.pbc: blib/Perl5/warnings.pbc lib/Perl5/Terms.pm
	$(PERL6) --target=pir --stagestats --output=blib/Perl5/Terms.pir lib/Perl5/Terms.pm
	$(PARROT) -o blib/Perl5/Terms.pbc blib/Perl5/Terms.pir

blib/Perl5/English.pbc: blib/Perl5/Terms.pbc lib/Perl5/English.pm
	$(PERL6) --target=pir --stagestats --output=blib/Perl5/English.pir lib/Perl5/English.pm
	$(PARROT) -o blib/Perl5/English.pbc blib/Perl5/English.pir

blib:
	$(MKPATH) blib/Perl5

clean:
	$(RM_F) blib/*.pbc blib/*.pir blib/Perl5/*.pbc blib/Perl5/*.pir

install: all
	$(MKPATH) $(NQPLIB)/lib/Perl5
	$(MKPATH) $(P6LIB)/lib/Perl5/warnings
	$(CP) blib/*.pbc $(P6LIB)/lib/
	$(CP) blib/Perl5/Actions.pbc $(NQPLIB)/lib/Perl5/
	$(CP) blib/Perl5/World.pbc $(NQPLIB)/lib/Perl5/
	$(CP) blib/Perl5/Grammar.pbc $(NQPLIB)/lib/Perl5/
	$(CP) blib/Perl5/ModuleLoader.pbc $(NQPLIB)/lib/Perl5/
	$(CP) lib/Perl5/*.pm $(P6LIB)/lib/Perl5/
	$(CP) lib/Perl5/warnings/*.pm $(P6LIB)/lib/Perl5/warnings/
	$(CP) blib/Perl5/Config.pbc $(P6LIB)/lib/Perl5/
	$(CP) blib/Perl5/Terms.pbc $(P6LIB)/lib/Perl5/
	$(CP) blib/Perl5/warnings.pbc $(P6LIB)/lib/Perl5/

uninstall:
	$(RM_F) $(NQPLIB)/lib/Perl5.pbc
	$(RM_F) $(NQPLIB)/lib/Perl5/Actions.pbc
	$(RM_F) $(NQPLIB)/lib/Perl5/Grammar.pbc
	$(RM_F) $(NQPLIB)/lib/Perl5/World.pbc

test: install
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) $(test_file) --verbosity=9

testable : all spectest_checkout spectest_update

spectest_checkout : t/spec
t/spec :
	git clone git://github.com/rakudo-p5/roast5.git t/spec
	-cd t/spec/ && git config remote.origin.pushurl git@github.com:rakudo-p5/roast5.git

spectest_update :
	-cd t/spec && git pull

spectest: install testable t/spectest.data
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) --tests-from-file=t/spectest.data

fulltest: install testable t/spectest.data
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) t/*/*.t t/*/*/*.t

t/*/*.t t/*/*/*.t:
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) --verbosity=1 $@
