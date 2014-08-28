
use v6.0.0;
use Test;
my $no_plan = 0;
my $done_testing_has_been_run = 0;
%*ENV<PERL6_EXE> //= ~$*EXECUTABLE;

sub _plan($t)                { plan($no_plan = $t eq 'no_plan' ?? * !! $t)   }
sub _pass(*@args)            { pass(|@args)                       }
sub _ok(*@args)              { ok(|@args)                         }
sub _nok(*@args)             { nok(|@args)                        }
sub _is($a, $b, $c)          { is($a, $b, $c)                     }
sub _isnt(*@args)            { isnt(|@args)                       }
sub _is_approx(*@args)       { is_approx(|@args)                  }
sub _todo(*@args)            { todo(|@args)                       }
sub _skip(*@args)            { skip(|@args)                       }
sub _skip_rest(*@args)       { skip_rest(|@args)                  }
sub _diag(*@args)            { diag(|@args)                       }
sub _flunk(*@args)           { flunk(|@args)                      }
sub _isa_ok(*@args)          { isa_ok(|@args)                     }
sub _dies_ok(*@args)         { dies_ok(|@args)                    }
sub _lives_ok(*@args)        { lives_ok(|@args)                   }
sub _eval_dies_ok(*@args)    { eval_dies_ok(|@args)               }
sub _eval_lives_ok(*@args)   { eval_lives_ok(|@args)              }
sub _is_deeply($a, $b, $c)   { is_deeply($a, $b, $c)              }
sub _eq_array($a, $b)        { $a eqv $b                          }
sub _cmp_ok($a, $b, $c, $d?) { _ok(::("&infix:<P5$b>")($a // 0, $c // 0), $d // '') }
sub _done_testing()          { done_testing()                     }
sub _done()                  { done()                             }
my $tmpfile;
sub _fresh_perl($a, $b) { # TODO $b contains compiler switches
    my $filename = "$tmpfile.$*PID";
    $filename.IO.spurt("use v5; $a");
    my $result = qqx[%*ENV<PERL6_EXE> $filename];
    unlink $filename;
    ~$result.subst(/\n+$/, '');
}

END {
    ## In unplanned mode, we need to call done, Test.pm is too sane for us.
    if !$done_testing_has_been_run && $no_plan {
        $done_testing_has_been_run = 1;
        done;
    }
}

{
    use v5;
    my $test = 1;
    my $planned;
    my $noplan;
    my $Perl;

    $::IS_ASCII  = ord 'A' ==  65;
    $::IS_EBCDIC = ord 'A' == 193;

    sub plan {
        my %args = scalar(@_) == 2 ? @_ : tests => $_[0];
        _plan( $args{'tests'} )
    }
    sub pass                    { $test = $test + 1; _pass(@_)                           }
    sub ok                      { $test = $test + 1; _ok(@_)                             }
    sub nok                     { $test = $test + 1; _nok(@_)                            }
    sub is                      { $test = $test + 1; _is($_[0], $_[1], $_[2] // '') }
    sub isnt                    { $test = $test + 1; _isnt(@_)                           }
    sub is_approx               { $test = $test + 1; _is_approx(@_)                      }
    sub is_miniperl             { $test = $test + 1; 0                                   }
    sub todo                    { $test = $test + ($_[1] || 1); _todo(@_)                }
    sub skip                    { $test = $test + ($_[1] || 1); _skip(@_)                }
    sub skip_rest               { _skip_rest(@_)                      }
    sub skip_if_miniperl        {                                     }
    sub skip_all                { _skip_rest(@_)                      }
    sub skip_all_if_miniperl    {                                     }
    sub skip_all_without_config {                                     }
    sub skip_all_without_perlio {                                     }
    sub skip_all_without_dynamic_extension {                          }
    sub diag                    { _diag(@_)                           }
    sub flunk                   { _flunk(@_)                          }
    sub isa_ok                  { _isa_ok(@_)                         }
    sub dies_ok                 { _dies_ok(@_)                        }
    sub lives_ok                { _lives_ok(@_)                       }
    sub eval_dies_ok            { _eval_dies_ok(@_)                   }
    sub eval_lives_ok           { _eval_lives_ok(@_)                  }
    sub is_deeply               { _is_deeply($_[0], $_[1], $_[2])     }
    sub eq_array                { _eq_array($_[0], $_[1])             }
    sub cmp_ok                  { _cmp_ok($_[0], $_[1], $_[2], $_[3]) }
    sub done_testing            { _done()                             }
    sub done                    { _done()                             }
    
    sub like   ($$@) { like_yn (0,@_) }; # 0 for -
    sub unlike ($$@) { like_yn (1,@_) }; # 1 for un-

    sub like_yn ($$$@) {
        my ($flip, $unused, $expected, $name);
        ($flip, $unused, $expected, $name) = @_;
        my $pass;
        $pass = $_[1] =~ /$expected/ if !$flip;
        $pass = $_[1] !~ /$expected/ if $flip;
        #~ unless ($pass) {
        #~ unshift(@mess, "#      got '$_[1]'\n",
            #~ $flip
            #~ ? "# expected !~ /$expected/\n" : "# expected /$expected/\n");
        #~ }
        #~ local $Level = $Level + 1;
        ok($pass, $name // '');
    }

    sub curr_test {
        #~ $test = shift if @_;
        return $test;
    }
    
    sub next_test {
        my $retval = $test;
        $test = $test + 1; # don't use ++
        $retval;
    }

    sub fresh_perl_is {
        my ($code, $expected, $options, $name) = @_;
        $expected  =~ s/\n+$//;
        _is( _fresh_perl($code, $options), $expected, $name )
    }
    sub fresh_perl_like {
        my ($code, $expected, $options, $name) = @_;
        _cmp_ok( _fresh_perl($code, $options), '~~', $expected, $name )
    }
    
    sub unlink_all {
        my $count = 0;
        foreach my $file (@_) {
            1 while unlink $file;
            if( -f $file ) {
                _print_stderr "# Couldn't unlink '$file': $!\n";
            }
            else {
                ++$count;
            }
        }
        $count;
    }

    # _num_to_alpha - Returns a string of letters representing a positive integer.
    # Arguments :
    #   number to convert
    #   maximum number of letters

    # returns undef if the number is negative
    # returns undef if the number of letters is greater than the maximum wanted

    # _num_to_alpha( 0) eq 'A';
    # _num_to_alpha( 1) eq 'B';
    # _num_to_alpha(25) eq 'Z';
    # _num_to_alpha(26) eq 'AA';
    # _num_to_alpha(27) eq 'AB';

    my @letters = qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);

    # Avoid ++ -- ranges split negative numbers
    sub _num_to_alpha{
        my($num,$max_char) = @_;
        return unless $num >= 0;
        my $alpha = '';
        my $char_count = 0;
        $max_char = 0 if $max_char < 0;

        while( 1 ){
            $alpha = $letters[ $num % 26 ] . $alpha;
            $num = int( $num / 26 );
            last if $num == 0;
            $num = $num - 1;

            # char limit
            next unless $max_char;
            $char_count = $char_count + 1;
            return if $char_count == $max_char;
        }
        return $alpha;
    }

    my %tmpfiles;
    END { unlink_all keys %tmpfiles }

    # A regexp that matches the tempfile names
    #~ $::tempfile_regexp = 'tmp\d+[A-Z][A-Z]?';

    # Avoid ++, avoid ranges, avoid split //
    my $tempfile_count = 0;
    sub tempfile {
        while(1) {
            my $try = "tmp$$";
                my $alpha = _num_to_alpha($tempfile_count,2);
                last unless defined $alpha;
                $try = $try . $alpha;
                $tempfile_count = $tempfile_count + 1;

            # Need to note all the file names we allocated, as a second request may
            # come before the first is created.
            if (!$tmpfiles{$try} && !-e $try) {
                # We have a winner
                $tmpfiles{$try} = 1;
                return $try;
            }
        }
        die "Can't find temporary file name starting \"tmp$$\"";
    }
    
    # This is the temporary file for _fresh_perl
    #~ $tmpfile = tempfile();
    
    
    sub which_perl {
        $Perl = $^X;
    }
    
    # so that these tests don't die, see https://github.com/mirrors/perl/blob/blead/t/test.pl#L1587
    sub native_to_latin1 { $_[0] }
    sub latin1_to_native { $_[0] }
    # Check that $got is within $range of $expected
    # if $range is 0, then check it's exact
    # else if $expected is 0, then $range is an absolute value
    # otherwise $range is a fractional error.
    # Here $range must be numeric, >= 0
    # Non numeric ranges might be a useful future extension. (eg %)
    sub within ($$$@) {
        my ($got, $expected, $range, $name);
        ($got, $expected, $range, $name) = @_;
        my $pass;
        if (!defined $got or !defined $expected or !defined $range) {
            # This is a fail, but doesn't need extra diagnostics
        } elsif ($got !~ /\d/ or $expected !~ /\d/ or $range !~ /\d/) {
            # This is a fail
            print "# got, expected and range must be numeric\n";
        } elsif ($range < 0) {
            # This is also a fail
            print "# range must not be negative\n";
        } elsif ($range == 0) {
            # Within 0 is ==
            $pass = $got == $expected;
        } elsif ($expected == 0) {
            # If expected is 0, treat range as absolute
            $pass = ($got <= $range) && ($got >= - $range);
        } else {
            my $diff = $got - $expected;
            $pass = abs ($diff / $expected) < $range;
        }
        unless ($pass) {
            if ($got eq $expected) {
                print "# $got - $expected = " . ($got - $expected) . "\n";
            }
            print "#      got ". _qq($got) ."\n";
            print "# expected ". _qq($expected) ." (within ". _qq($range) .")\n";
        }
        ok($pass, $name);
    }
    sub _qq {
        my $x = shift;
        return defined $x ? '"' . $x . '"' : 'undef';
    }
}
