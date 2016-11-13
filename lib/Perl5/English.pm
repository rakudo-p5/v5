
use v6;

sub EXPORT(|) {
    use Perl5::Terms;

    my %ex;
    %ex<$INPUT_RECORD_SEPARATOR> := $*INPUT_RECORD_SEPARATOR;
    %ex<$RS>                     := $*INPUT_RECORD_SEPARATOR;
    %ex<$PROCESS_ID>             := $*PID;
    %ex<$PID>                    := $*PID;
    {
        use v5;
        $ex{'$SUBSCRIPT_SEPARATOR'}     = $;; # XXX do binding instead of assignment
        $ex{'$SUBSEP'}                  = $;;
        $ex{'$OUTPUT_AUTOFLUSH'}        = $|;
        $ex{'$CHILD_ERROR'}             = $?;
        $ex{'$ACCUMULATOR'}             = $^A;
        $ex{'$COMPILING'}               = $^C;
        $ex{'$DEBUGGING'}               = $^D;
        $ex{'$EXTENDED_OS_ERROR'}       = $^E;
        $ex{'$SYSTEM_FD_MAX'}           = $^F;
        $ex{'$INPLACE_EDIT'}            = $^I;
        $ex{'$FORMAT_FORMFEED'}         = $^L;
        $ex{'$LAST_SUBMATCH_RESULT'}    = $^N;
        $ex{'$OSNAME'}                  = $^O;
        $ex{'$PERLDB'}                  = $^P;
        $ex{'$LAST_REGEXP_CODE_RESULT'} = $^R;
        $ex{'$EXCEPTIONS_BEING_CAUGHT'} = $^S;
        $ex{'$BASETIME'}                = $^T;
        $ex{'$PERL_VERSION'}            = $^V;
        $ex{'$EXECUTABLE_NAME'}         = $^X;
        $ex{'$WARNING'}                 = $^W;
    }
    %ex
}
