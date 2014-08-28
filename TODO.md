## Regressions by switching from NQP to Perl 6

```perl6
perl6-m -Ilib -e 'use v5; $_ = "abc"; s/[ba]+/d/; say'
Iteration past end of iterator
```
