v5 - Perl5 for rakudo
==
v5 will let you run Perl 5 code beside Perl 6 code, like:
```perl
use v6;
grammar Foo {
    method bar { ... }
}

{
    use v5;
    if( $^O eq 'MSWin32' ) {
        say $0 # Perl 5's special variable for program name
    }
    
    {
        use 6.0.0;
        multi sub foo(*@args) {
            ...
        }
}

say "Back to Perl 6 on a $*DISTRO.name box." # $*DISTRO is a Perl 6's special variable
```
The goal is to be able to run all pure-Perl 5 code besides Perl 6. One benefit of this approach
(reimplementing Perl 5 with Perl 6's object system) is to be able to pass data/objects easily
between both languages.
XS will not be supported, since it depends of Perl 5's internal structure.

INSTALLATION
--
```bash
git clone git://github.com/rakudo-p5/v5.git
(perl6 Build.pm clean)           # in case it was already built and rakudo got updated
perl6 Build.pm build             # it can only be used from lib now, installation will
                                 # be done in future by panda
```

TESTING
--
```bash
perl6-m Build.pm summary         # run all tests form roast5, even those we do not pass yet
```

USAGE
--
```bash
perl6 -Ilib t/v5/basic.t         # run a file that has a `use v5` at the top
perl6 -Ilib -MPerl5 t/v5/basic.t # run a file that hasn't
```
