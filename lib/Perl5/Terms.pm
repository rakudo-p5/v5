
class Perl5::Terms;

sub _chop($s is rw) {
    my $chopped_of = '';
    if $s.chars {
        $chopped_of = $s.substr(*-1);
        $s          = $s.substr(0, *-1);
    }
    $chopped_of
}
multi sub chop($s is rw) is export { _chop($s)           }
multi sub chop()         is export { _chop(CALLER::<$_>) }
