
use v6.0.0;

sub EXPORT(|) {
    use Perl5::Terms;

    my %ex;
    %ex<$INPUT_RECORD_SEPARATOR> := $*INPUT_RECORD_SEPARATOR;
    %ex<$RS>                     := $*INPUT_RECORD_SEPARATOR;
    %ex<$PROCESS_ID>             := $*PID;
    %ex<$PID>                    := $*PID;
    {
        use v5;
        $ex{'$SUBSCRIPT_SEPARATOR'} = $;; # XXX do binding instead of assignment
        $ex{'$SUBSEP'}              = $;;
    }
    %ex
}
