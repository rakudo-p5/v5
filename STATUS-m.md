<table align='center'>
    <thead>
        <tr><th></th><th>pass</th><th>fail</th><th>todo</th><th>skip</th><th>spec</th></tr>
    </thead>
    <tbody>
        <tr align='center'><td align='left'>summary</td><td>8030</td><td>33711</td><td>5</td><td>1809</td><td>42906</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/read.v5</td><td>2436</td><td>640</td><td>0</td><td>0</td><td>2564</td></tr>
        <tr><td colspan='5'> 512 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pack.v5</td><td>2380</td><td>12317</td><td>0</td><td>7</td><td>14704</td></tr>
        <tr><td colspan='5'>This type cannot unbox to a native string<br />
  in sub MAKE_REGEX at src/gen/m-CORE.setting:12960<br />
  in block  at src/gen/m-CORE.setting:12898<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in method INTERPOLATE at src/gen/m-CORE.setting:12890<br />
  in method match at src/gen/m-CORE.setting:6238<br />
  in method match at src/gen/m-CORE.setting:3655<br />
  in sub like_yn at /home/froggs/dev/v5/t/test.pl:97<br />
  in sub like at /home/froggs/dev/v5/t/test.pl:90<br />
  in block  at t/spec/op/pack.v5:1276<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/pack.v5:1008<br />
<br />   2 skipped: (EBCDIC and) version strings are bad idea<br />
   4 skipped: Not for EBCDIC<br />
   1 skipped: Couldn't generate infinity - got error ''<br />
</td></tr>
        <tr align='center'><td align='left'>op/sprintf2.v5</td><td>1155</td><td>215</td><td>0</td><td>0</td><td>1370</td></tr>
        <tr align='center'><td align='left'>op/pow.v5</td><td>267</td><td>1</td><td>0</td><td>0</td><td>268</td></tr>
        <tr align='center'><td align='left'>opbasic/arith.v5</td><td>153</td><td>14</td><td>0</td><td>0</td><td>167</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/for.v5</td><td>112</td><td>5</td><td>1</td><td>0</td><td>118</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::a called<br />
  in block  at t/spec/cmd/for.v5:661<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/cmd/for.v5:37<br />
<br />   1 todo   : RT #1085: what should be output of perl -we 'print do { foreach (1, 2) { 1; } }'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartkve.v5</td><td>98</td><td>62</td><td>0</td><td>3</td><td>163</td></tr>
        <tr><td colspan='5'>Type of argument to each on reference must be unblessed hashref or arrayref<br />
Type of argument to each on reference must be unblessed hashref or arrayref<br />
<br />   3 skipped: Cannot modify an immutable value<br />
</td></tr>
        <tr align='center'><td align='left'>op/filetest_stack_ok.v5</td><td>86</td><td>49</td><td>0</td><td>0</td><td>135</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chop.v5</td><td>79</td><td>58</td><td>0</td><td>6</td><td>143</td></tr>
        <tr><td colspan='5'>   4 skipped: Invalid character for UTF-8 encoding<br />
   2 skipped: Confused<br />
</td></tr>
        <tr align='center'><td align='left'>op/upgrade.v5</td><td>64</td><td>0</td><td>0</td><td>0</td><td>64</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic.v5</td><td>59</td><td>119</td><td>0</td><td>0</td><td>178</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/magic.v5:178<br />
------&gt;     print $? &amp; ⏏0xFF ? "ok $tn[4]$todo\n" : "not ok $tn[</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/list.v5</td><td>58</td><td>6</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Index out of range. Is: 1, should be in 0..0<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/num.v5</td><td>52</td><td>0</td><td>1</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>   1 todo   : NYI<br />
</td></tr>
        <tr align='center'><td align='left'>op/split_unicode.v5</td><td>48</td><td>103</td><td>0</td><td>0</td><td>151</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/my.v5</td><td>47</td><td>2</td><td>0</td><td>0</td><td>0</td></tr>
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
Undefined subroutine &amp;main::loop called<br />
  in block  at t/spec/op/my.v5:140<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/my.v5:92<br />
<br />  49 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>op/each_array.v5</td><td>46</td><td>17</td><td>0</td><td>0</td><td>63</td></tr>
        <tr align='center'><td align='left'>comp/cmdopt.v5</td><td>44</td><td>0</td><td>0</td><td>0</td><td>44</td></tr>
        <tr align='center'><td align='left'>op/auto.v5</td><td>41</td><td>6</td><td>0</td><td>0</td><td>47</td></tr>
        <tr align='center'><td align='left'>op/unshift.v5</td><td>36</td><td>0</td><td>0</td><td>0</td><td>36</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mydef.v5</td><td>36</td><td>16</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such method 'STORE' for invocant of type 'List'<br />
  in sub infix:&lt;=&gt; at src/gen/m-CORE.setting:16696<br />
  in block  at t/spec/op/mydef.v5:138<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/mydef.v5:1<br />
<br />  52 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>op/chars.v5</td><td>34</td><td>0</td><td>0</td><td>0</td><td>34</td></tr>
        <tr align='center'><td align='left'>op/negate.v5</td><td>31</td><td>14</td><td>0</td><td>0</td><td>45</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/splice.v5</td><td>28</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>No such method 'splice' for invocant of type 'Any'<br />
  in sub P5splice at lib/Perl5/Terms.pm:1092<br />
  in block  at t/spec/op/splice.v5:82<br />
<br />  29 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>op/recurse.v5</td><td>27</td><td>1</td><td>0</td><td>0</td><td>28</td></tr>
        <tr align='center'><td align='left'>t/v5/06-bool.v5</td><td>26</td><td>6</td><td>0</td><td>0</td><td>32</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/rxcode.v5</td><td>26</td><td>12</td><td>0</td><td>1</td><td>39</td></tr>
        <tr><td colspan='5'>   1 skipped: hangs<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/_num_to_alpha.v5</td><td>24</td><td>1</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'>Testing limit capabilities<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/sprintf.v5</td><td>22</td><td>30</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>'%*vd' is not valid in sprintf format sequence 'n%*vd'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ord.v5</td><td>22</td><td>0</td><td>0</td><td>13</td><td>35</td></tr>
        <tr><td colspan='5'>  13 skipped: Invalid character for UTF-8 encoding<br />
</td></tr>
        <tr align='center'><td align='left'>op/chr.v5</td><td>21</td><td>21</td><td>0</td><td>0</td><td>42</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/fold.v5</td><td>19</td><td>7</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $SIG<br />
    at t/spec/comp/fold.v5:90<br />
    ------&gt;     local $SIG{__DIE__}  ⏏= sub { $c+= 2 };<br />
Undefined subroutine &amp;main::INSTALL called<br />
  in block  at t/spec/comp/fold.v5:124<br />
</td></tr>
        <tr align='center'><td align='left'>cmd/switch.v5</td><td>18</td><td>0</td><td>0</td><td>0</td><td>18</td></tr>
        <tr align='center'><td align='left'>op/lop.v5</td><td>17</td><td>0</td><td>0</td><td>0</td><td>17</td></tr>
        <tr align='center'><td align='left'>t/v5/05-array.v5</td><td>16</td><td>1</td><td>0</td><td>0</td><td>17</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/not.v5</td><td>16</td><td>0</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>parens needed around second argument in next two tests<br />
to preserve list context inside function call<br />
</td></tr>
        <tr align='center'><td align='left'>op/exp.v5</td><td>16</td><td>0</td><td>0</td><td>0</td><td>16</td></tr>
        <tr align='center'><td align='left'>t/v5/04-string.v5</td><td>14</td><td>6</td><td>0</td><td>0</td><td>20</td></tr>
        <tr align='center'><td align='left'>op/int.v5</td><td>14</td><td>1</td><td>0</td><td>0</td><td>15</td></tr>
        <tr align='center'><td align='left'>t/v5/05-for.v5</td><td>13</td><td>0</td><td>0</td><td>0</td><td>13</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/tempfile.v5</td><td>12</td><td>0</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>skipping the first filename because it is taken for use by _fresh_perl()<br />
</td></tr>
        <tr align='center'><td align='left'>op/die_except.v5</td><td>12</td><td>0</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left'>t/v5/04-op.v5</td><td>11</td><td>0</td><td>0</td><td>0</td><td>11</td></tr>
        <tr align='center'><td align='left'>io/perlio_fail.v5</td><td>10</td><td>5</td><td>0</td><td>0</td><td>15</td></tr>
        <tr align='center'><td align='left'>t/v5/05-if.v5</td><td>9</td><td>0</td><td>0</td><td>0</td><td>9</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/opsubs.v5</td><td>9</td><td>27</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Cannot call 'match'; none of these signatures match:<br />
:(Cool:D: Any $target, *%adverbs)<br />
  in method Bool at src/gen/m-CORE.setting:13045<br />
  in sub P5Bool at lib/Perl5/Terms.pm:392<br />
  in sub P5Bool at lib/Perl5/Terms.pm:392<br />
  in sub isnt at t/spec/comp/opsubs.v5:66<br />
  in block  at t/spec/comp/opsubs.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>op/die_unwind.v5</td><td>9</td><td>3</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/append.v5</td><td>9</td><td>4</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>This type cannot unbox to a native string<br />
  in sub MAKE_REGEX at src/gen/m-CORE.setting:12960<br />
  in block  at src/gen/m-CORE.setting:12853<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at src/gen/m-CORE.setting:12847<br />
  in method INTERPOLATE at src/gen/m-CORE.setting:12825<br />
  in method INTERPOLATE at src/gen/m-CORE.setting:12827<br />
  in method match at src/gen/m-CORE.setting:6238<br />
  in sub like_yn at /home/froggs/dev/v5/t/test.pl:97<br />
  in sub like at /home/froggs/dev/v5/t/test.pl:90<br />
  in block  at t/spec/op/append.v5:43<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/append.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>uni/chr.v5</td><td>8</td><td>0</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/push.v5</td><td>8</td><td>50</td><td>0</td><td>2</td><td>60</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 117)<br />
Type of arg 1 to push must be array (not constant item)<br />
  in block  at t/spec/op/push.v5:85<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/push.v5:1<br />
<br />   2 skipped: implicit @-sigil on a barename in push/pop is rediculous<br />
</td></tr>
        <tr align='center'><td align='left'>comp/bproto.v5</td><td>8</td><td>8</td><td>0</td><td>0</td><td>16</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/17-hash-autovivify.v5</td><td>7</td><td>0</td><td>1</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>   1 todo   : <br />
</td></tr>
        <tr align='center'><td align='left'>op/rand.v5</td><td>7</td><td>1</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/length.v5</td><td>7</td><td>34</td><td>0</td><td>0</td><td>41</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $u<br />
    at t/spec/op/length.v5:176<br />
    ------&gt; my $u⏏;<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/length.v5:124<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/length.v5:15<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/18-array-autovivify.v5</td><td>6</td><td>0</td><td>0</td><td>0</td><td>6</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die.v5</td><td>6</td><td>13</td><td>0</td><td>0</td><td>19</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $SIG<br />
    at t/spec/op/die.v5:80<br />
    ------&gt;     local $SIG{__WARN__} ⏏= $SIG{__DIE__} = sub { $err = shift };<br />
    Redeclaration of symbol $SIG<br />
    at t/spec/op/die.v5:94<br />
    ------&gt;     local $SIG{__WARN__} ⏏= sub { $ok = 0 };<br />
ce �ii tu, bã ?<br />
</td></tr>
        <tr align='center'><td align='left'>op/context.v5</td><td>6</td><td>1</td><td>0</td><td>0</td><td>7</td></tr>
        <tr align='center'><td align='left'>cmd/mod.v5</td><td>6</td><td>7</td><td>0</td><td>0</td><td>13</td></tr>
        <tr align='center'><td align='left'>mro/isa_aliases_utf8.v5</td><td>6</td><td>6</td><td>0</td><td>0</td><td>12</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isa_aliases.v5</td><td>6</td><td>7</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "ook" via package "Baro" (perhaps you forgot to load "Baro"?)<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-while.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switcht.v5</td><td>5</td><td>8</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot convert string to number: base-10 number must begin with valid digits or '.' in '⏏/home/froggs/dev/v5/t/tmp27312B' (indicated by ⏏)<br />
</td></tr>
        <tr align='center'><td align='left'>re/pos.v5</td><td>5</td><td>3</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defined.v5</td><td>5</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 42 in sink context (line 15)<br />
</td></tr>
        <tr align='center'><td align='left'>base/while.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/term.v5</td><td>4</td><td>0</td><td>1</td><td>2</td><td>7</td></tr>
        <tr><td colspan='5'>   2 skipped: typeglobs NYI<br />
   1 todo   : rakudo doesnt support -l option<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/10-bind-sub-param.v5</td><td>4</td><td>0</td><td>1</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>   1 todo   : <br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/05-anon-sub.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>t/v5/03-num.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_nc_tie.v5</td><td>4</td><td>33</td><td>0</td><td>0</td><td>37</td></tr>
        <tr><td colspan='5'>Too many positional parameters passed; got 2 but expected 1<br />
  in sub exists at lib/Perl5/Terms.pm:262<br />
  in block  at t/spec/re/reg_nc_tie.v5:32<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pos.v5</td><td>4</td><td>8</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;Class::DESTROY called<br />
  in block  at t/spec/op/pos.v5:42<br />
  in block  at t/spec/op/pos.v5:42<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/packagev.v5</td><td>4</td><td>23</td><td>0</td><td>0</td><td>27</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_perl called<br />
  in block  at t/spec/op/packagev.v5:111<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/or.v5</td><td>4</td><td>4</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/or.v5:27<br />
  in block  at t/spec/op/or.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/numconvert.v5</td><td>4</td><td>0</td><td>0</td><td>1756</td><td>1760</td></tr>
        <tr><td colspan='5'><br /> 1756 skipped: Can't get bigint from something that isn't a SixModel object<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/heredoc.v5</td><td>4</td><td>5</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>Ending delimiter HEREDOC not found ---<br />
===SORRY!=== Error while compiling tmp26719A.26719<br />
Couldn't parse heredoc construct<br />
at tmp26719A.26719:1<br />
------&gt; use v5; print &lt;&lt;⏏;<br />
===SORRY!=== Error while compiling tmp26719A.26719<br />
Couldn't parse heredoc construct<br />
at tmp26719A.26719:1<br />
------&gt; use v5; print &lt;&lt;⏏&lt;EOL&gt;<br />
===SORRY!=== Error while compiling tmp26719A.26719<br />
Confused<br />
at tmp26719A.26719:4<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;</td></tr>
        <tr align='center'><td align='left'>op/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>cmd/elsif.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>base/cond.v5</td><td>4</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left'>t/v5/19-local.v5</td><td>3</td><td>4</td><td>0</td><td>0</td><td>7</td></tr>
        <tr align='center'><td align='left'>t/v5/05-anon-sub-lex-block.v5</td><td>3</td><td>0</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sselect.v5</td><td>3</td><td>8</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::select called<br />
  in block  at t/spec/op/sselect.v5:11<br />
</td></tr>
        <tr align='center'><td align='left'>op/sleep.v5</td><td>3</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reverse.v5</td><td>3</td><td>23</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol @a<br />
    at t/spec/op/reverse.v5:57<br />
    ------&gt;     tie my @a⏏, 'Tie::StdArray';<br />
    Redeclaration of symbol @empty<br />
    at t/spec/op/reverse.v5:82<br />
    ------&gt;     tie my @empty⏏, "Tie::StdArray";<br />
Undefined subroutine &amp;main::delete called<br />
  in block  at t/spec/op/reverse.v5:30<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/reverse.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>op/my_stash.v5</td><td>3</td><td>4</td><td>0</td><td>0</td><td>7</td></tr>
        <tr align='center'><td align='left'>io/iofile.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/26-syntax-namespace.v5</td><td>2</td><td>7</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::C called<br />
  in block  at t/v5/26-syntax-namespace.v5:52<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/v5/26-syntax-namespace.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/16-var-redeclare.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/v5/16-var-redeclare.v5:13<br />
    ------&gt;     my $x ⏏= 1;<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/11-class.v5</td><td>2</td><td>3</td><td>0</td><td>0</td><td>5</td></tr>
        <tr align='center'><td align='left'>t/v5/11-bless.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/11-bind-method-param.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/11-accessor.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left'>base/pat.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/05-lex-block.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/05-lex-block-if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/05-bind.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>t/v5/01-sanity.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>run/switchI.v5</td><td>2</td><td>2</td><td>0</td><td>0</td><td>4</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/noswitch.v5</td><td>2</td><td>0</td><td>0</td><td>1</td><td>3</td></tr>
        <tr><td colspan='5'>   1 skipped: hangs<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/locale.v5</td><td>2</td><td>7</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/locale.v5:88<br />
    ------&gt; 	local $ENV{LC_ALL}⏏; # so it never overrides LC_NUMERIC<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/locale.v5:165<br />
    ------&gt; 	local $ENV{LC_ALL}⏏; # so it never overrides LC_NUMERIC<br />
Undefined subroutine &amp;main::LC_NUMERIC called<br />
  in block  at t/spec/run/locale.v5:27<br />
</td></tr>
        <tr align='center'><td align='left'>re/overload.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub.v5</td><td>2</td><td>14</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "import" via package "main" (perhaps you forgot to load "main"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/print.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at tmp26817A.26817:7<br />
    ------&gt; open my $fh⏏, "&lt;:utf8", \"\xC1\xAF\xC1\xAF\xC1\xB0\x<br />
Failed to open file: no such file or directory<br />
  in method open at src/gen/m-CORE.setting:13669<br />
  in sub P5open at lib/Perl5/Terms.pm:97<br />
  in sub P5open at lib/Perl5/Terms.pm:77<br />
  in block  at tmp26817A.26817:1<br />
</td></tr>
        <tr align='center'><td align='left'>base/if.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/defins.v5</td><td>2</td><td>25</td><td>0</td><td>0</td><td>27</td></tr>
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
Undefined subroutine &amp;main::FILE called<br />
  in block  at t/spec/op/defins.v5:13<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dbm.v5</td><td>2</td><td>3</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;Foo::dbmopen called<br />
  in sub new at tmp26622A.26622:7<br />
  in block  at tmp26622A.26622:23<br />
  in block  at tmp26622A.26622:2<br />
Undefined subroutine &amp;Foo::dbmopen called<br />
  in sub new at tmp26622A.26622:6<br />
  in block  at tmp26622A.26622:22<br />
  in block  at tmp26622A.26622:1<br />
Undefined subroutine &amp;main::dbmopen called<br />
  in block  at tmp26622A.26622:1<br />
===SORRY!===<br />
MVMArray: Index out of bounds<br />
Undefined subroutine &amp;main::dbmopen called<br />
  in block  at t/spec/op/dbm.v5:63<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/dbm.v5:44<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/concat2.v5</td><td>2</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of "," in expression "= bless[chr 256],o::" in sink context (line 29)<br />
===SORRY!=== Error while compiling tmp26604A.26604<br />
Couldn't find terminator |<br />
at tmp26604A.26604:14<br />
------&gt; path(bless {},"Path::Class::Dir"), "\n";⏏&lt;EOL&gt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/chdir.v5</td><td>2</td><td>30</td><td>0</td><td>16</td><td>48</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::opendir called<br />
  in block  at t/spec/op/chdir.v5:73<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/chdir.v5:37<br />
<br />  16 skipped: no fchdir<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/args.v5</td><td>2</td><td>21</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::L called<br />
  in sub local2 at t/spec/op/args.v5:76<br />
  in block  at t/spec/op/args.v5:77<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/args.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/64bitint.v5</td><td>2</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>'lld' is not valid in sprintf format sequence '%lld'<br />
<br />   2 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/basic.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/12-context.v5</td><td>1</td><td>3</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of "," in expression "= 6, 7" in sink context (lines 21, 22)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/dup.v5</td><td>1</td><td>28</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan='5'>Can't open stdout<br />
  in block  at t/spec/io/dup.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>t/v5/02-int.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/goto.v5</td><td>1</td><td>3</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main:: called<br />
  in sub goto_softref at t/spec/uni/goto.v5:18<br />
  in block  at t/spec/uni/goto.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/eval.v5</td><td>1</td><td>4</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol '&amp;upgrade'<br />
</td></tr>
        <tr align='center'><td align='left'>run/switchF.v5</td><td>1</td><td>1</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/binmode.v5</td><td>1</td><td>8</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol '&amp;Layer'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/exit.v5</td><td>1</td><td>2</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of "," in expression "my $exit, $exit_arg" in sink context (line 49)<br />
No such symbol '&amp;POSIX::WIFEXITED'<br />
  in method fail at src/gen/m-CORE.setting:11237<br />
  in sub P5INDIRECT_NAME_LOOKUP at lib/Perl5/Terms.pm:484<br />
  in block  at t/spec/run/exit.v5:56<br />
Unhandled exception: No exception handler located for warn<br />
   at &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:print_exception:4294967295)<br />
 from src/gen/m-CORE.setting:11398  (/home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:&lt;anon&gt;:41)<br />
 from gen/moar/stage2/NQPHLL.nqp:1238  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:361)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
<br />   3 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot convert string to number: base-10 number must begin with valid digits or '.' in '⏏foo' (indicated by ⏏)<br />
===SORRY!===<br />
Cannot convert string to number: base-10 number must begin with valid digits or '.' in '⏏moo' (indicated by ⏏)<br />
===SORRY!=== Error while compiling tmp27184A.27184<br />
Two terms in a row<br />
at tmp27184A.27184:38<br />
------&gt; }⏏match("John Smith, 42 years old, secret</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/term.v5</td><td>1</td><td>22</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>Invocant requires an instance, but a type object was passed<br />
  in method Bridge at src/gen/m-CORE.setting:4459<br />
  in sub infix:&lt;&gt;&gt; at src/gen/m-CORE.setting:4380<br />
  in sub infix:&lt;P5&gt;&gt; at lib/Perl5/Terms.pm:311<br />
  in block  at t/spec/comp/term.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/setpgrpstack.v5</td><td>1</td><td>2</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::setpgrp called<br />
  in block  at t/spec/op/setpgrpstack.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/multiline.v5</td><td>1</td><td>5</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Could not close: <br />
  in block  at t/spec/comp/multiline.v5:50<br />
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
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/evalbytes.v5</td><td>1</td><td>7</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::evalbytes called<br />
  in block  at t/spec/op/evalbytes.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/assignwarn.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::warning_is called<br />
  in sub test_op at t/spec/op/assignwarn.v5:43<br />
  in block  at t/spec/op/assignwarn.v5:51<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method eager at src/gen/m-CORE.setting:7973<br />
  in block  at t/spec/op/assignwarn.v5:49<br />
<br />   1 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left'>mro/next_ineval.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT_utf8.v5</td><td>1</td><td>3</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "fಓ" via package "Fᶽ" (perhaps you forgot to load "Fᶽ"?)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_NEXT.v5</td><td>1</td><td>3</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Can't locate object method "foo" via package "Fuz" (perhaps you forgot to load "Fuz"?)<br />
</td></tr>
        <tr align='center'><td align='left'>mro/inconsistent_c3_utf8.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/inconsistent_c3.v5</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/vec.v5</td><td>1</td><td>6</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::vec called<br />
  in block  at t/spec/bigmem/vec.v5:10<br />
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
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching_utf8.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/method_caching_utf8.v5<br />
Variable '*FFF' is not declared<br />
at t/spec/mro/method_caching_utf8.v5:39<br />
------&gt;  { $_[1]+7 }; local *MC텟ᵀ::Bࡎᶓ::ᕘ = *FFF⏏; is(MC텟ᵀ::ድ리ᭉᛞ-&gt;ᕘ(0), 7); },</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/anonsub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/anonsub.v5<br />
Variable '*DATA' is not declared<br />
at t/spec/op/anonsub.v5:11<br />
------&gt; run_multiple_progs('', \*DATA⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/attrs.v5<br />
Unexpected closing bracket<br />
at t/spec/op/attrs.v5:303<br />
------&gt; FY_CODE_ATTRIBUTES { $proto = $_[1]; _: ⏏}<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/closure.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/closure.v5<br />
Variable '$vanishing_pad' is not declared<br />
at t/spec/op/closure.v5:486<br />
------&gt; BEGIN { $vanishing_pad ⏏= sub { eval $_[0] } }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coreamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/coreamp.v5<br />
Two terms in a row<br />
at t/spec/op/coreamp.v5:152<br />
------&gt;     my $minargs = $-[⏏0];</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/coresubs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/coresubs.v5<br />
Two terms in a row<br />
at t/spec/op/coresubs.v5:17<br />
------&gt; my $bd = new B::Deparse ⏏'-p';</td></tr>
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
  in sub postcircumfix&lt;P5[ ]&gt; at lib/Perl5/Terms.pm:378<br />
  in block  at t/spec/op/do.v5:27<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exists_sub.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'orig'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fork.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block  at t/spec/op/fork.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gmagic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*strat' is not declared<br />
at t/spec/op/gmagic.v5:54<br />
------&gt; $c = *strat⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/inc.v5<br />
Variable '$b' is not declared<br />
at t/spec/op/inc.v5:56<br />
------&gt; $b ⏏= -$a;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode-tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/inccode-tie.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/op/index_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/leaky-magic.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find tests in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/line_debug.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 32)<br />
Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readdir.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*.' is not declared<br />
at t/spec/op/readdir.v5:75<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_37033.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/require_37033.v5:14<br />
    ------&gt;     open my $fh⏏, '&lt;', 'README' or die "Can't open READM<br />
Could not find file './test.pl' for module ./test.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/op/require_37033.v5:8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/runlevel.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block  at t/spec/op/runlevel.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sprintf.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/sprintf.v5<br />
Unable to parse expression in variable; couldn't find final '}' <br />
at t/spec/op/sprintf.v5:76<br />
------&gt; ata, $result, $comment, $data) = @{shift⏏ @tests};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/op/substr_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block  at t/spec/op/tie.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8decode.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::v256 called<br />
  in block  at t/spec/op/utf8decode.v5:10<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/utf8decode.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/write.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '@&lt;' is not declared<br />
at t/spec/op/write.v5:81<br />
------&gt; the quick brown @&lt;⏏&lt;</td></tr>
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
===SORRY!===<br />
Could not find symbol '&amp;upgrade'<br />
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
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/porting/args_assert.v5:7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/authors.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block  at t/spec/porting/authors.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/checkcase.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find called<br />
  in block  at t/spec/porting/checkcase.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>porting/checkcfgvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/cmp_version.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block  at t/spec/porting/cmp_version.v5:15<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/customized.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Maintainers in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/diag.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$.' is not declared<br />
at t/spec/porting/diag.v5:106<br />
------&gt; TA as it is already in $pod near line $.⏏";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/dual-life.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::find called<br />
  in block  at t/spec/porting/dual-life.v5:11<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/require.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/comp/require.v5:182<br />
------&gt; &lt;BOL&gt;⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/globvar.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/globvar.v5:33<br />
    ------&gt; open my $fh⏏, '-|', $^X, '-Ilib', './makedef.pl', 'P<br />
WARNINGS:<br />
Useless use of "\n\t  DBcv bitcount cshname force_link_funcs generation lastgotoprobe\n\t  mod_latin1_uc modcount no_symref_sv timesbuf uudmap\n\t  watchaddr watchok warn_uninit_sv\n     " in expression "\n\t  DBcv bitcount cshname force_link_funcs generation lastgotoprobe\n\t  mod_latin1_uc modcount no_symref_sv timesbuf uudmap\n\t  watchaddr watchok warn_uninit_sv\n     " in sink context (line 16)<br />
Failed to open file: no such file or directory<br />
  in method open at src/gen/m-CORE.setting:13669<br />
  in sub P5open at lib/Perl5/Terms.pm:97<br />
  in sub P5open at lib/Perl5/Terms.pm:77<br />
  in block  at t/spec/porting/globvar.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/maintainers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Maintainers in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/manifest.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $m<br />
    at t/spec/porting/manifest.v5:17<br />
    ------&gt; open my $m⏏, '&lt;', $manifest or die "Can't open '$ma<br />
Can't open 'MANIFEST': <br />
  in block  at t/spec/porting/manifest.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pending-author.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/pending-author.v5:56<br />
    ------&gt; open my $fh⏏, '|-', "$^X Porting/checkAUTHORS.pl --t<br />
Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block  at t/spec/porting/pending-author.v5:30<br />
</td></tr>
        <tr align='center'><td align='left'>porting/perlfunc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/pod_rules.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/porting/pod_rules.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/regen.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Illegal redeclaration of 'OUTER'<br />
at t/spec/porting/regen.v5:26<br />
------&gt; OUTER: ⏏foreach my $file (@files) {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/test_bootstrap.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unrecognized backslash sequence: '\Q'<br />
at t/spec/porting/test_bootstrap.v5:36<br />
------&gt; +Test::More/, "$file doesn't use Test::\⏏QMore");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/utils.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/porting/utils.v5:37<br />
    ------&gt; open my $fh⏏, '&lt;', 'MANIFEST' or die "Can't open MAN<br />
Undefined subroutine &amp;main::find_git_or_skip called<br />
  in block  at t/spec/porting/utils.v5:26<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/fold_grind.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/fold_grind.v5<br />
Variable '$a' is not declared<br />
at t/spec/re/fold_grind.v5:75<br />
------&gt;     return $a ⏏&lt;=&gt; $b</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_advanced.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat_advanced.v5:35<br />
------&gt;         ok(/(.)(\⏏C)(\C)(.)/, $message);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_advanced_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/pat_advanced_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/pat_psycho_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/pat_re_eval_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/pat_rt_report_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/pat_special_cc_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/pat_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/reg_email.v5<br />
Variable '*DATA' is not declared<br />
at t/spec/re/reg_email.v5:76<br />
------&gt;     seek *DATA⏏, 0, 0;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_email_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/reg_email_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_mesg.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::warning_is called<br />
  in block  at t/spec/re/reg_mesg.v5:269<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_namedcapture.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol '&amp;DynaLoader::boot_DynaLoader'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_posixcc.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol '&amp;upgrade'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/regex_sets.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/regex_sets.v5:38<br />
------&gt; unlike("\cK", qr/(?[ \s - \⏏cK ])/, 'can do basic subtraction');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regex_sets_compat.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error while creating error string: No exception handler located for warn<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 401)<br />
Can't open re/re_tests: <br />
  in block  at t/spec/re/regexp.v5:77<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/regexp_unicode_prop.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/regexp_unicode_prop.v5:174<br />
------&gt;     $i ++, redo if $CLASSES [$i] =~ /^\⏏h*#\h*(.*)/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/regexp_unicode_prop_thr.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file './thread_it.pl' for module ./thread_it.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/re/regexp_unicode_prop_thr.v5:4<br />
</td></tr>
        <tr align='center'><td align='left'>re/substT.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst_amp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/subst_amp.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/subst_amp.v5:22<br />
------&gt; s/\⏏Ga(?{push @res, $_, $`})/xx/g;</td></tr>
        <tr align='center'><td align='left'>re/subst_wamp.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/uniprops.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 0 in sink context (line 10)<br />
</td></tr>
        <tr align='center'><td align='left'>run/fresh_perl.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchx.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/run/switchx.v5:13<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>test_pl/can_isa_ok.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::can_ok called<br />
  in block  at t/spec/test_pl/can_isa_ok.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/attrs.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/attrs.v5<br />
Unexpected closing bracket<br />
at t/spec/uni/attrs.v5:160<br />
------&gt; FY_CODE_ATTRIBUTES { $proto = $_[1]; _: ⏏}<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/fold.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Error encoding UTF-8 string near grapheme position 6614 with codepoint 393215<br />
   at src/Perl6/Grammar.nqp:337  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Grammar.moarvm:TOP:473)<br />
 from gen/moar/stage2/QRegex.nqp:1302  (/home/froggs/dev/nqp/install/languages/nqp/lib/QRegex.moarvm:parse:44)<br />
 from gen/moar/stage2/NQPHLL.nqp:1387  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:parse:80)<br />
 from gen/moar/stage2/NQPHLL.nqp:1343  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::71)<br />
 from gen/moar/stage2/NQPHLL.nqp:1333  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:compile:159)<br />
 from gen/moar/stage2/NQPHLL.nqp:1091  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:eval:55)<br />
 from gen/moar/stage2/NQPHLL.nqp:1300  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:86)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lower.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;GLOBAL::prop_invmap called<br />
  in sub casetest at /home/froggs/dev/v5/t/spec/uni/case.pl:31<br />
  in block  at t/spec/uni/lower.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf_through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>no kid script<br />
  in block  at t/spec/io/crlf_through.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/data.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::run_multiple_progs called<br />
  in block  at t/spec/io/data.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/title.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;GLOBAL::prop_invmap called<br />
  in sub casetest at /home/froggs/dev/v5/t/spec/uni/case.pl:31<br />
  in block  at t/spec/uni/title.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/upper.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;GLOBAL::prop_invmap called<br />
  in sub casetest at /home/froggs/dev/v5/t/spec/uni/case.pl:31<br />
  in block  at t/spec/uni/upper.v5:1<br />
<br />   1 tests more than planned were run<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>win32/runenv.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Win32 in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left'>win32/system.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr align='center'><td align='left' rowspan='2'>x2p/s2p.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Lexical symbol '$script' is already bound to an outer symbol;<br />
the implicit outer binding must be rewritten as OUTER::&lt;$script&gt;<br />
before you can unambiguously declare a new '$script' in this scope<br />
at t/spec/x2p/s2p.v5:837<br />
------&gt;     my $script ⏏= $testcase{$tc}{script};<br />
Undeclared routine:<br />
    my used at lines 830, 841<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/05-hash.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/05-hash.v5<br />
Two terms in a row<br />
at t/v5/05-hash.v5:60<br />
------&gt; sub x1 () { 1230 } ⏏$v{x1()} = 120;        # '1230'     =&gt; 1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/09-namespace.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/09-namespace.v5<br />
Variable '*subr4' is not declared<br />
at t/v5/09-namespace.v5:46<br />
------&gt; *subr4 ⏏= sub { 123 };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/30-tie-array.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/30-tie-array.v5<br />
Cannot use pseudo package CORE in sub declaration<br />
at t/v5/30-tie-array.v5:48<br />
------&gt; sub CORE::shift⏏         { say "not ok 101 # CORE::shift<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/layers.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/layers.v5<br />
Confused<br />
at t/spec/io/layers.v5:208<br />
------&gt; 	use open⏏(IN =&gt; ":crlf", OUT =&gt; ":encoding(cp1252</td></tr>
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
Two terms in a row<br />
at t/spec/io/say.v5:60<br />
------&gt;     CORE::say ⏏"ok 13 - CORE::say without feature.pm";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/through.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/through.v5<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/io/through.v5:90<br />
------&gt;   my @data = grep length,⏏ split /(.{1,$write_c})/s, $str;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/croak.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Could not find file 't/lib/common.pl' for module t/lib/common.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/lib/croak.v5:8<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_fallback.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/lib/overload_fallback.v5<br />
Cannot import symbol &amp;prefix:&lt;P5.&gt; from overload, because it already exists in this lexical scope<br />
at t/spec/lib/overload_fallback.v5:6<br />
------&gt;  =&gt; sub { 'stringvalue' }, fallback =&gt; 1⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/overload_nomethod.v5</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::ok called<br />
  in block  at t/spec/lib/overload_nomethod.v5:13<br />
  in block  at t/spec/lib/overload_nomethod.v5:6<br />
</td></tr>
        <tr align='center'><td align='left'>mro/basic_04_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>bigmem/read.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::DATA called<br />
  in block  at t/spec/bigmem/read.v5:10<br />
</td></tr>
        <tr align='center'><td align='left'>mro/basic_04_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/basic_04_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/basic_04_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/dbic_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/dbic_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/dbic_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/dbic_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_ineval_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/next_ineval_utf8.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/mro/next_ineval_utf8.v5:44<br />
------&gt;    qr/^అ::ຟǫ died/⏏u,</td></tr>
        <tr align='center'><td align='left'>mro/vulcan_c3.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/vulcan_c3_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/vulcan_dfs.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left'>mro/vulcan_dfs_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fresh_perl_utf8.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/fresh_perl_utf8.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/fresh_perl_utf8.v5:21<br />
------&gt; Can't localize lexical variable \$ᨕ at /⏏u, q!"Can't localize lexical" error is i</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash-rt85026.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/hash-rt85026.v5<br />
Confused<br />
at t/spec/op/hash-rt85026.v5:63<br />
------&gt; &lt;BOL&gt;⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/final_line_num.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/final_line_num.v5<br />
Two terms in a row<br />
at t/spec/comp/final_line_num.v5:14<br />
------&gt; BEGIN { $last_line_num = __LINE__; } ⏏print 1+</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/podcheck.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find file '../regen/regen_lib.pl' for module ../regen/regen_lib.pl<br />
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
        <tr align='center'><td align='left'>re/qrstack.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_60508.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol '&amp;encode'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_fold.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/re/reg_fold.v5:50<br />
------&gt;                                         ⏏@{$invmap_ref-&gt;[$i]});</td></tr>
        <tr align='center'><td align='left'>run/switch0.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/bom.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling tmp26324A.26324<br />
Unexpected closing bracket<br />
at tmp26324A.26324:1<br />
------&gt; use v5; ï⏏»¿print 1;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/cache.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/cache.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/cache.v5:29<br />
------&gt; $s =~ m/[\⏏p{Hiragana}\x{101}]/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/21-test.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Perlito5::Test in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errnosig.v5</td><td>0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::alarm called<br />
  in block  at t/spec/io/errnosig.v5:13<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/io/errnosig.v5:10<br />
<br />   1 skipped: Alarm not supported<br />
</td></tr>
        <tr align='center'><td align='left'>lib/1_compile.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/commonsense.v5</td><td>0</td><td>1</td><td>0</td><td>0</td><td>1</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::BAIL_OUT called<br />
  in block  at t/spec/lib/commonsense.v5:14<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'SUPER'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_c3_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'SUPER'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'SUPER'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_05_dfs_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'SUPER'<br />
</td></tr>
        <tr align='center'><td align='left'>mro/next_inanon.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left'>mro/next_inanon_utf8.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/groups.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/groups.v5<br />
Variable '$groups_command' is not declared<br />
at t/spec/op/groups.v5:39<br />
------&gt;     my ( $groups_command⏏, $groups_string ) = system_groups()</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/magic-27839.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/magic-27839.v5<br />
Variable '@+' is not declared<br />
at t/spec/op/magic-27839.v5:18<br />
------&gt; 	$x = "@+⏏";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/overload_integer.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Foo in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5, ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/pwent.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$.' is not declared<br />
at t/spec/op/pwent.v5:161<br />
------&gt; 	push @{ $seen{$name_s} }, $.⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time_loop.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block  at t/spec/op/time_loop.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/bincompat.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/porting/bincompat.v5<br />
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
  in sub trace_lines at t/spec/run/switchd-78586.v5:25<br />
  in block  at t/spec/run/switchd-78586.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/chomp.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Malformed UTF-8 at line 1 col 1<br />
  in method decode at src/gen/m-CORE.setting:5449<br />
  in method Str at src/gen/m-CORE.setting:5452<br />
  in method STORE_AT_KEY at src/gen/m-CORE.setting:9137<br />
  in method STORE_AT_KEY at src/gen/m-CORE.setting:9255<br />
  in method STORE at src/gen/m-CORE.setting:9267<br />
  in method new at src/gen/m-CORE.setting:9189<br />
  in sub circumfix:&lt;{ }&gt; at src/gen/m-CORE.setting:9622<br />
  in block  at t/spec/uni/chomp.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/11-class-open.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>No such method 'subr' for invocant of type 'Other'<br />
  in block  at t/v5/11-class-open.v5:31<br />
  in block  at t/v5/11-class-open.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/iprefix.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/io/iprefix.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/read.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr><td colspan='5'>Too many positional parameters passed; got 2 but expected 1<br />
  in method print at src/gen/m-CORE.setting:1051<br />
  in sub P5print at lib/Perl5/Terms.pm:1011<br />
  in block  at t/spec/io/read.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>lib/no_load.v5</td><td>0</td><td>2</td><td>0</td><td>0</td><td>2</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grent.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::setgrent called<br />
  in block  at t/spec/op/grent.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utftaint.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/utftaint.v5<br />
Variable '*is_utf8' is not declared<br />
at t/spec/op/utftaint.v5:27<br />
------&gt; *is_utf8 ⏏= \&amp;utf8::is_utf8;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/script.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr><td colspan='5'>Could not close: <br />
  in block  at t/spec/run/script.v5:19<br />
</td></tr>
        <tr align='center'><td align='left'>run/switchn.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
        <tr align='center'><td align='left'>run/switchp.v5</td><td>0</td><td>3</td><td>0</td><td>0</td><td>3</td></tr>
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
------&gt; sub TypeCheck :ATTR⏏(CODE,RAWDATA) {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/crypt.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::crypt called<br />
  in block  at t/spec/op/crypt.v5:32<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/crypt.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filehandle.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/filehandle.v5:15<br />
    ------&gt; open my $fh⏏, "&lt;", \$str;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigsystem.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/sigsystem.v5<br />
Two terms in a row<br />
at t/spec/op/sigsystem.v5:28<br />
------&gt;     my $pid = fork // ⏏die "Can't fork: $!";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/mad.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/mad.v5:34<br />
    ------&gt;     delete local $ENV{$_} ⏏for keys %ENV;<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/mad.v5:42<br />
    ------&gt;     delete local $ENV{$_} ⏏for keys %ENV;<br />
Undefined subroutine &amp;main::delete called<br />
  in block  at t/spec/run/mad.v5:34<br />
  in block  at t/spec/run/mad.v5:33<br />
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
Failed to create link called 'tmp27394C' on target 'tmp27394B': Failed to link file: no such file or directory<br />
  in block  at src/gen/m-CORE.setting:14295<br />
  in any  at /home/froggs/dev/nqp/install/languages/perl6/runtime/CORE.setting.moarvm:1<br />
  in sub link at src/gen/m-CORE.setting:14290<br />
  in block  at t/spec/win32/fs.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/24-strict.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/24-strict.v5<br />
Missing block<br />
at t/v5/24-strict.v5:3<br />
------&gt; eval⏏('use strict;my $x = "ok 1";print $x,"\n</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/25-syntax-defined-or.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/v5/25-syntax-defined-or.v5<br />
Two terms in a row<br />
at t/v5/25-syntax-defined-or.v5:8<br />
------&gt;     print "not " unless (shift // ⏏2) == 5;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'hello' for invocant of type 'Diamond_D'<br />
  in block  at t/spec/mro/basic_01_c3.v5:43<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'hèllò' for invocant of type 'Ｄiᚪၚd_D'<br />
  in block  at t/spec/mro/basic_01_c3_utf8.v5:45<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'hello' for invocant of type 'Diamond_D'<br />
  in block  at t/spec/mro/basic_01_dfs.v5:43<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_01_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'hèllò' for invocant of type 'Ｄiᚪၚd_D'<br />
  in block  at t/spec/mro/basic_01_dfs_utf8.v5:45<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_c3.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'O_or_D' for invocant of type 'Test::A'<br />
  in block  at t/spec/mro/basic_03_c3.v5:92<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_c3_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'ᴼ_or_Ḋ' for invocant of type '텟ţ::ଅ'<br />
  in block  at t/spec/mro/basic_03_c3_utf8.v5:94<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_dfs.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'O_or_D' for invocant of type 'Test::A'<br />
  in block  at t/spec/mro/basic_03_dfs.v5:92<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_03_dfs_utf8.v5</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td></tr>
        <tr><td colspan='5'>No such method 'ᴼ_or_Ḋ' for invocant of type '텟ţ::ଅ'<br />
  in block  at t/spec/mro/basic_03_dfs_utf8.v5:94<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_method.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such method 'hello' for invocant of type 'Diamond_D'<br />
  in block  at t/spec/mro/next_method.v5:51<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_method_utf8.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such method '헬ฬ' for invocant of type 'Diӑmond_D'<br />
  in block  at t/spec/mro/next_method_utf8.v5:53<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/alarm.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::alarm called<br />
  in block  at t/spec/op/alarm.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lock.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::lock called<br />
  in block  at t/spec/op/lock.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/yadayada.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Cannot call 'match'; none of these signatures match:<br />
:(Cool:D: Any $target, *%adverbs)<br />
  in sub P5split at lib/Perl5/Terms.pm:1104<br />
  in sub P5split at lib/Perl5/Terms.pm:1095<br />
  in sub P5split at lib/Perl5/Terms.pm:1096<br />
  in sub P5split at lib/Perl5/Terms.pm:1095<br />
  in block  at t/spec/op/yadayada.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $flile<br />
    at t/spec/re/qr.v5:82<br />
    ------&gt;  tie my $flile⏏, "qrBug";<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/re/qr.v5:78<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/re/qr.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchF1.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Close Run_switchF1.pl: <br />
  in block  at t/spec/run/switchF1.v5:29<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/opcroak.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/opcroak.v5<br />
Two terms in a row<br />
at t/spec/uni/opcroak.v5:21<br />
------&gt; Not enough arguments for main::\x{30cb}/⏏u, "Not enough arguments croak is UTF-8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/select.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such method 'IO' for invocant of type 'Typeglob'<br />
  in sub P5open at lib/Perl5/Terms.pm:88<br />
  in sub P5open at lib/Perl5/Terms.pm:77<br />
  in block  at t/spec/uni/select.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/31-autoload.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;A::a called<br />
  in block  at t/v5/31-autoload.v5:11<br />
  in block  at t/v5/31-autoload.v5:7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/32-autoload-method.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>No such method 'a' for invocant of type 'A'<br />
  in block  at t/v5/32-autoload-method.v5:11<br />
  in block  at t/v5/32-autoload-method.v5:7<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/nargv.v5</td><td>0</td><td>5</td><td>0</td><td>0</td><td>5</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::wantarray called<br />
  in sub mkfiles at t/spec/io/nargv.v5:71<br />
  in block  at t/spec/io/nargv.v5:13<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/blocks.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/blocks.v5<br />
Missing block<br />
at t/spec/op/blocks.v5:127<br />
------&gt; ::is INIT⏏, 5, 'constant named after a special blo</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/kill0.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::kill called<br />
  in block  at t/spec/op/kill0.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/threads-dirh.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/threads-dirh.v5:123<br />
------&gt;   ⏏is length async { scalar readdir $dirh }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/unlink.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/unlink.v5:21<br />
    ------&gt;   open my $fh⏏, "&gt;", $file or die "Can't open $file: $<br />
===SORRY!===<br />
Cannot convert string to number: base-10 number must begin with valid digits or '.' in '⏏/home/froggs/dev/v5/t/tmp26943B/aaa' (indicated by ⏏)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8magic.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $str2<br />
    at t/spec/op/utf8magic.v5:32<br />
    ------&gt; tie my $str2⏏, "", "a";<br />
===SORRY!===<br />
Could not find symbol '&amp;is_utf8'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_7jis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/tr_7jis.v5<br />
Variable '$B' is not declared<br />
at t/spec/uni/tr_7jis.v5:19<br />
------&gt; my @hiragana =  map {chr} ord("$B⏏$!(B")..ord("$B$s(B");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_eucjp.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_sjis.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/inplace.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/io/inplace.v5:17<br />
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
  in sub P5open at lib/Perl5/Terms.pm:97<br />
  in sub P5open at lib/Perl5/Terms.pm:77<br />
  in block  at t/spec/io/perlio_open.v5:20<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/io/perlio_open.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>benchmark/rt26188-speed-up-keys-on-empty-hash.v5</td><td>0</td><td>6</td><td>0</td><td>0</td><td>6</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::delete called<br />
  in block  at t/spec/benchmark/rt26188-speed-up-keys-on-empty-hash.v5:6<br />
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/pkg_gen.v5<br />
Variable '%Foo' is not declared<br />
at t/spec/mro/pkg_gen.v5:35<br />
------&gt; undef %Foo::⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/pkg_gen_utf8.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/pkg_gen_utf8.v5<br />
Variable '%ᕘ' is not declared<br />
at t/spec/mro/pkg_gen_utf8.v5:37<br />
------&gt; undef %ᕘ::⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest_t.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Cannot find method 'isatty': no method cache and no .^find_method<br />
  in method t at src/gen/m-CORE.setting:13751<br />
  in block  at t/spec/op/filetest_t.v5:18<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/filetest_t.v5:16<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/lex.v5<br />
Couldn't parse heredoc construct<br />
at t/spec/op/lex.v5:12<br />
------&gt;     print &lt;&lt;⏏;   # Yow!<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/our.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/comp/our.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package_block.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 93)<br />
Undefined subroutine &amp;main::eq called<br />
  in block  at t/spec/comp/package_block.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/magic_phase.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '&amp;Moo' is not declared<br />
at t/spec/opbasic/magic_phase.v5:40<br />
------&gt; my $tiger = bless {}, ⏏Moo::;<br />
Variable '&amp;Kooh' is not declared<br />
at t/spec/opbasic/magic_phase.v5:46<br />
------&gt; our $affe = bless {}, ⏏Kooh::;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/readline.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/readline.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/uni/readline.v5:53<br />
------&gt; like($obj, qr/Ȼლᔆ=ARRAY.*world/⏏u, 'rcatline and refs');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fflush.v5</td><td>0</td><td>7</td><td>0</td><td>0</td><td>7</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $CMD<br />
    at t/spec/io/fflush.v5:126<br />
    ------&gt; open my $CMD⏏, "$cmd |" or die "Can't open pipe to '$<br />
close tmp26344B: <br />
  in block  at t/spec/io/fflush.v5:1<br />
</td></tr>
        <tr align='center'><td align='left'>mro/recursion_c3.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left'>mro/recursion_c3_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left'>mro/recursion_dfs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left'>mro/recursion_dfs_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/fh.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::fileno called<br />
  in block  at t/spec/op/fh.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/getppid.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in declarator; couldn't find final ')' <br />
at t/spec/op/getppid.v5:29<br />
------&gt;     pipe my ($r, $w) ⏏or die "pipe: $!\n";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/symbolcache.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/symbolcache.v5<br />
Variable '%main::' is not declared<br />
at t/spec/op/symbolcache.v5:17<br />
------&gt; delete $main::{removed}⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tr_utf8.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/tr_utf8.v5<br />
Bogus statement<br />
at t/spec/uni/tr_utf8.v5:40<br />
------&gt;  $hiragana; $str =~ s/([ぁ-ん])/$h2k{$1}/g⏏o;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/write.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/write.v5<br />
Two terms in a row<br />
at t/spec/uni/write.v5:103<br />
------&gt;   like $@, qr/Undefined format "놋웇ʱＦᚖṀŦ/⏏u, 'no such format, with format name in</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/proxy_constant_subs.v5</td><td>0</td><td>8</td><td>0</td><td>0</td><td>8</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::svref_2object called<br />
  in block  at t/spec/lib/proxy_constant_subs.v5:22<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/lib/proxy_constant_subs.v5:20<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/decl.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/decl.v5<br />
Two terms in a row<br />
at t/spec/comp/decl.v5:33<br />
------&gt; &lt;BOL&gt;⏏four();</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/select.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/op/select.v5:20<br />
------&gt; is ref⏏\select, 'SCALAR', 'and STDOUT is a plai</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_special_cc.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 58)<br />
===SORRY!===<br />
Error while compiling op bind: QAST::Block with cuid cuid_102_1398027238.61379 has not appeared<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/dtrace.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>/bin/sh: 1: -V: not found<br />
===SORRY!=== Error while compiling t/spec/run/dtrace.v5<br />
Couldn't parse heredoc construct<br />
at t/spec/run/dtrace.v5:70<br />
------&gt; dtrace_like(&lt;&lt;⏏ 'MAGIC_OP',<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/labels.v5</td><td>0</td><td>9</td><td>0</td><td>0</td><td>9</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/labels.v5<br />
Two terms in a row<br />
at t/spec/uni/labels.v5:49<br />
------&gt;  $@, qr/Label not found for "last Ｅ" at/⏏u, "last's error is UTF-8 clean";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'next'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_skip_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/next_skip_utf8.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/mro/next_skip_utf8.v5:73<br />
------&gt; No next::method 'fuz' found for Ｄiᚪၚd_D/⏏u, '... cannot re-dispatch to a method w</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hash.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*guard' is not declared<br />
at t/spec/op/hash.v5:77<br />
------&gt; *guard ⏏= sub (&amp;) {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/srand.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/srand.v5<br />
Calling 'srand' requires arguments (if you meant to operate on $_, please use .srand or use an explicit invocant or argument)<br />
    Expected: :(Int $seed --&gt; Int)<br />
at t/spec/op/srand.v5:45<br />
------&gt;     srand(⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>porting/FindExt.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find FindExt in any of: /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchd.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/run/switchd.v5:63<br />
------&gt;    ⏏switches =&gt; [ '"-Mless ++INC-&gt;{q-Devel/_</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/tie.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/uni/tie.v5:33<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/eintr.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $in<br />
    at t/spec/io/eintr.v5:23<br />
    ------&gt; 	pipe my $in⏏, my $out;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/23-eval.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Oops<br />
Oops<br />
Oops<br />
Undefined subroutine &amp;main::or called<br />
  in block  at t/v5/23-eval.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/openpid.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block  at t/spec/io/openpid.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/deprecate.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>Failed to change the working directory to '/home/froggs/dev/v5/lib/deprecate': Directory does not exist<br />
  in sub chdir at src/gen/m-CORE.setting:14212<br />
  in sub P5chdir at lib/Perl5/Terms.pm:415<br />
  in sub P5chdir at lib/Perl5/Terms.pm:415<br />
  in block  at t/spec/lib/deprecate.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_c3.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>No such method 'C_or_D' for invocant of type 'Test::A'<br />
  in block  at t/spec/mro/basic_02_c3.v5:110<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_c3_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>No such method 'ƈ_or_Ḋ' for invocant of type '텟ţ::ଅ'<br />
  in block  at t/spec/mro/basic_02_c3_utf8.v5:112<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_dfs.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>No such method 'C_or_D' for invocant of type 'Test::A'<br />
  in block  at t/spec/mro/basic_02_dfs.v5:110<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_02_dfs_utf8.v5</td><td>0</td><td>10</td><td>0</td><td>0</td><td>10</td></tr>
        <tr><td colspan='5'>No such method 'ƈ_or_Ḋ' for invocant of type '텟ţ::ଅ'<br />
  in block  at t/spec/mro/basic_02_dfs_utf8.v5:112<br />
</td></tr>
        <tr align='center'><td align='left'>mro/complex_dfs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr align='center'><td align='left'>mro/complex_dfs_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array_base.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/array_base.v5<br />
Missing block<br />
at t/spec/op/array_base.v5:12<br />
------&gt;  is(eval⏏('$[ = 1; 123'), undef);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/flip.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/flip.v5<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')' <br />
at t/spec/op/flip.v5:54<br />
------&gt; ok(scalar(0⏏..2));</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto_xs.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/goto_xs.v5<br />
Redeclaration of symbol Fcntl<br />
at t/spec/op/goto_xs.v5:58<br />
------&gt; package Fcntl⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/require_errors.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$&gt;' is not declared<br />
at t/spec/op/require_errors.v5:82<br />
------&gt;     my $olduid = $&gt;⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/class.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/class.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/uni/class.v5:12<br />
------&gt; is(($str =~ /(\⏏p{IsMyUniClass}+)/)[0], '0123456789:;&lt;=&gt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/lex_utf8.v5</td><td>0</td><td>11</td><td>0</td><td>0</td><td>11</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/lex_utf8.v5<br />
Unrecognized character name U+00B5<br />
at t/spec/uni/lex_utf8.v5:27<br />
------&gt; my $uname_first = "b\N{U+00B5}⏏Ɓ";<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_c3.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'next'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/complex_c3_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol 'next'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::object_ok called<br />
  in block  at t/spec/mro/next_edgecases.v5:11<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/mro/next_edgecases.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/next_edgecases_utf8.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::object_ok called<br />
  in block  at t/spec/mro/next_edgecases_utf8.v5:14<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/mro/next_edgecases_utf8.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/protowarn.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/protowarn.v5<br />
Unable to parse expression in signature; couldn't find final ')' <br />
at t/spec/op/protowarn.v5:41<br />
------&gt; $sub = sub (⏏x) { };</td></tr>
        <tr align='center'><td align='left' rowspan='2'>t/v5/13-op-context.v5</td><td>0</td><td>12</td><td>0</td><td>0</td><td>12</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::wantarray called<br />
  in sub foo at t/v5/13-op-context.v5:7<br />
  in block  at t/v5/13-op-context.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/wantarray.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/wantarray.v5<br />
Variable '$cona' is not declared<br />
at t/spec/op/wantarray.v5:16<br />
------&gt;   my ( $cona⏏, $testnum ) = @_;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switchC.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/run/switchC.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/universal.v5</td><td>0</td><td>13</td><td>0</td><td>0</td><td>13</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/lib/universal.v5<br />
Unable to parse expression in variable; couldn't find final '}' <br />
at t/spec/lib/universal.v5:40<br />
------&gt; $x = ${qr⏏//};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/form_scope.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/form_scope.v5<br />
Couldn't parse heredoc construct<br />
at t/spec/comp/form_scope.v5:12<br />
------&gt; ok @&lt;&lt;&lt;&lt;&lt;⏏&lt;&lt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/studytied.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/studytied.v5:27<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/package.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/package.v5<br />
Two terms in a row<br />
at t/spec/comp/package.v5:18<br />
------&gt;     $main⏏'a = $'b;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/qr-72922.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::weaken called<br />
  in sub s1 at t/spec/re/qr-72922.v5:21<br />
  in block  at t/spec/re/qr-72922.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_pmod.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/reg_pmod.v5<br />
Found ? but no :; possible precedence problem<br />
at t/spec/re/reg_pmod.v5:41<br />
------&gt; 			(   $p eq '/p'   ? s/$pat/abc/⏏p</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/mypragma.v5</td><td>0</td><td>14</td><td>0</td><td>0</td><td>14</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find mypragma in any of: lib, /home/froggs/dev/nqp/install/languages/perl6/lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utf8cache.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/utf8cache.v5<br />
Variable '$a' is not declared<br />
at t/spec/op/utf8cache.v5:22<br />
------&gt;     $a ⏏= "hello \x{1234}";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_psycho.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_psycho.v5<br />
Illegal redeclaration of 'OUTER'<br />
at t/spec/re/pat_psycho.v5:107<br />
------&gt;           ⏏for my $a ("x","a","aa") {</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/shm.v5</td><td>0</td><td>15</td><td>0</td><td>0</td><td>15</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::IPC_PRIVATE called<br />
  in block  at t/spec/io/shm.v5:43<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/io/shm.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashwarn.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Odd number of elements found where hash expected<br />
  in method STORE at src/gen/m-CORE.setting:9269<br />
  in sub infix:&lt;=&gt; at src/gen/m-CORE.setting:16696<br />
  in block  at t/spec/op/hashwarn.v5:27<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/hashwarn.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/crlf.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/crlf.v5:38<br />
    ------&gt; 	open my $fh⏏, "&lt;:crlf", \$fcontents;<br />
Failed to open file: no such file or directory<br />
  in method open at src/gen/m-CORE.setting:13669<br />
  in sub P5open at lib/Perl5/Terms.pm:88<br />
  in sub P5open at lib/Perl5/Terms.pm:77<br />
  in block  at t/spec/io/crlf.v5:16<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/io/crlf.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/defout.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/defout.v5<br />
Two terms in a row<br />
at t/spec/io/defout.v5:32<br />
------&gt; @ ⏏@&lt;&lt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/errno.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>Could not find file './test.pl' for module ./test.pl<br />
  in any load_module at lib/Perl5/ModuleLoader.nqp:72<br />
  in any load_module at src/gen/m-ModuleLoader.nqp:159<br />
  in block  at t/spec/io/errno.v5:11<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>lib/cygwin.v5</td><td>0</td><td>16</td><td>0</td><td>0</td><td>16</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Win32 in any of: ../lib/Perl5<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/current_sub.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'Any'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_exit.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>Can't open temp error file tmp26638B:  <br />
  in block  at t/spec/op/die_exit.v5:37<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/glob.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/glob.v5<br />
Preceding context expects a term, but found infix &lt; instead<br />
at t/spec/op/glob.v5:117<br />
------&gt; &lt;BOL&gt;⏏&lt;EOL&gt;<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lfs.v5</td><td>0</td><td>17</td><td>0</td><td>0</td><td>17</td></tr>
        <tr><td colspan='5'>binmode tmp26765C failed: <br />
  in block  at t/spec/op/lfs.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/caller.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/caller.v5<br />
Two terms in a row<br />
at t/spec/uni/caller.v5:20<br />
------&gt; ndefined subroutine &amp;ｍａｉｎ::ok called at/⏏u;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/package.v5</td><td>0</td><td>18</td><td>0</td><td>0</td><td>18</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/package.v5<br />
Two terms in a row<br />
at t/spec/uni/package.v5:37<br />
------&gt;     $압Ƈ⏏'d읯ⱪ = 6;        #'</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/die_keeperr.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 46)<br />
===SORRY!===<br />
Error while compiling op callmethod (source text: "{ no warnings \"misc\"; die \"aa\\n\"; }"): Unknown QAST node type NQPMatch<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/redef.v5</td><td>0</td><td>20</td><td>0</td><td>0</td><td>20</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/redef.v5<br />
Redeclaration of routine sub0<br />
at t/spec/comp/redef.v5:22<br />
------&gt; &lt;BOL&gt;⏏ok 1, $warn =~ s/Subroutine sub0 redefin</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/exec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/exec.v5<br />
Two terms in a row<br />
at t/spec/op/exec.v5:110<br />
------&gt; $rc = system { "lskdfj" } ⏏"lskdfj";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/join.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Error while compiling, type X::Redeclaration<br />
  symbol: $t<br />
 at line 36, near ", 'X';\n  m"<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/mkdir.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Calling 'mkdir' requires arguments (if you meant to operate on $_, please use .mkdir or use an explicit invocant or argument)<br />
    Expected any of:     :(Any $path, Any $mode = { ... })<br />
at t/spec/op/mkdir.v5:54<br />
------&gt;     ok(mkdir⏏);<br />
Calling 'rmdir' requires arguments (if you meant to operate on $_, please use .rmdir or use an explicit invocant or argument)<br />
    Expected: :(Any $path)<br />
at t/spec/op/mkdir.v5:58<br />
------&gt;     ok(rmdir⏏);<br />
Calling 'mkdir' requires arguments (if you meant to operate on $_, please use .mkdir or use an explicit invocant or argument)<br />
    Expected any of:     :(Any $path, Any $mode = { ... })<br />
at t/spec/op/mkdir.v5:45<br />
------&gt; ok(mkdir⏏);<br />
Calling 'rmdir' requires arguments (if you meant to operate on $_, please use .rmdir or use an explicit invocant or argument)<br />
    Expected: :(Any $path)<br />
at t/spec/op/mkdir.v5:47<br />
------&gt; ok(rmdir⏏);<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/cloexec.v5</td><td>0</td><td>22</td><td>0</td><td>0</td><td>22</td></tr>
        <tr><td colspan='5'>close 'tmp27260C': <br />
  in sub make_tmp_file at t/spec/run/cloexec.v5:52<br />
  in block  at t/spec/run/cloexec.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/argv.v5</td><td>0</td><td>23</td><td>0</td><td>0</td><td>23</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/argv.v5:118<br />
    ------&gt;     open my $fh⏏, 'Io_argv1.tmp' or die "Could not open <br />
===SORRY!===<br />
Could not find symbol '&amp;Spec'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isarev.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/isarev.v5<br />
Unable to parse expression in variable; couldn't find final '}' <br />
at t/spec/mro/isarev.v5:22<br />
------&gt;      join(" ", sort @{mro::get_isarev⏏ $args[0]}),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/isarev_utf8.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/isarev_utf8.v5<br />
Unable to parse expression in variable; couldn't find final '}' <br />
at t/spec/mro/isarev_utf8.v5:25<br />
------&gt;      join(" ", sort @{mro::get_isarev⏏ $args[0]}),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pipe.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Error while compiling op bind: Local '_inline_arg__19' already declared<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/print.v5</td><td>0</td><td>24</td><td>0</td><td>0</td><td>24</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/print.v5<br />
Variable '$,' is not declared<br />
at t/spec/io/print.v5:34<br />
------&gt; $, ⏏= ' ';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/while.v5</td><td>0</td><td>25</td><td>0</td><td>0</td><td>25</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/cmd/while.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/cmd/while.v5:36<br />
------&gt; ok(eof &amp;&amp; ⏏!/vt100/ &amp;&amp; !$bad);</td></tr>
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
        <tr align='center'><td align='left' rowspan='2'>op/threads.v5</td><td>0</td><td>26</td><td>0</td><td>0</td><td>26</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/threads.v5<br />
Variable '$b' is not declared<br />
at t/spec/op/threads.v5:60<br />
------&gt; sub mycmp { length($b⏏) &lt;=&gt; length($a) }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/override.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/override.v5<br />
Two terms in a row<br />
at t/spec/op/override.v5:69<br />
------&gt;         CORE::require ⏏warnings;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/qq.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/opbasic/qq.v5<br />
Unrecognized backslash sequence: '\x'<br />
at t/spec/opbasic/qq.v5:45<br />
------&gt; is ("\⏏xh", chr (0) . 'h');	# This will warn</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/rs.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $T<br />
    at t/spec/base/rs.v5:91<br />
    ------&gt;     if (open our $T⏏, "./foo") {<br />
    Redeclaration of symbol $T<br />
    at t/spec/base/rs.v5:105<br />
    ------&gt;     if (open my $T⏏, "./foo") {<br />
WARNINGS:<br />
Useless use of "," in expression "= `\\@\\[\\]foo`, \"\\n\"" in sink context (line 53)<br />
===SORRY!===<br />
Cannot convert string to number: base-10 number must begin with valid digits or '.' in '⏏/home/froggs/dev/v5/foo' (indicated by ⏏)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/pvbm.v5</td><td>0</td><td>28</td><td>0</td><td>0</td><td>28</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/pvbm.v5<br />
Calling 'truncate' will never work with argument types (Mu, Int)<br />
    Expected any of:     :(Real:D $x)     :(Cool:D $x)<br />
at t/spec/io/pvbm.v5:52<br />
------&gt;     ok (!eval { truncate ⏏$pvbm, 0 }, 'truncate(PVBM) fails');<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sigdispatch.v5</td><td>0</td><td>29</td><td>0</td><td>0</td><td>29</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block  at t/spec/op/sigdispatch.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/readline.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/readline.v5<br />
Variable '$fh' is not declared<br />
at t/spec/op/readline.v5:98<br />
------&gt;     my ( $fh⏏, $timeout ) = @_;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/reset.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/reset.v5<br />
Redeclaration of symbol scratch<br />
at t/spec/op/reset.v5:84<br />
------&gt; package scratch ⏏{ reset "bc" }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/warn.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/warn.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/warn.v5:147<br />
------&gt;   qr/^ARRAY\(0x[\da-f]+\) at /⏏a,</td></tr>
        <tr align='center'><td align='left' rowspan='2'>opbasic/concat.v5</td><td>0</td><td>30</td><td>0</td><td>0</td><td>30</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/opbasic/concat.v5<br />
Missing block<br />
at t/spec/opbasic/concat.v5:157<br />
------&gt;     my $x = eval⏏"qr/\x{fff}/";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/dor.v5</td><td>0</td><td>31</td><td>0</td><td>0</td><td>31</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/dor.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/dor.v5:41<br />
------&gt; is(shift       // ⏏7, 7,	'shift // ... works');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/qr.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/qr.v5<br />
Unable to parse expression in variable; couldn't find final '}' <br />
at t/spec/op/qr.v5:73<br />
------&gt;     my $x = 1.1; $x = ${qr⏏//};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/vec.v5</td><td>0</td><td>32</td><td>0</td><td>0</td><td>32</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::vec called<br />
  in block  at t/spec/op/vec.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/reg_eval_scope.v5</td><td>0</td><td>34</td><td>0</td><td>0</td><td>34</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling tmp27186A.27186<br />
Lexical symbol '$x' is already bound to an outer symbol;<br />
the implicit outer binding must be rewritten as OUTER::&lt;$x&gt;<br />
before you can unambiguously declare a new '$x' in this scope<br />
at tmp27186A.27186:2<br />
------&gt;  print "a" =~ /(?{ print $x; my $x ⏏= 8; print $x; my $y })a/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/tell.v5</td><td>0</td><td>35</td><td>0</td><td>0</td><td>35</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::TST called<br />
  in block  at t/spec/io/tell.v5:18<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/method_caching.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol *A<br />
    at t/spec/mro/method_caching.v5:92<br />
    ------&gt;           local *A ⏏= sub { 21 };<br />
No such method 'foo' for invocant of type 'MCTest::Derived'<br />
  in sub  at t/spec/mro/method_caching.v5:30<br />
  in block  at t/spec/mro/method_caching.v5:107<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/subval.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/cmd/subval.v5<br />
Two terms in a row<br />
at t/spec/cmd/subval.v5:110<br />
------&gt; &amp;main⏏'somesub(28, 'foo', __FILE__, __LINE__);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/recompile.v5</td><td>0</td><td>36</td><td>0</td><td>0</td><td>36</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $tf<br />
    at t/spec/re/recompile.v5:44<br />
    ------&gt;     open my $tf⏏, "&gt;$tmpfile" or die "Cannot open $tmpfi<br />
Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/re/recompile.v5:29<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/delete.v5</td><td>0</td><td>38</td><td>0</td><td>0</td><td>38</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::delete called<br />
  in block  at t/spec/op/delete.v5:9<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/avhv.v5</td><td>0</td><td>40</td><td>0</td><td>0</td><td>40</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/avhv.v5<br />
Confused<br />
at t/spec/op/avhv.v5:167<br />
------&gt; $a = [{key =&gt; 1}⏏, 'a'];</td></tr>
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
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/study.v5<br />
Couldn't find terminator |<br />
at t/spec/op/study.v5:69<br />
------&gt; ok(m|bc/*d|⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/uproto.v5</td><td>0</td><td>43</td><td>0</td><td>0</td><td>43</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/uproto.v5<br />
Two terms in a row<br />
at t/spec/comp/uproto.v5:123<br />
------&gt; unop ⏏11, 22; # takes only the first parameter</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/perlio.v5</td><td>0</td><td>45</td><td>0</td><td>0</td><td>45</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $x<br />
    at t/spec/io/perlio.v5:109<br />
    ------&gt;       ok(open(my $x⏏,"+&lt;",undef), 'TMPDIR honored by magic t<br />
    Redeclaration of symbol $fh<br />
    at t/spec/io/perlio.v5:198<br />
    ------&gt;         open my $fh⏏, "&lt;", \(my $f = *f);<br />
Undefined subroutine &amp;main::use_ok called<br />
  in block  at t/spec/io/perlio.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sysio.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>WARNINGS:<br />
Useless use of constant integer 1 in sink context (line 239)<br />
sysio.t: cannot find myself: <br />
  in block  at t/spec/op/sysio.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/parser.v5</td><td>0</td><td>48</td><td>0</td><td>0</td><td>48</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
MVMArray: Index out of bounds<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/filetest.v5</td><td>0</td><td>49</td><td>0</td><td>0</td><td>49</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find Perl::OSType in any of: ../lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases_utf8.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/package_aliases_utf8.v5<br />
Two terms in a row<br />
at t/spec/mro/package_aliases_utf8.v5:87<br />
------&gt;    ~ =~ s\__code__\$$_{code}\⏏r; #\</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/fs.v5</td><td>0</td><td>52</td><td>0</td><td>0</td><td>52</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/io/fs.v5<br />
Variable '%FH' is not declared<br />
at t/spec/io/fs.v5:401<br />
------&gt; 	    ok(truncate(*FH{IO}⏏, 100), "fh resize by IO slot");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic_utf8.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/basic_utf8.v5<br />
Two terms in a row<br />
at t/spec/mro/basic_utf8.v5:9<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 53);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/package_aliases.v5</td><td>0</td><td>53</td><td>0</td><td>0</td><td>53</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/package_aliases.v5<br />
Two terms in a row<br />
at t/spec/mro/package_aliases.v5:75<br />
------&gt;    ~ =~ s\__code__\$$_{code}\⏏r,</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/each.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/each.v5<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/each.v5:172<br />
------&gt;     is (length,⏏ 3, "check length");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stash.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/stash.v5<br />
Variable '%pig' is not declared<br />
at t/spec/op/stash.v5:79<br />
------&gt;     ok( defined %pig::⏏, q(referencing a non-existent stash doe</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ver.v5</td><td>0</td><td>57</td><td>0</td><td>0</td><td>57</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/ver.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/ver.v5:110<br />
------&gt; 			 unpack⏏ 'U*', pack('U*',2001,2002,2003))),</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/stash.v5</td><td>0</td><td>58</td><td>0</td><td>0</td><td>58</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/stash.v5<br />
Variable '%piƓ' is not declared<br />
at t/spec/uni/stash.v5:71<br />
------&gt;         ok( defined %piƓ::⏏, q(referencing a non-existent stash doe</td></tr>
        <tr align='center'><td align='left' rowspan='2'>mro/basic.v5</td><td>0</td><td>59</td><td>0</td><td>0</td><td>59</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/mro/basic.v5<br />
Two terms in a row<br />
at t/spec/mro/basic.v5:7<br />
------&gt; BEGIN { require q(t/test.pl); } ⏏plan(tests =&gt; 59);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/quotemeta.v5</td><td>0</td><td>60</td><td>0</td><td>0</td><td>60</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/quotemeta.v5<br />
Unrecognized backslash sequence: '\U'<br />
at t/spec/op/quotemeta.v5:35<br />
------&gt; is("aA\⏏UbB\LcC\EdD", "aABBccdD", 'aA\UbB\LcC\Ed</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/utf8.v5</td><td>0</td><td>61</td><td>0</td><td>0</td><td>61</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/grep.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/grep.v5<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/grep.v5:57<br />
------&gt;            {a =&gt;$_},⏏&lt;EOL&gt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/method.v5</td><td>0</td><td>62</td><td>0</td><td>0</td><td>62</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/method.v5<br />
Two terms in a row<br />
at t/spec/uni/method.v5:43<br />
------&gt; method "ｍｅｔｈｏｄ" on unblessed reference /⏏u;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiehandle.v5</td><td>0</td><td>63</td><td>0</td><td>0</td><td>63</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/tiehandle.v5<br />
Two terms in a row<br />
at t/spec/op/tiehandle.v5:97<br />
------&gt; $r = printf $fh ⏏@expect[2,3];</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/localref.v5</td><td>0</td><td>64</td><td>0</td><td>0</td><td>64</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Error while compiling op callmethod: QAST::Var with scope '' NYI<br />
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
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/loopctl.v5:39<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/time.v5</td><td>0</td><td>66</td><td>0</td><td>0</td><td>66</td></tr>
        <tr><td colspan='5'>Undefined subroutine &amp;main::watchdog called<br />
  in block  at t/spec/op/time.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tiearray.v5</td><td>0</td><td>69</td><td>0</td><td>0</td><td>69</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol @dummy<br />
    at t/spec/op/tiearray.v5:295<br />
    ------&gt;     tie my @dummy⏏, "NegFetchsize";<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/tiearray.v5:155<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/tiearray.v5:153<br />
  in method reify at src/gen/m-CORE.setting:7686<br />
  in method reify at src/gen/m-CORE.setting:7549<br />
  in method gimme at src/gen/m-CORE.setting:8001<br />
  in method sink at src/gen/m-CORE.setting:8404<br />
  in block  at t/spec/op/tiearray.v5:151<br />
  in block  at t/spec/op/tiearray.v5:143<br />
  in block  at t/spec/op/tiearray.v5:12<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/greek.v5</td><td>0</td><td>72</td><td>0</td><td>0</td><td>72</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/retainedlines.v5</td><td>0</td><td>74</td><td>0</td><td>0</td><td>74</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
MVMArray: Index out of bounds<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/inccode.v5</td><td>0</td><td>77</td><td>0</td><td>0</td><td>77</td></tr>
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
No such method 'substr' for invocant of type 'Any'<br />
  in sub substr-rw at src/gen/m-CORE.setting:6866<br />
  in sub P5substr at lib/Perl5/Terms.pm:1190<br />
  in sub P5substr at lib/Perl5/Terms.pm:1183<br />
  in sub fooinc at t/spec/op/inccode.v5:38<br />
  in block  at t/spec/op/inccode.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/oct.v5</td><td>0</td><td>77</td><td>0</td><td>0</td><td>77</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/oct.v5<br />
Unrecognized backslash sequence: '\L'<br />
at t/spec/op/oct.v5:65<br />
------&gt; y $format = ($string =~ /([bx])/i) ? "0\⏏L$1%\U$1": '0%o';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/use.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find test_use in any of: ../lib, lib<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/bless.v5</td><td>0</td><td>84</td><td>0</td><td>0</td><td>84</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/uni/bless.v5<br />
Two terms in a row<br />
at t/spec/uni/bless.v5:18<br />
------&gt; r/^\Q$package\E=(\w+)\(0x([0-9a-f]+)\)$/⏏u;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>base/lex.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/base/lex.v5<br />
Unable to parse expression in parenthesized expression; couldn't find final ')' <br />
at t/spec/base/lex.v5:112<br />
------&gt; print (((q{{\{\(}} . q{{\)\}}⏏}) eq '{{\(}{\)}}') ? "ok 29\n" : "not o</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/undef.v5</td><td>0</td><td>85</td><td>0</td><td>0</td><td>85</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/undef.v5<br />
Variable '$a' is not declared<br />
at t/spec/op/undef.v5:16<br />
------&gt; ok !defined($a⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/goto.v5</td><td>0</td><td>89</td><td>0</td><td>0</td><td>89</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*__' is not declared. Did you mean '@__'?<br />
at t/spec/op/goto.v5:482<br />
------&gt; sub { *__ ⏏= \@_;  goto &amp;null } -&gt; ("rough and tubb</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/caller.v5</td><td>0</td><td>91</td><td>0</td><td>0</td><td>91</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
MVMArray: Index out of bounds<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/universal.v5</td><td>0</td><td>93</td><td>0</td><td>0</td><td>93</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Two terms in a row<br />
at t/spec/uni/universal.v5:82<br />
------&gt; equired--this is only version 2.718 at /⏏u;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/runenv.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/run/runenv.v5:117<br />
------&gt;     ⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/latin2.v5</td><td>0</td><td>94</td><td>0</td><td>0</td><td>94</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/utfhash.v5</td><td>0</td><td>99</td><td>0</td><td>0</td><td>99</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lex_assign.v5</td><td>0</td><td>100</td><td>0</td><td>0</td><td>100</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/lex_assign.v5<br />
Unrecognized backslash sequence: '\u'<br />
at t/spec/op/lex_assign.v5:34<br />
------&gt; my $b = "\⏏u\L$a";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bless.v5</td><td>0</td><td>109</td><td>0</td><td>0</td><td>109</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'A'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/stat.v5</td><td>0</td><td>113</td><td>0</td><td>0</td><td>113</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/op/stat.v5:465<br />
    ------&gt;     open my $fh⏏, "test.pl";<br />
===SORRY!===<br />
Could not find symbol '&amp;Spec'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/index.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/index.v5<br />
Variable '$a' is not declared<br />
at t/spec/op/index.v5:67<br />
------&gt; $a ⏏= "foo \x{1234}bar";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/svleak.v5</td><td>0</td><td>114</td><td>0</td><td>0</td><td>114</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Undefined subroutine &amp;main::or called<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/split.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '$p' is not declared<br />
at t/spec/op/split.v5:366<br />
------&gt;     $p⏏="a,b";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>run/switches.v5</td><td>0</td><td>115</td><td>0</td><td>0</td><td>115</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $f<br />
    at t/spec/run/switches.v5:86<br />
    ------&gt;     open my $f⏏, "&gt;$filename" or skip( "Can't write tem<br />
    Redeclaration of symbol $ENV<br />
    at t/spec/run/switches.v5:118<br />
    ------&gt;     local $ENV{LANGUAGE} ⏏= 'C';<br />
    Redeclaration of symbol $f<br />
    at t/spec/run/switches.v5:151<br />
    ------&gt;     open my $f⏏, "&gt;$filename" or skip( "Can't write tem<br />
    Redeclaration of symbol $f<br />
    at t/spec/run/switches.v5:167<br />
    ------&gt;     open my $f⏏, "&gt;$filename" or skip( "Can't write tem<br />
    Redeclaration of symbol $f<br />
    at t/spec/run/switches.v5:185<br />
    ------&gt;     open my $f⏏, "&gt;$filename" or skip( "Can't write tem<br />
    Redeclaration of symbol $f<br />
    at t/spec/run/switches.v5:432<br />
    ------&gt;     open my $f⏏, "&gt;$filename" or skip( "Can't write tem<br />
Undefined subroutine &amp;main::runperl called<br />
  in block  at t/spec/run/switches.v5:1<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>io/open.v5</td><td>0</td><td>121</td><td>0</td><td>0</td><td>121</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/io/open.v5:116<br />
------&gt;     like( $@, qr/Bad filehandle:\s+ǡﬁlḛ/⏏u,          '       right error' );</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/array.v5</td><td>0</td><td>127</td><td>0</td><td>0</td><td>127</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/array.v5<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')' <br />
at t/spec/op/array.v5:62<br />
------&gt; ok(scalar (($F1,$F2,$Etc) ⏏= ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/)));</td></tr>
        <tr align='center'><td align='left' rowspan='2'>cmd/lexsub.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/cmd/lexsub.v5<br />
Redeclaration of symbol bar<br />
at t/spec/cmd/lexsub.v5:41<br />
------&gt; package bar⏏;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/eval.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/eval.v5<br />
Missing block<br />
at t/spec/op/eval.v5:92<br />
------&gt;      is(eval⏏('"$b"'), $b);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/lc.v5</td><td>0</td><td>128</td><td>0</td><td>0</td><td>128</td></tr>
        <tr><td colspan='5'>Error while reading from file: Malformed UTF-8<br />
   at gen/moar/stage2/NQPHLL.nqp:1296  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm::62)<br />
 from gen/moar/stage2/NQPHLL.nqp:1277  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:evalfiles:59)<br />
 from gen/moar/stage2/NQPHLL.nqp:1204  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_eval:212)<br />
 from src/Perl6/Compiler.nqp:17  (/home/froggs/dev/nqp/install/languages/nqp/lib/Perl6/Compiler.moarvm:command_eval:116)<br />
 from gen/moar/stage2/NQPHLL.nqp:1179  (/home/froggs/dev/nqp/install/languages/nqp/lib/NQPHLL.moarvm:command_line:109)<br />
 from src/gen/m-main.nqp:45  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm:MAIN:18)<br />
 from src/gen/m-main.nqp:41  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::195)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::8)<br />
 from &lt;unknown&gt;:1  (/home/froggs/dev/nqp/install/languages/perl6/runtime/perl6.moarvm::9)<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>japh/abigail.v5</td><td>0</td><td>129</td><td>0</td><td>1</td><td>130</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot assign to a readonly variable or a value<br />
<br />   1 skipped: <br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/state.v5</td><td>0</td><td>131</td><td>0</td><td>0</td><td>131</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Cannot find method 'ast'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tr.v5</td><td>0</td><td>132</td><td>0</td><td>0</td><td>132</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/tr.v5<br />
Couldn't find terminator |<br />
at t/spec/op/tr.v5:202<br />
------&gt;          'LHS bad on updating tr'⏏);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/universal.v5</td><td>0</td><td>139</td><td>0</td><td>0</td><td>139</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Unable to parse expression in declarator; couldn't find final ')' <br />
at t/spec/op/universal.v5:195<br />
------&gt;     tie my($x), ⏏"HumanTie";</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/method.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/method.v5<br />
Two terms in a row<br />
at t/spec/op/method.v5:45<br />
------&gt; is((method $obj ⏏"a","b","c"), "method,a,b,c");</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/range.v5</td><td>0</td><td>141</td><td>0</td><td>0</td><td>141</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Confused<br />
at t/spec/op/range.v5:396<br />
------&gt;  for (1..2) { for (1..4) { $s .= ++$_ } ⏏$s.=' ' if $_==1; }</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/incfilter.v5</td><td>0</td><td>145</td><td>0</td><td>0</td><td>145</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/incfilter.v5<br />
Variable '*_' is not declared<br />
at t/spec/op/incfilter.v5:240<br />
------&gt;     unshift @INC, sub { sub { undef *_⏏; --$| }};</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/parser.v5</td><td>0</td><td>154</td><td>0</td><td>0</td><td>154</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/parser.v5<br />
Unrecognized backslash sequence: '\Q'<br />
at t/spec/comp/parser.v5:115<br />
------&gt; is( "\⏏Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Q\Qa", "a", "PL_le</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/bop.v5</td><td>0</td><td>174</td><td>0</td><td>0</td><td>174</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/bop.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/bop.v5:104<br />
------&gt; is (sprintf("%vd", v4095 &amp; ⏏v801), 801);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sort.v5</td><td>0</td><td>176</td><td>0</td><td>0</td><td>176</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/sort.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/sort.v5:94<br />
------&gt; $x = join('', sort $sub ⏏@harry);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/proto.v5</td><td>0</td><td>180</td><td>0</td><td>0</td><td>180</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/comp/proto.v5<br />
Two terms in a row<br />
at t/spec/comp/proto.v5:47<br />
------&gt; testing ⏏\&amp;no_proto, undef;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/sub_lval.v5</td><td>0</td><td>191</td><td>0</td><td>0</td><td>191</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/sub_lval.v5<br />
Preceding context expects a term, but found infix , instead<br />
at t/spec/op/sub_lval.v5:282<br />
------&gt; ok(!defined,⏏ 'implicitly returning undef in list con</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/switch.v5</td><td>0</td><td>201</td><td>0</td><td>0</td><td>201</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/switch.v5<br />
Confused<br />
at t/spec/op/switch.v5:23<br />
------&gt; e (without feature) and CORE::default" }⏏&lt;EOL&gt;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/subst.v5</td><td>0</td><td>206</td><td>0</td><td>0</td><td>206</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/subst.v5<br />
Two terms in a row<br />
at t/spec/re/subst.v5:14<br />
------&gt; $a = s/david/rules/⏏r;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/gv.v5</td><td>0</td><td>212</td><td>0</td><td>0</td><td>212</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
MVMArray: Index out of bounds<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>uni/overload.v5</td><td>0</td><td>215</td><td>0</td><td>0</td><td>215</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
No such symbol 'stringify'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/ref.v5</td><td>0</td><td>230</td><td>0</td><td>0</td><td>230</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/ref.v5<br />
Unable to parse expression in argument list; couldn't find final ')' <br />
at t/spec/op/ref.v5:48<br />
------&gt;     is ($$⏏$foo, 'valid');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/gv.v5</td><td>0</td><td>245</td><td>0</td><td>0</td><td>245</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
MVMArray: Index out of bounds<br />
</td></tr>
        <tr align='center'><td align='left'>op/cproto.v5</td><td>0</td><td>254</td><td>0</td><td>0</td><td>254</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/hashassign.v5</td><td>0</td><td>309</td><td>0</td><td>0</td><td>309</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/hashassign.v5<br />
Unable to parse expression in term:sym&lt;scalar&gt;; couldn't find final ')' <br />
at t/spec/op/hashassign.v5:361<br />
------&gt;     is( scalar(%h ⏏= (1,1,1)), 3,</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/local.v5</td><td>0</td><td>310</td><td>0</td><td>0</td><td>310</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Shaped arrays not yet implemented. Sorry. <br />
at t/spec/op/local.v5:123<br />
------&gt;     local(@a[4,6]⏏) = ('x', 'z');</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/tie_fetch_count.v5</td><td>0</td><td>312</td><td>0</td><td>0</td><td>312</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Variable '*dummy' is not declared. Did you mean any of these?<br />
    $dummy<br />
    @dummy<br />
at t/spec/op/tie_fetch_count.v5:48<br />
------&gt; *dummy  ⏏=  $var         ; check_count '*glob = $</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/smartmatch.v5</td><td>0</td><td>349</td><td>0</td><td>0</td><td>349</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol @tied_nums<br />
    at t/spec/op/smartmatch.v5:25<br />
    ------&gt; tie my @tied_nums⏏, 'Tie::StdArray';<br />
    Redeclaration of symbol %tied_hash<br />
    at t/spec/op/smartmatch.v5:29<br />
    ------&gt; tie my %tied_hash⏏, 'Tie::StdHash';<br />
Undefined subroutine &amp;main::tie called<br />
  in block  at t/spec/op/smartmatch.v5:19<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/substr.v5</td><td>0</td><td>387</td><td>0</td><td>0</td><td>387</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/op/substr.v5<br />
Lexical symbol '$a' is already bound to an outer symbol;<br />
the implicit outer binding must be rewritten as OUTER::&lt;$a&gt;<br />
before you can unambiguously declare a new '$a' in this scope<br />
at t/spec/op/substr.v5:197<br />
------&gt; my $a ⏏= 'zxcvbnm';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_re_eval.v5</td><td>0</td><td>463</td><td>0</td><td>0</td><td>463</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_re_eval.v5<br />
Variable '$a' is not declared<br />
at t/spec/re/pat_re_eval.v5:44<br />
------&gt;         $a ⏏= qr/(?{++$b})/;</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat.v5</td><td>0</td><td>466</td><td>0</td><td>0</td><td>466</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat.v5:270<br />
------&gt;         my $message = '/g, \⏏G and pos';</td></tr>
        <tr align='center'><td align='left' rowspan='2'>op/taint.v5</td><td>0</td><td>797</td><td>0</td><td>0</td><td>797</td></tr>
        <tr><td colspan='5'>===SORRY!===<br />
Could not find symbol '&amp;SysV'<br />
</td></tr>
        <tr align='center'><td align='left' rowspan='2'>re/pat_rt_report.v5</td><td>0</td><td>2530</td><td>0</td><td>0</td><td>2530</td></tr>
        <tr><td colspan='5'>===SORRY!=== Error while compiling t/spec/re/pat_rt_report.v5<br />
Unrecognized Perl 5 regex backslash sequence<br />
at t/spec/re/pat_rt_report.v5:96<br />
------&gt;         ok("École" =~ /^\⏏C\C(.)/ &amp;&amp; $1 eq 'c', $message);</td></tr>
        <tr align='center'><td align='left' rowspan='2'>comp/utf.v5</td><td>0</td><td>4016</td><td>0</td><td>0</td><td>4016</td></tr>
        <tr><td colspan='5'>Potential difficulties:<br />
    Redeclaration of symbol $fh<br />
    at t/spec/comp/utf.v5:38<br />
    ------&gt;     open my $fh⏏, "&gt;", "utf$$.pl" or die "utf.pl: $!";<br />
It takes about 40 minutes to skip all tests<br />
  in block  at t/spec/comp/utf.v5:1<br />
</td></tr>

        <tr><td>nqp-m --version</td><td colspan='5'>This is nqp version 2014.04-6-g0ef8041 built on MoarVM version 2014.04-11-g4749729
</td></tr>
        <tr><td>perl6-m --version</td><td colspan='5'>This is perl6 version 2014.04-36-g87a6833 built on MoarVM version 2014.04-11-g4749729
</td></tr>
    </tbody>
</table>
