See http://perldoc.perl.org/perlsyn.html#Compound-Statements

*Note* LABELs are not supported yet, but can and should be implemented
in rakudo and v5 at the same time.

Done:

    if (EXPR) BLOCK
    if (EXPR) BLOCK else BLOCK
    if (EXPR) BLOCK elsif (EXPR) BLOCK ...
    if (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK
    unless (EXPR) BLOCK
    unless (EXPR) BLOCK else BLOCK
    unless (EXPR) BLOCK elsif (EXPR) BLOCK ...
    unless (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK
    LABEL while (EXPR) BLOCK
    LABEL for (EXPR; EXPR; EXPR) BLOCK
    LABEL for VAR (LIST) BLOCK
    LABEL foreach (EXPR; EXPR; EXPR) BLOCK
    LABEL foreach VAR (LIST) BLOCK

Almost (LHF):

    given (EXPR) BLOCK
    LABEL until (EXPR) BLOCK

Todo:

    LABEL while (EXPR) BLOCK continue BLOCK
    LABEL until (EXPR) BLOCK continue BLOCK
    LABEL for VAR (LIST) BLOCK continue BLOCK
    LABEL foreach VAR (LIST) BLOCK continue BLOCK
    LABEL BLOCK
    LABEL BLOCK continue BLOCK
    PHASE BLOCK
