
class Perl5::Terms;


multi sub chop()          is export { chop(CALLER::<$_>) }
multi sub chop(*@s is rw) is export {
    my $chopped_of = '';
    for @s -> $s is rw {
        if $s && $s.chars {
            $chopped_of = $s.substr(*-1);
            $s          = $s.substr(0, *-1);
        }
    }
    $chopped_of
}


multi sub chomp()          is export { chomp(CALLER::<$_>) }
multi sub chomp(*@s is rw) is export {
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


sub ref($o) is export {
    $o.^name
}
