<table align=center>
    <thead>
        <tr><th></th><th>pass</th><th>fail</th><th>todo</th><th>skip</th><th>spec</th></tr>
    </thead>
    <tbody>
        <tr align=center><td align=left>base/num.v5</td><td>49</td><td>0</td><td>2</td><td>2</td><td>53</td></tr>
        <tr align=center><td align=left>comp/cmdopt.v5</td><td>44</td><td>0</td><td>0</td><td>0</td><td>44</td></tr>
        <tr align=center><td align=left>op/chars.v5</td><td>33</td><td>0</td><td>0</td><td>1</td><td>34</td></tr>
        <tr align=center><td align=left>op/ord.v5</td><td>22</td><td>0</td><td>0</td><td>13</td><td>35</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/04-op.v5</td><td>11</td><td>0</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>use of uninitialized value of type Any in string context  in block  at t/v5/04-op.v5:48

</td></tr>
        <tr align=center><td align=left>t/v5/05-if.v5</td><td>9</td><td>0</td><td>0</td><td>0</td><td>9</td></tr>
        <tr align=center><td align=left>t/v5/05-while.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr align=center><td align=left>base/while.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align=center><td align=left>t/v5/03-num.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align=center><td align=left>op/sleep.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align=center><td align=left>op/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align=center><td align=left>cmd/elsif.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align=center><td align=left>base/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align=center><td align=left rowspan=2>base/term.v5</td><td>3</td><td>0</td><td>2</td><td>2</td><td>7</td></tr>
        <tr><td colspan=5>use of uninitialized value of type Any in numeric context  in block  at t/spec/base/term.v5:32

use of uninitialized value of type Any in string context  in block  at t/spec/base/term.v5:32

</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/16-var-redeclare.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>Potential difficulties:
    Redeclaration of symbol $x
    at t/v5/16-var-redeclare.v5:14
    ------>     my $x ⏏= 1;
</td></tr>
        <tr align=center><td align=left>t/v5/05-bind.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align=center><td align=left>t/v5/01-sanity.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align=center><td align=left rowspan=2>op/append.v5</td><td>2</td><td>11</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>Cannot assign into a PMCNULL container
  in block  at t/spec/op/append.v5:23

</td></tr>
        <tr align=center><td align=left>base/if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align=center><td align=left>t/v5/basic.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align=center><td align=left>t/v5/02-int.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_04_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_04_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/basic_04_dfs.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_04_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_05_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/basic_05_c3.v5:8
------> require q(.⏏/test.pl); plan(tests => 2);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_05_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_05_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/basic_05_dfs.v5:8
------> require q(.⏏/test.pl); plan(tests => 2);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_05_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/c3_with_overload.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/c3_with_overload.v5:8
------> require q(.⏏/test.pl); plan(tests => 7);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/c3_with_overload_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/c3_with_overload_utf8.v5:8
------> require q(.⏏/test.pl); plan(tests => 7);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/complex_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/complex_c3.v5:8
------> require q(.⏏/test.pl); plan(tests => 12);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/complex_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/complex_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/complex_dfs.v5:8
------> require q(.⏏/test.pl); plan(tests => 11);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/complex_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/dbic_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/dbic_c3.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/dbic_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/dbic_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/dbic_dfs.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/dbic_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/inconsistent_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/inconsistent_c3.v5:14
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/inconsistent_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>cmd/for.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isa_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isa_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isa_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isa_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/method_caching.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Confused
at t/spec/mro/method_caching.v5:6
------> no strict ⏏'refs'; # we do a lot of this</td></tr>
        <tr align=center><td align=left rowspan=2>mro/method_caching_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_goto.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_goto.v5:8
------> require q(.⏏/test.pl); plan(tests => 4);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_goto_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_inanon.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_inanon.v5:8
------> require q(.⏏/test.pl); plan(tests => 2);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_inanon_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_ineval.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_ineval.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_ineval_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>cmd/mod.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_method.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_method.v5:8
------> require q(.⏏/test.pl); plan(tests => 5);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_method_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_skip.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_skip.v5:8
------> require q(.⏏/test.pl); plan(tests => 10);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_skip_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_skip_utf8.v5:8
------> require q(.⏏/test.pl); plan(tests => 10);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/overload_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/overload_c3.v5:14
------> require q(.⏏/test.pl); plan(tests => 7);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/overload_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/overload_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/overload_dfs.v5:14
------> require q(.⏏/test.pl); plan(tests => 7);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/pkg_gen.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/pkg_gen.v5:9
------> require q(.⏏/test.pl); plan(tests => 7);
</td></tr>
        <tr align=center><td align=left rowspan=2>cmd/subval.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/pkg_gen_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/vulcan_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/vulcan_c3.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/vulcan_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/vulcan_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/vulcan_dfs.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/vulcan_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/64bitint.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===

</td></tr>
        <tr align=center><td align=left rowspan=2>op/anonsub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '*DATA' is not declared
at t/spec/op/anonsub.v5:12
------> run_multiple_progs('', \*DATA⏏);</td></tr>
        <tr align=center><td align=left rowspan=2>op/assignwarn.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Confused
at t/spec/op/assignwarn.v5:21
------> ++$should_warn{$_} for⏏each qw(* / x & ** << >>);</td></tr>
        <tr align=center><td align=left rowspan=2>op/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/closure.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/bproto.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/coreamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'returns' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/coresubs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'returns' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/die_except.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Semicolon form of package definition not allowed in subscope;
  please use block form
at t/spec/op/die_except.v5:10
------>     ⏏sub DESTROY { $_[0]->() }</td></tr>
        <tr align=center><td align=left rowspan=2>op/die_exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '%ENV' is not declared
at t/spec/op/die_exit.v5:49
------> _rpt = $ENV{'DECC$FILENAME_UNIX_REPORT'}⏏ || '';</td></tr>
        <tr align=center><td align=left rowspan=2>op/die_unwind.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Semicolon form of package definition not allowed in subscope;
  please use block form
at t/spec/op/die_unwind.v5:20
------>     ⏏sub DESTROY { $_[0]->() }</td></tr>
        <tr align=center><td align=left rowspan=2>op/do.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/colon.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine ok
at t/spec/comp/colon.v5:24
------> <BOL>⏏$SIG{__WARN__} = sub { 1; }; # avoid som</td></tr>
        <tr align=center><td align=left rowspan=2>base/lex.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Unrecognized backslash sequence: '\E'
at t/spec/base/lex.v5:47
------> eval <<\⏏EOE, print $@;</td></tr>
        <tr align=center><td align=left rowspan=2>op/exists_sub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/decl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix = instead
at t/spec/comp/decl.v5:10
------> format one =⏏<EOL>
</td></tr>
        <tr align=center><td align=left rowspan=2>op/fork.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/gmagic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/groups.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Odd number of elements found where hash expected
</td></tr>
        <tr align=center><td align=left rowspan=2>op/inc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '$b' is not declared
at t/spec/op/inc.v5:57
------> $b⏏ = -$a;</td></tr>
        <tr align=center><td align=left rowspan=2>op/inccode-tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Tie::Array in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine is
at t/spec/comp/fold.v5:57
------> <BOL>⏏sub ok {</td></tr>
        <tr align=center><td align=left rowspan=2>op/index_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/op/index_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>op/leaky-magic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find tests in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/form_scope.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Malformed block
at t/spec/comp/form_scope.v5:8
------> sub f ⏏($);</td></tr>
        <tr align=center><td align=left rowspan=2>op/lex_assign.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/hints.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    @INC = qw(. ../lib);\n    chdir 't';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/my.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/mydef.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/line_debug.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine ok
at t/spec/comp/line_debug.v5:16
------> <BOL>⏏open AUX, "<", "comp/line_debug_0.aux" o</td></tr>
        <tr align=center><td align=left rowspan=2>comp/multiline.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine is
at t/spec/comp/multiline.v5:45
------> <BOL>⏏my $filename = "multiline$$";</td></tr>
        <tr align=center><td align=left rowspan=2>op/readdir.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/opsubs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'returns' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/require_37033.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '%INC' is not declared
at t/spec/op/require_37033.v5:14
------>     delete $INC{'test_use_14937.pm'}⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>op/runlevel.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Undeclared routine:
    run_multiple_progs used at line 17

</td></tr>
        <tr align=center><td align=left rowspan=2>comp/our.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine is
at t/spec/comp/our.v5:28
------> <BOL>⏏{</td></tr>
        <tr align=center><td align=left rowspan=2>op/smartkve.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/splice.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sprintf.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find version in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/package.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Too late for semicolon form of package definition
at t/spec/comp/package.v5:18
------>     ⏏$blurfl = 5;</td></tr>
        <tr align=center><td align=left rowspan=2>comp/package_block.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/substr_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/op/substr_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>op/tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Undeclared routine:
    run_multiple_progs used at line 20

</td></tr>
        <tr align=center><td align=left rowspan=2>comp/parser.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine is
at t/spec/comp/parser.v5:55
------> <BOL>⏏eval '%@x=0;';</td></tr>
        <tr align=center><td align=left rowspan=2>op/upgrade.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/proto.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Malformed block
at t/spec/comp/proto.v5:27
------> sub testing ⏏(&$) {</td></tr>
        <tr align=center><td align=left rowspan=2>op/utf8decode.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/redef.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &sub
</td></tr>
        <tr align=center><td align=left rowspan=2>op/write.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>opbasic/arith.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Malformed block
at t/spec/opbasic/arith.v5:16
------> sub try ⏏($$$) {</td></tr>
        <tr align=center><td align=left rowspan=2>opbasic/cmp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find integer in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>opbasic/concat.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine ok
at t/spec/opbasic/concat.v5:27
------> <BOL>⏏print "1..30\n";</td></tr>
        <tr align=center><td align=left rowspan=2>opbasic/qq.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/args_assert.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '@ARGV' is not declared
at t/spec/porting/args_assert.v5:66
------> <BOL>⏏<EOL></td></tr>
        <tr align=center><td align=left rowspan=2>porting/authors.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/require.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Number contains two decimal points (missing 'v' for version number?)
at t/spec/comp/require.v5:59
------> eval { require v5.5.⏏630; };
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/checkcase.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/checkcfgvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/cmp_version.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/customized.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n        # This test script uses a slightly atypical invocation of the 'standard'\n        # core ..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/diag.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/dual-life.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find File::Basename in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/exec-bit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find ExtUtils::Manifest in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/filenames.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Two terms in a row
at t/spec/porting/filenames.v5:8
------> tests being done⏏:</td></tr>
        <tr align=center><td align=left rowspan=2>porting/globvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/retainedlines.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Malformed block
at t/spec/comp/retainedlines.v5:29
------> sub is⏏($$$) {</td></tr>
        <tr align=center><td align=left rowspan=2>porting/maintainers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n\t# This test script uses a slightly atypical invocation of the 'standard'\n\t# core testing setu..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/manifest.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/pending-author.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/perlfunc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/pod_rules.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Undeclared routine:
    runperl used at line 13

</td></tr>
        <tr align=center><td align=left rowspan=2>porting/podcheck.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Carp in any of: ../lib, blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/regen.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/test_bootstrap.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/utils.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find TestInit in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/term.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/fold_grind.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/overload.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_advanced.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/re/pat_advanced.v5:14
------> sub run_tests⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_advanced_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/pat_advanced_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_psycho_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/pat_psycho_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_re_eval_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/pat_re_eval_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>comp/uproto.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Redeclaration of routine is
at t/spec/comp/uproto.v5:53
------> <BOL>⏏sub f($$_) { my $x = shift; is("@_", $x)</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_rt_report_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/pat_rt_report_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_special_cc_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/pat_special_cc_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/pat_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>comp/use.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Malformed block
at t/spec/comp/use.v5:61
------> sub like ⏏($$;$) {</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_email.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_email_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/reg_email_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_eval.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_mesg.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
hangs
</td></tr>
        <tr align=center><td align=left>re/reg_namedcapture.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align=center><td align=left rowspan=2>comp/utf.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_posixcc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regex_sets.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib, .
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regex_sets_compat.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &prefix:<|>
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_noamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_notrie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    ${^RE_TRIE_MAXBUF}=-1;\n    #${^RE_DEBUG_FLAGS}=0;\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_qr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_qr_embed.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_qr_embed_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_trielist.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n        ${^RE_TRIE_MAXBUFF}=0;\n        #${^RE_DEBUG_FLAGS}=0;\n      }"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_unicode_prop.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_if_miniperl
</td></tr>
        <tr align=center><td align=left rowspan=2>re/regexp_unicode_prop_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file './thread_it.pl' for module ./thread_it.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/re/regexp_unicode_prop_thr.v5:5

</td></tr>
        <tr align=center><td align=left rowspan=2>re/substT.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/subst_amp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/subst_wamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>re/uniprops.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/re/uniprops.v5:9
------> do ⏏'../lib/unicore/TestProp.pl';</td></tr>
        <tr align=center><td align=left rowspan=2>run/exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>run/fresh_perl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/locale.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchF1.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Unrecognized backslash sequence: '\3'
at t/spec/run/switchF1.v5:25
------> ok\⏏3\- use of alternate delimiter (backslas</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchx.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>test_pl/_num_to_alpha.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>test_pl/can_isa_ok.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file 'test.pl' for module test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>test_pl/tempfile.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/crlf_through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/io/crlf_through.v5:12
------> do ⏏'./io/through.t' or die "no kid script";</td></tr>
        <tr align=center><td align=left rowspan=2>uni/fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Error while reading from file: Invalid character in UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/lower.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib uni .);\n    require \"case.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>io/data.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Undeclared routine:
    run_multiple_progs used at line 20

</td></tr>
        <tr align=center><td align=left rowspan=2>uni/title.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib uni .);\n    require \"case.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/upper.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib uni .);\n    require \"case.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>win32/runenv.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>win32/system.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Cannot modify an immutable value
</td></tr>
        <tr align=center><td align=left rowspan=2>x2p/s2p.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find File::Copy in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/04-string.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '${v[1]}' is not declared
at t/v5/04-string.v5:66
------> $r = "-${v[1]}⏏-";</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-anon-sub-lex-block.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Word 'sub' interpreted as 'sub()' function call; please use whitespace around the parens
at t/v5/05-anon-sub-lex-block.v5:8
------>     my $a = sub ⏏() { 
Unexpected block in infix position (two terms in a row)
at t/v5/05-anon-sub-lex-block.v5:8
------>     my $a = sub () ⏏{ 

</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-anon-sub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-array.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-for.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-hash.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-lex-block-if.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/05-lex-block.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/06-bool.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/09-namespace.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Too late for semicolon form of package definition
at t/v5/09-namespace.v5:13
------> <BOL>⏏sub subr { $_[0] + $_[1] + 1 }</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/10-bind-sub-param.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
CHECK FAILED:
Calling proto of 'shift' will never work with no arguments (lines 11, 12, 58)
    Expected: :()
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/11-accessor.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>base/rs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/11-bind-method-param.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/11-bless.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/11-class-open.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Too late for semicolon form of package definition
at t/v5/11-class-open.v5:22
------> <BOL>⏏sub subr2 {</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/11-class.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/13-op-context.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Two terms in a row
at t/v5/13-op-context.v5:11
------>     my $result = wantarray ? "LIST" ⏏: defined wantarray ? "SCALAR" : "VOID";</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/17-hash-autovivify.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/18-array-autovivify.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/19-local.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling, type X::Comp::AdHoc
  payload: Too late for semicolon form of package definition
 at line 11, near "say '1..7'"
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/21-test.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perlito5::Test in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/23-eval.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/24-strict.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/v5/24-strict.v5:4
------> eval⏏('use strict;my $x = "ok 1";print $x,"\n</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/25-syntax-defined-or.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Null regex not allowed
at t/v5/25-syntax-defined-or.v5:9
------>     print "not " unless (shift //⏏ 2) == 5;
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/26-syntax-namespace.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not locate compile-time value for symbol A
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/30-tie-array.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Semicolon form of package definition not allowed in subscope;
  please use block form
at t/v5/30-tie-array.v5:9
------>     ⏏sub TIEARRAY {</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/31-autoload.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Semicolon form of package definition not allowed in subscope;
  please use block form
at t/v5/31-autoload.v5:12
------>     ⏏our $AUTOLOAD;</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/32-autoload-method.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Semicolon form of package definition not allowed in subscope;
  please use block form
at t/v5/32-autoload-method.v5:12
------>     ⏏our $AUTOLOAD;</td></tr>
        <tr align=center><td align=left rowspan=2>io/layers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/nargv.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/perlio_leaks.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/print.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===

</td></tr>
        <tr align=center><td align=left rowspan=2>io/say.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===

</td></tr>
        <tr align=center><td align=left rowspan=2>io/tell.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/croak.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>Could not find file '../t/lib/common.pl' for module ../t/lib/common.pl
  in any load_module at src/Perl6/ModuleLoader.nqp:123
  in block  at t/spec/lib/croak.v5:9

</td></tr>
        <tr align=center><td align=left rowspan=2>lib/no_load.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/overload_fallback.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find overload in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/overload_nomethod.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'is_composed' not found for invocant of class 'NQPClassHOW'
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_02_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_03_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/basic_03_c3.v5:8
------> require q(.⏏/test.pl); plan(tests => 4);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_03_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_03_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/basic_03_dfs.v5:8
------> require q(.⏏/test.pl); plan(tests => 4);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_03_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_04_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/basic_04_c3.v5:8
------> require q(.⏏/test.pl); plan(tests => 1);
</td></tr>
        <tr align=center><td align=left rowspan=2>op/fresh_perl_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>comp/final_line_num.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Unable to parse regex; couldn't find final '/'
at t/spec/comp/final_line_num.v5:8
------> =~ /\Asyntax error at [^ ]+ line ([0-9]+⏏), at EOF/ or exit 1;</td></tr>
        <tr align=center><td align=left rowspan=2>op/hash-rt85026.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/charset.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/no_utf8_pm.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Unrecognized Perl 5 regex backslash sequence
at t/spec/re/no_utf8_pm.v5:17
------> "\0" =~ /[\001-\⏏xFF]/i;</td></tr>
        <tr align=center><td align=left rowspan=2>re/qrstack.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Bogus statement
at t/spec/re/qrstack.v5:13
------> ok(defined [(1)x⏏127,qr//,1]->[127], "qr// should extend</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_60508.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Unrecognized backslash sequence: '\3'
at t/spec/re/reg_60508.v5:37
------> $k2 =~ s/([\⏏360-\362])/>/g;</td></tr>
        <tr align=center><td align=left rowspan=2>run/switch0.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/bom.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/cache.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib .);\n    require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>io/errnosig.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/1_compile.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/commonsense.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>bigmem/read.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib, blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/magic-27839.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &sub
</td></tr>
        <tr align=center><td align=left rowspan=2>op/overload_integer.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>op/pwent.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/time_loop.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/bincompat.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/qr_gc.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>base/pat.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>Cannot assign into a PMCNULL container
  in block  at t/spec/base/pat.v5:9

</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchF.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switcha.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchd-78586.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    $^P = 0x122;\n    chdir 't';\n    @INC = ('../lib', 'lib');\n    require './test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/chomp.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>io/iprefix.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>io/read.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan=5>===SORRY!===

</td></tr>
        <tr align=center><td align=left rowspan=2>op/concat2.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/getpid.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib);\n    #require './test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/grent.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/print.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file 'test.pl' for module test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/setpgrpstack.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/utftaint.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>run/noswitch.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/script.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchn.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchp.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>Null PMC access in find_method('subst')
  in block  at t/spec/run/switchp.v5:17

</td></tr>
        <tr align=center><td align=left rowspan=2>io/iofile.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_if_miniperl
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_NEXT.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find NEXT in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_NEXT_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find NEXT in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/attrhand.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_if_miniperl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/crypt.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/filehandle.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sigsystem.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n      require './test.pl';\n      skip_all_if_miniperl();\n      skip_all_without_config(qw(d_for..."): Error while compiling op call (source text: "skip_all_without_config(qw(d_fork))"): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>run/mad.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchI.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib, blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>win32/fs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
hangs
</td></tr>
        <tr align=center><td align=left rowspan=2>t/v5/12-context.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>WARNINGS:
Useless use of "," in expression "= 6, 7" in sink context (lines 22, 23)
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/proxy_constant_subs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Confused
at t/spec/lib/proxy_constant_subs.v5:6
------> ip_all_without_dynamic_extension($_) for⏏each qw(B Fcntl);</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_01_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Operators '<' and '>' are non-associative and require parenthesis
at t/spec/mro/basic_01_c3.v5:54
------> <BOL>⏏<EOL></td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_01_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_01_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Operators '<' and '>' are non-associative and require parenthesis
at t/spec/mro/basic_01_dfs.v5:54
------> <BOL>⏏<EOL></td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_01_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/alarm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/dbm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/defined.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>op/filetest_stack_ok.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Null regex not allowed
at t/spec/op/filetest_stack_ok.v5:15
------> my @ops = split //⏏, 'rwxoRWXOezsfdlpSbctugkTMBAC';
</td></tr>
        <tr align=center><td align=left rowspan=2>op/lock.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    #require './test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/yadayada.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/qr.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/eval.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/opcroak.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/select.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/blocks.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Unable to parse expression in shell-quote words; couldn't find final '>>'
at t/spec/op/blocks.v5:150
------> <BOL>⏏<EOL></td></tr>
        <tr align=center><td align=left rowspan=2>op/kill0.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/threads-dirh.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/unlink.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/utf8magic.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/tr_7jis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/tr_eucjp.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/tr_sjis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>io/inplace.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>io/perlio_open.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_without_perlio
</td></tr>
        <tr align=center><td align=left rowspan=2>benchmark/rt26188-speed-up-keys-on-empty-hash.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Benchmark in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>bigmem/vec.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib, blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/context.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/filetest_t.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/lex.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '$yow' is not declared
at t/spec/op/lex.v5:18
------>     my $yow⏏ = "ok 2";</td></tr>
        <tr align=center><td align=left rowspan=2>op/my_stash.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'is_composed' not found for invocant of class 'NQPClassHOW'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/packagev.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>opbasic/magic_phase.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Malformed block
at t/spec/opbasic/magic_phase.v5:16
------> sub ok ⏏($$) {</td></tr>
        <tr align=center><td align=left rowspan=2>uni/readline.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/fflush.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/recursion_c3.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '%SIG' is not declared
at t/spec/mro/recursion_c3.v5:16
------> m has no SIGALRM") if !exists $SIG{ALRM}⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>mro/recursion_c3_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/recursion_dfs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '%SIG' is not declared
at t/spec/mro/recursion_dfs.v5:16
------> m has no SIGALRM") if !exists $SIG{ALRM}⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>mro/recursion_dfs_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/evalbytes.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>op/fh.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Undeclared routines:
    fileno used at line 17
    select used at line 20

</td></tr>
        <tr align=center><td align=left rowspan=2>op/getppid.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/or.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix - instead
at t/spec/op/or.v5:23
------>   return ${$_[0]}--⏏;
</td></tr>
        <tr align=center><td align=left rowspan=2>op/rand.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir \"t\" if -d \"t\";\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/symbolcache.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pos.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Unsupported use of /g; in Perl 6 please use :g
at t/spec/re/pos.v5:24
------> 	$str =~ /i/g⏏;
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/chr.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/tr_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/write.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '$IS_EBCDIC' is not declared
at t/spec/uni/write.v5:8
------> "EBCDIC porting needed") if $::IS_EBCDIC⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>op/heredoc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '$code' is not declared
at t/spec/op/heredoc.v5:21
------>     my $code⏏ = "<<'HEREDOC';\n${string}HEREDOC";  #</td></tr>
        <tr align=center><td align=left rowspan=2>op/select.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_special_cc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/re/pat_special_cc.v5:14
------> sub run_tests⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>io/binmode.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n#    require './test.pl';\n    eval 'use Errn..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>run/dtrace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't';\n    @INC = '../lib';\n    require './test.pl';\n\n    skip_all_without_config(\"u..."): Error while compiling op if (source text: "&&"): Operation 'if' needs either 2 or 3 operands
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/labels.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/hash.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find constant in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/srand.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    die 'hangs';\n    chdir \"t\" if -d \"t\";\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>porting/FindExt.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    @INC = qw(../win32 ../lib);\n    require './test.pl';\n    skip_all('FindExt not portable')\n..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchd.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/tie.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>io/eintr.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/openpid.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/deprecate.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find File::Copy in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_02_c3.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Two terms in a row
at t/spec/mro/basic_02_c3.v5:13
------> This example is take from⏏: http://www.python.org/2.3/mro.html</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_02_c3_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find open in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic_02_dfs.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan=5>===SORRY!===
Two terms in a row
at t/spec/mro/basic_02_dfs.v5:13
------> This example is take from⏏: http://www.python.org/2.3/mro.html</td></tr>
        <tr align=center><td align=left rowspan=2>op/array_base.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/op/array_base.v5:13
------>  is(eval⏏('$[ = 1; 123'), undef);</td></tr>
        <tr align=center><td align=left rowspan=2>op/flip.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file 'test.pl' for module test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/goto_xs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/require_errors.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sselect.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
hangs
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/class.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib .);\n    require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/lex_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    $| = 1;\n\n    require './test.pl';\n    skip_all_if_miniperl(\"no dynamic loading on miniper..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isa_aliases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_edgecases.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_edgecases.v5:8
------> BEGIN { chdir 't'; require q(.⏏/test.pl); @INC = qw "../lib lib" }
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/next_edgecases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/next_edgecases_utf8.v5:8
------> BEGIN { chdir 't'; require q(.⏏/test.pl); @INC = qw "../lib lib" }
</td></tr>
        <tr align=center><td align=left rowspan=2>op/pos.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/protowarn.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>io/dup.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n#    require \"./test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isa_aliases.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/pow.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/wantarray.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switchC.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switcht.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/universal.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/studytied.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/qr-72922.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_if_miniperl
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_pmod.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix , instead
at t/spec/re/reg_pmod.v5:18
------>     [ '',     "(345)",  undef,⏏  undef,  undef ],
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/mypragma.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find mypragma in any of: lib, blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/int.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/numconvert.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/utf8cache.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_psycho.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/re/pat_psycho.v5:17
------> sub run_tests⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>io/perlio_fail.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/shm.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/exp.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Undeclared routine:
    cmp_ok used at lines 21, 33, 46, 47, 48, 49, 50, 53, 54, 55, 56, 57

</td></tr>
        <tr align=center><td align=left rowspan=2>op/hashwarn.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/not.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/push.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sub.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/crlf.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n#    require \"test.pl\";\n    skip_all_witho..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>io/defout.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix = instead
at t/spec/io/defout.v5:32
------> format STDOUT =⏏<EOL>
</td></tr>
        <tr align=center><td align=left rowspan=2>io/errno.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>lib/cygwin.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all
</td></tr>
        <tr align=center><td align=left rowspan=2>op/current_sub.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't';\n    @INC = qw(../lib);\n    #require './test.pl';\n    plan (17);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/glob.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    #require 'test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/lfs.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/lop.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'ResizablePMCArray'
</td></tr>
        <tr align=center><td align=left rowspan=2>cmd/switch.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan=5>Cannot assign into a PMCNULL container
  in sub foo1 at t/spec/cmd/switch.v5:8
  in block  at t/spec/cmd/switch.v5:22

</td></tr>
        <tr align=center><td align=left rowspan=2>uni/caller.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/package.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/die.v5</td><td>0</td><td>19</td><td>0</td><td>0</td><td>19</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/die_keeperr.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>op/exec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan=5>===SORRY!===
Unsupported use of /i; in Perl 6 please use :i
at t/spec/op/exec.v5:19
------> y $unix_rpt = $env_unix_rpt =~ /^[ET1]/i⏏; 
</td></tr>
        <tr align=center><td align=left rowspan=2>op/join.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan=5>===SORRY!===
Null regex not allowed
at t/spec/op/join.v5:18
------> is( join(':',split(/ /⏏,"1 2 3")), '1:2:3', 'join implicit arra
</td></tr>
        <tr align=center><td align=left rowspan=2>op/mkdir.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/cloexec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/args.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan=5>===SORRY!===
Two terms in a row
at t/spec/op/args.v5:78
------> L⏏: { local2 }</td></tr>
        <tr align=center><td align=left rowspan=2>io/argv.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isarev.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/isarev.v5:10
------>     require q(.⏏/test.pl);
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/isarev_utf8.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/isarev_utf8.v5:10
------>     require q(.⏏/test.pl);
</td></tr>
        <tr align=center><td align=left rowspan=2>io/pipe.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>cmd/while.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>op/reverse.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/threads.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n     chdir 't' if -d 't';\n     @INC = '../lib';\n     require './test.pl';\n     $| = 1;\n\n    ..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/defins.v5</td><td>0</td><td>27</td><td>0</td><td>0</td><td>27</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    $SIG{__WARN__} = sub { $warns++; warn $_[..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/override.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/recurse.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    require \"test.pl\";\n    plan(tests => 2..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>io/pvbm.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    require \"./test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sigdispatch.v5</td><td>0</td><td>29</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/readline.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/reset.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/warn.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/dor.v5</td><td>0</td><td>31</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>op/qr.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan=5>===SORRY!===
Merging GLOBAL symbols failed: duplicate definition of symbol QAST
</td></tr>
        <tr align=center><td align=left rowspan=2>op/vec.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_eval_scope.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't';\n    @INC = qw(lib ../lib);\n    require './test.pl';\n    skip_all_if_miniperl(\"..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/unshift.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file 'test.pl' for module test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>re/recompile.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_if_miniperl
</td></tr>
        <tr align=center><td align=left rowspan=2>re/reg_nc_tie.v5</td><td>0</td><td>37</td><td>0</td><td>0</td><td>37</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find sub &skip_all_if_miniperl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/delete.v5</td><td>0</td><td>38</td><td>0</td><td>0</td><td>38</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>re/rxcode.v5</td><td>0</td><td>39</td><td>0</td><td>0</td><td>39</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>op/avhv.v5</td><td>0</td><td>40</td><td>0</td><td>0</td><td>40</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/length.v5</td><td>0</td><td>41</td><td>0</td><td>0</td><td>41</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find bytes in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/chr.v5</td><td>0</td><td>42</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib); # ../lib needed for test.deparse\n    #require..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/repeat.v5</td><td>0</td><td>42</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix , instead
at t/spec/op/repeat.v5:21
------> is('-' x undef,⏏ '',     '  x undef');
</td></tr>
        <tr align=center><td align=left rowspan=2>op/study.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/negate.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/perlio.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/auto.v5</td><td>0</td><td>47</td><td>0</td><td>0</td><td>47</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n#    require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/chdir.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sysio.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/parser.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/filetest.v5</td><td>0</td><td>49</td><td>0</td><td>0</td><td>49</td></tr>
        <tr><td colspan=5>===SORRY!===
Two terms in a row
at t/spec/op/filetest.v5:34
------> SKIP⏏: {</td></tr>
        <tr align=center><td align=left rowspan=2>mro/package_aliases_utf8.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/package_aliases_utf8.v5:11
------>     require q(.⏏/test.pl);
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/sprintf.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib .);\n    require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>io/fs.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/package_aliases.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan=5>===SORRY!===
Preceding context expects a term, but found infix . instead
at t/spec/mro/package_aliases.v5:10
------>     require q(.⏏/test.pl);
</td></tr>
        <tr align=center><td align=left rowspan=2>op/each.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan=5>===SORRY!===
Bogus statement
at t/spec/op/each.v5:55
------> 	$key =~ y/a-z/A-Z/⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>op/stash.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/ver.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    $SIG{'__WARN__'} = sub { warn $_[0] if $D..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/stash.v5</td><td>0</td><td>58</td><td>0</td><td>0</td><td>58</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>mro/basic.v5</td><td>0</td><td>59</td><td>0</td><td>0</td><td>59</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/inccode.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    #require './test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/quotemeta.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>io/utf8.v5</td><td>0</td><td>61</td><td>0</td><td>0</td><td>61</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>op/grep.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    #require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/method.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/each_array.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find vars in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/tiehandle.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not locate compile-time value for symbol fail
</td></tr>
        <tr align=center><td align=left rowspan=2>op/list.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/localref.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan=5>===SORRY!===
Bogus statement
at t/spec/op/localref.v5:21
------> { local ${$x x⏏2};$aa = 6; is($aa,6); undef $x; is($aa,</td></tr>
        <tr align=center><td align=left rowspan=2>op/loopctl.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/time.v5</td><td>0</td><td>66</td><td>0</td><td>0</td><td>66</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/tiearray.v5</td><td>0</td><td>69</td><td>0</td><td>0</td><td>69</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/greek.v5</td><td>0</td><td>72</td><td>0</td><td>0</td><td>72</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>op/oct.v5</td><td>0</td><td>77</td><td>0</td><td>0</td><td>77</td></tr>
        <tr><td colspan=5>===SORRY!===
Bogus statement
at t/spec/op/oct.v5:35
------> 	['0b'.(  '0'x⏏10).'1_0101', 0b101_01],</td></tr>
        <tr align=center><td align=left rowspan=2>uni/bless.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/undef.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/goto.v5</td><td>0</td><td>89</td><td>0</td><td>0</td><td>89</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    #require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/caller.v5</td><td>0</td><td>91</td><td>0</td><td>0</td><td>91</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/universal.v5</td><td>0</td><td>93</td><td>0</td><td>0</td><td>93</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = '../lib';\n    $| = 1;\n    require \"./test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>run/runenv.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/latin2.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>op/utfhash.v5</td><td>0</td><td>99</td><td>0</td><td>0</td><td>99</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>op/bless.v5</td><td>0</td><td>109</td><td>0</td><td>0</td><td>109</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/stat.v5</td><td>0</td><td>113</td><td>0</td><td>0</td><td>113</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/index.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan=5>===SORRY!===
Variable '$a' is not declared
at t/spec/op/index.v5:68
------> $a⏏ = "foo \x{1234}bar";</td></tr>
        <tr align=center><td align=left rowspan=2>op/svleak.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/split.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>run/switches.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>io/open.v5</td><td>0</td><td>121</td><td>0</td><td>0</td><td>121</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/array.v5</td><td>0</td><td>127</td><td>0</td><td>0</td><td>127</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ., ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>cmd/lexsub.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/eval.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>op/lc.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan=5>Error while reading from file: Malformed UTF-8 string

current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12731) (src/stage2/gen/NQPHLL.nqp:1315)
called from Sub 'evalfiles' pc 31800 (src/stage2/gen/NQPHLL.pir:12553) (src/stage2/gen/NQPHLL.nqp:1302)
called from Sub 'command_eval' pc 30589 (src/stage2/gen/NQPHLL.pir:12069) (src/stage2/gen/NQPHLL.nqp:1257)
called from Sub 'command_eval' pc 369 (src/gen/perl6-compiler.pir:194) (src/Perl6/Compiler.nqp:17)
called from Sub 'command_line' pc 29612 (src/stage2/gen/NQPHLL.pir:11664) (src/stage2/gen/NQPHLL.nqp:1207)
called from Sub 'MAIN' pc 362 (src/gen/perl6.pir:141) (src/main.nqp src/gen/main-version.nqp:41)
called from Sub '' pc 77 (src/gen/perl6.pir:56) (src/main.nqp src/gen/main-version.nqp:1)
called from Sub '' pc 1127 (src/gen/perl6.pir:404) (src/main.nqp src/gen/main-version.nqp:52)
</td></tr>
        <tr align=center><td align=left rowspan=2>japh/abigail.v5</td><td>0</td><td>130</td><td>0</td><td>0</td><td>130</td></tr>
        <tr><td colspan=5>===SORRY!===
Cannot modify an immutable value
</td></tr>
        <tr align=center><td align=left rowspan=2>op/state.v5</td><td>0</td><td>131</td><td>0</td><td>0</td><td>131</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/tr.v5</td><td>0</td><td>132</td><td>0</td><td>0</td><td>132</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/universal.v5</td><td>0</td><td>139</td><td>0</td><td>0</td><td>139</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = '../lib';\n    $| = 1;\n    require \"./test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/method.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib lib);\n    require \"test.pl\";\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/range.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: ../lib, .
</td></tr>
        <tr align=center><td align=left rowspan=2>op/chop.v5</td><td>0</td><td>143</td><td>0</td><td>0</td><td>143</td></tr>
        <tr><td colspan=5>===SORRY!===
Method 'ast' not found for invocant of class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/incfilter.v5</td><td>0</td><td>145</td><td>0</td><td>0</td><td>145</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    #require 'test.pl';\n    skip_all_if_mini..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/split_unicode.v5</td><td>0</td><td>151</td><td>0</td><td>0</td><td>151</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find file './test.pl' for module ./test.pl
</td></tr>
        <tr align=center><td align=left rowspan=2>op/bop.v5</td><td>0</td><td>174</td><td>0</td><td>0</td><td>174</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sort.v5</td><td>0</td><td>176</td><td>0</td><td>0</td><td>176</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    require 'test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/magic.v5</td><td>0</td><td>178</td><td>0</td><td>0</td><td>178</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    $| = 1;\n    chdir 't' if -d 't';\n    @INC = '../lib';\n    #require './test.pl';\n    plan ..."): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sub_lval.v5</td><td>0</td><td>191</td><td>0</td><td>0</td><td>191</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/switch.v5</td><td>0</td><td>201</td><td>0</td><td>0</td><td>201</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/subst.v5</td><td>0</td><td>206</td><td>0</td><td>0</td><td>206</td></tr>
        <tr><td colspan=5>===SORRY!===
get_iter() not implemented in class 'NQPMu'
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/gv.v5</td><td>0</td><td>212</td><td>0</td><td>0</td><td>212</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>uni/overload.v5</td><td>0</td><td>215</td><td>0</td><td>0</td><td>215</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/ref.v5</td><td>0</td><td>230</td><td>0</td><td>0</td><td>230</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    require 'test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/gv.v5</td><td>0</td><td>245</td><td>0</td><td>0</td><td>245</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>op/cproto.v5</td><td>0</td><td>254</td><td>0</td><td>0</td><td>254</td></tr>
        <tr><td colspan=5>===SORRY!===
Null PMC access in get_iter()
</td></tr>
        <tr align=center><td align=left rowspan=2>op/hashassign.v5</td><td>0</td><td>309</td><td>0</td><td>0</td><td>309</td></tr>
        <tr><td colspan=5>===SORRY!===
Unable to parse expression in argument list; couldn't find final ')'
at t/spec/op/hashassign.v5:134
------> ok (main->in_method ⏏(%names), "pass hash into a method");</td></tr>
        <tr align=center><td align=left rowspan=2>op/local.v5</td><td>0</td><td>310</td><td>0</td><td>0</td><td>310</td></tr>
        <tr><td colspan=5>===SORRY!===
Error while compiling block : Error while compiling block  (source text: "{\n    chdir 't' if -d 't';\n    @INC = qw(. ../lib);\n    require './test.pl';\n}"): Error while compiling op p6store (source text: "="): Unknown QAST node type NQPMu
</td></tr>
        <tr align=center><td align=left rowspan=2>op/tie_fetch_count.v5</td><td>0</td><td>312</td><td>0</td><td>0</td><td>312</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/smartmatch.v5</td><td>0</td><td>349</td><td>0</td><td>0</td><td>349</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/substr.v5</td><td>0</td><td>387</td><td>0</td><td>0</td><td>387</td></tr>
        <tr><td colspan=5>===SORRY!===
Confused
at t/spec/op/substr.v5:11
------> use warnings⏏ ;
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_re_eval.v5</td><td>0</td><td>463</td><td>0</td><td>0</td><td>463</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat.v5</td><td>0</td><td>466</td><td>0</td><td>0</td><td>466</td></tr>
        <tr><td colspan=5>===SORRY!===
Missing block
at t/spec/re/pat.v5:13
------> sub run_tests⏏;</td></tr>
        <tr align=center><td align=left rowspan=2>op/taint.v5</td><td>0</td><td>797</td><td>0</td><td>0</td><td>797</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/sprintf2.v5</td><td>0</td><td>1370</td><td>0</td><td>0</td><td>1370</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>re/pat_rt_report.v5</td><td>0</td><td>2530</td><td>0</td><td>0</td><td>2530</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Config in any of: blib, ., /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/site/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/vendor/lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib, /home/froggs/.perl6/2013.03-122-gef73eb9/lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/read.v5</td><td>0</td><td>2564</td><td>0</td><td>0</td><td>2564</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
        <tr align=center><td align=left rowspan=2>op/pack.v5</td><td>0</td><td>14704</td><td>0</td><td>0</td><td>14704</td></tr>
        <tr><td colspan=5>===SORRY!===
Could not find Perl6::Grammar in any of: ../lib
</td></tr>
    </tbody>
</table>
