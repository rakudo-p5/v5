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
}

say "Back to Perl 6 on a $*DISTRO.name box." # $*DISTRO is a Perl 6's "special variable"
```
The goal is to be able to run all pure-Perl 5 code besides Perl 6. One benefit of this approach
(reimplementing Perl 5 with Perl 6's object system) is to be able to pass data/objects easily
between both languages.
XS will not be supported, since it depends of Perl 5's internal structure.

INSTALLATION
--
```bash
panda install v5
```

USAGE
--
```bash
perl6 my_script.pl             # run a file that has a `use v5` at the top
perl6 -MPerl5 my_old_script.pl # run a file that hasn't
```
