<table align='center'>
    <thead>
        <tr><th></th><th>pass</th><th>fail</th><th>todo</th><th>skip</th><th>spec</th></tr>
    </thead>
    <tbody>
        <tr align='center'><td align='left'>summary</td><td>750</td><td>39662</td><td>5</td><td>37</td><td>40451</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/arith.v5</td><td>151</td><td>16</td><td>0</td><td>0</td><td>167</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in block  at t/spec/opbasic/arith.v5:375<br />
use of uninitialized value of type Any in numeric context  in block  at t/spec/opbasic/arith.v5:378<br />
use of uninitialized value of type Any in numeric context  in block  at t/spec/opbasic/arith.v5:387<br />
use of uninitialized value of type Any in numeric context  in block  at t/spec/opbasic/arith.v5:390<br />
use of uninitialized value of type Any in numeric context  in block  at t/spec/opbasic/arith.v5:394<br />
use of uninitialized value of type Any in numeric context  in block  at t/spec/opbasic/arith.v5:398<br />
Divide by zero<br />
  in sub infix:&lt;div&gt; at src/gen/CORE.setting:3433<br />
  in sub infix:&lt;div&gt; at src/gen/CORE.setting:3061<br />
  in method floor at src/gen/CORE.setting:7994<br />
  in method Str at src/gen/CORE.setting:8012<br />
  in method Str at src/gen/CORE.setting:875<br />
  in method Stringy at src/gen/CORE.setting:884<br />
  in sub infix:&lt;eq&gt; at src/gen/CORE.setting:1290<br />
  in sub infix:&lt;eq&gt; at src/gen/CORE.setting:1288<br />
  in block  at src/gen/CORE.setting:14011<br />
  in sub infix:&lt;ne&gt; at src/gen/CORE.setting:1294<br />
  in sub infix:&lt;ne&gt; at src/gen/CORE.setting:1292<br />
  in block  at t/spec/opbasic/arith.v5:408<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/list.v5</td><td>57</td><td>7</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in string context  in block  at t/spec/op/list.v5:169<br />
use of uninitialized value of type Any in string context  in block  at t/spec/op/list.v5:169<br />
use of uninitialized value of type Any in string context  in block  at t/spec/op/list.v5:169<br />
use of uninitialized value of type Any in string context  in block  at t/spec/op/list.v5:169<br />
use of uninitialized value of type Any in string context  in block  at t/spec/op/list.v5:169<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/num.v5</td><td>52</td><td>0</td><td>1</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>   1 todo   : NYI<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chop.v5</td><td>45</td><td>88</td><td>0</td><td>10</td><td>143</td></tr>
        <tr><td colspan='5'>   4 skipped: Invalid character for UTF-8 encoding<br />
   2 skipped: Confused<br />
   4 skipped: Unrecognized directive 'U'<br />
</td></tr>
        <tr align='center'><td align='left'>op/auto.v5</td><td>45</td><td>2</td><td>0</td><td>0</td><td>47</td></tr>
        <tr align='center'><td align='left'>comp/cmdopt.v5</td><td>44</td><td>0</td><td>0</td><td>0</td><td>44</td></tr>
        <tr align='center'><td align='left'>op/unshift.v5</td><td>36</td><td>0</td><td>0</td><td>0</td><td>36</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chars.v5</td><td>33</td><td>0</td><td>0</td><td>1</td><td>34</td></tr>
        <tr><td colspan='5'>   1 skipped: ord("") NYI<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ord.v5</td><td>22</td><td>0</td><td>0</td><td>13</td><td>35</td></tr>
        <tr><td colspan='5'>  13 skipped: Invalid character for UTF-8 encoding<br />
</td></tr>
        <tr align='center'><td align='left'>cmd/switch.v5</td><td>18</td><td>0</td><td>0</td><td>0</td><td>18</td></tr>
        <tr align='center'><td align='left'>t/v5/05-array.v5</td><td>16</td><td>1</td><td>0</td><td>0</td><td>17</td></tr>
        <tr align='center'><td align='left'>op/exp.v5</td><td>16</td><td>0</td><td>0</td><td>0</td><td>16</td></tr>
        <tr align='center'><td align='left'>op/lop.v5</td><td>15</td><td>2</td><td>0</td><td>0</td><td>17</td></tr>
        <tr align='center'><td align='left'>t/v5/05-for.v5</td><td>13</td><td>0</td><td>0</td><td>0</td><td>13</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/sprintf.v5</td><td>13</td><td>39</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>Cannot convert string to number: trailing characters after number in '512⏏Büf' (indicated by ⏏)<br />
  in method Int at src/gen/CORE.setting:10167<br />
  in method Int at src/gen/CORE.setting:4119<br />
  in method chr at src/gen/CORE.setting:2510<br />
  in block  at t/spec/uni/sprintf.v5:83<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/uni/sprintf.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/not.v5</td><td>12</td><td>4</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>parens needed around second argument in next two tests<br />
to preserve list context inside function call<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/04-op.v5</td><td>11</td><td>0</td><td>0</td><td>0</td><td>11</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/for.v5</td><td>10</td><td>108</td><td>0</td><td>0</td><td>118</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;bless'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/cmd/for.v5:94<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/cmd/for.v5:79<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-if.v5</td><td>9</td><td>0</td><td>0</td><td>0</td><td>9</td></tr>
        <tr align='center'><td align='left'>op/die_except.v5</td><td>8</td><td>4</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/17-hash-autovivify.v5</td><td>7</td><td>0</td><td>1</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>   1 todo   : <br />
</td></tr>
        <tr align='center'><td align='left'>op/die_unwind.v5</td><td>7</td><td>5</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/bproto.v5</td><td>7</td><td>12</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>   3 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/18-array-autovivify.v5</td><td>6</td><td>0</td><td>0</td><td>0</td><td>6</td></tr>
        <tr align='center'><td align='left'>t/v5/05-while.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/04-string.v5</td><td>5</td><td>15</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>Cannot modify an immutable value<br />
  in block  at t/v5/04-string.v5:30<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defined.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 42 in sink context (line 15)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chr.v5</td><td>5</td><td>37</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan='5'>Invalid character for UTF-8 encoding<br />
  in method chr at src/gen/CORE.setting:3334<br />
  in block  at t/spec/op/chr.v5:24<br />
</td></tr>
        <tr align='center'><td align='left'>base/while.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/10-bind-sub-param.v5</td><td>4</td><td>0</td><td>1</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>   1 todo   : <br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-anon-sub.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>t/v5/03-num.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left'>op/sleep.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/negate.v5</td><td>4</td><td>41</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'>Cannot convert string to number: trailing characters after number in '10⏏foo' (indicated by ⏏)<br />
  in method Numeric at src/gen/CORE.setting:10169<br />
  in sub prefix:&lt;-&gt; at src/gen/CORE.setting:2904<br />
  in sub prefix:&lt;-&gt; at src/gen/CORE.setting:2903<br />
  in sub prefix:&lt;-&gt; at src/gen/CORE.setting:2904<br />
  in sub prefix:&lt;-&gt; at src/gen/CORE.setting:2903<br />
  in block  at t/spec/op/negate.v5:21<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/length.v5</td><td>4</td><td>37</td><td>0</td><td>0</td><td>41</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $u<br />
    at t/spec/op/length.v5:176<br />
    ------&gt; my $u⏏;<br />
Unrecognized directive 'U'<br />
  in block  at src/gen/CORE.setting:7940<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in sub pack at src/gen/CORE.setting:7887<br />
  in sub pack at src/gen/CORE.setting:7885<br />
  in block  at t/spec/op/length.v5:37<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/op/length.v5:20<br />
</td></tr>
        <tr align='center'><td align='left'>op/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>cmd/elsif.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>base/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/term.v5</td><td>3</td><td>0</td><td>2</td><td>2</td><td>7</td></tr>
        <tr><td colspan='5'>   2 skipped: typeglobs NYI<br />
   1 todo   : retrieving highest array index NYI<br />
   1 todo   : rakudo doesnt support -l option<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/19-local.v5</td><td>3</td><td>4</td><td>0</td><td>0</td><td>7</td></tr>
        <tr align='center'><td align='left'>t/v5/05-anon-sub-lex-block.v5</td><td>3</td><td>0</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left'>op/heredoc.v5</td><td>3</td><td>6</td><td>0</td><td>0</td><td>9</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/append.v5</td><td>3</td><td>0</td><td>0</td><td>10</td><td>13</td></tr>
        <tr><td colspan='5'>  10 skipped: Unrecognized directive 'U'<br />
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
        <tr align='center'><td align='left'>op/print.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left'>base/if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/basic.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>t/v5/02-int.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchI.v5</td><td>1</td><td>3</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in block  at t/spec/run/switchI.v5:15<br />
</td></tr>
        <tr align='center'><td align='left'>run/switchF.v5</td><td>1</td><td>1</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/hints.v5</td><td>1</td><td>30</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Nominal type check failed for parameter ''; expected Any but got Mu instead<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/vec.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in block  at t/spec/bigmem/vec.v5:13<br />
use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
No such symbol '&amp;vec'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/bigmem/vec.v5:24<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_c3.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$package' is not declared<br />
at t/spec/mro/isa_c3.v5:68<br />
------&gt; 	object_ok($ref, $class, $package⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_c3_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$package' is not declared<br />
at t/spec/mro/isa_c3_utf8.v5:70<br />
------&gt; 	object_ok($ref, $class, $package⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_dfs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$package' is not declared<br />
at t/spec/mro/isa_dfs.v5:64<br />
------&gt; 	object_ok($ref, $class, $package⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_dfs_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$package' is not declared<br />
at t/spec/mro/isa_dfs_utf8.v5:66<br />
------&gt; 	object_ok($ref, $class, $package⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/method_caching.v5:30<br />
------&gt;     sub { is(MCTest::Derived-&gt;foo(⏏0), 1); },</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/method_caching_utf8.v5:32<br />
------&gt;     sub { is(MC텟ᵀ::ድ리ᭉᛞ-&gt;ᕘ(⏏0), 1); },</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/64bitint.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
UV_max eq '0', doesn't end in 5; your UV isn't 4n bits long :-(.<br />
  in block  at t/spec/op/64bitint.v5:25<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/anonsub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*DATA' is not declared<br />
at t/spec/op/anonsub.v5:11<br />
------&gt; run_multiple_progs('', \*DATA⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/assignwarn.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$tie' is not declared<br />
at t/spec/op/assignwarn.v5:51<br />
------&gt; 	test_op($tie⏏, $integer, $_, 0) foreach qw($x++ $x--</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol pass<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/closure.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/closure.v5:79<br />
------&gt; is(&amp;{$foo[0]}⏏(), 0);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coreamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub infix:&lt;|=&gt; at lib/Perl5/Terms.pm:147<br />
===SORRY!===<br />
Preceding context expects a term, but found infix + instead<br />
at t/spec/op/coreamp.v5:57<br />
------&gt;     $tests ++⏏;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coresubs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub infix:&lt;|=&gt; at lib/Perl5/Terms.pm:147<br />
===SORRY!===<br />
Could not find B::Deparse in any of: ., ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/do.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$#t' is not declared<br />
at t/spec/op/do.v5:117<br />
------&gt; is($#t⏏, 0, "empty do result value" );</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exists_sub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/exists_sub.v5:49<br />
------&gt;     ok( defined &amp;t5, ,⏏ 't5 defined' );<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fork.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
No such symbol '&amp;run_multiple_progs'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/fork.v5:17<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gmagic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$Level' is not declared<br />
at t/spec/op/gmagic.v5:16<br />
------&gt;     local $::Level⏏ = $::Level + 1;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$b' is not declared<br />
at t/spec/op/inc.v5:56<br />
------&gt; $b⏏ = -$a;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode-tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Tie::Array in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/op/index_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/leaky-magic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find tests in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in declarator; couldn't find final ')'<br />
at t/spec/op/my.v5:15<br />
------&gt;     { my($a, ⏏undef, $c) = ("ok 9\n", "not ok 10\n", "</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mydef.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Method 'p5cc' not found for invocant of class 'Perl5::Grammar'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/line_debug.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/comp/line_debug.v5:36<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readdir.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*OP' is not declared<br />
at t/spec/op/readdir.v5:18<br />
------&gt;     local *OP⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_37033.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%INC' is not declared<br />
at t/spec/op/require_37033.v5:13<br />
------&gt;     delete $INC{'test_use_14937.pm'}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/runlevel.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;run_multiple_progs'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/runlevel.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartkve.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/splice.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/splice.v5:87<br />
------&gt; ok( ! Foo-&gt;isa(⏏'Bar'), 'Foo is not a Bar');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find version in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/op/substr_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;run_multiple_progs'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/tie.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/upgrade.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$source_type' is not declared<br />
at t/spec/op/upgrade.v5:44<br />
------&gt; 	$vars-&gt;{source} = $types{$source_type⏏};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8decode.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/utf8decode.v5:188<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/write.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/write.v5:1296<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
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
WARNINGS:<br />
Useless use of "," in expression "my @raw, @upgraded, @utf8" in sink context (line 38)<br />
Could not find symbol '&amp;upgrade'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/opbasic/cmp.v5:45<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/args_assert.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/porting/args_assert.v5:65<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/args_assert.v5:27<br />
    ------&gt;     open my $fh⏏, '&lt;', $proto or die "Can't open $proto:<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/authors.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcase.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcfgvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/cmp_version.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/customized.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Digest in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/diag.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '@ARGV' is not declared<br />
at t/spec/porting/diag.v5:21<br />
------&gt; my $make_exceptions_list = ($ARGV[0]⏏||'') eq '--make-exceptions-list';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/dual-life.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Basename in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/exec-bit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/porting/exec-bit.v5:67<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/exec-bit.v5:13<br />
    ------&gt;   open my $fh⏏, '&lt;', $fname or die "Can't open '$fname<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/filenames.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Basename in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/require.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/comp/require.v5:206<br />
------&gt; eval { CORE::require ⏏bleah; };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/globvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/maintainers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Maintainers in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/manifest.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pending-author.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/perlfunc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pod_rules.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;runperl'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/porting/pod_rules.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/regen.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/test_bootstrap.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/porting/test_bootstrap.v5:80<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/test_bootstrap.v5:18<br />
    ------&gt; open my $fh⏏, '&lt;', '../MANIFEST' or die "Can't open <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/utils.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find TestInit in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/fold_grind.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/re/fold_grind.v5:4<br />
------&gt; binmode STDOUT,⏏ ":utf8";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/overload.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;bless'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/re/overload.v5:21<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/re/overload.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat_advanced.v5:35<br />
------&gt;         ok(/(.)(\⏏C)(\C)(.)/, $message);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/pat_advanced_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/pat_psycho_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/pat_re_eval_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/pat_rt_report_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/pat_special_cc_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/pat_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
quantifier quantifies nothing<br />
at t/spec/re/reg_email.v5:16<br />
------&gt;     (?⏏(DEFINE)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/reg_email_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_mesg.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix =&gt; instead<br />
at t/spec/re/reg_mesg.v5:100<br />
------&gt;  '/*/', =&gt;⏏ 'Quantifier follows nothing {#} m/*{#}/<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_namedcapture.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol '&amp;DynaLoader::boot_DynaLoader'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_posixcc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$idx' is not declared<br />
at t/spec/re/reg_posixcc.v5:65<br />
------&gt;             $first= $last= $ary-&gt;[$idx⏏];</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
quantifier quantifies nothing<br />
at t/spec/re/regex_sets.v5:23<br />
------&gt; like("a", qr/(?⏏[ [a]      # This is a comment</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets_compat.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Null filename used<br />
  in sub _P5do at lib/Perl5/Terms.pm:177<br />
  in block  at t/spec/re/regex_sets_compat.v5:11<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in block  at t/spec/re/regex_sets_compat.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Null PMC access in find_method('shift')<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_noamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Null filename used<br />
  in sub _P5do at lib/Perl5/Terms.pm:177<br />
  in block  at t/spec/re/regexp_noamp.v5:8<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in block  at t/spec/re/regexp_noamp.v5:7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_notrie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Null filename used<br />
  in sub _P5do at lib/Perl5/Terms.pm:177<br />
  in block  at t/spec/re/regexp_notrie.v5:11<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in block  at t/spec/re/regexp_notrie.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_qr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Null filename used<br />
  in sub _P5do at lib/Perl5/Terms.pm:177<br />
  in block  at t/spec/re/regexp_qr.v5:6<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in block  at t/spec/re/regexp_qr.v5:5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_qr_embed.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Null filename used<br />
  in sub _P5do at lib/Perl5/Terms.pm:177<br />
  in block  at t/spec/re/regexp_qr_embed.v5:7<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in block  at t/spec/re/regexp_qr_embed.v5:6<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_qr_embed_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;useithreads'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/re/regexp_qr_embed_thr.v5:7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_trielist.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Null filename used<br />
  in sub _P5do at lib/Perl5/Terms.pm:177<br />
  in block  at t/spec/re/regexp_trielist.v5:12<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method eager at src/gen/CORE.setting:6170<br />
  in block  at t/spec/re/regexp_trielist.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$IS_EBCDIC' is not declared<br />
at t/spec/re/regexp_unicode_prop.v5:68<br />
------&gt;                $::IS_EBCDIC⏏ ? ['!\x{7f}',  '\x{80}',            '!\</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/re/regexp_unicode_prop_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/substT.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Unable to open filehandle from path './': No such file or directory(2)  in block  at lib/Perl5/Terms.pm:171<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst_amp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/subst_amp.v5:22<br />
------&gt; s/\⏏Ga(?{push @res, $_, $`})/xx/g;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst_wamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Unable to open filehandle from path './': No such file or directory(2)  in block  at lib/Perl5/Terms.pm:171<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/uniprops.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 0 in sink context (line 10)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/exit.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of "," in expression "my $exit, $exit_arg" in sink context (line 49)<br />
use of uninitialized value of type Any in string context  in sub plan at lib/Test.pm:42<br />
No such symbol '&amp;system'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in sub run at t/spec/run/exit.v5:16<br />
  in block  at t/spec/run/exit.v5:51<br />
use of uninitialized value of type Any in numeric context<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/fresh_perl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/run/fresh_perl.v5:881<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/locale.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/run/locale.v5:17<br />
------&gt;     eval { require POSIX; POSIX-&gt;import(⏏"locale_h") };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchx.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/run/switchx.v5:25<br />
------&gt;      qr/^No Perl script found in input\⏏r?\n\z/,</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/_num_to_alpha.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;_num_to_alpha'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/test_pl/_num_to_alpha.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/can_isa_ok.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%Bar' is not declared<br />
at t/spec/test_pl/can_isa_ok.v5:23<br />
------&gt;     local %Bar::⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/tempfile.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>skipping the first filename because it is taken for use by _fresh_perl()<br />
No such symbol '&amp;tempfile'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/test_pl/tempfile.v5:41<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol pass<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while reading from file: Invalid character in UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lower.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find file 'case.pl' for module case.pl<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf_through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>no kid script<br />
  in block  at t/spec/io/crlf_through.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/data.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;run_multiple_progs'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/io/data.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/title.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find file 'case.pl' for module case.pl<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/upper.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find file 'case.pl' for module case.pl<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>win32/runenv.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Temp in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left'>win32/system.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>x2p/s2p.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Copy in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/05-hash.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/v5/05-hash.v5:60<br />
------&gt; sub x1 () { 1230 } ⏏$v{x1()} = 120;        # '1230'     =&gt; 1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/06-bool.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/v5/06-bool.v5:54<br />
------&gt;     say +( Main-&gt;new()  ? "" : "not " ⏏), "ok 19 - object";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/09-namespace.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*subr4' is not declared<br />
at t/v5/09-namespace.v5:46<br />
------&gt; *subr4⏏ = sub { 123 };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-accessor.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/v5/11-accessor.v5:20<br />
------&gt;     my $other = Other-&gt;new1( 'a' =&gt; 2 ⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-bind-method-param.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/v5/11-bind-method-param.v5:17<br />
------&gt; $x = Main-&gt;subr( 1, 2 ⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-bless.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/v5/11-bless.v5:30<br />
------&gt; my $other = Other-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-class-open.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/v5/11-class-open.v5:33<br />
------&gt;     my $other = Other-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-class.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/v5/11-class.v5:32<br />
------&gt;     my $other = Other-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/30-tie-array.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot use pseudo package CORE in sub declaration<br />
at t/v5/30-tie-array.v5:48<br />
------&gt; sub CORE::shift⏏         { say "not ok 101 # CORE::shift<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/32-autoload-method.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/v5/32-autoload-method.v5:25<br />
------&gt;     my $v = A-&gt;a(⏏123);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/layers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/io/layers.v5:208<br />
------&gt; 	use open⏏(IN =&gt; ":crlf", OUT =&gt; ":encoding(cp1252</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_leaks.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$TODO' is not declared<br />
at t/spec/io/perlio_leaks.v5:25<br />
------&gt; 	    local $::TODO⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/say.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Errno in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/through.v5:150<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/croak.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file '../t/lib/common.pl' for module ../t/lib/common.pl<br />
  in any load_module at src/gen/ModuleLoader.nqp:173<br />
  in block  at t/spec/lib/croak.v5:8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_fallback.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Test::Simple in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_nomethod.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Test::Simple in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_04_c3.v5:31<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/read.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in block  at t/spec/bigmem/read.v5:13<br />
use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
No such symbol '&amp;DATA'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/bigmem/read.v5:22<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_04_c3_utf8.v5:33<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_04_dfs.v5:31<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_04_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_04_dfs_utf8.v5:33<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/dbic_c3.v5:95<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/dbic_c3_utf8.v5:97<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/dbic_dfs.v5:95<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/dbic_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/dbic_dfs_utf8.v5:97<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/inconsistent_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find mro in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
  in any load_module at src/gen/ModuleLoader.nqp:176<br />
  in block  at t/spec/mro/inconsistent_c3.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/inconsistent_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find mro in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
  in any load_module at src/gen/ModuleLoader.nqp:176<br />
  in block  at t/spec/mro/inconsistent_c3_utf8.v5:18<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_ineval.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_ineval.v5:32<br />
------&gt; rn 'B::foo =&gt; ' . (shift)-&gt;next::method(⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_ineval_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_ineval_utf8.v5:34<br />
------&gt; urn 'ｂ::ຟǫ =&gt; ' . (shift)-&gt;next::method(⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/vulcan_c3.v5:64<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/vulcan_c3_utf8.v5:65<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/vulcan_dfs.v5:64<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/vulcan_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/vulcan_dfs_utf8.v5:66<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fresh_perl_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/fresh_perl_utf8.v5:21<br />
------&gt; Can't localize lexical variable \$ᨕ at /⏏u, q!"Can't localize lexical" error is i</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash-rt85026.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Devel::Peek in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/final_line_num.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse regex; couldn't find final '/'<br />
at t/spec/comp/final_line_num.v5:7<br />
------&gt; =~ /\Asyntax error at [^ ]+ line ([0-9]+⏏), at EOF/ or exit 1;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/podcheck.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Carp in any of: ../lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/charset.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find locale in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/no_utf8_pm.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/no_utf8_pm.v5:16<br />
------&gt; "\0" =~ /[\001-\⏏xFF]/i;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qrstack.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement<br />
at t/spec/re/qrstack.v5:12<br />
------&gt; ok(defined [(1)x⏏127,qr//,1]-&gt;[127], "qr// should extend</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_60508.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;encode'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/re/reg_60508.v5:23<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/re/reg_60508.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_fold.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Unicode::UCD in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switch0.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Too many positional parameters passed; got 3 but expected 1<br />
  in sub ord at src/gen/CORE.setting:2613<br />
  in block  at t/spec/run/switch0.v5:12<br />
</td></tr>
        <tr align='center'><td align='left'>io/bom.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/cache.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/cache.v5:29<br />
------&gt; $s =~ m/[\⏏p{Hiragana}\x{101}]/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/21-test.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Perlito5::Test in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left'>io/errnosig.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/1_compile.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Spec::Functions in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/commonsense.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Could not find Config in any of: ../lib<br />
  in any load_module at src/gen/ModuleLoader.nqp:176<br />
  in block  at t/spec/lib/commonsense.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_05_c3.v5:49<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_05_c3_utf8.v5:51<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_05_dfs.v5:49<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_05_dfs_utf8.v5:52<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_inanon.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_inanon.v5:36<br />
------&gt; rn 'B::foo =&gt; ' . (shift)-&gt;next::method(⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_inanon_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_inanon_utf8.v5:37<br />
------&gt; turn 'Ḃ::ᕘ =&gt; ' . (shift)-&gt;next::method(⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/groups.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find POSIX in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic-27839.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '@+' is not declared<br />
at t/spec/op/magic-27839.v5:19<br />
------&gt; 	return @+⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/overload_integer.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%INC' is not declared<br />
at t/spec/op/overload_integer.v5:26<br />
------&gt; BEGIN { $INC{'Foo.pm'}⏏ = "/lib/Foo.pm" }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pwent.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/pwent.v5:254<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time_loop.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/op/time_loop.v5:15<br />
------&gt; local $SIG{__WARN__}⏏ = sub {};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/bincompat.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/porting/bincompat.v5:14<br />
------&gt; my @V = map {s/^ //⏏r} Internals::V();</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr_gc.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol '&amp;Regexp::DESTROY'<br />
</td></tr>
        <tr align='center'><td align='left'>run/switcha.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd-78586.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'><br />
  in sub trace_lines at t/spec/run/switchd-78586.v5:28<br />
  in block  at t/spec/run/switchd-78586.v5:32<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chomp.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Encode in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iprefix.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '@ARGV' is not declared<br />
at t/spec/io/iprefix.v5:22<br />
------&gt; @ARGV⏏ = @tfiles;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/read.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Errno in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left'>lib/no_load.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/concat2.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of "," in expression "= bless[chr 256],o::" in sink context (line 29)<br />
No such symbol '&amp;bless'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/concat2.v5:29<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getpid.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &gt; instead<br />
at t/spec/op/getpid.v5:32<br />
------&gt; $pid2, $ppid2) = ($$, getppid()); } ) -&gt;⏏ join();<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grent.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/grent.v5:193<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/setpgrpstack.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/setpgrpstack.v5:13<br />
------&gt; die("got here") }; package main; A-&gt;foo(⏏setpgrp())});</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utftaint.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Placeholder variable H^ash[0xcbafe18] may not be used here because the surrounding block takes no signature<br />
at t/spec/op/utftaint.v5:15<br />
------&gt;     not eval { join("",@_), kill 0; 1 }⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/noswitch.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/run/noswitch.v5:21<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/script.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;which_perl'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/run/script.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchn.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>No such method 'subst' for invocant of type 'Any'<br />
  in block  at t/spec/run/switchn.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchp.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>No such method 'subst' for invocant of type 'Any'<br />
  in block  at t/spec/run/switchp.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iofile.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/io/iofile.v5:25<br />
------&gt;     ok( eval { STDOUT-&gt;autoflush(⏏1); 1 }, 'STDOUT-&gt;autoflush(1) lives' );</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find NEXT in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find NEXT in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_goto.v5:27<br />
------&gt;     sub foo { shift-&gt;Proxy::next_proxy(⏏) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_goto_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_goto_utf8.v5:28<br />
------&gt;     sub ᕗ { shift-&gt;PṞoxᚤ::next_prxᔬ(⏏) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrhand.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Attribute::Handlers in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/crypt.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;like'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/crypt.v5:40<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filehandle.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find FileHandle in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigsystem.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/mad.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Path in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/goto.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\3'<br />
at t/spec/uni/goto.v5:22<br />
------&gt;     goto &amp;{"\⏏345\225\217\351\241\214\343\201\256\345\</td></tr>
        <tr align='center'><td align='left' rowspan='2'>win32/fs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Errno in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/12-context.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of "," in expression "= 6, 7" in sink context (lines 21, 22)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/24-strict.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block<br />
at t/v5/24-strict.v5:3<br />
------&gt; eval⏏('use strict;my $x = "ok 1";print $x,"\n</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/25-syntax-defined-or.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/v5/25-syntax-defined-or.v5:8<br />
------&gt;     print "not " unless (shift // ⏏2) == 5;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/proxy_constant_subs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find B in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_01_c3.v5:47<br />
------&gt; is(Diamond_D-&gt;can(⏏'hello')-&gt;(), 'Diamond_C::hello', '... c</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_01_c3_utf8.v5:49<br />
------&gt; is(Ｄiᚪၚd_D-&gt;can(⏏'hèllò')-&gt;(), 'Ｄiᚪၚd_C::hèllò', '... can</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_01_dfs.v5:47<br />
------&gt; is(Diamond_D-&gt;can(⏏'hello')-&gt;(), 'Diamond_A::hello', '... c</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_01_dfs_utf8.v5:49<br />
------&gt; is(Ｄiᚪၚd_D-&gt;can(⏏'hèllò')-&gt;(), 'Ｄiᚪၚd_A::hèllò', '... can</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_03_c3.v5:90<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_03_c3_utf8.v5:92<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_03_dfs.v5:90<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/basic_03_dfs_utf8.v5:92<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_method.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_method.v5:31<br />
------&gt; ond_B::foo =&gt; ' . (shift)-&gt;next::method(⏏) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_method_utf8.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_method_utf8.v5:33<br />
------&gt; mond_B::fಓ =&gt; ' . (shift)-&gt;next::method(⏏) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/alarm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;which_perl'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/alarm.v5:18<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dbm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
No such symbol '&amp;tempfile'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/dbm.v5:17<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lock.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;lock'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/lock.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/yadayada.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix ... instead<br />
at t/spec/op/yadayada.v5:16<br />
------&gt; eval { ...⏏ };<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $flile<br />
    at t/spec/re/qr.v5:82<br />
    ------&gt;  tie my $flile⏏, "qrBug";<br />
Too many positional parameters passed; got 3 but expected 1<br />
  in sub ref at lib/Perl5/Terms.pm:130<br />
  in block  at t/spec/re/qr.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchF1.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;F'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/run/switchF1.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/eval.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\3'<br />
at t/spec/uni/eval.v5:32<br />
------&gt;     isnt eval "q!\⏏360\237\220\252!", eval "q!\x{1f42a}!";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/opcroak.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/opcroak.v5:21<br />
------&gt;  $@, qr/Not enough arguments for main::\⏏x{30cb}/u, "Not enough arguments croak i</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/select.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;DÙP'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/uni/select.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/31-autoload.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;a'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/v5/31-autoload.v5:23<br />
  in block  at t/v5/31-autoload.v5:53<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/nargv.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/nargv.v5:79<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/blocks.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/kill0.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;kill'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/kill0.v5:20<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/multiline.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/comp/multiline.v5:95<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads-dirh.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find threads in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/unlink.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/unlink.v5:21<br />
    ------&gt;   open my $fh⏏, "&gt;", $file or die "Can't open $file: $<br />
No such symbol '&amp;tempfile'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/unlink.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8magic.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$stored' is not declared<br />
at t/spec/op/utf8magic.v5:30<br />
------&gt; sub STORE     { $::stored⏏ = pop }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_7jis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find encoding in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_eucjp.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_sjis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/inplace.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '@ARGV' is not declared<br />
at t/spec/io/inplace.v5:20<br />
------&gt; @ARGV⏏ = @tfiles;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_open.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Fcntl in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>benchmark/rt26188-speed-up-keys-on-empty-hash.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Benchmark in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/c3_with_overload.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/c3_with_overload.v5:32<br />
------&gt;  $x = InheritingFromOverloadedTest-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/c3_with_overload_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/c3_with_overload_utf8.v5:32<br />
------&gt;  $x = InheritingFromOverloadedTest-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_c3.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/overload_c3.v5:38<br />
------&gt;  $x = InheritingFromOverloadedTest-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_c3_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/overload_c3_utf8.v5:41<br />
------&gt; my $x = 읺ҎꀀḮṆᵷꜰ롬ᵕveŔŁoad엗텟ᵵ-&gt;ネᚹ(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/overload_dfs.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/overload_dfs.v5:38<br />
------&gt;  $x = InheritingFromOverloadedTest-&gt;new(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%Foo' is not declared<br />
at t/spec/mro/pkg_gen.v5:35<br />
------&gt; undef %Foo::⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%ᕘ' is not declared<br />
at t/spec/mro/pkg_gen_utf8.v5:37<br />
------&gt; undef %ᕘ::⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/context.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;curr_test'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in sub foo at t/spec/op/context.v5:15<br />
  in block  at t/spec/op/context.v5:18<br />
</td></tr>
        <tr align='center'><td align='left'>op/filetest_t.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct<br />
at t/spec/op/lex.v5:12<br />
------&gt;     print &lt;&lt;⏏;   # Yow!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my_stash.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/packagev.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/packagev.v5:193<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/our.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;tie'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/comp/our.v5:46<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package_block.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 93)<br />
===SORRY!===<br />
Error while compiling block  (source text: "use v5;\n#!./perl\n\nprint \"1..7\\n\";\n\n$main::result = \"\";\neval q{\n    $main::result .= \"a(..."): Error while compiling op call: Error while compiling block : Error while compiling block  (source text: "{ $main::warning .= $_[0]; }"): Error while compiling op p6typecheckrv: Error while compiling op lexotic: Error while compiling op p6decontrv: Error while compiling op bind: First child of a 'bind' op must be a QAST::Var<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/magic_phase.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '' is not declared<br />
at t/spec/opbasic/magic_phase.v5:23<br />
------&gt;     ok ${^GLOBAL_PHASE}⏏ eq 'START', 'START';</td></tr>
        <tr align='center'><td align='left'>re/reg_eval.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/readline.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/uni/readline.v5:71<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fflush.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/fflush.v5:137<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_c3.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/mro/recursion_c3.v5:15<br />
------&gt; m has no SIGALRM") if !exists $SIG{ALRM}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_c3_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/mro/recursion_c3_utf8.v5:17<br />
------&gt; m has no SIGALRM") if !exists $SIG{ALRM}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_dfs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/mro/recursion_dfs.v5:15<br />
------&gt; m has no SIGALRM") if !exists $SIG{ALRM}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/recursion_dfs_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/mro/recursion_dfs_utf8.v5:17<br />
------&gt; m has no SIGALRM") if !exists $SIG{ALRM}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/evalbytes.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Error while compiling block  (source text: "use v5;\n#!./perl\n\nBEGIN {\n    chdir 't';\n    @INC = '../lib';\n    require './test.pl';\n}\n\np..."): Error while compiling op call: Error while compiling block : Error while compiling op bind: Error while compiling op call (source text: "(my $upcode = $code) .= chr 256"): Error while compiling op bind: First child of a 'bind' op must be a QAST::Var<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fh.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;fileno'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/fh.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getppid.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/op/getppid.v5:25<br />
------&gt; $SIG{CHLD}⏏ = 'IGNORE';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/or.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix - instead<br />
at t/spec/op/or.v5:22<br />
------&gt;   return ${$_[0]}--⏏;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/rand.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/rand.v5:85<br />
------&gt;     unless (ok( !$max &lt;= 0 ⏏or $max &gt;= (2 ** $randbits))) {# Just in</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/symbolcache.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%main::' is not declared<br />
at t/spec/op/symbolcache.v5:17<br />
------&gt; delete $main::{removed}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pos.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;pos'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/re/pos.v5:25<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/re/pos.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chr.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find encoding in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find encoding in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/write.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$IS_EBCDIC' is not declared<br />
at t/spec/uni/write.v5:7<br />
------&gt; "EBCDIC porting needed") if $::IS_EBCDIC⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/decl.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/comp/decl.v5:26<br />
------&gt; if ($x eq $x) ⏏{</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/select.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/select.v5:20<br />
------&gt; is ref\⏏select, 'SCALAR', 'and STDOUT is a plain</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 58)<br />
===SORRY!===<br />
Could not find sub cuid_67_1371548821.61261<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/dtrace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol '&amp;which_perl'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/binmode.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Errno in any of: ., ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/labels.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/uni/labels.v5:49<br />
------&gt;  $@, qr/Label not found for "last Ｅ" at/⏏u, "last's error is UTF-8 clean";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/26-syntax-namespace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol A<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_skip.v5:31<br />
------&gt; ond_B::baz =&gt; ' . (shift)-&gt;next::method(⏏) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_skip_utf8.v5:34<br />
------&gt; iᚪၚd_B::바ź =&gt; ' . (shift)-&gt;next::method(⏏) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/srand.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/srand.v5:18<br />
------&gt; sub mk_rand { map int ⏏rand 10000, 1..100; }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/FindExt.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find FindExt in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/run/switchd.v5:85<br />
------&gt;   qr "1\⏏r?\n2\r?\n",</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tie.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\3'<br />
at t/spec/uni/tie.v5:33<br />
------&gt; foreach my $t ("ASCII", "B\⏏366se") {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/eintr.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/io/eintr.v5:76<br />
------&gt; $SIG{PIPE}⏏ = 'IGNORE';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/23-eval.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Oops  in block  at t/v5/23-eval.v5:41<br />
Oops  in block  at t/v5/23-eval.v5:44<br />
Oops  in block  at t/v5/23-eval.v5:59<br />
No such symbol '&amp;or'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/v5/23-eval.v5:59<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/openpid.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/openpid.v5:89<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/deprecate.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Copy in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_c3.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_02_c3.v5:114<br />
------&gt; is(Test::A-&gt;can(⏏'C_or_D')-&gt;(), 'Test::C', '... can got t</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_c3_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_02_c3_utf8.v5:116<br />
------&gt; is(텟ţ::ଅ-&gt;can(⏏'ƈ_or_Ḋ')-&gt;(), '텟ţ::ƈ', '... can got the</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_dfs.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_02_dfs.v5:114<br />
------&gt; is(Test::A-&gt;can(⏏'C_or_D')-&gt;(), 'Test::D', '... can got t</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_dfs_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/basic_02_dfs_utf8.v5:116<br />
------&gt; is(텟ţ::ଅ-&gt;can(⏏'ƈ_or_Ḋ')-&gt;(), '텟ţ::Ḋ', '... can got the</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_dfs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/complex_dfs.v5:85<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_dfs_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>Could not find symbol '&amp;get_linear_isa'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/mro/complex_dfs_utf8.v5:87<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array_base.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block<br />
at t/spec/op/array_base.v5:12<br />
------&gt;  is(eval⏏('$[ = 1; 123'), undef);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/flip.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/flip.v5:69<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto_xs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Fcntl in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_errors.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/op/require_errors.v5:45<br />
------&gt;     like $@, qr/^Can't locate \⏏Q$file\E in \@INC \(change \.h to \.ph m</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sselect.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;like'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/sselect.v5:31<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/class.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/class.v5:12<br />
------&gt; is(($str =~ /(\⏏p{IsMyUniClass}+)/)[0], '0123456789:;&lt;=&gt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lex_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in backslash:sym&lt;N&gt;; couldn't find final '}'<br />
at t/spec/uni/lex_utf8.v5:25<br />
------&gt; my $name_first = "b\N{⏏MICRO SIGN}Ɓ";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_c3.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/complex_c3.v5:143<br />
------&gt; th(), "right", 'next::method working ok'⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_c3_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unexpected closing bracket<br />
at t/spec/mro/complex_c3_utf8.v5:145<br />
------&gt; th(), "right", 'next::method working ok'⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/mro/isa_aliases_utf8.v5:15<br />
------&gt; ok 'ฟ옥ʮ'-&gt;isa(⏏"Ｂᐊㄗ"),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_edgecases.v5:24<br />
------&gt;     my $foo = Foo-&gt;new(⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in block; couldn't find final '}'<br />
at t/spec/mro/next_edgecases_utf8.v5:27<br />
------&gt;     my $foo = ᕘ-&gt;new(⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pos.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;pos'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/pos.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/protowarn.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/op/protowarn.v5:35<br />
------&gt;     $SIG{'__WARN__'}⏏ = sub { push @warnings, @_ };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/dup.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/dup.v5:149<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/13-op-context.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;wantarray'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in sub foo at t/v5/13-op-context.v5:10<br />
  in block  at t/v5/13-op-context.v5:18<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/mro/isa_aliases.v5:12<br />
------&gt; ok 'Foogh'-&gt;isa(⏏"Baz"),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/mod.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/cmd/mod.v5:60<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pow.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/pow.v5:12<br />
------&gt; my $bits_in_uv = int ⏏(0.001 + log (~0+1) / log 2);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/wantarray.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$Level' is not declared<br />
at t/spec/op/wantarray.v5:15<br />
------&gt;   local $::Level⏏ = $::Level + 1;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchC.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/run/switchC.v5:27<br />
------&gt; like( $r, qr/^$b(?:\⏏r?\n)?$/s, '-CO: no warning on UTF-8 out</td></tr>
        <tr align='center'><td align='left'>run/switcht.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/universal.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'<br />
at t/spec/lib/universal.v5:40<br />
------&gt; $x = ${qr⏏//};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/form_scope.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't parse heredoc construct<br />
at t/spec/comp/form_scope.v5:12<br />
------&gt; ok @&lt;&lt;&lt;&lt;&lt;⏏&lt;&lt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/studytied.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;tie'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/studytied.v5:30<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/comp/package.v5:18<br />
------&gt;     $main⏏'a = $'b;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr-72922.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Scalar::Util in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_pmod.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/re/reg_pmod.v5:24<br />
------&gt; $SIG{__WARN__}⏏ = sub { $W.=join("",@_); };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/mypragma.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find mypragma in any of: lib, /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/int.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/int.v5:47<br />
------&gt; $y = int ⏏($x);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/numconvert.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Method 'p5cc' not found for invocant of class 'Perl5::Grammar'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8cache.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$a' is not declared<br />
at t/spec/op/utf8cache.v5:22<br />
------&gt;     $a⏏ = "hello \x{1234}";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$"' is not declared<br />
at t/spec/re/pat_psycho.v5:45<br />
------&gt;         local $"⏏ = "|";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio_fail.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;FH'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/io/perlio_fail.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/shm.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find file './test.pl' for module ./test.pl<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashwarn.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/op/hashwarn.v5:18<br />
------&gt;     $SIG{'__WARN__'}⏏ = sub { push @warnings, @_ };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/push.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/sub.v5:27<br />
------&gt;     push @a, 4, 5, main-&gt;import(⏏6,7);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/crlf.v5:85<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/defout.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/io/defout.v5:32<br />
------&gt; @ ⏏@&lt;&lt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errno.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$perlio' is not declared<br />
at t/spec/io/errno.v5:32<br />
------&gt; nbsd' &amp;&amp; $Config{useithreads} &amp;&amp; $perlio⏏ eq 'stdio';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/cygwin.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/lib/cygwin.v5:77<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $cat<br />
    at t/spec/lib/cygwin.v5:23<br />
    ------&gt; my $catpid = open my $cat⏏, "|cat" or die "Couldn't cat: $!";<br />
    Redeclaration of symbol $ps<br />
    at t/spec/lib/cygwin.v5:24<br />
    ------&gt; open my $ps⏏, "ps|" or die "Couldn't do ps: $!";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/current_sub.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Null PMC access in get_bool()<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_exit.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;tempfile'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/die_exit.v5:61<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/glob.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/glob.v5:117<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lfs.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in block  at t/spec/op/lfs.v5:13<br />
use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
===SORRY!===<br />
Variable '$Level' is not declared<br />
at t/spec/op/lfs.v5:162<br />
------&gt;     local $::Level⏏ = $::Level + 1;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/caller.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol like<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/package.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/uni/package.v5:37<br />
------&gt;     $압Ƈ⏏'d읯ⱪ = 6;        #'</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die.v5</td><td>0</td><td>19</td><td>0</td><td>0</td><td>19</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/op/die.v5:86<br />
------&gt;     like( $@, qr/Global symbol "\$\⏏x{3b1}"/, 'utf8 symbol names show up in</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_keeperr.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/die_keeperr.v5:23<br />
------&gt; 	    my $e = end { die $inx if $inx }⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/redef.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Redeclaration of routine sub0<br />
at t/spec/comp/redef.v5:22<br />
------&gt; &lt;BOL&gt;⏏ok 1, $warn =~ s/Subroutine sub0 redefin</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find vmsish in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/join.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Error while compiling, type X::Redeclaration<br />
  symbol: $t<br />
 at line 36, near ", 'X';\n  m"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mkdir.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>Failed to create directory 'blurfl' with mode '0o777': mkdir failed: File exists<br />
  in block  at src/gen/CORE.setting:11621<br />
  in sub mkdir at src/gen/CORE.setting:11616<br />
  in sub mkdir at src/gen/CORE.setting:11612<br />
  in block  at t/spec/op/mkdir.v5:26<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/cloexec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*FHTMP' is not declared<br />
at t/spec/run/cloexec.v5:53<br />
------&gt;     local *FHTMP⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/args.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;bless'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in sub new1 at t/spec/op/args.v5:14<br />
  in block  at t/spec/op/args.v5:16<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/op/args.v5:10<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/term.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Method 'ast' not found for invocant of class 'NQPMu'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/argv.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/argv.v5:158<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isarev.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'<br />
at t/spec/mro/isarev.v5:22<br />
------&gt;      join(" ", sort @{mro::get_isarev⏏ $args[0]}),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isarev_utf8.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'<br />
at t/spec/mro/isarev_utf8.v5:25<br />
------&gt;      join(" ", sort @{mro::get_isarev⏏ $args[0]}),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pipe.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>use of uninitialized value of type Any in numeric context  in sub skip_rest at lib/Test.pm:134<br />
===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/pipe.v5:238<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/print.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Errno in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/while.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/cmd/while.v5:220<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/colon.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 1)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/fold.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/comp/fold.v5:117<br />
------&gt;  ok scalar $jing =~ (1 ? y/fo// ⏏: /bar/),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reverse.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Tie::Array in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find warnings in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defins.v5</td><td>0</td><td>27</td><td>0</td><td>0</td><td>27</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/defins.v5:232<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/override.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/override.v5:69<br />
------&gt;         CORE::require ⏏warnings;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/recurse.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$x' is not declared<br />
at t/spec/op/recurse.v5:69<br />
------&gt; 	my $a = ackermann($x⏏, $y);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/qq.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\x'<br />
at t/spec/opbasic/qq.v5:45<br />
------&gt; is ("\⏏xh", chr (0) . 'h');	# This will warn</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/rs.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/base/rs.v5:249<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pvbm.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/pvbm.v5:89<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigdispatch.v5</td><td>0</td><td>29</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/op/sigdispatch.v5:18<br />
------&gt; $SIG{ALRM}⏏ = sub {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readline.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/readline.v5:284<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reset.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Redeclaration of symbol scratch<br />
at t/spec/op/reset.v5:84<br />
------&gt; package scratch ⏏{ reset "bc" }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/warn.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/op/warn.v5:118<br />
------&gt;   qr/^\⏏xee(?:\r?\n\xee){3}/,</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/concat.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block<br />
at t/spec/opbasic/concat.v5:157<br />
------&gt;     my $x = eval⏏"qr/\x{fff}/";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dor.v5</td><td>0</td><td>31</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/dor.v5:41<br />
------&gt; is(shift       // ⏏7, 7,	'shift // ... works');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/qr.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in variable; couldn't find final '}'<br />
at t/spec/op/qr.v5:73<br />
------&gt;     my $x = 1.1; $x = ${qr⏏//};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/vec.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
CHECK FAILED:<br />
Undefined routine '&amp;prefix:&lt;\&gt;' called (line 96)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval_scope.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
quantifier quantifies nothing<br />
at t/spec/re/reg_eval_scope.v5:91<br />
------&gt; "a" =~ do { package foo; qr/(?⏏{ $::pack = __PACKAGE__ })a/ };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/tell.v5</td><td>0</td><td>35</td><td>0</td><td>0</td><td>35</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/tell.v5:188<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/subval.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/cmd/subval.v5:110<br />
------&gt; &amp;main⏏'somesub(28, 'foo', __FILE__, __LINE__);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/opsubs.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/comp/opsubs.v5:83<br />
------&gt;     if (eval { $class-&gt;can(⏏$method) }) {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/recompile.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $tf<br />
    at t/spec/re/recompile.v5:44<br />
    ------&gt;     open my $tf⏏, "&gt;$tmpfile" or die "Cannot open $tmpfi<br />
No such symbol '&amp;runperl'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/re/recompile.v5:28<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_nc_tie.v5</td><td>0</td><td>37</td><td>0</td><td>0</td><td>37</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
quantifier quantifies nothing<br />
at t/spec/re/reg_nc_tie.v5:21<br />
------&gt;     (?⏏&lt;a&gt;.)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/delete.v5</td><td>0</td><td>38</td><td>0</td><td>0</td><td>38</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;delete'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/delete.v5:20<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/rxcode.v5</td><td>0</td><td>39</td><td>0</td><td>0</td><td>39</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
quantifier quantifies nothing<br />
at t/spec/re/rxcode.v5:13<br />
------&gt; like( 'a',  qr/^a(?⏏{1})(?:b(?{2}))?/, 'a =~ ab?' );</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/avhv.v5</td><td>0</td><td>40</td><td>0</td><td>0</td><td>40</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/avhv.v5:167<br />
------&gt; $a = [{key =&gt; 1}⏏, 'a'];</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/repeat.v5</td><td>0</td><td>42</td><td>0</td><td>0</td><td>42</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement<br />
at t/spec/op/repeat.v5:130<br />
------&gt; my ($x, $y) = scalar ((1,2)x⏏2);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/study.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator |<br />
at t/spec/op/study.v5:69<br />
------&gt; ok(m|bc/*d|⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/uproto.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/comp/uproto.v5:58<br />
------&gt; f("FOO xy", $foo, ⏏"xy");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/perlio.v5:230<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chdir.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find File::Spec::Functions in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sysio.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Couldn't find terminator $stop<br />
at t/spec/op/sysio.v5:70<br />
------&gt; ok(!-s $outfile⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/parser.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
ResizablePMCArray: index out of bounds!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest.v5</td><td>0</td><td>49</td><td>0</td><td>0</td><td>49</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/filetest.v5:60<br />
------&gt; is( "@{[grep -r,⏏ qw(foo io noo op zoo)]}", "io op",<br />
Other potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/filetest.v5:27<br />
    ------&gt;     open my $fh⏏, '&gt;', $ro_empty_file or die "open $fh: <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases_utf8.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/package_aliases_utf8.v5:35<br />
------&gt; ok (ऑlㄉ-&gt;isa(⏏Ｎeẁ::), 'ऑlㄉ inherits from Ｎeẁ');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fs.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Use of a closing delimiter for an opener is reserved<br />
at t/spec/io/fs.v5:31<br />
------&gt;      ⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_utf8.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/mro/basic_utf8.v5:9<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 53);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/mro/package_aliases.v5:31<br />
------&gt; ok (Old-&gt;isa ⏏(New::), 'Old inherits from New');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement<br />
at t/spec/op/each.v5:54<br />
------&gt; 	$key =~ y/a-z/A-Z/⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stash.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%pig' is not declared<br />
at t/spec/op/stash.v5:79<br />
------&gt;     ok( defined %pig::⏏, q(referencing a non-existent stash doe</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ver.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/ver.v5:110<br />
------&gt; 			 ⏏unpack 'U*', pack('U*',2001,2002,2003)))</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/stash.v5</td><td>0</td><td>58</td><td>0</td><td>0</td><td>58</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find constant in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic.v5</td><td>0</td><td>59</td><td>0</td><td>0</td><td>59</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/mro/basic.v5:7<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 59);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%INC' is not declared<br />
at t/spec/op/inccode.v5:55<br />
------&gt; ok( exists $INC{'Foo.pm'}⏏,         '  %INC sees Foo.pm' );</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/quotemeta.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Method 'p5cc' not found for invocant of class 'Perl5::Grammar'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/utf8.v5</td><td>0</td><td>61</td><td>0</td><td>0</td><td>61</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grep.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/grep.v5:57<br />
------&gt;            {a =&gt;$_},⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/method.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol is<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each_array.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;each'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/each_array.v5:17<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiehandle.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol fail<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/localref.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement<br />
at t/spec/op/localref.v5:20<br />
------&gt; { local ${$x x⏏2};$aa = 6; is($aa,6); undef $x; is($aa,</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/loopctl.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/loopctl.v5:958<br />
    ------&gt;     until (! (my $x ⏏= $i)) {<br />
    Redeclaration of symbol $x<br />
    at t/spec/op/loopctl.v5:964<br />
    ------&gt;     for ($i = 1; my $x ⏏= $i; ) {<br />
===SORRY!===<br />
Could not find sub cuid_96_1371548574.32329<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time.v5</td><td>0</td><td>66</td><td>0</td><td>0</td><td>66</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;watchdog'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/time.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiearray.v5</td><td>0</td><td>69</td><td>0</td><td>0</td><td>69</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol @dummy<br />
    at t/spec/op/tiearray.v5:295<br />
    ------&gt;     tie my @dummy⏏, "NegFetchsize";<br />
No such symbol '&amp;tie'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/tiearray.v5:155<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/op/tiearray.v5:153<br />
  in method reify at src/gen/CORE.setting:5868<br />
  in method reify at src/gen/CORE.setting:5763<br />
  in method gimme at src/gen/CORE.setting:6191<br />
  in method sink at src/gen/CORE.setting:6492<br />
  in block  at t/spec/op/tiearray.v5:151<br />
  in block  at t/spec/op/tiearray.v5:107<br />
  in block  at t/spec/op/tiearray.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/greek.v5</td><td>0</td><td>72</td><td>0</td><td>0</td><td>72</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/retainedlines.v5</td><td>0</td><td>74</td><td>0</td><td>0</td><td>74</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
ResizablePMCArray: index out of bounds!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/oct.v5</td><td>0</td><td>77</td><td>0</td><td>0</td><td>77</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Bogus statement<br />
at t/spec/op/oct.v5:34<br />
------&gt; 	['0b'.(  '0'x⏏10).'1_0101', 0b101_01],</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/use.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/comp/use.v5:100<br />
------&gt; r/Perl v6\.0\.0 required--this is only \⏏Q$^V\E, stopped/);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/bless.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/bless.v5:18<br />
------&gt;     my $r = qr/^\⏏Q$package\E=(\w+)\(0x([0-9a-f]+)\)$/u;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/lex.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in parenthesized expression; couldn't find final ')'<br />
at t/spec/base/lex.v5:112<br />
------&gt; print (((q{{\{\(}} . q{{\)\}}⏏}) eq '{{\(}{\)}}') ? "ok 29\n" : "not o</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/undef.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$a' is not declared<br />
at t/spec/op/undef.v5:16<br />
------&gt; ok !defined($a⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto.v5</td><td>0</td><td>89</td><td>0</td><td>0</td><td>89</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '%SIG' is not declared<br />
at t/spec/op/goto.v5:18<br />
------&gt; local $SIG{__WARN__}⏏ = sub { if ($_[0] =~ m/jump into a cons</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/caller.v5</td><td>0</td><td>91</td><td>0</td><td>0</td><td>91</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
ResizablePMCArray: index out of bounds!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/universal.v5</td><td>0</td><td>93</td><td>0</td><td>0</td><td>93</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/uni/universal.v5:21<br />
------&gt; ok $a-&gt;isa(⏏"Bòb");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/runenv.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/run/runenv.v5:280<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
Other potential difficulties:<br />
    Redeclaration of symbol $stdout<br />
    at t/spec/run/runenv.v5:43<br />
    ------&gt;     open my $stdout⏏, '&lt;', $STDOUT<br />
    Redeclaration of symbol $stderr<br />
    at t/spec/run/runenv.v5:45<br />
    ------&gt;     open my $stderr⏏, '&lt;', $STDERR<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/latin2.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utfhash.v5</td><td>0</td><td>99</td><td>0</td><td>0</td><td>99</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex_assign.v5</td><td>0</td><td>100</td><td>0</td><td>0</td><td>100</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/lex_assign.v5:344<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bless.v5</td><td>0</td><td>109</td><td>0</td><td>0</td><td>109</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/op/bless.v5:16<br />
------&gt;     my $r = qr/^\⏏Q$package\E=(\w+)\(0x([0-9a-f]+)\)$/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stat.v5</td><td>0</td><td>113</td><td>0</td><td>0</td><td>113</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/stat.v5:119<br />
------&gt;         my $cwd = File::Spec-&gt;rel2abs(⏏$Curdir);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$a' is not declared<br />
at t/spec/op/index.v5:67<br />
------&gt; $a⏏ = "foo \x{1234}bar";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/svleak.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/svleak.v5:13<br />
------&gt; equire XS::APItest; XS::APItest-&gt;import(⏏'sv_count'); 1 }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/op/split.v5:84<br />
------&gt; foo =~ /DEBUGGING/ || $foo =~ /const\n?\⏏Q(IV(3))\E/);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switches.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Errno in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/open.v5</td><td>0</td><td>121</td><td>0</td><td>0</td><td>121</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/io/open.v5:393<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array.v5</td><td>0</td><td>127</td><td>0</td><td>0</td><td>127</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')'<br />
at t/spec/op/array.v5:62<br />
------&gt; ok(scalar (($F1,$F2,$Etc) ⏏= ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/)));</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/lexsub.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Redeclaration of symbol bar<br />
at t/spec/cmd/lexsub.v5:41<br />
------&gt; package bar⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/eval.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Missing block<br />
at t/spec/op/eval.v5:92<br />
------&gt;      is(eval⏏('"$b"'), $b);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lc.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8 string<br />
current instr.: '' pc 32304 (src/stage2/gen/NQPHLL.pir:12724) (src/stage2/gen/NQPHLL.nqp:1315)</td></tr>
        <tr align='center'><td align='left' rowspan='2'>japh/abigail.v5</td><td>0</td><td>129</td><td>0</td><td>1</td><td>130</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot assign to a readonly variable or a value<br />
<br />   1 skipped: <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/state.v5</td><td>0</td><td>131</td><td>0</td><td>0</td><td>131</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol is<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tr.v5</td><td>0</td><td>132</td><td>0</td><td>0</td><td>132</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Method 'p5cc' not found for invocant of class 'Perl5::Grammar'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/universal.v5</td><td>0</td><td>139</td><td>0</td><td>0</td><td>139</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/universal.v5:18<br />
------&gt; ok $a-&gt;isa(⏏"Bob");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/method.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/method.v5:30<br />
------&gt; is(Pack-&gt;method(⏏"a","b","c"), "method,a,b,c");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/range.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/range.v5:396<br />
------&gt;  for (1..2) { for (1..4) { $s .= ++$_ } ⏏$s.=' ' if $_==1; }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest_stack_ok.v5</td><td>0</td><td>145</td><td>0</td><td>0</td><td>145</td></tr>
        <tr><td colspan='5'>No such symbol '&amp;bless'<br />
  in method &lt;anon&gt; at src/gen/CORE.setting:10177<br />
  in any  at src/gen/Metamodel.nqp:2577<br />
  in any find_method_fallback at src/gen/Metamodel.nqp:2565<br />
  in any find_method at src/gen/Metamodel.nqp:939<br />
  in block  at t/spec/op/filetest_stack_ok.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/incfilter.v5</td><td>0</td><td>145</td><td>0</td><td>0</td><td>145</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Filter::Util::Call in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split_unicode.v5</td><td>0</td><td>151</td><td>0</td><td>0</td><td>151</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in backslash:sym&lt;N&gt;; couldn't find final '}'<br />
at t/spec/op/split_unicode.v5:28<br />
------&gt; 	ord("\N{⏏NEL}"), # Cc       &lt;control-0085&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/parser.v5</td><td>0</td><td>154</td><td>0</td><td>0</td><td>154</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\Q'<br />
at t/spec/comp/parser.v5:115<br />
------&gt; is( "\⏏Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Qa", "a", "PL_le</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bop.v5</td><td>0</td><td>174</td><td>0</td><td>0</td><td>174</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/bop.v5:104<br />
------&gt; is (sprintf("%vd", v4095 &amp; ⏏v801), 801);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sort.v5</td><td>0</td><td>176</td><td>0</td><td>0</td><td>176</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/sort.v5:21<br />
------&gt;     map scalar(sort(+())), ('')x⏏68;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic.v5</td><td>0</td><td>178</td><td>0</td><td>0</td><td>178</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Nominal type check failed for parameter 'key'; expected Any but got Mu instead<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/proto.v5</td><td>0</td><td>180</td><td>0</td><td>0</td><td>180</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot use placeholder parameter @_ in the mainline<br />
at t/spec/comp/proto.v5:39<br />
------&gt; @_⏏ = qw(a b c d);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub_lval.v5</td><td>0</td><td>191</td><td>0</td><td>0</td><td>191</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/sub_lval.v5:282<br />
------&gt; ok(!defined,⏏ 'implicitly returning undef in list con<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/switch.v5</td><td>0</td><td>201</td><td>0</td><td>0</td><td>201</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/switch.v5:21<br />
------&gt; CORE::given(3) ⏏{</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst.v5</td><td>0</td><td>206</td><td>0</td><td>0</td><td>206</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/re/subst.v5:14<br />
------&gt; $a = s/david/rules/⏏r;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/gv.v5</td><td>0</td><td>212</td><td>0</td><td>0</td><td>212</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
ResizablePMCArray: index out of bounds!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/overload.v5</td><td>0</td><td>215</td><td>0</td><td>0</td><td>215</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot call 'trait_mod:&lt;is&gt;'; none of these signatures match:<br />
:(Mu:U $child, Mu:U $parent)<br />
:(Mu:U $type, :rw(:$rw)!)<br />
:(Mu:U $type, :nativesize(:$nativesize)!)<br />
:(Mu:U $type, :hidden(:$hidden)!)<br />
:(Mu:U $type, *%fail)<br />
:(Attribute:D $attr, :rw(:$rw)!)<br />
:(Attribute:D $attr, :readonly(:$readonly)!)<br />
:(Attribute:D $attr, :box_target(:$box_target)!)<br />
:(Routine:D $r, :rw(:$rw)!)<br />
:(Routine:D $r, :default(:$default)!)<br />
:(Routine:D $r, :DEPRECATED(:$DEPRECATED)!)<br />
:(Routine:D $r, Mu :inlinable(:$inlinable)!)<br />
:(Routine:D $r, :onlystar(:$onlystar)!)<br />
:(Routine:D $r, :prec(%spec)!)<br />
:(Routine $r, :equiv(:&amp;equiv)!)<br />
:(Routine $r, :tighter(:&amp;tighter)!)<br />
:(Routine $r, :looser(:&amp;looser)!)<br />
:(Routine $r, :assoc(:$assoc)!)<br />
:(Parameter:D $param, :readonly(:$readonly)!)<br />
:(Parameter:D $param, :rw(:$rw)!)<br />
:(Parameter:D $param, :copy(:$copy)!)<br />
:(Parameter:D $param, :required(:$required)!)<br />
:(Parameter:D $param, :parcel(:$parcel)!)<br />
:(Routine:D \r, :export(:$export)!)<br />
:(Mu:U \type, :export(:$export)!)<br />
:(Mu \sym, :export(:$export)!, :SYMBOL(:$SYMBOL)!)<br />
:(Mu:D $docee, :docs(:$docs)!)<br />
:(Mu:U $docee, :docs(:$docs)!)<br />
:(Routine:D $r, :hidden_from_backtrace(:$hidden_from_backtrace)!)<br />
:(Routine:D $r, :pure(:$pure)!)<br />
:(Routine:D $r, :lvalue(:$lvalue)!)<br />
at t/spec/uni/overload.v5:15<br />
------&gt; <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ref.v5</td><td>0</td><td>230</td><td>0</td><td>0</td><td>230</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/ref.v5:48<br />
------&gt;     is ($$⏏$foo, 'valid');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gv.v5</td><td>0</td><td>245</td><td>0</td><td>0</td><td>245</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
ResizablePMCArray: index out of bounds!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/cproto.v5</td><td>0</td><td>254</td><td>0</td><td>0</td><td>254</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/cproto.v5:291<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashassign.v5</td><td>0</td><td>309</td><td>0</td><td>0</td><td>309</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')'<br />
at t/spec/op/hashassign.v5:133<br />
------&gt; ok (main-&gt;in_method ⏏(%names), "pass hash into a method");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/local.v5</td><td>0</td><td>310</td><td>0</td><td>0</td><td>310</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not locate compile-time value for symbol ok<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie_fetch_count.v5</td><td>0</td><td>312</td><td>0</td><td>0</td><td>312</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Preceding context expects a term, but found infix + instead<br />
at t/spec/op/tie_fetch_count.v5:25<br />
------&gt; sub FETCH {$count ++⏏; @{$_ [0]} == 1 ? ${$_ [0]}[0] : shift <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartmatch.v5</td><td>0</td><td>349</td><td>0</td><td>0</td><td>349</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Tie::Array in any of: /home/froggs/dev/nqp/install/lib/parrot/5.2.0-devel/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr.v5</td><td>0</td><td>387</td><td>0</td><td>0</td><td>387</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Lexical symbol '$a' is already bound to an outer symbol;<br />
the implicit outer binding must be rewritten as OUTER::&lt;$a&gt;<br />
before you can unambiguously declare a new '$a' in this scope<br />
at t/spec/op/substr.v5:197<br />
------&gt; my $a ⏏= 'zxcvbnm';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval.v5</td><td>0</td><td>463</td><td>0</td><td>0</td><td>463</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$a' is not declared<br />
at t/spec/re/pat_re_eval.v5:44<br />
------&gt;         $a⏏ = qr/(?{++$b})/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat.v5</td><td>0</td><td>466</td><td>0</td><td>0</td><td>466</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat.v5:270<br />
------&gt;         my $message = '/g, \⏏G and pos';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/taint.v5</td><td>0</td><td>797</td><td>0</td><td>0</td><td>797</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/taint.v5:41<br />
------&gt; 	  IPC::SysV-&gt;import(⏏qw(IPC_PRIVATE IPC_RMID IPC_CREAT S_IRWX</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf2.v5</td><td>0</td><td>1370</td><td>0</td><td>0</td><td>1370</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$i' is not declared<br />
at t/spec/op/sprintf2.v5:41<br />
------&gt;     my $format = "%$i.${i}⏏s";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report.v5</td><td>0</td><td>2530</td><td>0</td><td>0</td><td>2530</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
quantifier quantifies nothing<br />
at t/spec/re/pat_rt_report.v5:35<br />
------&gt;    like("A \x{263a} B z C", qr/A . B (??⏏{ "z" }) C/,<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/read.v5</td><td>0</td><td>2564</td><td>0</td><td>0</td><td>2564</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$value' is not declared. Did you mean '@values'?<br />
at t/spec/op/read.v5:49<br />
------&gt; 	if ($value⏏ !~ tr/\0-\377//c) {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/utf.v5</td><td>0</td><td>4016</td><td>0</td><td>0</td><td>4016</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/comp/utf.v5:45<br />
------&gt;  ($@ =~ /^(Unsupported script encoding \⏏Q$enc\E)/) {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pack.v5</td><td>0</td><td>14704</td><td>0</td><td>0</td><td>14704</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unknown warnings category 'FATAL'<br />
</td></tr>

        <tr><td>nqp --version</td><td colspan='5'>This is nqp version 2013.05-158-gede50c1 built on parrot 5.2.0 revision RELEASE_5_2_0
</td></tr>
        <tr><td>perl6 --version</td><td colspan='5'>This is perl6 version 2013.05-213-gf737ff7 built on parrot 5.2.0 revision RELEASE_5_2_0
</td></tr>
    </tbody>
</table>
