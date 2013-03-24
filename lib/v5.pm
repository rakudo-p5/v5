use Perl6::Grammar;
use Perl6::P5Grammar;
use Perl6::P5World;

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
