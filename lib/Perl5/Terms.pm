
class Perl5::Terms;

my $INPUT_RECORD_SEPARATOR = "\n";
sub INPUT_RECORD_SEPARATOR is export is rw { $INPUT_RECORD_SEPARATOR }

multi sub chop()          is export { chop(CALLER::DYNAMIC::<$_>) }
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

# http://perldoc.perl.org/functions/chomp.html
multi sub chomp()          is export { chomp(CALLER::DYNAMIC::<$_>) }
multi sub chomp(*@s is rw) is export {
    my $nr_chomped = 0;
    return 0 unless $INPUT_RECORD_SEPARATOR.defined;
    # TODO When in slurp mode ($/ = undef ) or fixed-length record mode
    #      ($/ is a reference to an integer or the like; see perlvar) chomp() won't remove anything
    for @s -> $s is rw {
        if $s && $s.chars {
            my $chomped  = $INPUT_RECORD_SEPARATOR eq ''
                        ?? $s.subst(/\n+$/, '')
                        !! $s.subst(/$INPUT_RECORD_SEPARATOR$/, '');
            $nr_chomped += $s.chars - $chomped.chars;
            $s           = $chomped;
        }
    }
    $nr_chomped
}

multi sub open( $fh is rw, $expr )             is export { open( $fh, $expr.substr(0, 1), $expr.substr(1) ) }
multi sub open( $fh is rw, $m, $expr, *@list ) is export {
    # ($path, :r(:$r), :w(:$w), :a(:$a), :p(:$p), :bin(:$bin), :chomp(:$chomp) = { ... }, :enc(:encoding(:$encoding)) = { ... })
    $fh = $expr.IO.open( :r($m eq '<'), :w($m eq '>'), :a($m eq '>>'), :p($m eq '|'), :bin(0) );
}

multi sub print( *@text ) is export { $*OUT.print( @text.join('') ) }

sub close( IO::Handle $fh ) is export { $fh.close }

sub ref($o) is export {
    $o.^name.uc
}

sub scalar( @array ) is export { +@array }

proto sub shift(|) {*}
multi sub shift()   is export { shift(CALLER::DYNAMIC::<@_>) }
multi sub shift(@a) is export { @a.shift                     }
