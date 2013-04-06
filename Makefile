NQP        = nqp
PARROT     = parrot
PERL       = perl
PERL6      = perl6
RM_F       = $(PERL) -MExtUtils::Command -e rm_f
CP         = $(PERL) -MExtUtils::Command -e cp
MKPATH     = $(PERL) -MExtUtils::Command -e mkpath
LIB        = $(shell $(PERL6) -e 'print %*CUSTOM_LIB<home>')

# We need to tweak that some day
HAS_ICU    = 0

# NOTE: eventually, we should remove --keep-exit-code and --fudge
#       as the goal is that all tests must pass without fudge
HARNESS_WITH_FUDGE = $(PERL) t/harness --fudge --keep-exit-code --add_use_v5 --icu=$(HAS_ICU)

all: blib/Perl5.pbc

blib/Perl5.pbc: lib/Perl5.pm blib/Perl6/P5World.pbc blib/Perl6/P5Actions.pbc blib/Perl6/P5Grammar.pbc
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl5.pir lib/Perl5.pm
	$(PARROT) -o blib/Perl5.pbc blib/Perl5.pir

blib/Perl6/P5World.pbc: lib/Perl6/P5World.pm
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl6/P5World.pir lib/Perl6/P5World.pm
	$(PARROT) -o blib/Perl6/P5World.pbc blib/Perl6/P5World.pir

blib/Perl6/P5Actions.pbc: lib/Perl6/P5World.pm lib/Perl6/P5Actions.pm
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl6/P5Actions.pir lib/Perl6/P5Actions.pm
	$(PARROT) -o blib/Perl6/P5Actions.pbc blib/Perl6/P5Actions.pir

blib/Perl6/P5Grammar.pbc: lib/Perl6/P5Actions.pm lib/Perl6/P5Grammar.pm
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl6/P5Grammar.pir lib/Perl6/P5Grammar.pm
	$(PARROT) -o blib/Perl6/P5Grammar.pbc blib/Perl6/P5Grammar.pir

clean:
	$(RM_F) blib/*.pbc blib/*.pir blib/Perl6/*.pbc blib/Perl6/*.pir

install: all
	$(MKPATH) $(LIB)/lib/Perl6
	$(CP) blib/*.pbc $(LIB)/lib/
	$(CP) blib/*.pir $(LIB)/lib/
	$(CP) blib/Perl6/*.pbc $(LIB)/lib/Perl6/
	$(CP) blib/Perl6/*.pir $(LIB)/lib/Perl6/

test:
	PERL6LIB=blib prove -e perl6 t/perl5/basic.t

testable : all spectest_checkout spectest_update

spectest_checkout : t/spec
t/spec :
	git clone git://github.com/rakudo-p5/roast5.git t/spec
	-cd t/spec/ && git config remote.origin.pushurl git@github.com:rakudo-p5/roast5.git

spectest_update :
	-cd t/spec && git pull

spectest: testable t/spectest.data
	V5DEBUG=0 PERL6LIB=blib $(HARNESS_WITH_FUDGE) --tests-from-file=t/spectest.data

fulltest: testable t/spectest.data
	V5DEBUG=0 PERL6LIB=blib $(HARNESS_WITH_FUDGE) t/*/*.t t/*/*/*.t
