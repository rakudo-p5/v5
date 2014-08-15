<table align='center'>
    <thead>
        <tr><th></th><th>pass</th><th>fail</th><th>todo</th><th>skip</th><th>spec</th></tr>
    </thead>
    <tbody>
        <tr align='center'><td align='left'>summary</td><td>611</td><td>39836</td><td>3</td><td>1</td><td>40449</td></tr>
        <tr align='center'><td align='left'>opbasic/arith.v5</td><td>153</td><td>14</td><td>0</td><td>0</td><td>167</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/for.v5</td><td>61</td><td>56</td><td>1</td><td>0</td><td>118</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::a called<br />
  in block  at t/spec/cmd/for.v5:665<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in block  at t/spec/cmd/for.v5:20<br />
<br />   1 todo   : RT #1085: what should be output of perl -we 'print do { foreach (1, 2) { 1; } }'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/num.v5</td><td>52</td><td>0</td><td>1</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'><br />
# Failed test at lib/Test.pm line 75<br />
<br />   1 todo   : NYI<br />
</td></tr>
        <tr align='center'><td align='left'>comp/cmdopt.v5</td><td>44</td><td>0</td><td>0</td><td>0</td><td>44</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest_stack_ok.v5</td><td>34</td><td>101</td><td>0</td><td>0</td><td>135</td></tr>
        <tr><td colspan='5'># Failed test '-r *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test '-w *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test '-x *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test '-o *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test at lib/Test.pm line 89<br />
#      got: '1'<br />
# expected: '-o $overld did not leave $overld on the stack'<br />
# Failed test '-R *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test at /home/froggs/dev/v5/t/./test.pl line 12<br />
#      got: '1'<br />
# expected: '-R $overld did not leave $overld on the stack'<br />
# Failed test '-W *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test at /home/froggs/dev/v5/t/./test.pl line 12<br />
#      got: '1'<br />
# expected: '-W $overld did not leave $overld on the stack'<br />
# Failed test '-X *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test at /home/froggs/dev/v5/t/./test.pl line 12<br />
#      got: '1'<br />
# expected: '-X $overld did not leave $overld on the stack'<br />
# Failed test '-O *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test at /home/froggs/dev/v5/t/./test.pl line 12<br />
#      got: '1'<br />
# expected: '-O $overld did not leave $overld on the stack'<br />
# Failed test '-e *gv returns single value'<br />
# at lib/Test.pm line 75<br />
# Failed test '-z *gv returns single value'<br />
# at lib/Test.pm line 75<br />
'' is not a regular file while trying to do '.z'<br />
  in method Str at src/gen/m-CORE.setting:13018<br />
  in sub P5Str at src/Perl5/Terms.pm:1182<br />
  in sub P5Str at /home/froggs/dev/v5/lib/Perl5/Terms.pm.moarvm:1<br />
  in sub is at /home/froggs/dev/v5/t/./test.pl:64<br />
  in block  at t/spec/op/filetest_stack_ok.v5:26<br />
# Looks like you planned 135 tests, but ran 49<br />
# Looks like you failed 15 tests of 49<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/_num_to_alpha.v5</td><td>24</td><td>1</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'><br />
# Failed test at lib/Test.pm line 89<br />
#      got: ''<br />
# expected: 'Returns undef for negative numbers'<br />
Testing limit capabilities<br />
# Looks like you failed 1 tests of 25<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/unshift.v5</td><td>22</td><td>14</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'unshift singleton list'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: '1 2 3'<br />
# expected: '0 1 2 3'<br />
# Failed test 'unshift count == 4'<br />
# at lib/Test.pm line 75<br />
# Failed test 'unshift list'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: '1 2 3'<br />
# expected: '3 2 1 0 1 2 3'<br />
# Failed test 'unshift count == 7'<br />
# at lib/Test.pm line 75<br />
# Failed test 'unshift array'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: '1 2 3'<br />
# expected: '5 4 3 2 1 0 1 2 3'<br />
# Failed test 'unshift count == 9'<br />
# at lib/Test.pm line 75<br />
# Failed test 'unshift count == 9 (ref)'<br />
# at lib/Test.pm line 75<br />
# Failed test 'unshift arrays'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: '1 2 3'<br />
# expected: '7 6 5 4 3 2 1 0 1 2 3'<br />
# Failed test 'unshift count == 11'<br />
# at lib/Test.pm line 75<br />
# Failed test 'unshift count == 11 (ref)'<br />
# at lib/Test.pm line 75<br />
# Failed test 'void unshift singleton list'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: 'y z'<br />
# expected: 'x y z'<br />
# Failed test 'void unshift list'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: 'y z'<br />
# expected: 'u v w x y z'<br />
# Failed test 'void unshift array'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: 'y z'<br />
# expected: 's t u v w x y z'<br />
# Failed test 'void unshift arrays'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: 'y z'<br />
# expected: 'q r s t u v w x y z'<br />
# Looks like you failed 14 tests of 36<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/fold.v5</td><td>19</td><td>7</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $SIG<br />
    at t/spec/comp/fold.v5:90<br />
    ------&gt;     local $SIG⏏{__DIE__}  = sub { $c+= 2 };<br />
Undefined subroutine &amp;main::INSTALL called<br />
  in block  at t/spec/comp/fold.v5:124<br />
</td></tr>
        <tr align='center'><td align='left'>cmd/switch.v5</td><td>18</td><td>0</td><td>0</td><td>0</td><td>18</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/06-bool.v5</td><td>16</td><td>16</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "Main" (perhaps you forgot to load "Main"?)<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-array.v5</td><td>16</td><td>1</td><td>0</td><td>0</td><td>17</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/not.v5</td><td>16</td><td>0</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>parens needed around second argument in next two tests<br />
to preserve list context inside function call<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-for.v5</td><td>13</td><td>0</td><td>0</td><td>0</td><td>13</td></tr>
        <tr align='center'><td align='left'>op/die_except.v5</td><td>12</td><td>0</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left'>t/v5/04-op.v5</td><td>11</td><td>0</td><td>0</td><td>0</td><td>11</td></tr>
        <tr align='center'><td align='left'>t/v5/05-if.v5</td><td>9</td><td>0</td><td>0</td><td>0</td><td>9</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_unwind.v5</td><td>9</td><td>3</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'># Failed test 'true value assigned to $@ before 'end' block inside 'eval' block'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: ''<br />
# expected: 't1<br />
# '<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: ''<br />
# expected: 't3<br />
# '<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
#      got: ''<br />
# expected: 't3<br />
# '<br />
# Looks like you failed 3 tests of 12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/17-hash-autovivify.v5</td><td>7</td><td>0</td><td>1</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>   1 todo   : <br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/18-array-autovivify.v5</td><td>6</td><td>0</td><td>0</td><td>0</td><td>6</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/bproto.v5</td><td>6</td><td>10</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Cannot use Bool as Matcher with 'grep'.  Did you mean to use $_ inside a block?<br />
  in sub test_no_error at t/spec/comp/bproto.v5:31<br />
  in block  at t/spec/comp/bproto.v5:49<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-while.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr align='center'><td align='left'>base/while.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>t/v5/05-anon-sub.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>t/v5/03-num.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left'>cmd/elsif.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>base/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>t/v5/05-anon-sub-lex-block.v5</td><td>3</td><td>0</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sleep.v5</td><td>3</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'Sleep says it slept at least 2 seconds'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my_stash.v5</td><td>3</td><td>4</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'># Failed test at lib/Test.pm line 75<br />
# Failed test at lib/Test.pm line 75<br />
# Failed test at lib/Test.pm line 75<br />
# Failed test at lib/Test.pm line 75<br />
# Looks like you failed 4 tests of 7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defined.v5</td><td>3</td><td>2</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'defined( ... ? ... : @array)'<br />
# at lib/Test.pm line 75<br />
# Failed test 'defined(scalar @array)'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 2 tests of 5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iofile.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'># Failed test 'IO::File now loaded'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 3<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/16-var-redeclare.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/v5/16-var-redeclare.v5:13<br />
    ------&gt;     my $x ⏏= 1;<br />
</td></tr>
        <tr align='center'><td align='left'>base/pat.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/05-lex-block.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/05-lex-block-if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/05-bind.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/01-sanity.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>base/if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/term.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:744<br />
  in block  at t/spec/base/term.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_fail.v5</td><td>1</td><td>14</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::FH called<br />
  in block  at t/spec/io/perlio_fail.v5:13<br />
# Looks like you planned 15 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/basic.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-accessor.v5</td><td>1</td><td>2</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new1" via package "Other" (perhaps you forgot to load "Other"?)<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/02-int.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/opsubs.v5</td><td>1</td><td>35</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Cannot find method 'at_key': no method cache and no .^find_method<br />
  in block  at t/spec/comp/opsubs.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/multiline.v5</td><td>1</td><td>5</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Could not close: <br />
  in block  at t/spec/comp/multiline.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/hints.v5</td><td>1</td><td>30</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot call 'infix:&lt;P5&amp;&gt;'; none of these signatures match:<br />
:(Str \a, Str \b)<br />
:(Any \a, Any \b)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getpid.v5</td><td>1</td><td>2</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::getppid called<br />
  in block  at t/spec/op/getpid.v5:28<br />
# Looks like you planned 3 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/vec.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::vec called<br />
  in block  at t/spec/bigmem/vec.v5:10<br />
# Looks like you planned 7 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 54, near "klonk =&gt; ["<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 56, near "kഌoんḰ =&gt; ["<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 50, near "klonk =&gt; ["<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 52, near "kഌoんḰ =&gt; ["<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 33, near "sub { is(M"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/64bitint.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Iteration past end of iterator<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/anonsub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/anonsub.v5:6<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/assignwarn.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/closure.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 182, near "'global_sc"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/cond.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coreamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 31, near "evalbytes="<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coresubs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/do.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exists_sub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fork.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block  at t/spec/op/fork.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gmagic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct at line 218, near " \"EOC\" or "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode-tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/inccode-tie.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/index_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/leaky-magic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find tests in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mydef.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/line_debug.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readdir.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/readdir.v5:39<br />
------&gt; my @G = sort &lt;op/*.⏏t&gt;;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $man<br />
    at t/spec/op/readdir.v5:29<br />
    ------&gt;     open my $man⏏, '&lt;', '../MANIFEST' or die "Can't open <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_37033.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/require_37033.v5:14<br />
    ------&gt;     open my $fh⏏, '&lt;', 'README' or die "Can't open READM<br />
Could not find file './test.pl' for module ./test.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/require_37033.v5:8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/runlevel.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/runlevel.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartkve.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 36, near "hash =&gt; { "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/splice.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'  at line 77, near " @tests};\n"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/substr_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/tie.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/upgrade.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8decode.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/write.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/cmp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/args_assert.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/args_assert.v5:27<br />
    ------&gt;     open my $fh⏏, '&lt;', $proto or die "Can't open $proto:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/args_assert.v5:38<br />
    ------&gt;     open my $fh⏏, '&lt;', $manifest or die "Can't open $man<br />
Can't open ../proto.h: <br />
  in block  at t/spec/porting/args_assert.v5:24<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in block  at t/spec/porting/args_assert.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/authors.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block  at t/spec/porting/authors.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcase.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing or wrong version of dependency 'src/gen/m-BOOTSTRAP.nqp'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcfgvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub shell at src/gen/m-CORE.setting:726<br />
  in sub system at src/Perl5/Terms.pm:279<br />
  in block  at t/spec/porting/checkcfgvar.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/cmp_version.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block  at t/spec/porting/cmp_version.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/customized.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Maintainers in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/diag.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot call 'Real'; none of these signatures match:<br />
:(Mu:U \v: *%_)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/dual-life.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing or wrong version of dependency 'src/gen/m-BOOTSTRAP.nqp'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/exec-bit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/exec-bit.v5:13<br />
    ------&gt;   open my $fh⏏, '&lt;', $fname or die "Can't open '$fname<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/filenames.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $m<br />
    at t/spec/porting/filenames.v5:37<br />
    ------&gt; open my $m⏏, '&lt;', $manifest or die "Can't open '$ma<br />
Can't open '../MANIFEST': <br />
  in block  at t/spec/porting/filenames.v5:32<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/require.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Not an ARRAY reference<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/globvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/globvar.v5:33<br />
    ------&gt; open my $fh⏏, '-|', $^X, '-Ilib', './makedef.pl', 'P<br />
===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/maintainers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Maintainers in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/manifest.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $m<br />
    at t/spec/porting/manifest.v5:17<br />
    ------&gt; open my $m⏏, '&lt;', $manifest or die "Can't open '$ma<br />
===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pending-author.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/perlfunc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub shell at src/gen/m-CORE.setting:726<br />
  in sub system at src/Perl5/Terms.pm:279<br />
  in block  at t/spec/porting/perlfunc.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pod_rules.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/porting/pod_rules.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/regen.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/test_bootstrap.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 22, near "hints =&gt; \""<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/utils.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 54, near "'Porting/g"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/fold_grind.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/overload.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/pat_advanced_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/pat_psycho_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/pat_re_eval_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/pat_rt_report_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/pat_special_cc_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/pat_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/reg_email_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_mesg.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_namedcapture.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_posixcc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets_compat.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_noamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_notrie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_qr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_qr_embed.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_qr_embed_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::useithreads called<br />
  in block  at t/spec/re/regexp_qr_embed_thr.v5:5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_trielist.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 39, near "L         "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/re/regexp_unicode_prop_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left'>re/substT.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst_amp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left'>re/subst_wamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left'>re/uniprops.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/fresh_perl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/locale.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchx.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/run/switchx.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/can_isa_ok.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/tempfile.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>skipping the first filename because it is taken for use by _fresh_perl()<br />
# Failed test at lib/Test.pm line 89<br />
#      got: 'tmp13663A'<br />
# expected: 'tmp13663B'<br />
# Failed test at /home/froggs/dev/v5/t/./test.pl line 12<br />
#      got: 'tmp13663B'<br />
# expected: 'tmp13663C'<br />
Too many positional parameters passed; got 2 but expected between 0 and 1<br />
  in sub fail at src/Perl5/Terms.pm:211<br />
  in block  at t/spec/test_pl/tempfile.v5:31<br />
  in sub skip_files at t/spec/test_pl/tempfile.v5:13<br />
  in block  at t/spec/test_pl/tempfile.v5:1<br />
<br />   2 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/attrs.v5<br />
Unexpected closing bracket<br />
at t/spec/uni/attrs.v5:160<br />
------&gt; FY_CODE_ATTRIBUTES { $proto = $_[1]; _: ⏏}<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error encoding UTF-8 string near grapheme position 6613 with codepoint 64259<br />
   at src/Perl6/Grammar.nqp:338  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Grammar.moarvm:TOP:425)<br />
 from gen/moar/stage2/QRegex.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/QRegex.moarvm:parse:44)<br />
 from gen/moar/stage2/NQPHLL.nqp:1398  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:parse:80)<br />
 from gen/moar/stage2/NQPHLL.nqp:1354  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:compile:197)<br />
 from gen/moar/stage2/NQPHLL.nqp:1101  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:eval:53)<br />
 from gen/moar/stage2/NQPHLL.nqp:1311  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:87)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lower.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Type check failed in binding; expected 'Positional' but got 'Parcel'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf_through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Cannot find method 'at_key': no method cache and no .^find_method<br />
  in block  at t/spec/io/crlf_through.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/data.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/title.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Type check failed in binding; expected 'Positional' but got 'Parcel'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/upper.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Type check failed in binding; expected 'Positional' but got 'Parcel'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>win32/runenv.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Win32 in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left'>win32/system.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>x2p/s2p.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/04-string.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot modify an immutable Any<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/05-hash.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/05-hash.v5<br />
Confused<br />
at t/v5/05-hash.v5:60<br />
------&gt; sub x1 () { 1230 } ⏏$v{x1()} = 120;        # '1230'     =&gt; 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/09-namespace.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/10-bind-sub-param.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/19-local.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/30-tie-array.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/30-tie-array.v5<br />
Cannot use pseudo package CORE in sub declaration<br />
at t/v5/30-tie-array.v5:48<br />
------&gt; sub CORE::shift⏏         { say "not ok 101 # CORE::shift<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/31-autoload.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/32-autoload-method.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/layers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_leaks.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $in<br />
    at t/spec/io/perlio_leaks.v5:22<br />
    ------&gt;         my $base_fd = do{ open my $in⏏, '&lt;', $0 or die $!; fileno $in };<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/perlio_leaks.v5:29<br />
    ------&gt; 	    open my $fh⏏, "&lt;$layer", $0 or die $!;<br />
Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/say.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/croak.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Failed to find '/home/froggs/dev/v5/lib/t/lib/common.pl.pm6' while trying to do '.f'<br />
  in method f at src/gen/m-CORE.setting:14013<br />
  in block  at /home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:21315<br />
  in method candidates at src/gen/m-CORE.setting:21312<br />
  in block  at src/gen/m-CORE.setting:21128<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in method candidates at src/gen/m-CORE.setting:21126<br />
  in method load_module at src/gen/m-CORE.setting:21140<br />
  in block  at t/spec/lib/croak.v5:8<br />
Unhandled exception: Element shifted from empty list<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11704  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:40)<br />
 from gen/moar/stage2/NQPHLL.nqp:1249  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:374)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/no_load.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/lib/no_load.v5:22<br />
------&gt; 		 ⏏) {<br />
Other potential difficulties:<br />
    Redeclaration of symbol $test<br />
    at t/spec/lib/no_load.v5:22<br />
    ------&gt; 		 ⏏) {<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_fallback.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_nomethod.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "Foo" (perhaps you forgot to load "Foo"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for t::lib::F'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/read.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::DATA called<br />
  in block  at t/spec/bigmem/read.v5:10<br />
# Looks like you planned 1 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Ƭ::ŁiƁ::Ḟ'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for t::lib::F'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Ƭ::ŁiƁ::Ḟ'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right C3 merge order for xx::DBIx::Class::Core'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right C3 merge order for Ẋẋ::ḐʙIＸ::Cl았::Core'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right DFS merge order for xx::DBIx::Class::Core'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right DFS merge order for Ẋẋ::ḐʙIＸ::Cl았::Coﾚ'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/inconsistent_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/inconsistent_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_ineval.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "B" (perhaps you forgot to load "B"?)<br />
# Looks like you planned 1 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_ineval_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 45, near "u, \n   'me"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for the Vulcan Dylan Example'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for the ቩᓪ찬 Dylan Example'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for the Vulcan Dylan Example'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for the ቩᓪ찬 Dylan Example'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fresh_perl_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash-rt85026.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/final_line_num.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/final_line_num.v5<br />
Confused<br />
at t/spec/comp/final_line_num.v5:14<br />
------&gt; BEGIN { $last_line_num = __LINE__; } ⏏print 1+<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/podcheck.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing or wrong version of dependency 'src/gen/m-BOOTSTRAP.nqp'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/charset.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 19, near "'\\w' =&gt; [ "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/no_utf8_pm.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qrstack.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_60508.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_fold.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 51, near "@{$invmap_"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switch0.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/bom.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/cache.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/21-test.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Perlito5::Test in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errnosig.v5</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::alarm called<br />
  in block  at t/spec/io/errnosig.v5:13<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in block  at t/spec/io/errnosig.v5:10<br />
<br />   1 skipped: Alarm not supported<br />
</td></tr>
        <tr align='center'><td align='left'>lib/1_compile.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/commonsense.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::BAIL_OUT called<br />
  in block  at t/spec/lib/commonsense.v5:14<br />
# Looks like you planned 1 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Diamond_D'<br />
# at lib/Test.pm line 75<br />
===SORRY!===<br />
Can't locate object method "foo" via package "Diamond_D" (perhaps you forgot to load "Diamond_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Ｄiᚪၚd_D'<br />
# at lib/Test.pm line 75<br />
===SORRY!===<br />
Can't locate object method "ᕘ" via package "Ｄiᚪၚd_D" (perhaps you forgot to load "Ｄiᚪၚd_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Diamond_D'<br />
# at lib/Test.pm line 75<br />
===SORRY!===<br />
Can't locate object method "foo" via package "Diamond_D" (perhaps you forgot to load "Diamond_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Ｄiᚪၚd_D'<br />
# at lib/Test.pm line 75<br />
===SORRY!===<br />
Can't locate object method "ᕘ" via package "Ｄiᚪၚd_D" (perhaps you forgot to load "Ｄiᚪၚd_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_inanon.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "B" (perhaps you forgot to load "B"?)<br />
# Looks like you planned 2 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_inanon_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "ᕘ" via package "Ḃ" (perhaps you forgot to load "Ḃ"?)<br />
# Looks like you planned 2 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/groups.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic-27839.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot call 'Real'; none of these signatures match:<br />
:(Mu:U \v: *%_)<br />
# Looks like you planned 2 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/overload_integer.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Foo in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, ., ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pwent.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time_loop.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block  at t/spec/op/time_loop.v5:1<br />
# Looks like you planned 2 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/bincompat.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/porting/bincompat.v5<br />
Confused<br />
at t/spec/porting/bincompat.v5:14<br />
------&gt; my @V = map {s/^ //⏏r} Internals::V();<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr_gc.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchF.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switcha.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd-78586.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $^P<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chomp.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-bind-method-param.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "subr" via package "Main" (perhaps you forgot to load "Main"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-bless.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "Other" (perhaps you forgot to load "Other"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-class-open.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "Other" (perhaps you forgot to load "Other"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iprefix.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/io/iprefix.v5:17<br />
# Looks like you planned 2 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/read.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/concat2.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grent.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/print.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/setpgrpstack.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utftaint.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/noswitch.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/script.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchn.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left'>run/switchp.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "Foo" (perhaps you forgot to load "Foo"?)<br />
# Looks like you planned 4 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "fಓ" via package "ᕘ" (perhaps you forgot to load "ᕘ"?)<br />
# Looks like you planned 4 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "TTop" (perhaps you forgot to load "TTop"?)<br />
# Looks like you planned 4 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_goto_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "ᕗ" via package "ᵗ톺" (perhaps you forgot to load "ᵗ톺"?)<br />
# Looks like you planned 4 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrhand.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/crypt.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filehandle.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigsystem.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/sigsystem.v5<br />
Confused<br />
at t/spec/op/sigsystem.v5:28<br />
------&gt;     my $pid = fork // ⏏die "Can't fork: $!";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/mad.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/mad.v5:34<br />
    ------&gt;     delete local $ENV⏏{$_} for keys %ENV;<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/mad.v5:42<br />
    ------&gt;     delete local $ENV⏏{$_} for keys %ENV;<br />
Undefined subroutine &amp;main::delete called<br />
  in block  at t/spec/run/mad.v5:34<br />
  in block  at t/spec/run/mad.v5:33<br />
# Looks like you planned 4 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchI.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Cannot call method 'end' on a null object<br />
  in block  at t/spec/run/switchI.v5:15<br />
# Looks like you planned 4 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>win32/fs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/12-context.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/24-strict.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block at line 4, near "('use stri"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/25-syntax-defined-or.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/25-syntax-defined-or.v5<br />
Confused<br />
at t/v5/25-syntax-defined-or.v5:8<br />
------&gt;     print "not " unless (shift // ⏏2) == 5;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_method.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_method_utf8.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/alarm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::alarm called<br />
  in block  at t/spec/op/alarm.v5:1<br />
# Looks like you planned 5 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dbm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lock.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/yadayada.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchF1.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/eval.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/opcroak.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/select.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-class.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "Other" (perhaps you forgot to load "Other"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/nargv.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/blocks.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/kill0.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads-dirh.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
# Looks like you planned 6 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/unlink.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8magic.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_7jis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator ) at line 49, near ""<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_eucjp.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_sjis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/inplace.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/io/inplace.v5:15<br />
# Looks like you planned 6 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_open.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>benchmark/rt26188-speed-up-keys-on-empty-hash.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 47, near "big =&gt; '1 "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/c3_with_overload.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/c3_with_overload_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_c3.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_c3_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_dfs.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/context.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/context.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest_t.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct at line 13, near ";   # Yow!"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/packagev.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/our.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/comp/our.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package_block.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/magic_phase.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/readline.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fflush.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_c3.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 70, near "sub { @E::"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_c3_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 72, near "sub { @ǝ::"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_dfs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 57, near "sub { @E::"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_dfs_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 59, near "sub { @ǝ::"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/evalbytes.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fh.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getppid.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/or.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/or.v5:27<br />
  in block  at t/spec/op/or.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/rand.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/symbolcache.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pos.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chr.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/tr_utf8.v5<br />
Missing semicolon.<br />
at t/spec/uni/tr_utf8.v5:40<br />
------&gt; $str = $hiragana; ⏏$str =~ s/([ぁ-ん])/$h2k{$1}/go;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/write.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/proxy_constant_subs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::svref_2object called<br />
  in block  at t/spec/lib/proxy_constant_subs.v5:22<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in block  at t/spec/lib/proxy_constant_subs.v5:20<br />
# Looks like you planned 8 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/decl.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/decl.v5<br />
Confused<br />
at t/spec/comp/decl.v5:33<br />
------&gt; &lt;BOL&gt;⏏four();<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/heredoc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/select.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/select.v5:20<br />
------&gt; is ref⏏\select, 'SCALAR', 'and STDOUT is a plai<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/select.v5:12<br />
    ------&gt; open my $fh⏏, "test.pl" or die "$0 unfortunately can<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/dtrace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
P6opaque: no such attribute '$!storage'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/binmode.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/labels.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/labels.v5<br />
Confused<br />
at t/spec/uni/labels.v5:49<br />
------&gt;  $@, qr/Label not found for "last Ｅ" at/⏏u, "last's error is UTF-8 clean";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/26-syntax-namespace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'># Failed test '... got the right MRO for Diamond_D'<br />
# at lib/Test.pm line 75<br />
===SORRY!===<br />
Can't locate object method "foo" via package "Diamond_D" (perhaps you forgot to load "Diamond_D"?)<br />
# Looks like you planned 10 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 74, near "u, '... ca"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 86, near "guard =&gt; g"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/srand.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/FindExt.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find FindExt in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tie.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/eintr.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/23-eval.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/openpid.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block  at t/spec/io/openpid.v5:1<br />
# Looks like you planned 10 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/deprecate.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 16, near "(File::Spe"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_c3.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_c3_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_dfs.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_dfs_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_dfs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'># Failed test '... got the right DFS merge order for Test::A'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::B'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::C'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::D'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::E'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::F'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::G'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::H'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::I'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::J'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for Test::K'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 11 tests of 11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_dfs_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'># Failed test '... got the right DFS merge order for 텟Ṱ::ᐊ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ḅ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ȼ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḏ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ӭ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḟ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ḡ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḣ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ᶦ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ｊ'<br />
# at lib/Test.pm line 75<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḵ'<br />
# at lib/Test.pm line 75<br />
# Looks like you failed 11 tests of 11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array_base.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block at line 13, near "('$[ = 1; "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/flip.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')'  at line 55, near "..2));\n\nli"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto_xs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unknown QAST node type Any<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_errors.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sselect.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/sselect.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/class.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lex_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_c3.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_c3_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pos.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/protowarn.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in parensig; couldn't find final ')'  at line 42, near "x) { };\n\nB"<br />
# Looks like you planned 12 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/dup.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/13-op-context.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::wantarray called<br />
  in sub foo at t/v5/13-op-context.v5:7<br />
  in block  at t/v5/13-op-context.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/mod.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/append.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pow.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/wantarray.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchC.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switcht.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/universal.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/form_scope.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct at line 13, near "&lt;&lt;\n$test\n."<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/studytied.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/package.v5<br />
Confused<br />
at t/spec/comp/package.v5:18<br />
------&gt;     $main⏏'a = $'b;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr-72922.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
# Looks like you planned 14 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_pmod.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 16, near "[ '/p',   "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/mypragma.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find mypragma in any of: lib, lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
# Looks like you planned 14 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/int.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/numconvert.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8cache.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/shm.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exp.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashwarn.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/hashwarn.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/push.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/defout.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errno.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Could not find file './test.pl' for module ./test.pl<br />
  in method load_module at src/Perl5/ModuleLoader.pm:54<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/io/errno.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/cygwin.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/current_sub.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/glob.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lfs.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lop.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/caller.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/package.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/package.v5<br />
Confused<br />
at t/spec/uni/package.v5:37<br />
------&gt;     $압Ƈ⏏'d읯ⱪ = 6;        #'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die.v5</td><td>0</td><td>19</td><td>0</td><td>0</td><td>19</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_keeperr.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unknown QAST node type Match<br />
# Looks like you planned 20 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/redef.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/join.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mkdir.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/cloexec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/args.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/term.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/argv.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 28, near "prog\t=&gt; 'w"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isarev.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'  at line 23, near " $args[0]}"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isarev_utf8.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'  at line 26, near " $args[0]}"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pipe.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/print.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/while.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left'>comp/colon.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reverse.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defins.v5</td><td>0</td><td>27</td><td>0</td><td>0</td><td>27</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $name<br />
    at t/spec/op/defins.v5:100<br />
    ------&gt; while (my $name ⏏= readdir(DIR))<br />
    Redeclaration of symbol $name<br />
    at t/spec/op/defins.v5:149<br />
    ------&gt; while (my $name ⏏= glob('*'))<br />
    Redeclaration of symbol $name<br />
    at t/spec/op/defins.v5:179<br />
    ------&gt; while (my $name ⏏= each %hash)<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/override.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/recurse.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/qq.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/rs.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $T<br />
    at t/spec/base/rs.v5:91<br />
    ------&gt;     if (open our $T⏏, "./foo") {<br />
    Redeclaration of symbol $T<br />
    at t/spec/base/rs.v5:105<br />
    ------&gt;     if (open my $T⏏, "./foo") {<br />
===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pvbm.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigdispatch.v5</td><td>0</td><td>29</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readline.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reset.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/warn.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/concat.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dor.v5</td><td>0</td><td>31</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'is_composed' for invocant of type 'NQPClassHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/qr.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'  at line 74, near "//};\n    p"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/vec.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chars.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval_scope.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ord.v5</td><td>0</td><td>35</td><td>0</td><td>0</td><td>35</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/tell.v5</td><td>0</td><td>35</td><td>0</td><td>0</td><td>35</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/subval.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/recompile.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_nc_tie.v5</td><td>0</td><td>37</td><td>0</td><td>0</td><td>37</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/delete.v5</td><td>0</td><td>38</td><td>0</td><td>0</td><td>38</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/rxcode.v5</td><td>0</td><td>39</td><td>0</td><td>0</td><td>39</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/avhv.v5</td><td>0</td><td>40</td><td>0</td><td>0</td><td>40</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 42, near "'abc' =&gt; 1"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/length.v5</td><td>0</td><td>41</td><td>0</td><td>0</td><td>41</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chr.v5</td><td>0</td><td>42</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/repeat.v5</td><td>0</td><td>42</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 131, near "(1,2)x2);\n"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/study.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator | at line 70, near ");\n\nok(/^$"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/uproto.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/negate.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/auto.v5</td><td>0</td><td>47</td><td>0</td><td>0</td><td>47</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chdir.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
# Looks like you planned 48 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sysio.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/parser.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest.v5</td><td>0</td><td>49</td><td>0</td><td>0</td><td>49</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases_utf8.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'Bool' for invocant of type 'NQPMu'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/sprintf.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fs.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_utf8.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/basic_utf8.v5<br />
Confused<br />
at t/spec/mro/basic_utf8.v5:9<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 53);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'Bool' for invocant of type 'NQPMu'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stash.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ver.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/stash.v5</td><td>0</td><td>58</td><td>0</td><td>0</td><td>58</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic.v5</td><td>0</td><td>59</td><td>0</td><td>0</td><td>59</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/basic.v5<br />
Confused<br />
at t/spec/mro/basic.v5:7<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 59);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/quotemeta.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/utf8.v5</td><td>0</td><td>61</td><td>0</td><td>0</td><td>61</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grep.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/method.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each_array.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiehandle.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/list.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
  in block  at src/Perl5/ModuleLoader.pm:208<br />
  in method reify at src/gen/m-CORE.setting:7828<br />
  in method reify at src/gen/m-CORE.setting:7664<br />
  in method gimme at src/gen/m-CORE.setting:8176<br />
  in method sink at src/gen/m-CORE.setting:8635<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:172<br />
  in method load_module at src/Perl5/ModuleLoader.pm:147<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21150<br />
  in block  at t/spec/op/list.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/localref.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 21, near "$x x2};$aa"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/loopctl.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/loopctl.v5:958<br />
    ------&gt;     until (! (my $x ⏏= $i)) {<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/loopctl.v5:964<br />
    ------&gt;     for ($i = 1; my $x ⏏= $i; ) {<br />
===SORRY!===<br />
Cannot find method 'named'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time.v5</td><td>0</td><td>66</td><td>0</td><td>0</td><td>66</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiearray.v5</td><td>0</td><td>69</td><td>0</td><td>0</td><td>69</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/greek.v5</td><td>0</td><td>72</td><td>0</td><td>0</td><td>72</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/retainedlines.v5</td><td>0</td><td>74</td><td>0</td><td>0</td><td>74</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/oct.v5</td><td>0</td><td>77</td><td>0</td><td>0</td><td>77</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 35, near "'0'x10).'1"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/use.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find test_use in any of: lib, /home/froggs/dev/v5/lib, /home/froggs/dev/v5/lib/Perl5, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, .<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/bless.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/lex.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/undef.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto.v5</td><td>0</td><td>89</td><td>0</td><td>0</td><td>89</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'curry' for invocant of type 'Perl6::Metamodel::ParametricRoleGroupHOW'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/caller.v5</td><td>0</td><td>91</td><td>0</td><td>0</td><td>91</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/universal.v5</td><td>0</td><td>93</td><td>0</td><td>0</td><td>93</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/runenv.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type cannot unbox to a native string<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/latin2.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utfhash.v5</td><td>0</td><td>99</td><td>0</td><td>0</td><td>99</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex_assign.v5</td><td>0</td><td>100</td><td>0</td><td>0</td><td>100</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bless.v5</td><td>0</td><td>109</td><td>0</td><td>0</td><td>109</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'add_categorical' for invocant of type 'Cursor'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stat.v5</td><td>0</td><td>113</td><td>0</td><td>0</td><td>113</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/svleak.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switches.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/open.v5</td><td>0</td><td>121</td><td>0</td><td>0</td><td>121</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array.v5</td><td>0</td><td>127</td><td>0</td><td>0</td><td>127</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/lexsub.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/eval.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lc.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1307  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1288  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1214  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1189  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>japh/abigail.v5</td><td>0</td><td>130</td><td>0</td><td>0</td><td>130</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/state.v5</td><td>0</td><td>131</td><td>0</td><td>0</td><td>131</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tr.v5</td><td>0</td><td>132</td><td>0</td><td>0</td><td>132</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/universal.v5</td><td>0</td><td>139</td><td>0</td><td>0</td><td>139</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/method.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/range.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/range.v5:396<br />
------&gt;  for (1..2) { for (1..4) { $s .= ++$_ } ⏏$s.=' ' if $_==1; }<br />
Other potential difficulties:<br />
    Redeclaration of symbol @foo<br />
    at t/spec/op/range.v5:355<br />
    ------&gt; my @foo⏏;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chop.v5</td><td>0</td><td>143</td><td>0</td><td>0</td><td>143</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/incfilter.v5</td><td>0</td><td>145</td><td>0</td><td>0</td><td>145</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split_unicode.v5</td><td>0</td><td>151</td><td>0</td><td>0</td><td>151</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
# Looks like you planned 151 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/parser.v5</td><td>0</td><td>154</td><td>0</td><td>0</td><td>154</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bop.v5</td><td>0</td><td>174</td><td>0</td><td>0</td><td>174</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sort.v5</td><td>0</td><td>176</td><td>0</td><td>0</td><td>176</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 22, near "map scalar"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic.v5</td><td>0</td><td>178</td><td>0</td><td>0</td><td>178</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/proto.v5</td><td>0</td><td>180</td><td>0</td><td>0</td><td>180</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/proto.v5<br />
Confused<br />
at t/spec/comp/proto.v5:47<br />
------&gt; testing ⏏\&amp;no_proto, undef;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub_lval.v5</td><td>0</td><td>191</td><td>0</td><td>0</td><td>191</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/switch.v5</td><td>0</td><td>201</td><td>0</td><td>0</td><td>201</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/switch.v5<br />
Confused<br />
at t/spec/op/switch.v5:23<br />
------&gt;     ⏏CORE::default { pass "continue (without <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst.v5</td><td>0</td><td>206</td><td>0</td><td>0</td><td>206</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/subst.v5<br />
Confused<br />
at t/spec/re/subst.v5:14<br />
------&gt; $a = s/david/rules/⏏r;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/gv.v5</td><td>0</td><td>212</td><td>0</td><td>0</td><td>212</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/overload.v5</td><td>0</td><td>215</td><td>0</td><td>0</td><td>215</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'stringify'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ref.v5</td><td>0</td><td>230</td><td>0</td><td>0</td><td>230</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gv.v5</td><td>0</td><td>245</td><td>0</td><td>0</td><td>245</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/cproto.v5</td><td>0</td><td>254</td><td>0</td><td>0</td><td>254</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashassign.v5</td><td>0</td><td>309</td><td>0</td><td>0</td><td>309</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/local.v5</td><td>0</td><td>310</td><td>0</td><td>0</td><td>310</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie_fetch_count.v5</td><td>0</td><td>312</td><td>0</td><td>0</td><td>312</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
# Looks like you planned 312 tests, but ran 0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartmatch.v5</td><td>0</td><td>349</td><td>0</td><td>0</td><td>349</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr.v5</td><td>0</td><td>387</td><td>0</td><td>0</td><td>387</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'ast' for invocant of type 'Array'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval.v5</td><td>0</td><td>463</td><td>0</td><td>0</td><td>463</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat.v5</td><td>0</td><td>466</td><td>0</td><td>0</td><td>466</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/taint.v5</td><td>0</td><td>797</td><td>0</td><td>0</td><td>797</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf2.v5</td><td>0</td><td>1370</td><td>0</td><td>0</td><td>1370</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report.v5</td><td>0</td><td>2530</td><td>0</td><td>0</td><td>2530</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol __INC__<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/read.v5</td><td>0</td><td>2564</td><td>0</td><td>0</td><td>2564</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'throw_unrecog_backslash_seq' for invocant of type 'Perl5::QGrammar+{qq}+{stop5[Str]}'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/utf.v5</td><td>0</td><td>4016</td><td>0</td><td>0</td><td>4016</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 9, near "'UTF-8'   "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pack.v5</td><td>0</td><td>14704</td><td>0</td><td>0</td><td>14704</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement at line 285, near "$x = unpac"<br />
</td></tr>

        <tr><td>/home/froggs/dev/nqp/install/bin/perl6-m -I/home/froggs/dev/v5/lib --version</td><td colspan='5'>This is perl6 version 2014.07-179-g3c6bcff built on MoarVM version 2014.07-365-g29d2e7b
</td></tr>
    </tbody>
</table>
