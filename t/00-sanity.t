use lib 'lib';
use v5;
use 5.10.0;

# This file is intended to run with rakudo's v5 as well with your installed Perl 5 interpreter.

$n = 0; # 'my' blows up
say( (1 ? '' : 'n')     . "ok " . ++$n . " - at line " . __LINE__ );
say( (0+1 ? '' : 'n')   . "ok " . ++$n . " - at line " . __LINE__ );
say( ("a" ? '' : 'n')   . "ok " . ++$n . " - at line " . __LINE__ );
say( ("0" ? 'n' : '')   . "ok " . ++$n . " - at line " . __LINE__ );
say( ("0e0" ? '' : 'n') . "ok " . ++$n . " - at line " . __LINE__ );

say "1.." . $n;
