
use v6.0.0;
use Test;
sub _plan(*@args)            { plan(|@args)                       }
sub _pass(*@args)            { pass(|@args)                       }
sub _ok(*@args)              { ok(|@args)                         }
sub _nok(*@args)             { nok(|@args)                        }
sub _is($a, $b, $c)          { is($a.P5Str, $b.P5Str, $c.P5Str)   }
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
sub _cmp_ok($a, $b, $c, $d?) { _ok(::("&infix:<$b>")($a, $c), $d) }
sub _done_testing()          { done_testing()                     }
sub _done()                  { done()                             }
sub _fresh_perl($a, $b) { # TODO $b contains compiler switches
    my $filename = IO::Spec.catdir("$*TMPDIR", "fresh_perl.$*PID");
    $filename.IO.spurt("use v5; $a");
    my $result = qqx[perl6 $filename];
    unlink $filename;
    ~$result.subst(/\n+$/, '');
}

{
    use v5;
    sub plan {
        my %args = scalar(@_) == 2 ? @_ : tests => $_[0];
        _plan( $args{'tests'} )
    }
    sub pass                    { _pass(@_)                           }
    sub ok                      { _ok(@_)                             }
    sub nok                     { _nok(@_)                            }
    sub is                      { _is($_[0], $_[1], $_[2])            }
    sub isnt                    { _isnt(@_)                           }
    sub is_approx               { _is_approx(@_)                      }
    sub is_miniperl             { 0                                   }
    sub todo                    { _todo(@_)                           }
    sub skip                    { _skip(@_)                           }
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
    sub eq_array                { _is_deeply($_[0], $_[1], $_[2])     }
    sub cmp_ok                  { _cmp_ok($_[0], $_[1], $_[2], $_[3]) }
    sub done_testing            { _done()                             }
    sub done                    { _done()                             }
    
    sub fresh_perl_is {
        my ($code, $expected, $options, $name) = @_;
        $expected  =~ s/\n+$//;
        _is( _fresh_perl($code, $options), $expected, $name )
    }
    sub fresh_perl_like {
        my ($code, $expected, $options, $name) = @_;
        _cmp_ok( _fresh_perl($code, $options), '~~', $expected, $name )
    }
    
    # so that these tests don't die, see https://github.com/mirrors/perl/blob/blead/t/test.pl#L1587
    sub native_to_latin1 { $_[0] }
    sub latin1_to_native { $_[0] }
}
