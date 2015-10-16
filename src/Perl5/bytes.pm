
use v6;

# http://perldoc.perl.org/bytes.html

sub EXPORT(|) {
    { '$*USE_BYTES' => +($*SCOPE eq 'use'); }
}

unit module bytes;
