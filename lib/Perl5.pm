use Perl6::Grammar;
use Perl6::P5Grammar;
use Perl6::P5World;

sub EXPORT(*@a) {
    $*W.HOW.mixin( $*W, Perl6::P5World );

    %*LANG<Perl5> := Perl6::P5Grammar;
    %*LANG<Perl5-actions> := Perl6::P5Actions;
    %*LANG<P5Q> := Perl6::P5QGrammar;
    %*LANG<P5Q-actions> := Perl6::P5QActions;
    %*LANG<P5Regex> := Perl6::P5RegexGrammar;
    %*LANG<P5Regex-actions> := Perl6::P5RegexActions;
    $*ACTIONS := %*LANG<Perl5-actions>;
    
    $*MAIN := 'Perl5';
    
    $*W.install_lexical_symbol($*W.cur_lexpad(), '%?LANG', $*W.p6ize_recursive(%*LANG));
    $*W.install_lexical_symbol($*W.cur_lexpad(), '$*MAIN', $*W.p6ize_recursive($*MAIN));

    my $PROCESS := nqp::gethllsym('perl6', 'PROCESS');
    if !nqp::isnull($PROCESS) && nqp::existskey($PROCESS.WHO, '%CUSTOM_LIB') {
        my $INC := ($PROCESS.WHO)<%CUSTOM_LIB>;
        if nqp::defined($INC) {
            my %INC := $INC.FLATTENABLE_HASH();
            unless nqp::existskey(%INC, 'Perl5') {
                %INC<Perl5> := $*W.find_symbol(['Array']).new;
                my $PERL5LIB := nqp::atkey(nqp::getenvhash(), 'PERL5LIB');
                if nqp::defined($PERL5LIB) {
                    %INC<Perl5>.unshift: $*W.p6ize_recursive( nqp::split(':', $PERL5LIB) )
                }
                my $I := %*COMPILING<%?OPTIONS><I>;
                if nqp::defined($I) {
                    if nqp::islist($I) {
                        my $iter := nqp::iterator($I);
                        %INC<Perl5>.unshift: $*W.p6ize_recursive( nqp::shift($iter) ) while $iter;
                    }
                    else {
                        %INC<Perl5>.unshift: $*W.p6ize_recursive( $I );
                    }
                }
            }
        }
    }
}
