
use v6.0.0;

# http://perldoc.perl.org/bytes.html

sub EXPORT(|) {
    { '$*USE_BYTES' => +($*SCOPE eq 'use'); }
}

module bytes;
