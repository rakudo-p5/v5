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
    LABEL while (EXPR) BLOCK continue BLOCK
    LABEL until (EXPR) BLOCK
    LABEL until (EXPR) BLOCK continue BLOCK
    LABEL for (EXPR; EXPR; EXPR) BLOCK
    LABEL for VAR (LIST) BLOCK
    LABEL for VAR (LIST) BLOCK continue BLOCK
    LABEL foreach (EXPR; EXPR; EXPR) BLOCK
    LABEL foreach VAR (LIST) BLOCK
    LABEL foreach VAR (LIST) BLOCK continue BLOCK
    LABEL BLOCK
    LABEL BLOCK continue BLOCK

Almost (LHF):

    given (EXPR) BLOCK

Todo:

    PHASE BLOCK

To make LABELs work, see:

- parrot/compilers/pct/src/PAST/Compiler.pir:1646:    ops.'push_pirop'('new', handreg, "'ExceptionHandler'", "[.CONTROL_LOOP_NEXT;.CONTROL_LOOP_REDO;.CONTROL_LOOP_LAST]")
- parrot/compilers/pct/src/PAST/Compiler.pir:1677:    ops.'push_pirop'('eq', $S0, '.CONTROL_LOOP_NEXT', nextlabel)

- nqp/src/NQP/Actions.pm:1563:    method term:sym<next>($/) { make QAST::Op.new( :op('control'), :name('next') ) }
- nqp/src/QAST/Operations.nqp:1386:    'next', '.CONTROL_LOOP_NEXT',

- rakudo/src/core/control.pm:67:my &next := -> | { 
- rakudo/src/core/control.pm:71:          pir::const::CONTROL_LOOP_NEXT)
