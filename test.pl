
say "hello from P6";
if 1 {
    say 1;
}

{
    use perl5;
    use strict;
    use feature 'say'; # say does work without it though
    
    #package Main;
    
    if( 2 ) {
        say("2: hello from P5");
    }
    if( 0 ) {
        say "you should never see this";
    }
    say "you should never see this" if 0;
    say "you should never see this" unless 1;
    unless ( "" ) { print "3\n"; }
    say 4;
    say "5: 1..5";
    $_ = 7;
    for (6..9) { say $_ }
    for (10..13) {
        say $_;
    }
    sub a { say 14; }; a();
    my $s = 15;
    say $s;
    #sub b ($x) { say $x }          # Method 'multisig' not found for invocant of class 'Perl6::P5Grammar'
    #for my $x (10..13) { say $x; } # scoped variables not yet implemented. Sorry.
}

say "16";
