
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

multi sub open( $fh is rw, $expr )             is export { open( $fh, $expr.substr(0, 1), $expr.substr(1) ) }
multi sub open( $fh is rw, $m, $expr, *@list ) is export {
    # ($path, :r(:$r), :w(:$w), :a(:$a), :p(:$p), :bin(:$bin), :chomp(:$chomp) = { ... }, :enc(:encoding(:$encoding)) = { ... })
    $fh = $expr.IO.open( :r($m eq '<'), :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) );
}

multi sub print( :$fh, *@text ) is export { ($fh || $*OUT).print( @text.join('') ) }

sub close( IO::Handle $fh ) is export { $fh.close }

sub ref($o) is export {
    $o.^name
}
