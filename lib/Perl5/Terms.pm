
class Perl5::Terms;

sub _chop(*@s is rw) {
    my $chopped_of = '';
    for @s -> $s is rw {
        if $s && $s.chars {
            $chopped_of = $s.substr(*-1);
            $s          = $s.substr(0, *-1);
        }
    }
    $chopped_of
}
multi sub chop(*@s is rw) is export { _chop(@s)           }
multi sub chop()          is export { _chop(CALLER::<$_>) }

sub _chomp(*@s is rw) {
    my $so_chomped = 0;
    for @s -> $s is rw {
        if $s && $s.chars {
            my $chomped = $s.chomp;
            $so_chomped = +?($s ne $chomped);
            $s          = $chomped;
        }
    }
    $so_chomped
}
multi sub chomp(*@s is rw) is export { _chomp(@s)           }
multi sub chomp()          is export { _chomp(CALLER::<$_>) }

sub ref($o) is export {
    $o.^name
}
