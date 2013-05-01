NQP        = nqp
PARROT     = parrot
PERL       = perl
PERL6      = perl6
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

all: blib blib/Perl5.pbc

blib/Perl5/World.pbc: lib/Perl5/World.nqp
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl5/World.pir lib/Perl5/World.nqp
	$(PARROT) -o blib/Perl5/World.pbc blib/Perl5/World.pir

blib/Perl5/Actions.pbc: blib/Perl5/World.pbc lib/Perl5/Actions.nqp
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl5/Actions.pir lib/Perl5/Actions.nqp
	$(PARROT) -o blib/Perl5/Actions.pbc blib/Perl5/Actions.pir

blib/Perl5/Grammar.pbc: blib/Perl5/Actions.pbc lib/Perl5/Grammar.nqp
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl5/Grammar.pir lib/Perl5/Grammar.nqp
	$(PARROT) -o blib/Perl5/Grammar.pbc blib/Perl5/Grammar.pir

blib/Perl5.pbc: lib/Perl5.nqp blib/Perl5/World.pbc blib/Perl5/Actions.pbc blib/Perl5/Grammar.pbc
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl5.pir lib/Perl5.nqp
	$(PARROT) -o blib/Perl5.pbc blib/Perl5.pir

blib:
	$(MKPATH) blib/Perl5

clean:
	$(RM_F) blib/*.pbc blib/*.pir blib/Perl5/*.pbc blib/Perl5/*.pir

install: all
	$(MKPATH) $(NQPLIB)/lib/Perl5
	$(CP) blib/*.pbc $(NQPLIB)/lib/
	$(CP) blib/Perl5/*.pbc $(NQPLIB)/lib/Perl5/
	$(CP) lib/*.pm $(P6LIB)/lib/

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
