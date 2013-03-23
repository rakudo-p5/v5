NQP        = nqp
PARROT     = parrot
RM_F       = perl -MExtUtils::Command -e rm_f

all: blib/perl5.pbc 

blib/perl5.pbc: lib/v5.pm blib/Perl6/P5Actions.pbc blib/Perl6/P5Grammar.pbc

	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/perl5.pir lib/v5.pm
	$(PARROT) -o blib/perl5.pbc blib/perl5.pir

blib/Perl6/P5Actions.pbc: lib/Perl6/P5Actions.pm
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl6/P5Actions.pir lib/Perl6/P5Actions.pm
	$(PARROT) -o blib/Perl6/P5Actions.pbc blib/Perl6/P5Actions.pir

blib/Perl6/P5Grammar.pbc: lib/Perl6/P5Grammar.pm
	$(NQP) --vmlibs=perl6_group,perl6_ops --target=pir --stagestats --output=blib/Perl6/P5Grammar.pir lib/Perl6/P5Grammar.pm
	$(PARROT) -o blib/Perl6/P5Grammar.pbc blib/Perl6/P5Grammar.pir

clean:
	$(RM_F) blib/*.pbc blib/*.pir blib/Perl6/*.pbc blib/Perl6/*.pir

test:
	PERL6LIB=blib prove -e perl6 t/v5/basic.t
