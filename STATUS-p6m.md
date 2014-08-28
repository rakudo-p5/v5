<table align='center'>
    <thead>
        <tr><th></th><th>pass</th><th>fail</th><th>todo</th><th>skip</th><th>spec</th></tr>
    </thead>
    <tbody>
        <tr align='center'><td align='left'>summary</td><td>4251</td><td>36426</td><td>2</td><td>1773</td><td>42398</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/read.v5</td><td>1542</td><td>1022</td><td>0</td><td>0</td><td>2564</td></tr>
        <tr><td colspan='5'># Failed test 'got 161 into 70 l 2 o 0'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: '1'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf2.v5</td><td>1278</td><td>92</td><td>0</td><td>0</td><td>1370</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'expected warnings'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '36'<br />
#      got: '0'<br />
P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block  at t/spec/op/sprintf2.v5:173<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method eager at src/gen/m-CORE.setting:8273<br />
  in block &lt;unit&gt; at t/spec/op/sprintf2.v5:1<br />
# Looks like you planned 1370 tests, but ran 1279<br />
# Looks like you failed 1 tests of 1279<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pow.v5</td><td>267</td><td>1</td><td>0</td><td>0</td><td>268</td></tr>
        <tr><td colspan='5'><br />
# Failed test '-2 ** 31 got[-2147483648] expect[-2147483648]'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 268<br />
</td></tr>
        <tr align='center'><td align='left'>opbasic/arith.v5</td><td>153</td><td>14</td><td>0</td><td>0</td><td>167</td></tr>
        <tr align='center'><td align='left'>op/upgrade.v5</td><td>64</td><td>0</td><td>0</td><td>0</td><td>64</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/for.v5</td><td>61</td><td>56</td><td>1</td><td>0</td><td>118</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::a called<br />
  in block  at t/spec/cmd/for.v5:665<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/cmd/for.v5:20<br />
<br />   1 todo   : RT #1085: what should be output of perl -we 'print do { foreach (1, 2) { 1; } }'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/list.v5</td><td>52</td><td>12</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'join list'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'long list assign'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'short list 1 defined'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'short list 2 defined'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'long list reassign'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'logical or f'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'slice ary nil'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
Error while creating error string: No exception handler located for warn<br />
# Looks like you planned 64 tests, but ran 59<br />
# Looks like you failed 7 tests of 59<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/num.v5</td><td>52</td><td>0</td><td>1</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>   1 todo   : NYI<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest_stack_ok.v5</td><td>51</td><td>84</td><td>0</td><td>0</td><td>135</td></tr>
        <tr><td colspan='5'><br />
# Failed test '-r *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '-r $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-w *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-w $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-x *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-x $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-o *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-o $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-R *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-R $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-W *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-W $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-X *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-X $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-O *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-O $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-e *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-e $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-z *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-z $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-s *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-s $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-f *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-f $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-d *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-d $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-l *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-l $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-p *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-p $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-S *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-S $overld did not leave $overld on the stack'<br />
#      got: '1'<br />
# Failed test '-b *gv returns single value'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my.v5</td><td>45</td><td>4</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $i<br />
    at t/spec/op/my.v5:71<br />
    ------&gt; if (my $i ⏏= "inner") {<br />
    Redeclaration of symbol $i<br />
    at t/spec/op/my.v5:75<br />
    ------&gt; if ((my $i ⏏= 1) == 0) {<br />
    Redeclaration of symbol $i<br />
    at t/spec/op/my.v5:83<br />
    ------&gt; while (my $i ⏏= --$j) {<br />
    Redeclaration of symbol $i<br />
    at t/spec/op/my.v5:92<br />
    ------&gt; for (my $i ⏏= 0; (my $k = $i) &lt; $j; ++$i) {<br />
# Failed test 'correct number of elements in array'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '1'<br />
#      got: 'ok 16<br />
# '<br />
# Failed test 'correct number of elements in array'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: 'ok 17<br />
# '<br />
# Failed test '$k is only defined in the scope of the previous for loop'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '$i not modified by while/for/foreach using same variable name'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'outer'<br />
#      got: '5'<br />
Undefined subroutine &amp;main::loop called<br />
  in block  at t/spec/op/my.v5:140<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/my.v5:108<br />
<br />  49 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/auto.v5</td><td>45</td><td>2</td><td>0</td><td>0</td><td>47</td></tr>
        <tr><td colspan='5'><br />
# Failed test '99a incr 100'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '99\0a incr 100'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 2 tests of 47<br />
</td></tr>
        <tr align='center'><td align='left'>comp/cmdopt.v5</td><td>44</td><td>0</td><td>0</td><td>0</td><td>44</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each_array.v5</td><td>41</td><td>22</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'got index when only index was assigned to variable'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '1'<br />
#      got: '1 zam'<br />
# Failed test 'got expected index of remaining element'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: '2 RATTLE'<br />
# Failed test '0'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'bacon'<br />
#      got: '0'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'no elements remaining to be iterated over; array reference case'<br />
#      got: ''<br />
# Failed test 'got expected index'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '0'<br />
#      got: '2'<br />
# Failed test 'got expected value'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'crunch'<br />
#      got: 'bloop'<br />
# Failed test 'following 'keys', got expected index'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '0'<br />
#      got: ''<br />
# Failed test 'following 'keys', got expected value'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'crunch'<br />
#      got: ''<br />
# Failed test 'following 'values', 'each' and 'values', 'each' continues to return expected index'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '0'<br />
#      got: '1'<br />
# Failed test 'following 'values', 'each' and 'values', 'each' continues to return expected value'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'crunch'<br />
#      got: 'zam'<br />
# Failed test ''each' on array in scalar context in loop returns expected index '0''<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '0'<br />
#      got: '0 crunch'<br />
# Failed test ''each' on array in scalar context in loop returns expected index '1''<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: '1 zam'<br />
# Failed test ''each' on array in scalar context in loop returns expected index '2''<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: '2 bloop'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split_unicode.v5</td><td>31</td><td>120</td><td>0</td><td>0</td><td>151</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'Space: U+0009 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+0009 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+0009 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+0009 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+000a - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+000a - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+000a - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+000a - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+000c - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+000c - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+000c - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+000c - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+000d - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+000d - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+000d - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+000d - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+0020 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+0020 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+0020 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '5'<br />
#      got: ''<br />
# Failed test 'Space: U+0020 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+0085 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+0085 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+0085 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+0085 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+00a0 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+00a0 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+00a0 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+00a0 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+1680 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+1680 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+1680 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+1680 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+180e - /\s+/'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+180e - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: 'A:᠎:B'<br />
# Failed test 'Space: U+180e - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+180e - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+180e - /\s+/ No.2'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+180e - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: '᠎᠎:A:᠎᠎:B'<br />
# Failed test 'Space: U+2000 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2000 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2000 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2000 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2001 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2001 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2001 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2001 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2002 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2002 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2002 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2002 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2003 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2003 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2003 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2003 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2004 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2004 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2004 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2004 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2005 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2005 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2005 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2005 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2006 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2006 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'Space: U+2006 - ' ' (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1'<br />
#      got: ''<br />
# Failed test 'Space: U+2006 - /\s+/ No.2 (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3'<br />
#      got: ' :A: :B'<br />
# Failed test 'Space: U+2007 - /\s+/ (count)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '2'<br />
#      got: 'A: :B'<br />
# Failed test 'Space: U+2007 - ' ''<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/negate.v5</td><td>31</td><td>14</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'Negation of string starting with "-" returns a string starting with "+" - non-numeric'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '+10foo'<br />
#      got: '10'<br />
# Failed test 'Negation of a negative string adds "-" to the front'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-xyz'<br />
#      got: '0'<br />
# Failed test 'Negation of a negative string to positive'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '+xyz'<br />
#      got: '0'<br />
# Failed test 'Negation of a positive string to negative'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-xyz'<br />
#      got: '0'<br />
# Failed test 'cached numeric value does not sabotage string negation'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-dogs'<br />
#      got: '0'<br />
# Failed test 'Negation of string starting with "-" returns a string starting with "+" - non-numeric'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '+10foo'<br />
#      got: '10'<br />
# Failed test 'Negation of a negative string adds "-" to the front'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-xyz'<br />
#      got: '0'<br />
# Failed test 'Negation of a negative string to positive'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '+xyz'<br />
#      got: '0'<br />
# Failed test 'Negation of a positive string to negative'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-xyz'<br />
#      got: '0'<br />
# Failed test 'cached numeric value does not sabotage string negation'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '-dogs'<br />
#      got: '0'<br />
# Looks like you planned 45 tests, but ran 41<br />
# Looks like you failed 10 tests of 41<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/recurse.v5</td><td>27</td><td>1</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'># Failed test '64K deep recursion - no coredump expected'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '0'<br />
#      got: ''<br />
# Looks like you failed 1 tests of 28<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/rxcode.v5</td><td>26</td><td>12</td><td>0</td><td>1</td><td>39</td></tr>
        <tr><td colspan='5'><br />
# Failed test '..$^R after a =~ ab?'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..$^R after ab =~ ab'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..$^R after ab =~ ab?'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..$^R after ab =~ ab? (2)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..$^R after ab =~ ab? (3)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..$^R after ac =~ ab?'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..nothing pushed'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..still nothing pushed'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..nothing pushed (package)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '..still nothing pushed (package)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '$^R == 32'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '$^R == 37'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 12 tests of 39<br />
<br />   1 skipped: hangs<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/_num_to_alpha.v5</td><td>24</td><td>1</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'># Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'Returns undef for negative numbers'<br />
#      got: ''<br />
Testing limit capabilities<br />
# Looks like you failed 1 tests of 25<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/undef.v5</td><td>23</td><td>62</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol %foo<br />
    at t/spec/op/undef.v5:93<br />
    ------&gt;     tie my %foo⏏, 'Tie::StdHash';<br />
    Redeclaration of symbol @foo<br />
    at t/spec/op/undef.v5:102<br />
    ------&gt;     tie my @foo⏏, 'Tie::StdArray';<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
Cannot modify an immutable Int<br />
  in sub undefine at src/gen/m-CORE.setting:17695<br />
  in sub undef at src/Perl5/Terms.pm:275<br />
  in block &lt;unit&gt; at t/spec/op/undef.v5:1<br />
# Looks like you planned 85 tests, but ran 25<br />
# Looks like you failed 2 tests of 25<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/sprintf.v5</td><td>22</td><td>30</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'><br />
# Failed test '\x{1234}'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1234 1'<br />
#      got: '3f 1'<br />
# Failed test '%s \x{5678}'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '5678 1'<br />
#      got: '3f 1'<br />
# Failed test '\x{1234}%s \x{5678}'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '1234 5678 2'<br />
#      got: '3f 3f 2'<br />
'%*vd' is not valid in sprintf format sequence 'n%*vd'<br />
# Looks like you planned 52 tests, but ran 25<br />
# Looks like you failed 3 tests of 25<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/unshift.v5</td><td>22</td><td>14</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'unshift singleton list'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '0 1 2 3'<br />
#      got: '1 2 3'<br />
# Failed test 'unshift count == 4'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'unshift list'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '3 2 1 0 1 2 3'<br />
#      got: '1 2 3'<br />
# Failed test 'unshift count == 7'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'unshift array'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '5 4 3 2 1 0 1 2 3'<br />
#      got: '1 2 3'<br />
# Failed test 'unshift count == 9'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'unshift count == 9 (ref)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'unshift arrays'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '7 6 5 4 3 2 1 0 1 2 3'<br />
#      got: '1 2 3'<br />
# Failed test 'unshift count == 11'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'unshift count == 11 (ref)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'void unshift singleton list'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'x y z'<br />
#      got: 'y z'<br />
# Failed test 'void unshift list'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'u v w x y z'<br />
#      got: 'y z'<br />
# Failed test 'void unshift array'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 's t u v w x y z'<br />
#      got: 'y z'<br />
# Failed test 'void unshift arrays'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'q r s t u v w x y z'<br />
#      got: 'y z'<br />
# Looks like you failed 14 tests of 36<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ord.v5</td><td>22</td><td>0</td><td>0</td><td>13</td><td>35</td></tr>
        <tr><td colspan='5'>  13 skipped: Invalid character for UTF-8 encoding<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chr.v5</td><td>21</td><td>21</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'c4 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'df bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'e0 a0 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'e0 bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'e1 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ec bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ed 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ed 9f bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ed a0 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ed bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ee 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ef bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f0 90 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f0 bf bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f1 80 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f3 bf bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f4 80 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f4 8f bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f4 90 80 80'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f7 bf bf bf'<br />
#      got: '3f'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f8 88 80 80 80'<br />
#      got: '3f'<br />
# Looks like you failed 21 tests of 42<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chop.v5</td><td>21</td><td>122</td><td>0</td><td>0</td><td>143</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'optimized'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'cab'<br />
#      got: 'abc'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'hi there!'<br />
#      got: 'hi <br />
#  there<br />
#  !'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'hi there!'<br />
#      got: 'hi <br />
#  there<br />
#  !'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'foo<br />
# '<br />
#      got: 'foo<br />
# '<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f'<br />
#      got: 'foo'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f'<br />
#      got: 'f<br />
# '<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'f'<br />
#      got: 'f<br />
# '<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: ''<br />
#      got: 'xx'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'a'<br />
#      got: 'axx'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ab<br />
# '<br />
#      got: 'ab'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '4'<br />
#      got: ''<br />
# Failed test 'chomp ref (modify)'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ARRAY'<br />
#      got: ''<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
postcircumfix:&lt;{ }&gt; not defined for type Array<br />
  in method Str at src/gen/m-CORE.setting:13269<br />
  in method Stringy at src/gen/m-CORE.setting:1096<br />
  in sub infix:&lt;eq&gt; at src/gen/m-CORE.setting:1509<br />
  in sub is at lib/Test.pm:97<br />
  in sub is at lib/Test.pm:94<br />
  in sub _is at /home/froggs/dev/v5/t/test.pl:12<br />
  in sub is at /home/froggs/dev/v5/t/test.pl:64<br />
  in block  at t/spec/op/chop.v5:160<br />
  in block &lt;unit&gt; at t/spec/op/chop.v5:153<br />
# Looks like you planned 143 tests, but ran 41<br />
# Looks like you failed 20 tests of 41<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/fold.v5</td><td>19</td><td>7</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $SIG<br />
    at t/spec/comp/fold.v5:90<br />
    ------&gt;     local $SIG⏏{__DIE__}  = sub { $c+= 2 };<br />
Undefined subroutine &amp;main::INSTALL called<br />
  in block &lt;unit&gt; at t/spec/comp/fold.v5:124<br />
</td></tr>
        <tr align='center'><td align='left'>cmd/switch.v5</td><td>18</td><td>0</td><td>0</td><td>0</td><td>18</td></tr>
        <tr align='center'><td align='left'>op/lop.v5</td><td>17</td><td>0</td><td>0</td><td>0</td><td>17</td></tr>
        <tr align='center'><td align='left'>op/exp.v5</td><td>16</td><td>0</td><td>0</td><td>0</td><td>16</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/not.v5</td><td>15</td><td>1</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'logical negation of empty list compared with logical negation of false value'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'True'<br />
#      got: '1'<br />
parens needed around second argument in next two tests<br />
to preserve list context inside function call<br />
# Looks like you failed 1 tests of 16<br />
</td></tr>
        <tr align='center'><td align='left'>op/die_except.v5</td><td>12</td><td>0</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left'>t/v5/04-op.v5</td><td>11</td><td>0</td><td>0</td><td>0</td><td>11</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_fail.v5</td><td>10</td><td>5</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'># Failed test 'Got errno'<br />
# at /home/froggs/dev/v5/t/../t/test.pl line 13<br />
# twice: '0'<br />
# Failed test 'Got errno'<br />
# at /home/froggs/dev/v5/t/../t/test.pl line 13<br />
# twice: '0'<br />
# Failed test 'All punctuation fails open'<br />
# at /home/froggs/dev/v5/t/../t/test.pl line 10<br />
# Failed test 'Bad package fails open'<br />
# at /home/froggs/dev/v5/t/../t/test.pl line 10<br />
# Failed test 'Got errno'<br />
# at /home/froggs/dev/v5/t/../t/test.pl line 13<br />
# twice: '0'<br />
# Looks like you failed 5 tests of 15<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-if.v5</td><td>9</td><td>0</td><td>0</td><td>0</td><td>9</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_unwind.v5</td><td>9</td><td>3</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'># Failed test 'true value assigned to $@ before 'end' block inside 'eval' block'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 't1<br />
# '<br />
#      got: ''<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 't3<br />
# '<br />
#      got: ''<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 't3<br />
# '<br />
#      got: ''<br />
# Looks like you failed 3 tests of 12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/append.v5</td><td>9</td><td>4</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>This type cannot unbox to a native string<br />
  in sub MAKE_REGEX at src/gen/m-CORE.setting:13616<br />
  in block  at src/gen/m-CORE.setting:13497<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block  at src/gen/m-CORE.setting:13491<br />
  in method INTERPOLATE at src/gen/m-CORE.setting:13574<br />
  in method INTERPOLATE at src/gen/m-CORE.setting:13471<br />
  in method match at src/gen/m-CORE.setting:6494<br />
  in sub like_yn at /home/froggs/dev/v5/t/test.pl:96<br />
  in sub like at /home/froggs/dev/v5/t/test.pl:90<br />
  in block  at t/spec/op/append.v5:43<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/append.v5:1<br />
# Looks like you planned 13 tests, but ran 9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/length.v5</td><td>8</td><td>33</td><td>0</td><td>0</td><td>41</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $u<br />
    at t/spec/op/length.v5:176<br />
    ------&gt; my $u⏏;<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/length.v5:125<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/length.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chr.v5</td><td>6</td><td>2</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 2 tests of 8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/bproto.v5</td><td>6</td><td>10</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Cannot use Bool as Matcher with 'grep'.  Did you mean to use $_ inside a block?<br />
  in sub test_no_error at t/spec/comp/bproto.v5:31<br />
  in block &lt;unit&gt; at t/spec/comp/bproto.v5:49<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/int.v5</td><td>6</td><td>9</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'x+y equals 3'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
Too many positional parameters passed; got 2 but expected 1<br />
  in sub diag at lib/Test.pm:190<br />
  in sub _diag at /home/froggs/dev/v5/t/test.pl:18<br />
  in sub diag at /home/froggs/dev/v5/t/test.pl:77<br />
  in block  at t/spec/op/int.v5:36<br />
  in block &lt;unit&gt; at t/spec/op/int.v5:29<br />
# Looks like you planned 15 tests, but ran 7<br />
# Looks like you failed 1 tests of 7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die.v5</td><td>6</td><td>13</td><td>0</td><td>0</td><td>19</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $SIG<br />
    at t/spec/op/die.v5:80<br />
    ------&gt;     local $SIG⏏{__WARN__} = $SIG{__DIE__} = sub { $err <br />
    Redeclaration of symbol $SIG<br />
    at t/spec/op/die.v5:94<br />
    ------&gt;     local $SIG⏏{__WARN__} = sub { $ok = 0 };<br />
# Failed test 'actual array, not a copy, passed to signal handler'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '4'<br />
#      got: '3'<br />
# Failed test 'die with no arguments propagates $@, but leaves references alone'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '7'<br />
#      got: 'Died'<br />
# Failed test '$@ is an Error object'<br />
# at /home/froggs/dev/v5/t/test.pl line 20<br />
# Actual type: Str<br />
# Failed test 'returning a different object than what was passed in, via PROPAGATE'<br />
# at /home/froggs/dev/v5/t/test.pl line 20<br />
# Actual type: Str<br />
# Failed test 'reference returned correctly'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '9'<br />
#      got: ''<br />
# Failed test 'die handler with utf8'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ce �ii tu, bã ?<br />
# '<br />
#      got: '[]<br />
# '<br />
ce �ii tu, bã ?<br />
  in block  at t/spec/op/die.v5:79<br />
# Failed test 'warn handler with utf8'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'ce �ii tu, bã ?<br />
# '<br />
#      got: '[]<br />
# '<br />
# Looks like you planned 19 tests, but ran 13<br />
# Looks like you failed 7 tests of 13<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/context.v5</td><td>6</td><td>1</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'foo called once'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# nr tests: before=1, after=1<br />
# Looks like you failed 1 tests of 7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases_utf8.v5</td><td>6</td><td>6</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'isa after another stash has claimed the @ISA via glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa on the stash that claimed the @ISA via glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa after glob-to-ref assignment when *ISA is shared'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa after glob-to-ref assignment on another stash when *ISA is shared'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa after another stash has claimed the @ISA via ref-to-glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa on the stash that claimed the @ISA via ref-to-glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 6 tests of 12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases.v5</td><td>6</td><td>7</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'isa after another stash has claimed the @ISA via glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa on the stash that claimed the @ISA via glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa after glob-to-ref assignment when *ISA is shared'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa after glob-to-ref assignment on another stash when *ISA is shared'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa after another stash has claimed the @ISA via ref-to-glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'isa on the stash that claimed the @ISA via ref-to-glob assignment'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
===SORRY!===<br />
Can't locate object method "ook" via package "Baro" (perhaps you forgot to load "Baro"?)<br />
# Looks like you planned 13 tests, but ran 12<br />
# Looks like you failed 6 tests of 12<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-while.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/mod.v5</td><td>5</td><td>8</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>Cannot assign to a readonly variable or a value<br />
  in sub infix:&lt;=&gt; at src/gen/m-CORE.setting:17468<br />
  in block &lt;unit&gt; at t/spec/cmd/mod.v5:29<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/03-num.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/or.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'><br />
# Failed test '|| short-circuited as expected'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '3'<br />
#      got: '1'<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/or.v5:27<br />
  in block &lt;unit&gt; at t/spec/op/or.v5:12<br />
# Looks like you planned 8 tests, but ran 5<br />
# Looks like you failed 1 tests of 5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/numconvert.v5</td><td>4</td><td>0</td><td>0</td><td>1756</td><td>1760</td></tr>
        <tr><td colspan='5'><br /> 1756 skipped: Can't get bigint from something that isn't a SixModel object<br />
</td></tr>
        <tr align='center'><td align='left'>cmd/elsif.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>op/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>base/while.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>base/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sselect.v5</td><td>3</td><td>8</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'select undef  $blank $blank 0'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: ''<br />
#      got: 'Undefined subroutine &amp;main::select called'<br />
# Failed test 'select $blank undef  $blank 0'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: ''<br />
#      got: 'Undefined subroutine &amp;main::select called'<br />
# Failed test 'select $blank $blank undef  0'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: ''<br />
#      got: 'Undefined subroutine &amp;main::select called'<br />
# Failed test 'select ""     $blank $blank 0'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: ''<br />
#      got: 'Undefined subroutine &amp;main::select called'<br />
# Failed test 'select $blank ""     $blank 0'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: ''<br />
#      got: 'Undefined subroutine &amp;main::select called'<br />
# Failed test 'select $blank $blank ""     0'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: ''<br />
#      got: 'Undefined subroutine &amp;main::select called'<br />
Undefined subroutine &amp;main::select called<br />
  in block &lt;unit&gt; at t/spec/op/sselect.v5:11<br />
# Looks like you planned 11 tests, but ran 9<br />
# Looks like you failed 6 tests of 9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sleep.v5</td><td>3</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'Sleep says it slept at least 2 seconds'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pack.v5</td><td>3</td><td>14701</td><td>0</td><td>0</td><td>14704</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my_stash.v5</td><td>3</td><td>4</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 4 tests of 7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defined.v5</td><td>3</td><td>2</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'defined( ... ? ... : @array)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test 'defined(scalar @array)'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 2 tests of 5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/16-var-redeclare.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/../v5/16-var-redeclare.v5:13<br />
    ------&gt;     my $x ⏏= 1;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iofile.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'># Failed test 'IO::File now loaded'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 3<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-bind.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchI.v5</td><td>2</td><td>2</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block &lt;unit&gt; at t/spec/run/switchI.v5:12<br />
# Looks like you planned 4 tests, but ran 2<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/noswitch.v5</td><td>2</td><td>0</td><td>0</td><td>1</td><td>3</td></tr>
        <tr><td colspan='5'>   1 skipped: hangs<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/overload.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'list context //g against overloaded object'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'foo:bar'<br />
#      got: ''<br />
# Looks like you failed 1 tests of 3<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/setpgrpstack.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::setpgrp called<br />
  in block &lt;unit&gt; at t/spec/op/setpgrpstack.v5:1<br />
# Looks like you planned 3 tests, but ran 2<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/args.v5</td><td>2</td><td>21</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'bless'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'y'<br />
#      got: '@'<br />
# Failed test 'bless'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'x'<br />
#      got: '@'<br />
# Failed test 'splice'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'a b c x'<br />
#      got: '@abcx'<br />
# Failed test 'splice'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'a b c y'<br />
#      got: '@abcy'<br />
# Failed test 'goto: single element'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'y'<br />
#      got: '@'<br />
# Failed test 'goto: single element'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'x'<br />
#      got: '@'<br />
# Failed test 'goto: multiple elements'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'a b c x'<br />
#      got: '@abcx'<br />
# Failed test 'goto: multiple elements'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'a b c y'<br />
#      got: '@abcy'<br />
Undefined subroutine &amp;main::L called<br />
  in sub local2 at t/spec/op/args.v5:76<br />
  in block &lt;unit&gt; at t/spec/op/args.v5:77<br />
# Looks like you planned 23 tests, but ran 10<br />
# Looks like you failed 8 tests of 10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/64bitint.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>'lld' is not valid in sprintf format sequence '%lld'<br />
<br />   2 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>base/pat.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>base/if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/01-sanity.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/basic.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/dup.v5</td><td>1</td><td>28</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan='5'>Can't open stdout<br />
  in block &lt;unit&gt; at t/spec/io/dup.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/binmode.v5</td><td>1</td><td>8</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;Layer'<br />
  in method &lt;anon&gt; at src/gen/m-CORE.setting:13274<br />
  in any find_method_fallback at src/gen/m-Metamodel.nqp:2632<br />
  in any find_method at src/gen/m-Metamodel.nqp:946<br />
  in block  at t/spec/io/binmode.v5:16<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/io/binmode.v5:1<br />
# Looks like you planned 9 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/term.v5</td><td>1</td><td>22</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>Invocant requires an instance, but a type object was passed<br />
  in method Bridge at src/gen/m-CORE.setting:4685<br />
  in sub infix:&lt;&gt;&gt; at src/gen/m-CORE.setting:4612<br />
  in sub infix:&lt;P5&gt;&gt; at src/Perl5/Terms.pm:320<br />
  in block &lt;unit&gt; at t/spec/comp/term.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchF.v5</td><td>1</td><td>1</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'># Looks like you planned 2 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/opsubs.v5</td><td>1</td><td>35</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Cannot find method 'at_key': no method cache and no .^find_method<br />
  in block &lt;unit&gt; at t/spec/comp/opsubs.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/multiline.v5</td><td>1</td><td>5</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Could not close: <br />
  in block &lt;unit&gt; at t/spec/comp/multiline.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/hints.v5</td><td>1</td><td>30</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot call 'infix:&lt;P5&amp;&gt;'; none of these signatures match:<br />
:(Str \a, Str \b)<br />
:(Any \a, Any \b)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getpid.v5</td><td>1</td><td>2</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::getppid called<br />
  in block &lt;unit&gt; at t/spec/op/getpid.v5:28<br />
# Looks like you planned 3 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/evalbytes.v5</td><td>1</td><td>7</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::evalbytes called<br />
  in block &lt;unit&gt; at t/spec/op/evalbytes.v5:1<br />
# Looks like you planned 8 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/02-int.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/vec.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::vec called<br />
  in block &lt;unit&gt; at t/spec/bigmem/vec.v5:10<br />
# Looks like you planned 7 tests, but ran 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/assignwarn.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::warning_is called<br />
  in sub test_op at t/spec/op/assignwarn.v5:43<br />
  in block  at t/spec/op/assignwarn.v5:51<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method eager at src/gen/m-CORE.setting:8273<br />
  in block &lt;unit&gt; at t/spec/op/assignwarn.v5:49<br />
<br />   1 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/term.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in block &lt;unit&gt; at t/spec/base/term.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'klonk'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'kഌoんḰ'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'klonk'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'kഌoんḰ'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol *A<br />
    at t/spec/mro/method_caching.v5:92<br />
    ------&gt;           local *A ⏏= sub { 21 };<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/anonsub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block &lt;unit&gt; at t/spec/op/anonsub.v5:6<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/attrs.v5<br />
Unexpected closing bracket<br />
at t/spec/op/attrs.v5:303<br />
------&gt; FY_CODE_ATTRIBUTES { $proto = $_[1]; _: ⏏}<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/closure.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block at line 540, near "'$x'}-&gt;(),"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coreamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coresubs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/coresubs.v5<br />
Confused<br />
at t/spec/op/coresubs.v5:17<br />
------&gt; my $bd = new B::Deparse ⏏'-p';<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/do.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $do<br />
    at t/spec/op/do.v5:72<br />
    ------&gt; if (open my $do⏏, '&gt;', $file16) {<br />
    Redeclaration of symbol $do<br />
    at t/spec/op/do.v5:81<br />
    ------&gt; if (open my $do⏏, '&gt;', $file17) {<br />
    Redeclaration of symbol $do<br />
    at t/spec/op/do.v5:81<br />
    ------&gt; if (open my $do⏏, '&gt;', $file17) {<br />
    Redeclaration of symbol $do<br />
    at t/spec/op/do.v5:90<br />
    ------&gt; if (open my $do⏏, '&gt;', $file18) {<br />
    Redeclaration of symbol $do<br />
    at t/spec/op/do.v5:90<br />
    ------&gt; if (open my $do⏏, '&gt;', $file18) {<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/do.v5:280<br />
    ------&gt;       open my $fh⏏, '&lt;', \$code;<br />
Cannot call 'postcircumfix&lt;P5[ ]&gt;'; none of these signatures match:<br />
:(Any \SELF)<br />
:(Any \SELF, int $pos)<br />
:(Any \SELF, Any $pos)<br />
:(Any \SELF, Positional \pos)<br />
  in sub postcircumfix&lt;P5[ ]&gt; at src/Perl5/Terms.pm:387<br />
  in block &lt;unit&gt; at t/spec/op/do.v5:26<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exists_sub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'orig'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fork.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block &lt;unit&gt; at t/spec/op/fork.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gmagic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate overload in @INC (@INC contains: ../lib)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct at line 218, near " \"EOC\" or "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode-tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block &lt;unit&gt; at t/spec/op/inccode-tie.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/op/index_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/leaky-magic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate tests in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mydef.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
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
Can't locate ./test.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/op/require_37033.v5:8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/runlevel.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block &lt;unit&gt; at t/spec/op/runlevel.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartkve.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/splice.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such method 'splice' for invocant of type 'Range'<br />
  in sub P5splice at src/Perl5/Terms.pm:1102<br />
  in block &lt;unit&gt; at t/spec/op/splice.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'  at line 77, near " @tests};\n"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/op/substr_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/svleak.pl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Ending delimiter END not found at line 4, near "\nsay \"# FU"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block &lt;unit&gt; at t/spec/op/tie.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8decode.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::v256 called<br />
  in block  at t/spec/op/utf8decode.v5:10<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/utf8decode.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/write.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/write.v5:83<br />
------&gt; &lt;BOL&gt;⏏jumped<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/write.v5:16<br />
    ------&gt;     open my $fh⏏, $file or die "can't open '$file': $!";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/cmp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $i<br />
    at t/spec/opbasic/cmp.v5:290<br />
    ------&gt; while (my ($i⏏, $v) = each @utf8) {<br />
    Redeclaration of symbol $v<br />
    at t/spec/opbasic/cmp.v5:290<br />
    ------&gt; while (my ($i, $v⏏) = each @utf8) {<br />
===SORRY!===<br />
This type does not support positional operations<br />
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
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/porting/args_assert.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/line_debug.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/authors.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block &lt;unit&gt; at t/spec/porting/authors.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcase.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing or wrong version of dependency 'src/gen/m-BOOTSTRAP.nqp'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcfgvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub shell at src/gen/m-CORE.setting:783<br />
  in sub system at src/Perl5/Terms.pm:278<br />
  in block &lt;unit&gt; at t/spec/porting/checkcfgvar.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/cmp_version.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block &lt;unit&gt; at t/spec/porting/cmp_version.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/customized.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing or wrong version of dependency 'src/gen/m-BOOTSTRAP.nqp'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/diag.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unhandled exception: No exception handler located for warn<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11949  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:40)<br />
 from gen/moar/stage2/NQPHLL.nqp:1361  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:374)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
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
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/filenames.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $m<br />
    at t/spec/porting/filenames.v5:37<br />
    ------&gt; open my $m⏏, '&lt;', $manifest or die "Can't open '$ma<br />
Can't open '../MANIFEST': <br />
  in block &lt;unit&gt; at t/spec/porting/filenames.v5:32<br />
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
Can't locate Maintainers in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/manifest.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $m<br />
    at t/spec/porting/manifest.v5:17<br />
    ------&gt; open my $m⏏, '&lt;', $manifest or die "Can't open '$ma<br />
Can't open 'MANIFEST': <br />
  in block &lt;unit&gt; at t/spec/porting/manifest.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pending-author.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/pending-author.v5:56<br />
    ------&gt; open my $fh⏏, '|-', "$^X Porting/checkAUTHORS.pl --t<br />
Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block &lt;unit&gt; at t/spec/porting/pending-author.v5:30<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/perlfunc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub shell at src/gen/m-CORE.setting:783<br />
  in sub system at src/Perl5/Terms.pm:278<br />
  in block &lt;unit&gt; at t/spec/porting/perlfunc.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pod_rules.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block &lt;unit&gt; at t/spec/porting/pod_rules.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/regen.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Illegal redeclaration of 'OUTER'<br />
at t/spec/porting/regen.v5:26<br />
------&gt; OUTER: ⏏foreach my $file (@files) {<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/regen.v5:27<br />
    ------&gt;     open my $fh⏏, '&lt;', $file or die "Can't open $file: $<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/test_bootstrap.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\Q'<br />
at t/spec/porting/test_bootstrap.v5:36<br />
------&gt; +Test::More/, "$file doesn't use Test::\⏏QMore");<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/test_bootstrap.v5:18<br />
    ------&gt; open my $fh⏏, '&lt;', '../MANIFEST' or die "Can't open <br />
    Redeclaration of symbol $t<br />
    at t/spec/porting/test_bootstrap.v5:33<br />
    ------&gt;     open my $t⏏, '&lt;', $file or die "Can't open $file: $<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/utils.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/utils.v5:37<br />
    ------&gt; open my $fh⏏, '&lt;', 'MANIFEST' or die "Can't open MAN<br />
Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block &lt;unit&gt; at t/spec/porting/utils.v5:26<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/fold_grind.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/re/fold_grind.v5:262<br />
------&gt; y $line = $_ =~ s/ (?: \s* \# .* )? $ //⏏rx;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $i<br />
    at t/spec/re/fold_grind.v5:189<br />
    ------&gt;         for (my $i ⏏= 0; $i &lt; $max_folds_to; $i++) {<br />
    Redeclaration of symbol $fh<br />
    at t/spec/re/fold_grind.v5:253<br />
    ------&gt;     &amp;&amp; open my $fh⏏, "&lt;", $file)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_advanced.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat_advanced.v5:35<br />
------&gt;         ok(/(.)(\⏏C)(\C)(.)/, $message);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/pat_advanced_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/pat_psycho_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/pat_re_eval_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/pat_rt_report_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/pat_special_cc_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/pat_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left'>re/re_tests.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unhandled exception: No exception handler located for warn<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11949  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:40)<br />
 from gen/moar/stage2/NQPHLL.nqp:1361  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:374)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/reg_email_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block &lt;unit&gt; at t/spec/re/reg_eval.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_mesg.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::warning_is called<br />
  in block &lt;unit&gt; at t/spec/re/reg_mesg.v5:269<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_namedcapture.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol '&amp;DynaLoader::boot_DynaLoader'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_posixcc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type cannot unbox to a native string<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets_compat.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
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
  in block &lt;unit&gt; at t/spec/re/regexp_qr_embed_thr.v5:5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_trielist.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/regexp_unicode_prop.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/regexp_unicode_prop.v5:174<br />
------&gt;     $i ++, redo if $CLASSES [$i] =~ /^\⏏h*#\h*(.*)/;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Can't locate ./thread_it.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/re/regexp_unicode_prop_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left'>re/substT.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst_amp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/subst_amp.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/subst_amp.v5:22<br />
------&gt; s/\⏏Ga(?{push @res, $_, $`})/xx/g;<br />
</td></tr>
        <tr align='center'><td align='left'>re/subst_wamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left'>re/uniprops.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left'>run/fresh_perl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/locale.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/locale.v5:88<br />
    ------&gt; 	local $ENV⏏{LC_ALL}; # so it never overrides LC_NUM<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/locale.v5:165<br />
    ------&gt; 	local $ENV⏏{LC_ALL}; # so it never overrides LC_NUM<br />
postcircumfix:&lt;{ }&gt; not defined for type Parcel<br />
  in method Str at src/gen/m-CORE.setting:13269<br />
  in sub P5Str at src/Perl5/Terms.pm:1181<br />
  in sub P5Str at src/Perl5/Terms.pm:1177<br />
  in sub prefix:&lt;P5.&gt; at src/Perl5/Terms.pm:294<br />
  in sub infix:&lt;P5eq&gt; at src/Perl5/Terms.pm:329<br />
  in block &lt;unit&gt; at t/spec/run/locale.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/require.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Not an ARRAY reference<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchx.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block &lt;unit&gt; at t/spec/run/switchx.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/can_isa_ok.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol Bar<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/tempfile.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>skipping the first filename because it is taken for use by _fresh_perl()<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'tmp6756B'<br />
#      got: 'tmp6756A'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'tmp6756C'<br />
#      got: 'tmp6756B'<br />
Too many positional parameters passed; got 2 but expected between 0 and 1<br />
  in sub fail at src/Perl5/Terms.pm:210<br />
  in block  at t/spec/test_pl/tempfile.v5:31<br />
  in sub skip_files at t/spec/test_pl/tempfile.v5:13<br />
  in block &lt;unit&gt; at t/spec/test_pl/tempfile.v5:1<br />
<br />   2 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/attrs.v5<br />
Unexpected closing bracket<br />
at t/spec/uni/attrs.v5:160<br />
------&gt; FY_CODE_ATTRIBUTES { $proto = $_[1]; _: ⏏}<br />
</td></tr>
        <tr align='center'><td align='left'>uni/case.pl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error encoding UTF-8 string near grapheme position 6613 with codepoint 64259<br />
   at src/Perl6/Grammar.nqp:338  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Grammar.moarvm:TOP:425)<br />
 from gen/moar/stage2/QRegex.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/QRegex.moarvm:parse:44)<br />
 from gen/moar/stage2/NQPHLL.nqp:1510  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:parse:80)<br />
 from gen/moar/stage2/NQPHLL.nqp:1466  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:compile:197)<br />
 from gen/moar/stage2/NQPHLL.nqp:1213  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:eval:53)<br />
 from gen/moar/stage2/NQPHLL.nqp:1423  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:87)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lower.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Type check failed in binding; expected 'Positional' but got 'Parcel'<br />
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
Can't locate Win32 in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
</td></tr>
        <tr align='center'><td align='left'>win32/system.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>x2p/s2p.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf_through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Cannot find method 'at_key': no method cache and no .^find_method<br />
  in block &lt;unit&gt; at t/spec/io/crlf_through.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/data.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block &lt;unit&gt; at t/spec/io/data.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/layers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/layers.v5<br />
Confused<br />
at t/spec/io/layers.v5:208<br />
------&gt; 	use open⏏(IN =&gt; ":crlf", OUT =&gt; ":encoding(cp1252<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/say.v5<br />
Confused<br />
at t/spec/io/say.v5:60<br />
------&gt;     CORE::say ⏏"ok 13 - CORE::say without feature.pm";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/croak.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Failed to find '/home/froggs/dev/v5/lib/t/lib/common.pl.pm6' while trying to do '.f'<br />
  in method f at src/gen/m-CORE.setting:14259<br />
  in block  at /home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:21868<br />
  in method candidates at src/gen/m-CORE.setting:21865<br />
  in block  at src/gen/m-CORE.setting:21681<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in method candidates at src/gen/m-CORE.setting:21679<br />
  in method load_module at src/gen/m-CORE.setting:21693<br />
  in block &lt;unit&gt; at t/spec/lib/croak.v5:8<br />
Unhandled exception: Element shifted from empty list<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11949  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:40)<br />
 from gen/moar/stage2/NQPHLL.nqp:1361  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:374)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/no_load.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block  at t/spec/lib/no_load.v5:25<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method eager at src/gen/m-CORE.setting:8273<br />
  in block &lt;unit&gt; at t/spec/lib/no_load.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_fallback.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_nomethod.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::ok called<br />
  in block  at t/spec/lib/overload_nomethod.v5:13<br />
  in block &lt;unit&gt; at t/spec/lib/overload_nomethod.v5:6<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for t::lib::F'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Ƭ::ŁiƁ::Ḟ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for t::lib::F'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Ƭ::ŁiƁ::Ḟ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right C3 merge order for xx::DBIx::Class::Core'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right C3 merge order for Ẋẋ::ḐʙIＸ::Cl았::Core'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right DFS merge order for xx::DBIx::Class::Core'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right DFS merge order for Ẋẋ::ḐʙIＸ::Cl았::Coﾚ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
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
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_ineval_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 45, near "u, \n   'me"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for the Vulcan Dylan Example'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for the ቩᓪ찬 Dylan Example'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for the Vulcan Dylan Example'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for the ቩᓪ찬 Dylan Example'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/read.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::DATA called<br />
  in block &lt;unit&gt; at t/spec/bigmem/read.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fresh_perl_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 22, near "u, q!\"Can'"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash-rt85026.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/hash-rt85026.v5<br />
Confused<br />
at t/spec/op/hash-rt85026.v5:63<br />
------&gt; &lt;BOL&gt;⏏;<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/charset.v5<br />
Unexpected closing bracket<br />
at t/spec/re/charset.v5:52<br />
------&gt;     ⏏}<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/no_utf8_pm.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/no_utf8_pm.v5<br />
Illegal range endpoint in regex: \001-\xFF<br />
at t/spec/re/no_utf8_pm.v5:16<br />
------&gt; "\0" =~ /[\001-\xFF]⏏/i;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qrstack.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test 'qr// should extend the stack properly'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_60508.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_fold.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 51, near "@{$invmap_"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switch0.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'><br />
# Failed test '$/ set to 0 via switch'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '0'<br />
#      got: '10'<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/cache.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/cache.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/cache.v5:29<br />
------&gt; $s =~ m/[\⏏p{Hiragana}\x{101}]/;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/bom.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block &lt;unit&gt; at t/spec/io/bom.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errnosig.v5</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::alarm called<br />
  in block  at t/spec/io/errnosig.v5:13<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/io/errnosig.v5:10<br />
<br />   1 skipped: Alarm not supported<br />
</td></tr>
        <tr align='center'><td align='left'>lib/1_compile.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/commonsense.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::BAIL_OUT called<br />
  in block &lt;unit&gt; at t/spec/lib/commonsense.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Diamond_D'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
===SORRY!===<br />
Can't locate object method "foo" via package "Diamond_D" (perhaps you forgot to load "Diamond_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Ｄiᚪၚd_D'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
===SORRY!===<br />
Can't locate object method "ᕘ" via package "Ｄiᚪၚd_D" (perhaps you forgot to load "Ｄiᚪၚd_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Diamond_D'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
===SORRY!===<br />
Can't locate object method "foo" via package "Diamond_D" (perhaps you forgot to load "Diamond_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Ｄiᚪၚd_D'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
===SORRY!===<br />
Can't locate object method "ᕘ" via package "Ｄiᚪၚd_D" (perhaps you forgot to load "Ｄiᚪၚd_D"?)<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_inanon.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "B" (perhaps you forgot to load "B"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_inanon_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "ᕘ" via package "Ḃ" (perhaps you forgot to load "Ḃ"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/groups.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic-27839.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unhandled exception: No exception handler located for warn<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11949  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:40)<br />
 from gen/moar/stage2/NQPHLL.nqp:1361  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:374)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/overload_integer.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate Foo in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 . ../lib)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pwent.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/pwent.v5:71<br />
    ------&gt; 	next unless open my $fh⏏, '-|', "$dscl . -readall /Users @{[keys<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/pwent.v5:71<br />
    ------&gt; dall /Users @{[keys %want]} 2&gt;/dev/null"⏏;<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/pwent.v5:71<br />
    ------&gt; dall /Users @{[keys %want]} 2&gt;/dev/null"⏏;<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/pwent.v5:71<br />
    ------&gt; dall /Users @{[keys %want]} 2&gt;/dev/null"⏏;<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/pwent.v5:71<br />
    ------&gt; dall /Users @{[keys %want]} 2&gt;/dev/null"⏏;<br />
===SORRY!===<br />
Variable '&amp;infix:&lt;//=&gt;' is not declared<br />
at t/spec/op/pwent.v5:34<br />
------&gt; $where ⏏//= try_prog('NetInfo passwd', 'passwd .<br />
Variable '&amp;infix:&lt;//=&gt;' is not declared<br />
at t/spec/op/pwent.v5:37<br />
------&gt; $where ⏏//= try_prog('NIS+', 'passwd.org_dir', '<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time_loop.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block &lt;unit&gt; at t/spec/op/time_loop.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/bincompat.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/porting/bincompat.v5<br />
Confused<br />
at t/spec/porting/bincompat.v5:14<br />
------&gt; my @V = map {s/^ //⏏r} Internals::V();<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr_gc.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol '&amp;Regexp::DESTROY'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switcha.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'># Failed test 'testing split of string '''<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'ok'<br />
#      got: ''<br />
# Looks like you planned 2 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd-78586.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $^P<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chomp.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Cannot use a Buf as a string, but you called the Str method on it<br />
  in method Str at src/gen/m-CORE.setting:5522<br />
  in method STORE_AT_KEY at src/gen/m-CORE.setting:9609<br />
  in method STORE_AT_KEY at src/gen/m-CORE.setting:9724<br />
  in method STORE at src/gen/m-CORE.setting:9749<br />
  in method new at src/gen/m-CORE.setting:9658<br />
  in sub circumfix:&lt;{ }&gt; at src/gen/m-CORE.setting:10126<br />
  in block &lt;unit&gt; at t/spec/uni/chomp.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iprefix.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block &lt;unit&gt; at t/spec/io/iprefix.v5:17<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/read.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Too many positional parameters passed; got 2 but expected 1<br />
  in method print at src/gen/m-CORE.setting:1103<br />
  in sub P5print at src/Perl5/Terms.pm:1021<br />
  in block &lt;unit&gt; at t/spec/io/read.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/concat2.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grent.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::setgrent called<br />
  in block &lt;unit&gt; at t/spec/op/grent.v5:87<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/print.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block &lt;unit&gt; at t/spec/op/print.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utftaint.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $taint<br />
    at t/spec/op/utftaint.v5:80<br />
    ------&gt;     my $taint ⏏= $arg; substr($taint, 0) = $byte;<br />
    Redeclaration of symbol $taint<br />
    at t/spec/op/utftaint.v5:110<br />
    ------&gt;     my $taint ⏏= $arg; substr($taint, 0) = $down;<br />
    Redeclaration of symbol $taint<br />
    at t/spec/op/utftaint.v5:121<br />
    ------&gt;     my $taint ⏏= $arg; substr($taint, 0) = $up;<br />
    Redeclaration of symbol $taint<br />
    at t/spec/op/utftaint.v5:132<br />
    ------&gt;     my $taint ⏏= $arg; substr($taint, 0) = $down;<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/script.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in block &lt;unit&gt; at t/spec/run/script.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchn.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'># Failed test 'Checking line '<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: ''<br />
#      got: 'ok '<br />
# Looks like you planned 3 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left'>run/switchp.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
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
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "Foo" (perhaps you forgot to load "Foo"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "fಓ" via package "ᕘ" (perhaps you forgot to load "ᕘ"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "TTop" (perhaps you forgot to load "TTop"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_goto_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "ᕗ" via package "ᵗ톺" (perhaps you forgot to load "ᵗ톺"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrhand.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/attrhand.v5<br />
Missing block<br />
at t/spec/op/attrhand.v5:19<br />
------&gt; sub TypeCheck :ATTR⏏(CODE,RAWDATA) {<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/crypt.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::crypt called<br />
  in block  at t/spec/op/crypt.v5:32<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/crypt.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filehandle.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/filehandle.v5:15<br />
    ------&gt; open my $fh⏏, "&lt;", \$str;<br />
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
  in block &lt;unit&gt; at t/spec/run/mad.v5:33<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Dynamic variable $*ROUTINE_NAME not found<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>win32/fs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/win32/fs.v5:21<br />
    ------&gt; open my $fh⏏, "&gt;", $tmpfile1<br />
    Redeclaration of symbol $fh<br />
    at t/spec/win32/fs.v5:24<br />
    ------&gt; open my $fh⏏, "&gt;", $tmpfile2<br />
    Redeclaration of symbol $fh<br />
    at t/spec/win32/fs.v5:24<br />
    ------&gt; open my $fh⏏, "&gt;", $tmpfile2<br />
Failed to create link called 'tmp6832B' on target 'tmp6832A': Failed to link file: no such file or directory<br />
  in block  at src/gen/m-CORE.setting:15029<br />
  in any  at /home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:1<br />
  in sub link at src/gen/m-CORE.setting:15024<br />
  in block &lt;unit&gt; at t/spec/win32/fs.v5:1<br />
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
  in block &lt;unit&gt; at t/spec/op/alarm.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dbm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block &lt;unit&gt; at t/spec/op/dbm.v5:44<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lock.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::lock called<br />
  in block &lt;unit&gt; at t/spec/op/lock.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/yadayada.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'Unimplemented at t/spec/op/yadayada.v5 line 16.<br />
# '<br />
#      got: 'Unimplemented'<br />
Error while creating error string: No exception handler located for warn<br />
# Looks like you planned 5 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $flile<br />
    at t/spec/re/qr.v5:82<br />
    ------&gt;  tie my $flile⏏, "qrBug";<br />
# Failed test 'qr// blessed into 'Regexp' by default'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'Regexp'<br />
#      got: 'REGEX'<br />
# Failed test '$a_match_var =~ /$qr/'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '5<br />
# 1: 5<br />
# 2: 5<br />
# '<br />
#      got: '1<br />
# 1: 1<br />
# 2: 1<br />
# '<br />
# Failed test '/$qr/ with my $_ aliased to a match var'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '5<br />
# 1: 5<br />
# 2: 5<br />
# '<br />
#      got: '1<br />
# 1: 1<br />
# 2: 1<br />
# '<br />
# Failed test '/$qr/ with $'_ aliased to a match var'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '5<br />
# 1: 5<br />
# 2: 5<br />
# '<br />
#      got: '1<br />
# 1: 1<br />
# 2: 1<br />
# '<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/re/qr.v5:79<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/re/qr.v5:1<br />
# Looks like you planned 5 tests, but ran 4<br />
# Looks like you failed 4 tests of 4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchF1.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Close Run_switchF1.pl: <br />
  in block &lt;unit&gt; at t/spec/run/switchF1.v5:29<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/eval.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/opcroak.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/opcroak.v5<br />
Confused<br />
at t/spec/uni/opcroak.v5:21<br />
------&gt; Not enough arguments for main::\x{30cb}/⏏u, "Not enough arguments croak is UTF-8 <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/select.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such method 'IO' for invocant of type 'Any'<br />
  in sub P5open at src/Perl5/Terms.pm:88<br />
  in sub P5open at src/Perl5/Terms.pm:77<br />
  in block &lt;unit&gt; at t/spec/uni/select.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/nargv.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>benchmark/rt26188-speed-up-keys-on-empty-hash.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::delete called<br />
  in block &lt;unit&gt; at t/spec/benchmark/rt26188-speed-up-keys-on-empty-hash.v5:6<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/blocks.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block at line 128, near ", 5, 'cons"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/kill0.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::kill called<br />
  in block &lt;unit&gt; at t/spec/op/kill0.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads-dirh.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such method 'item' for invocant of type 'QAST::Regex'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/unlink.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/unlink.v5:21<br />
    ------&gt;   open my $fh⏏, "&gt;", $file or die "Can't open $file: $<br />
Cannot convert string to number: base-10 number must begin with valid digits or '.' in '⏏/home/froggs/dev/v5/t/tmp6493A/aaa' (indicated by ⏏)<br />
  in method Numeric at src/gen/m-CORE.setting:13268<br />
  in sub infix:&lt;==&gt; at src/gen/m-CORE.setting:4448<br />
  in sub infix:&lt;==&gt; at /home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:1<br />
  in sub P5unlink at src/Perl5/Terms.pm:1333<br />
  in sub P5unlink at src/Perl5/Terms.pm:1331<br />
  in block &lt;unit&gt; at t/spec/op/unlink.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8magic.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $str2<br />
    at t/spec/op/utf8magic.v5:32<br />
    ------&gt; tie my $str2⏏, "", "a";<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_7jis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator ) at line 49, near ""<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_eucjp.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_sjis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/inplace.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block &lt;unit&gt; at t/spec/io/inplace.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_open.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/perlio_open.v5:20<br />
    ------&gt;     ok((open my $fh⏏, "+&gt;", undef), "open my \$fh, '+&gt;', und<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/perlio_open.v5:28<br />
    ------&gt;     ok((open my $fh⏏, "+&lt;", undef), "open my \$fh, '+&lt;', und<br />
No such method 'IO' for invocant of type 'Any'<br />
  in sub P5open at src/Perl5/Terms.pm:97<br />
  in sub P5open at src/Perl5/Terms.pm:77<br />
  in block  at t/spec/io/perlio_open.v5:19<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/io/perlio_open.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/through.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/through.v5:93<br />
    ------&gt;   open my $fh⏏, '&gt;', $filename or die;<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/through.v5:116<br />
    ------&gt; open my $fh⏏, '-|', qq[$Perl -we "eval qq(\\x24\\x7c<br />
Cannot find method 'at_key': no method cache and no .^find_method<br />
  in block &lt;unit&gt; at t/spec/io/through.v5:31<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/c3_with_overload.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "InheritingFromOverloadedTest" (perhaps you forgot to load "InheritingFromOverloadedTest"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/c3_with_overload_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "InheritingFromOverloadedTest" (perhaps you forgot to load "InheritingFromOverloadedTest"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_c3.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "InheritingFromOverloadedTest" (perhaps you forgot to load "InheritingFromOverloadedTest"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_c3_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "ネᚹ" via package "읺ҎꀀḮṆᵷꜰ롬ᵕveŔŁoad엗텟ᵵ" (perhaps you forgot to load "읺ҎꀀḮṆᵷꜰ롬ᵕveŔŁoad엗텟ᵵ"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_dfs.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "new" via package "InheritingFromOverloadedTest" (perhaps you forgot to load "InheritingFromOverloadedTest"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
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
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/magic_phase.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/our.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block &lt;unit&gt; at t/spec/comp/our.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package_block.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Cannot find method 'at_key': no method cache and no .^find_method<br />
  in block &lt;unit&gt; at t/spec/comp/package_block.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/readline.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 54, near "u, 'rcatli"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fflush.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $CMD<br />
    at t/spec/io/fflush.v5:126<br />
    ------&gt; open my $CMD⏏, "$cmd |" or die "Can't open pipe to '$<br />
close tmp5781A: <br />
  in block &lt;unit&gt; at t/spec/io/fflush.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_c3.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_c3_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_dfs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_dfs_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fh.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::fileno called<br />
  in block &lt;unit&gt; at t/spec/op/fh.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getppid.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in declarator; couldn't find final ')'  at line 30, near "or die \"pi"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/rand.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>postcircumfix:&lt;{ }&gt; not defined for type Parcel<br />
  in block  at t/spec/op/rand.v5:45<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/rand.v5:27<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/symbolcache.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Undefined subroutine &amp;main::delete called<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pos.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'pos correct'<br />
#      got: '2'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'pos undef after failed match'<br />
#      got: ''<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'pos correct'<br />
#      got: '2'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'pos undef after failed match'<br />
#      got: ''<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'pos correct'<br />
#      got: '4'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'pos correct'<br />
#      got: '4'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'pos correct'<br />
#      got: '1'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'pos correct'<br />
#      got: '1'<br />
# Looks like you failed 8 tests of 8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/tr_utf8.v5<br />
Missing semicolon.<br />
at t/spec/uni/tr_utf8.v5:40<br />
------&gt; $str = $hiragana; ⏏$str =~ s/([ぁ-ん])/$h2k{$1}/go;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/write.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/write.v5<br />
Confused<br />
at t/spec/uni/write.v5:103<br />
------&gt;   like $@, qr/Undefined format "놋웇ʱＦᚖṀŦ/⏏u, 'no such format, with format name in <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/proxy_constant_subs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::svref_2object called<br />
  in block  at t/spec/lib/proxy_constant_subs.v5:22<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/lib/proxy_constant_subs.v5:20<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/heredoc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>Ending delimiter HEREDOC not found at line 3, near "testing fo" ---  in block  at t/spec/op/heredoc.v5:15<br />
# Failed test 'no terminating newline in string-eval'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'testing for 65838'<br />
#      got: ''<br />
P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block  at t/spec/op/heredoc.v5:27<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/heredoc.v5:1<br />
# Looks like you planned 9 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
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
        <tr align='center'><td align='left' rowspan='2'>comp/decl.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/decl.v5<br />
Confused<br />
at t/spec/comp/decl.v5:33<br />
------&gt; &lt;BOL&gt;⏏four();<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
QAST::Block with cuid cuid_101_1409258752.35455 has not appeared<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/dtrace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
P6opaque: no such attribute '$!storage'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/labels.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/labels.v5<br />
Confused<br />
at t/spec/uni/labels.v5:49<br />
------&gt;  $@, qr/Label not found for "last Ｅ" at/⏏u, "last's error is UTF-8 clean";<br />
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
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right MRO for Diamond_D'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
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
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol %h<br />
    at t/spec/op/hash.v5:45<br />
    ------&gt;     tie my %h⏏, "bar";<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/srand.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/FindExt.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate FindExt in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 64, near "switches ="<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tie.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/eintr.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $in<br />
    at t/spec/io/eintr.v5:23<br />
    ------&gt; 	pipe my $in⏏, my $out;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/openpid.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block &lt;unit&gt; at t/spec/io/openpid.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/deprecate.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_dfs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right DFS merge order for Test::A'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::B'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::C'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::D'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::E'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::F'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::G'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::H'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::I'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::J'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for Test::K'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Looks like you failed 11 tests of 11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_dfs_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'><br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ᐊ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ḅ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ȼ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḏ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ӭ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḟ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ḡ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḣ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::ᶦ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ｊ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
# Failed test '... got the right DFS merge order for 텟Ṱ::Ḵ'<br />
# at /home/froggs/dev/v5/t/test.pl line 10<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/goto_xs.v5<br />
Redeclaration of symbol Fcntl<br />
at t/spec/op/goto_xs.v5:58<br />
------&gt; package Fcntl⏏;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_errors.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $module_fh<br />
    at t/spec/op/require_errors.v5:64<br />
    ------&gt; open my $module_fh⏏, "&gt;", $mod_file or die $!;<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/class.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/class.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/class.v5:12<br />
------&gt; is(($str =~ /(\⏏p{IsMyUniClass}+)/)[0], '0123456789:;&lt;=&gt;<br />
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
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pos.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'><br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'matching, pos() leaves off at offset 2'<br />
#      got: '2'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'not matching, pos() remains at offset 2'<br />
#      got: '2'<br />
# Failed test 'matching again, pos() next leaves off at offset 4'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '4'<br />
#      got: ''<br />
# Failed test 'pos() set inside //g'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '0123 5678910?'<br />
#      got: 'est string?'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'matching, pos() leaves off at offset 4'<br />
#      got: '4'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'value of pos() unaffected by intermediate localization'<br />
#      got: '4'<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'utf8_mg_len_cache_update() test'<br />
#      got: '3'<br />
Undefined subroutine &amp;Class::DESTROY called<br />
  in block  at t/spec/op/pos.v5:42<br />
  in block &lt;unit&gt; at t/spec/op/pos.v5:42<br />
# Looks like you planned 12 tests, but ran 7<br />
# Looks like you failed 7 tests of 7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/protowarn.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in parensig; couldn't find final ')'  at line 42, near "x) { };\n\nB"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/wantarray.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchC.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block &lt;unit&gt; at t/spec/run/switchC.v5:17<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switcht.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'># Failed test '${^TAINT} == -1'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '-1'<br />
#      got: ''<br />
P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in block &lt;unit&gt; at t/spec/run/switcht.v5:14<br />
# Looks like you planned 13 tests, but ran 1<br />
# Looks like you failed 1 tests of 1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/universal.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'  at line 41, near "//};\nInter"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/studytied.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/form_scope.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct at line 13, near "&lt;&lt;\n$test\n."<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr-72922.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/package.v5<br />
Confused<br />
at t/spec/comp/package.v5:18<br />
------&gt;     $main⏏'a = $'b;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_pmod.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Found ? but no :; possible precedence problem at line 42, near "p\n\t\t\t  : $"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/mypragma.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate mypragma in @INC (@INC contains: lib lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8cache.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/utf8cache.v5<br />
Preceding context expects a term, but found infix = instead<br />
at t/spec/op/utf8cache.v5:69<br />
------&gt; substr $x, 0, 1, =⏏ "\x{100}";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_psycho.v5<br />
Illegal redeclaration of 'OUTER'<br />
at t/spec/re/pat_psycho.v5:107<br />
------&gt;           ⏏for my $a ("x","a","aa") {<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/shm.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::IPC_PRIVATE called<br />
  in block  at t/spec/io/shm.v5:43<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/io/shm.v5:40<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashwarn.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
  in block  at src/Perl5/ModuleLoader.pm:212<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in sub merge_globals at src/Perl5/ModuleLoader.pm:176<br />
  in method load_module at src/Perl5/ModuleLoader.pm:151<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/op/hashwarn.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/push.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot modify an immutable Any<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'># Failed test at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: 'Is empty'<br />
#      got: ''<br />
# Failed test at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: 'Is still empty'<br />
#      got: ''<br />
# Failed test 'Didnt return anything'<br />
# at /home/froggs/dev/v5/t/test.pl line 12<br />
# expected: '0'<br />
#      got: ''<br />
# Failed test 'Didnt return anything'<br />
# at /home/froggs/dev/v5/t/test.pl line 64<br />
# expected: '0'<br />
#      got: ''<br />
No such method 'import' for invocant of type 'Str+{P5Bareword}'<br />
  in block  at t/spec/op/sub.v5:26<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/sub.v5:1<br />
# Looks like you planned 16 tests, but ran 4<br />
# Looks like you failed 4 tests of 4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/defout.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/defout.v5<br />
Confused<br />
at t/spec/io/defout.v5:32<br />
------&gt; @ ⏏@&lt;&lt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errno.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Can't locate ./test.pl in @INC (@INC contains: lib /home/froggs/dev/v5/lib /home/froggs/dev/v5/lib/Perl5 /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5 .)<br />
  in method load_module at src/Perl5/ModuleLoader.pm:58<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:165<br />
  in method load_module at src/gen/m-CORE.setting:21703<br />
  in block &lt;unit&gt; at t/spec/io/errno.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/cygwin.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate Win32 in @INC (@INC contains: ../lib/Perl5)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/current_sub.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/glob.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/glob.v5<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/glob.v5:12<br />
------&gt; @oops = @ops = &lt;⏏op/*&gt;;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lfs.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>binmode tmp6277B failed: <br />
  in block &lt;unit&gt; at t/spec/op/lfs.v5:24<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/caller.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/caller.v5<br />
Confused<br />
at t/spec/uni/caller.v5:20<br />
------&gt; ndefined subroutine &amp;ｍａｉｎ::ok called at/⏏u;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/package.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/package.v5<br />
Confused<br />
at t/spec/uni/package.v5:37<br />
------&gt;     $압Ƈ⏏'d읯ⱪ = 6;        #'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_keeperr.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'End'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/redef.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/redef.v5<br />
Redeclaration of routine sub0<br />
at t/spec/comp/redef.v5:22<br />
------&gt; &lt;BOL&gt;⏏ok 1, $warn =~ s/Subroutine sub0 redefin<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/exec.v5<br />
Confused<br />
at t/spec/op/exec.v5:110<br />
------&gt; $rc = system { "lskdfj" } ⏏"lskdfj";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/join.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mkdir.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/cloexec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>close 'tmp6706B': <br />
  in sub make_tmp_file at t/spec/run/cloexec.v5:53<br />
  in block &lt;unit&gt; at t/spec/run/cloexec.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/argv.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/argv.v5:118<br />
    ------&gt;     open my $fh⏏, 'Io_argv1.tmp' or die "Could not open <br />
===SORRY!===<br />
This type does not support positional operations<br />
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
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in method open at src/gen/m-CORE.setting:14354<br />
  in sub P5open at src/Perl5/Terms.pm:82<br />
  in sub P5open at src/Perl5/Terms.pm:77<br />
  in block &lt;unit&gt; at t/spec/io/pipe.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/print.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/print.v5<br />
Variable '$,' is not declared<br />
at t/spec/io/print.v5:34<br />
------&gt; $, ⏏= ' ';<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/while.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 37, near "!/vt100/ &amp;"<br />
</td></tr>
        <tr align='center'><td align='left'>comp/colon.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reverse.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 201, near "use thread"<br />
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
        <tr align='center'><td align='left' rowspan='2'>op/override.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'at_key': no method cache and no .^find_method<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/qq.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/opbasic/qq.v5<br />
Unrecognized backslash sequence: '\x'<br />
at t/spec/opbasic/qq.v5:45<br />
------&gt; is ("\x⏏h", chr (0) . 'h');	# This will warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pvbm.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/pvbm.v5<br />
Calling 'truncate' will never work with argument types (Mu, Int)<br />
    Expected any of: <br />
    :(Real:D $x) <br />
    :(Cool:D $x)<br />
at t/spec/io/pvbm.v5:52<br />
------&gt;     ok (!eval { truncate ⏏$pvbm, 0 }, 'truncate(PVBM) fails');<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigdispatch.v5</td><td>0</td><td>29</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readline.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot iterate object with P6opaque representation<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reset.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/reset.v5<br />
Redeclaration of symbol scratch<br />
at t/spec/op/reset.v5:84<br />
------&gt; package scratch ⏏{ reset "bc" }<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/warn.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 148, near "a,\n  { },\n"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/concat.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block at line 158, near "\"qr/\\x{fff"<br />
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
        <tr><td colspan='5'>Undefined subroutine &amp;main::vec called<br />
  in block &lt;unit&gt; at t/spec/op/vec.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chars.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type cannot unbox to a native string<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval_scope.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan='5'>P6opaque: no such attribute '$!storage'<br />
  in sub QX at src/gen/m-CORE.setting:801<br />
  in sub _fresh_perl at /home/froggs/dev/v5/t/test.pl:34<br />
  in sub fresh_perl_is at /home/froggs/dev/v5/t/test.pl:121<br />
  in block &lt;unit&gt; at t/spec/re/reg_eval_scope.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/tell.v5</td><td>0</td><td>35</td><td>0</td><td>0</td><td>35</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::TST called<br />
  in block &lt;unit&gt; at t/spec/io/tell.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/subval.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/cmd/subval.v5<br />
Confused<br />
at t/spec/cmd/subval.v5:110<br />
------&gt; &amp;main⏏'somesub(28, 'foo', __FILE__, __LINE__);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/recompile.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $tf<br />
    at t/spec/re/recompile.v5:44<br />
    ------&gt;     open my $tf⏏, "&gt;$tmpfile" or die "Cannot open $tmpfi<br />
Undefined subroutine &amp;main::runperl called<br />
  in block &lt;unit&gt; at t/spec/re/recompile.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_nc_tie.v5</td><td>0</td><td>37</td><td>0</td><td>0</td><td>37</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unhandled exception: No exception handler located for warn<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11949  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:40)<br />
 from gen/moar/stage2/NQPHLL.nqp:1361  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:374)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/delete.v5</td><td>0</td><td>38</td><td>0</td><td>0</td><td>38</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::delete called<br />
  in block &lt;unit&gt; at t/spec/op/delete.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/avhv.v5</td><td>0</td><td>40</td><td>0</td><td>0</td><td>40</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/avhv.v5<br />
Confused<br />
at t/spec/op/avhv.v5:167<br />
------&gt; $a = [{key =&gt; 1}⏏, 'a'];<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/repeat.v5</td><td>0</td><td>42</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '&amp;infix:&lt;x=&gt;' is not declared<br />
at t/spec/op/repeat.v5:47<br />
------&gt; $a ⏏x= 2;<br />
Variable '&amp;infix:&lt;x=&gt;' is not declared<br />
at t/spec/op/repeat.v5:49<br />
------&gt; $a ⏏x= 1;<br />
Variable '&amp;infix:&lt;x=&gt;' is not declared<br />
at t/spec/op/repeat.v5:51<br />
------&gt; $a ⏏x= 0;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/study.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator | at line 70, near ");\n\nok(/^$"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/uproto.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/io/perlio.v5:109<br />
    ------&gt;       ok(open(my $x⏏,"+&lt;",undef), 'TMPDIR honored by magic t<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/perlio.v5:198<br />
    ------&gt;         open my $fh⏏, "&lt;", \(my $f = *f);<br />
Undefined subroutine &amp;main::use_ok called<br />
  in block &lt;unit&gt; at t/spec/io/perlio.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chdir.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sysio.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>sysio.t: cannot find myself: <br />
  in block &lt;unit&gt; at t/spec/op/sysio.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/parser.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot modify an immutable Any<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest.v5</td><td>0</td><td>49</td><td>0</td><td>0</td><td>49</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate Perl::OSType in @INC (@INC contains: ../lib)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases_utf8.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/package_aliases_utf8.v5<br />
Confused<br />
at t/spec/mro/package_aliases_utf8.v5:87<br />
------&gt;    ~ =~ s\__code__\$$_{code}\⏏r; #\<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fs.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_utf8.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/basic_utf8.v5<br />
Confused<br />
at t/spec/mro/basic_utf8.v5:9<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 53);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/package_aliases.v5<br />
Confused<br />
at t/spec/mro/package_aliases.v5:75<br />
------&gt;    ~ =~ s\__code__\$$_{code}\⏏r,<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stash.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol oedipa::maas<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ver.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 111, near "unpack 'U*"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/stash.v5</td><td>0</td><td>58</td><td>0</td><td>0</td><td>58</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol 왿ퟀⲺa::ᒫṡ<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic.v5</td><td>0</td><td>59</td><td>0</td><td>0</td><td>59</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/basic.v5<br />
Confused<br />
at t/spec/mro/basic.v5:7<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 59);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/inccode.v5:29<br />
    ------&gt;     open my $fh⏏, "&gt;$f" or die "Can't create $f: $!";<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/inccode.v5:274<br />
    ------&gt;         open my $fh⏏, '&lt;',<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/inccode.v5:303<br />
    ------&gt; 	my $pid = open my $fh⏏, "-|";<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/quotemeta.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/quotemeta.v5<br />
Unrecognized backslash sequence: '\U'<br />
at t/spec/op/quotemeta.v5:35<br />
------&gt; is("aA\⏏UbB\LcC\EdD", "aABBccdD", 'aA\UbB\LcC\Ed<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/utf8.v5</td><td>0</td><td>61</td><td>0</td><td>0</td><td>61</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grep.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/grep.v5<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/grep.v5:57<br />
------&gt;            {a =&gt;$_},⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/method.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/method.v5<br />
Confused<br />
at t/spec/uni/method.v5:43<br />
------&gt; method "ｍｅｔｈｏｄ" on unblessed reference /⏏u;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiehandle.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/tiehandle.v5<br />
Confused<br />
at t/spec/op/tiehandle.v5:97<br />
------&gt; $r = printf $fh ⏏@expect[2,3];<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/localref.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
QAST::Var with scope '' NYI<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/loopctl.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/loopctl.v5:958<br />
    ------&gt;     until (! (my $x ⏏= $i)) {<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/loopctl.v5:964<br />
    ------&gt;     for ($i = 1; my $x ⏏= $i; ) {<br />
Undefined subroutine &amp;main::TEST1 called<br />
  in block  at t/spec/op/loopctl.v5:51<br />
  in block  at t/spec/op/loopctl.v5:44<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block &lt;unit&gt; at t/spec/op/loopctl.v5:42<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time.v5</td><td>0</td><td>66</td><td>0</td><td>0</td><td>66</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiearray.v5</td><td>0</td><td>69</td><td>0</td><td>0</td><td>69</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol @dummy<br />
    at t/spec/op/tiearray.v5:295<br />
    ------&gt;     tie my @dummy⏏, "NegFetchsize";<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/tiearray.v5:155<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block  at t/spec/op/tiearray.v5:153<br />
  in method reify at src/gen/m-CORE.setting:7976<br />
  in method reify at src/gen/m-CORE.setting:7812<br />
  in method gimme at src/gen/m-CORE.setting:8301<br />
  in method sink at src/gen/m-CORE.setting:8760<br />
  in block  at t/spec/op/tiearray.v5:151<br />
  in block  at t/spec/op/tiearray.v5:143<br />
  in block &lt;unit&gt; at t/spec/op/tiearray.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/greek.v5</td><td>0</td><td>72</td><td>0</td><td>0</td><td>72</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/retainedlines.v5</td><td>0</td><td>74</td><td>0</td><td>0</td><td>74</td></tr>
        <tr><td colspan='5'>No such method 'name' for invocant of type 'Any'<br />
  in method name at src/Perl5/Terms.pm:116<br />
  in method list at src/Perl5/Terms.pm:131<br />
  in method keys at src/gen/m-CORE.setting:1620<br />
  in sub keys at src/gen/m-CORE.setting:2014<br />
  in block &lt;unit&gt; at t/spec/comp/retainedlines.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/oct.v5</td><td>0</td><td>77</td><td>0</td><td>0</td><td>77</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/oct.v5<br />
Unrecognized backslash sequence: '\L'<br />
at t/spec/op/oct.v5:65<br />
------&gt; y $format = ($string =~ /([bx])/i) ? "0\⏏L$1%\U$1": '0%o';<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/bless.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/bless.v5<br />
Confused<br />
at t/spec/uni/bless.v5:18<br />
------&gt; r/^\Q$package\E=(\w+)\(0x([0-9a-f]+)\)$/⏏u;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/use.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate test_use in @INC (@INC contains: ../lib lib)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/lex.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot modify an immutable Any<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto.v5</td><td>0</td><td>89</td><td>0</td><td>0</td><td>89</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/goto.v5:513<br />
------&gt;     F1⏏:++$x and eval 'return if ++$y == 10; go<br />
Other potential difficulties:<br />
    Redeclaration of symbol $f<br />
    at t/spec/op/goto.v5:234<br />
    ------&gt; open my $f⏏, "&gt;Op_goto01.pm" or die;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/caller.v5</td><td>0</td><td>91</td><td>0</td><td>0</td><td>91</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate strict in @INC (@INC contains: ../lib)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/universal.v5</td><td>0</td><td>93</td><td>0</td><td>0</td><td>93</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/runenv.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type cannot unbox to a native string<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/latin2.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utfhash.v5</td><td>0</td><td>99</td><td>0</td><td>0</td><td>99</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex_assign.v5</td><td>0</td><td>100</td><td>0</td><td>0</td><td>100</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/lex_assign.v5<br />
Unrecognized backslash sequence: '\u'<br />
at t/spec/op/lex_assign.v5:34<br />
------&gt; my $b = "\⏏u\L$a";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bless.v5</td><td>0</td><td>109</td><td>0</td><td>0</td><td>109</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stat.v5</td><td>0</td><td>113</td><td>0</td><td>0</td><td>113</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/stat.v5:465<br />
    ------&gt;     open my $fh⏏, "test.pl";<br />
===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
chr codepoint cannot be negative<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/svleak.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Undefined subroutine &amp;main::or called<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switches.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support elems<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/open.v5</td><td>0</td><td>121</td><td>0</td><td>0</td><td>121</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 117, near "u,        "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array.v5</td><td>0</td><td>127</td><td>0</td><td>0</td><td>127</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')'  at line 63, near "= ($foo =~"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/eval.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block at line 93, near "('\"$b\"'), "<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/lexsub.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/cmd/lexsub.v5<br />
Redeclaration of symbol bar<br />
at t/spec/cmd/lexsub.v5:41<br />
------&gt; package bar⏏;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lc.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1419  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1400  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:60)<br />
 from gen/moar/stage2/NQPHLL.nqp:1326  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:211)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:93)<br />
 from gen/moar/stage2/NQPHLL.nqp:1301  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:116)<br />
 from src/gen/m-main.nqp:39  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:35  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;mainline&gt;:197)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;main&gt;:8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:&lt;entry&gt;:9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>japh/abigail.v5</td><td>0</td><td>129</td><td>0</td><td>1</td><td>130</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot modify an immutable Num<br />
<br />   1 skipped: <br />
</td></tr>
        <tr align='center'><td align='left'>op/state.v5</td><td>0</td><td>131</td><td>0</td><td>0</td><td>131</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tr.v5</td><td>0</td><td>132</td><td>0</td><td>0</td><td>132</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator | at line 203, near ");\n\n\n# v30"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/universal.v5</td><td>0</td><td>139</td><td>0</td><td>0</td><td>139</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Merging GLOBAL symbols failed: duplicate definition of symbol $|<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/method.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/method.v5<br />
Confused<br />
at t/spec/op/method.v5:45<br />
------&gt; is((method $obj ⏏"a","b","c"), "method,a,b,c");<br />
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
        <tr align='center'><td align='left' rowspan='2'>op/incfilter.v5</td><td>0</td><td>145</td><td>0</td><td>0</td><td>145</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/parser.v5</td><td>0</td><td>154</td><td>0</td><td>0</td><td>154</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/parser.v5<br />
Unrecognized backslash sequence: '\Q'<br />
at t/spec/comp/parser.v5:115<br />
------&gt; is( "\⏏Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Qa", "a", "PL_le<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bop.v5</td><td>0</td><td>174</td><td>0</td><td>0</td><td>174</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 105, near "v801), 801"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sort.v5</td><td>0</td><td>176</td><td>0</td><td>0</td><td>176</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in args; couldn't find final ')'  at line 95, near "@harry);\n$"<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/sub_lval.v5<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/sub_lval.v5:282<br />
------&gt; ok(!defined,⏏ 'implicitly returning undef in list con<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/gv.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/gv.v5:130<br />
------&gt; 	like($msg, qr/Argument "\*main::(\⏏p{ASCII}|\Q\x{\E\p{ASCII_Hex_Digit}{2}\}<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/overload.v5</td><td>0</td><td>215</td><td>0</td><td>0</td><td>215</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'stringify'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ref.v5</td><td>0</td><td>230</td><td>0</td><td>0</td><td>230</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/ref.v5:235<br />
------&gt; $object = bless $main⏏'anonhash2;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/ref.v5:173<br />
    ------&gt; my $x⏏;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gv.v5</td><td>0</td><td>245</td><td>0</td><td>0</td><td>245</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/gv.v5<br />
Confused<br />
at t/spec/op/gv.v5:165<br />
------&gt; XXX This text isn⏏'t used. Should it be?<br />
</td></tr>
        <tr align='center'><td align='left'>op/cproto.v5</td><td>0</td><td>254</td><td>0</td><td>0</td><td>254</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashassign.v5</td><td>0</td><td>309</td><td>0</td><td>0</td><td>309</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')'  at line 362, near "= (1,1,1))"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/local.v5</td><td>0</td><td>310</td><td>0</td><td>0</td><td>310</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in declarator; couldn't find final ')'  at line 89, near "[1]) = 'fo"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie_fetch_count.v5</td><td>0</td><td>312</td><td>0</td><td>0</td><td>312</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/tie_fetch_count.v5:257<br />
------&gt; pos⏏$var = 0             ; check_count 'lval<br />
Other potential difficulties:<br />
    Redeclaration of symbol $var<br />
    at t/spec/op/tie_fetch_count.v5:44<br />
    ------&gt; tie my $var ⏏=&gt; 'main', 1;<br />
    Redeclaration of symbol $v42<br />
    at t/spec/op/tie_fetch_count.v5:68<br />
    ------&gt; tie my $v42 ⏏=&gt; 'main', "z";<br />
    Redeclaration of symbol $v_1<br />
    at t/spec/op/tie_fetch_count.v5:104<br />
    ------&gt; tie my $v_1⏏, "main", 0;<br />
    Redeclaration of symbol $var0<br />
    at t/spec/op/tie_fetch_count.v5:123<br />
    ------&gt; tie my $var0⏏, "main", \*DATA;<br />
    Redeclaration of symbol $var1<br />
    at t/spec/op/tie_fetch_count.v5:166<br />
    ------&gt; tie my $var1 ⏏=&gt; 'main', \1;<br />
    Redeclaration of symbol $var2<br />
    at t/spec/op/tie_fetch_count.v5:168<br />
    ------&gt; tie my $var2 ⏏=&gt; 'main', [];<br />
    Redeclaration of symbol $var3<br />
    at t/spec/op/tie_fetch_count.v5:171<br />
    ------&gt; tie my $var3 ⏏=&gt; 'main', {};<br />
    Redeclaration of symbol $var4<br />
    at t/spec/op/tie_fetch_count.v5:176<br />
    ------&gt;     tie my $var4 ⏏=&gt; 'main', **;<br />
    Redeclaration of symbol $var5<br />
    at t/spec/op/tie_fetch_count.v5:180<br />
    ------&gt; tie my $var5 ⏏=&gt; 'main', sub {1};<br />
    Redeclaration of symbol $var1<br />
    at t/spec/op/tie_fetch_count.v5:185<br />
    ------&gt;     tie my $var1 ⏏=&gt; 'main', 1;<br />
    Redeclaration of symbol $var6<br />
    at t/spec/op/tie_fetch_count.v5:200<br />
    ------&gt;     tie my $var6 ⏏=&gt; main =&gt; 988;<br />
    Redeclaration of symbol $var7<br />
    at t/spec/op/tie_fetch_count.v5:206<br />
    ------&gt;     tie my $var7 ⏏=&gt; main =&gt; 973;<br />
    Redeclaration of symbol $var8<br />
    at t/spec/op/tie_fetch_count.v5:210<br />
    ------&gt; tie my $var8 ⏏=&gt; 'main', 'main';<br />
    Redeclaration of symbol $var9<br />
    at t/spec/op/tie_fetch_count.v5:218<br />
    ------&gt;     tie my $var9 ⏏=&gt; 'main', 'swibble';<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartmatch.v5</td><td>0</td><td>349</td><td>0</td><td>0</td><td>349</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol @tied_nums<br />
    at t/spec/op/smartmatch.v5:25<br />
    ------&gt; tie my @tied_nums⏏, 'Tie::StdArray';<br />
    Redeclaration of symbol %tied_hash<br />
    at t/spec/op/smartmatch.v5:29<br />
    ------&gt; tie my %tied_hash⏏, 'Tie::StdHash';<br />
Undefined subroutine &amp;main::tie called<br />
  in block &lt;unit&gt; at t/spec/op/smartmatch.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr.v5</td><td>0</td><td>387</td><td>0</td><td>0</td><td>387</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
This type does not support positional operations<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval.v5</td><td>0</td><td>463</td><td>0</td><td>0</td><td>463</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'value'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat.v5</td><td>0</td><td>466</td><td>0</td><td>0</td><td>466</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat.v5:270<br />
------&gt;         my $message = '/g, \⏏G and pos';<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/taint.v5</td><td>0</td><td>797</td><td>0</td><td>0</td><td>797</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/taint.v5:392<br />
------&gt;     $res = $s =~ s/(.+)/xyz/⏏r;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/taint.v5:129<br />
    ------&gt; open my $fh⏏, '&gt;', $ECHO or die "Can't create $ECHO:<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report.v5</td><td>0</td><td>2530</td><td>0</td><td>0</td><td>2530</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_rt_report.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat_rt_report.v5:96<br />
------&gt;         ok("École" =~ /^\⏏C\C(.)/ &amp;&amp; $1 eq 'c', $message);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/utf.v5</td><td>0</td><td>4016</td><td>0</td><td>0</td><td>4016</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/comp/utf.v5:38<br />
    ------&gt;     open my $fh⏏, "&gt;", "utf$$.pl" or die "utf.pl: $!";<br />
It takes about 40 minutes to skip all tests<br />
  in block &lt;unit&gt; at t/spec/comp/utf.v5:1<br />
</td></tr>

        <tr><td>compiler version</td><td colspan='5'>This is perl6 version 2014.08-131-gc0ac56f built on MoarVM version 2014.08-50-gf73877a
</td></tr>
    </tbody>
</table>
