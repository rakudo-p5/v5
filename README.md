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

say "Back to Perl 6 on a $*OS box." # $*OS is Perl 6's special variable
```
The goal is to be able to run all pure-Perl 5 code besides Perl 6. One benefit of this approach
(reimplementing Perl 5 with Perl 6's object system) is to be able to pass data/objects easily between both languages.
XS will not be supported, since it depends of Perl 5's internal structure.

INSTALLATION
--
```bash
git clone git://github.com/rakudo-p5/v5.git
cd rakudo                        # I assume you already have rakudo installed
patch -i ../v5/rakudo.patch      # this is needed atm and will hopefully go away pretty soon
make install                     # install the patched rakudo
cd ../v5
perl6 Configure.p6
make install                     # install the Perl5 module
```

TESTING
--
```bash
make install                     # build and install everything
make spectest                    # run all tests form roast5 we pass
make fulltest                    # run all tests form roast5, even those we do not pass yet
make test test_file=t/v5/basic.t # run a single test file (using fudge)
```

USAGE
--
```bash
perl6 t/v5/basic.t               # run a file that has a `use v5` at the top
perl6 -MPerl5 t/v5/basic.t       # run a file that hasn't
```
