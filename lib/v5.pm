use Perl6::Grammar;
use Perl6::P5Grammar;
grammar Foo {
}
my $grammar := Foo.HOW.new_type();
$grammar.HOW.add_parent($grammar,Perl6::P5Grammar);
$grammar.HOW.add_parent($grammar,Perl6::Grammar);
$grammar.HOW.compose($grammar);
%*LANG<MAIN> := $grammar;
%*LANG<MAIN-actions> := Perl6::P5Actions;
