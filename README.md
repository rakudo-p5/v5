v5 - Perl5.pm for rakudo
==

Currently Perl5.pm will only be imported if you do 'use Perl5'. In near future this module will be picked up
for statements like 'use v5;' and 'use 5.10'.
This module is not installable via panda yet, and can only be used if your Cwd is the repo's root directory
and if you set PERL6LIB to 'blib'.

USAGE
--

make                             # build everything
make spectest                    # run all tests form roast5 we pass
make fulltest                    # run all tests form roast5, even those we do not pass yet
make test test_file=t/v5/basic.t # run a single test file (using fudge)

PERL6LIB=blib perl6 t/v5/basic.t # run a file

What v5 can't/won't support:
--
- As of now, we won't support `goto`. See http://perldoc.perl.org/perlsyn.html#Goto

