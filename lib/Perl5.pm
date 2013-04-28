use Perl6::Grammar;
use Perl6::P5Grammar;
use Perl6::P5World;

sub EXPORT(*@a) {
    # we use the MOP because that's the only way nqp supports multiple inheritance 
    grammar Foo {
    }
    my $grammar := Foo.HOW.new_type();
    $grammar.HOW.add_parent($grammar,Perl6::P5Grammar);
    # we need to add that so that the rebless of the cursor works, we don't use it otherwise
    $grammar.HOW.add_parent($grammar,Perl6::Grammar);
    $grammar.HOW.compose($grammar);

    $*W.HOW.mixin( $*W, Perl6::P5World );

    %*LANG<MAIN> := $grammar;
    %*LANG<MAIN-actions> := Perl6::P5Actions;
    %*LANG<Q> := Perl6::P5QGrammar;
    %*LANG<Q-actions> := Perl6::P5QActions;
    %*LANG<Regex> := Perl6::P5RegexGrammar;
    %*LANG<Regex-actions> := Perl6::P5RegexActions;
    $*ACTIONS := %*LANG<MAIN-actions>;

    my $PROCESS := nqp::gethllsym('perl6', 'PROCESS');
    if !nqp::isnull($PROCESS) && nqp::existskey($PROCESS.WHO, '%CUSTOM_LIB') {
        my $INC := ($PROCESS.WHO)<%CUSTOM_LIB>;
        if nqp::defined($INC) {
            my %INC := $INC.FLATTENABLE_HASH();
            unless nqp::existskey(%INC, 'Perl5') {
                %INC<Perl5> := $*W.find_symbol(['Array']).new;
                my $PERL5LIB := $*W.get_env('PERL5LIB');
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
