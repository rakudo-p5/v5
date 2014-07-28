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
say "ok "  . ++$n . " - at line " . __LINE__ if 1;
say "nok " . ++$n . " - at line " . __LINE__ if 0;
say "ok "  . ++$n . " - at line " . __LINE__ unless 0;
say "nok " . ++$n . " - at line " . __LINE__ unless 1;
say "ok "  . ++$n . " - at line " . __LINE__ if 1 && 1;
say "ok "  . ++$n . " - at line " . __LINE__ if 0 || 1;
say "nok " . ++$n . " - at line " . __LINE__ if 0 || 0;
say "nok " . ++$n . " - at line " . __LINE__ if 1 && 0;
say "ok "  . ++$n . " - at line " . __LINE__ if "$n";

$x = 0;
for (3..5) { $x++ };
say( ($x == 3 ? '' : 'n') . "ok " . ++$n . " - at line " . __LINE__ );

sub foo { 42 }
say( (foo() ? '' : 'n') . "ok " . ++$n . " - at line " . __LINE__ );

sub bar { $_[0] * 42 }
say( (bar(2) == 84 ? '' : 'n') . "ok " . ++$n . " - at line " . __LINE__ );

if ($n) {
    say "ok " . ++$n . " - at line " . __LINE__
}
else {
    say "nok " . ++$n . " - at line " . __LINE__
}

say "1.." . $n;
