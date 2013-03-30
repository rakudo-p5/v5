v5
==

v5.pm for rakudo

Currently v5.pm is compiled into perl5.pbc as 'use v5' is currently a noop in rakudo so temporarily use 'use perl5'.

make # build everything
make spectest # run the tests form roast5 we pass

PERL6LIB=blib perl6 t/v5/basic.t # run a file

