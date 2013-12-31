#!perl6

use v6;
my $devnull     = IO::Spec.devnull;
my $have_parrot = shell("perl6-p -e 1 >$devnull 2>$devnull").status == 0;
my $have_moar   = shell("perl6-m -e 1 >$devnull 2>$devnull").status == 0;
my $have_jvm    = 0;

# That goes into the Makefile.
my %config =
    p_perl6           => "PERL6LIB={cwd}/lib perl6-p",
    m_perl6           => "PERL6LIB={cwd}/lib perl6-m",
    p_modules         => '',
    m_modules         => '',
    p_modules_list    => '',
    m_modules_list    => '',
    summary           => '',
;
my regex name { [\w+]+ % '::' };
my regex desc { <-[\n\[]>+ };
my regex deps { '[' <name>+ % ' ' ']' { make $<name>.list>>.Str } };

my %p_module_paths;
my @modules = "build/core_modules".IO.slurp.lines.grep(/^\w/).map({
    /^ <name> ' - ' <desc> <deps>?/;
    { :name(~$<name>), :desc(~$<desc>), :deps($<deps> ?? $<deps>.ast !! []) }
});

my $i = 0;
my $l = 0;
for @modules -> $module {
    my @name_parts         = $module<name>.split('::');
    my $basename           = @name_parts.join('/');
    my $pm                 = "lib/Perl5/$basename.pm";
    my $last               = $i == @modules.end;
    $l                    += $pm.chars + 2;
    my $break_modules_list = !$last && $l > 110;
    $l                     = 0 if $break_modules_list;

    if $have_parrot {
        my $pbc                  = "lib/Perl5/$basename.pbc";
        my $pir                  = "lib/Perl5/$basename.pir";
        %config<p_modules_list> ~= "$pbc ";
        %config<p_modules_list> ~= "\\\n\t" if $break_modules_list;
        my $deps                 = join ' ', $module<deps>>>.map({ 'lib/Perl5/' ~ .split('::').join('/') ~ '.pir' });

        my $mk_path = '';
        for 0..^@name_parts.end {
            my $path = @name_parts[0..$_].join('/');
            $mk_path ~= "\t\$(MKPATH) \$(P_P6LIB)/lib/Perl5/$path\n";
        }

        %config<p_modules> ~= qq:to/P_MODULES/.subst('    ', "\t", :g);
            $pir: $pm $deps
            \t@echo Compiling $module<name> to pir
            \t@\$(P_PERL6) --target=pir --output=$pir $pm
            $pbc: $pir
            \t@echo Compiling $module<name> to pbc
            \t@\$(P_PARROT) -o $pbc $pir
            \$(P_P6LIB)/$pbc: $pbc
            {+@name_parts > 1 ?? $mk_path !! ''}\t\$(CP) $pbc \$(P_P6LIB)/$pbc
            
            P_MODULES

        %config{"p_{$module<name>.substr(0,1).lc}_install"} ~= "\$(P_P6LIB)/$pbc ";
        %config<summary> ~= ' p-summary';
    }

    if $have_moar {
        my $mbc                  = "lib/Perl5/$basename.moarvm";
        %config<m_modules_list> ~= "$mbc ";
        %config<m_modules_list> ~= "\\\n\t" if $break_modules_list;
        my $deps                 = join ' ', $module<deps>>>.map({ 'lib/Perl5/' ~ .split('::').join('/') ~ '.moarvm' });

        my $mk_path = '';
        for 0..^@name_parts.end {
            my $path = @name_parts[0..$_].join('/');
            $mk_path ~= "\t\$(MKPATH) \$(M_P6LIB)/lib/Perl5/$path\n";
        }

        %config<m_modules> ~= qq:to/M_MODULES/.subst('    ', "\t", :g);
            $mbc: $pm $deps
            \t@echo Compiling $module<name> to mbc
            \t@\$(M_PERL6) --target=mbc --output=$mbc $pm
            \$(M_P6LIB)/$mbc: $mbc
            {+@name_parts > 1 ?? $mk_path !! ''}\t\$(CP) $mbc \$(M_P6LIB)/$mbc
            
            M_MODULES

        %config{"m_{$module<name>.substr(0,1).lc}_install"} ~= "\$(M_P6LIB)/$mbc ";
        %config<summary> ~= ' m-summary';
    }

    $i++;
}

my $Makefile = fill_template 'build/Makefile-common.in';
$Makefile   ~= fill_template 'build/Makefile-Parrot.in' if $have_parrot;
$Makefile   ~= fill_template 'build/Makefile-Moar.in'   if $have_moar;
$Makefile   ~= fill_template 'build/Makefile-JVM.in'    if $have_jvm;

"Makefile".IO.spurt: $Makefile;

sub fill_template($file, :%values = %config) {
    my $template = $file.IO.slurp;
    $template .= subst(/ '@' (\w+) '@' /, { %values{$0} // note "unknown key '$0' in '$file'" }, :g)
}

