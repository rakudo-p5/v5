#!perl6

use v6;
my $devnull     = IO::Spec.devnull;
my $have_parrot = shell("perl6-p -e 1 >$devnull 2>$devnull").status == 0;
my $have_moar   = shell("perl6-m -e 1 >$devnull 2>$devnull").status == 0;
my $have_jvm    = shell("perl6-j -e 1 >$devnull 2>$devnull").status == 0;

# That goes into the Makefile.
my %config =
    p_perl6        => "PERL6LIB={cwd}/lib perl6-p",
    m_perl6        => "PERL6LIB={cwd}/lib perl6-m",
    j_perl6        => "PERL6LIB={cwd}/lib perl6-j",
    p_nqplib       => qqx{nqp-p -e "my \%conf := pir::getinterp__P()[pir::const::IGLOBALS_CONFIG_HASH]; print(\%conf<libdir> ~ \%conf<versiondir> ~ '/languages/nqp');"},
    m_nqplib       => qqx{nqp-m -e "nqp::print(nqp::backendconfig<prefix> ~ '/languages/nqp')"},
    j_nqplib       => qqx{nqp-p -e "nqp::print(nqp::backendconfig<prefix> ~ '/languages/nqp')"},
    p_p6lib        => qqx{perl6-p -e "print \%*CUSTOM_LIB<perl>"},
    m_p6lib        => qqx{perl6-m -e "print \%*CUSTOM_LIB<perl>"},
    j_p6lib        => qqx{perl6-j -e "print \%*CUSTOM_LIB<perl>"},
    p_modules      => '',
    m_modules      => '',
    j_modules      => '',
    p_modules_list => '',
    m_modules_list => '',
    j_modules_list => '',
    p_clean        => {},
    m_clean        => {},
    j_clean        => {},
    summary        => '',
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
    my $pattern            = "lib/Perl5/$basename";
    $pattern              ~~ s{\w+$} = '*';

    if $have_parrot {
        my $pbc                  = "lib/Perl5/$basename.pbc";
        my $pir                  = "lib/Perl5/$basename.pir";
        %config<p_modules_list> ~= "$pbc ";
        %config<p_modules_list> ~= "\\\n\t" if $break_modules_list;
        my $deps                 = join ' ', $module<deps>>>.map({ 'lib/Perl5/' ~ .split('::').join('/') ~ '.pir' });
        %config<p_clean>{"$pattern.pir"} = 1;
        %config<p_clean>{"$pattern.pbc"} = 1;

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
        %config<m_clean>{"$pattern.moarvm"} = 1;

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

    if $have_jvm {
        my $cls                  = "lib/Perl5/$basename.jar";
        %config<j_modules_list> ~= "$cls ";
        %config<j_modules_list> ~= "\\\n\t" if $break_modules_list;
        my $deps                 = join ' ', $module<deps>>>.map({ 'lib/Perl5/' ~ .split('::').join('/') ~ '.jar' });
        %config<j_clean>{"$pattern.jar"} = 1;

        my $mk_path = '';
        for 0..^@name_parts.end {
            my $path = @name_parts[0..$_].join('/');
            $mk_path ~= "\t\$(MKPATH) \$(J_P6LIB)/lib/Perl5/$path\n";
        }

        %config<j_modules> ~= qq:to/J_MODULES/.subst('    ', "\t", :g);
            $cls: $pm $deps
            \t@echo Compiling $module<name> to jar
            \t@\$(J_PERL6) --target=jar --output=$cls $pm
            \$(J_P6LIB)/$cls: $cls
            {+@name_parts > 1 ?? $mk_path !! ''}\t\$(CP) $cls \$(J_P6LIB)/$cls
            
            J_MODULES

        %config{"j_{$module<name>.substr(0,1).lc}_install"} ~= "\$(J_P6LIB)/$cls ";
        %config<summary> ~= ' j-summary';
    }

    $i++;
}
for < p j m > {
    %config{$_ ~ '_clean'} = %config{$_ ~ '_clean'}.keys.join(' ') if %config{$_ ~ '_clean'} # >
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

