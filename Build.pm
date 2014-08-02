use v6;
#~ use Panda::Common;
#~ use Panda::Builder;

my class X::Perl5::CannotBuildModule is Exception {
    has $.cmd;
    has $.module;
    method message {
        "ERROR: Cannot build $!module<name>, failing command was:\n\t$!cmd"
    }
}

my $perl6 = "$*EXECUTABLE -I{cwd}/lib";

#~ class Build is Panda::Builder {
class Build {
    method build(|) {
        my grammar CoreModules {
            token TOP     { [ <line> | <.comment> | <.blank> ]+ }
            token line    { ^^ <name> ' - ' <desc> <deps>? \n? }
            token comment { ^^ '#' \N+ \n? }
            token blank   { ^^ \n? }
            token name    { [\w+]+ % '::' }
            token desc    { <-[\n\[]>+ }
            token deps    { '[' <name>+ % ' ' ']' }
        }
        my class CoreModulesAction {
            method TOP($/)  { make $<line>».ast }
            method line($/) { make { :name($<name>.ast), :desc($<desc>.ast), :deps($<deps>.?ast // []) } }
            method name($/) { make ~$/ }
            method desc($/) { make ~$/ }
            method deps($/) { make $<name>.list».ast }
        }

        say "==> Parsing list of modules and their dependencies";
        my @modules      = CoreModules.parse( "build/core_modules".IO.slurp, :actions(CoreModulesAction) ).ast;
        my @core_modules = { :name<Perl5::World>, :deps([]), :is_nqp },
                           { :name<Perl5::Actions>, :deps([<Perl5::World>]), :is_nqp },
                           { :name<Perl5::Grammar>, :deps([<Perl5::Actions>]), :is_nqp },
                           { :name<Perl5::ModuleLoader>, :deps([]), :is_nqp },
                           { :name<Perl5>, :deps([<Perl5::Actions Perl5::ModuleLoader>]), :is_nqp };
        my @build_order;

        say "==> Generating build order";
        while @build_order < @modules {
            for @modules.kv -> $i, $module {
                # This module was already built, skip it.
                my @build_names = @build_order.map({ $_<name> });
                next if $module<name> eq any @build_names;
                # All deps were already built, so let us continue.
                next unless (@($module<deps>) (&) @build_names) ~~ @($module<deps>);
                # We can build it now! \o/
                @build_order.push: $module;
            }
        }

        my $i = 0;
        my $l = 0;
        my %build_time;
        for @core_modules, @build_order -> $module {
            my $is_nqp     = $module<is_nqp>;
            my @name_parts = $module<name>.split('::');
            my $basename   = @name_parts.join('/');
            my $pm         = $is_nqp ?? "src/$basename.pm" !! "src/Perl5/$basename.pm";
            my $bc         = ($is_nqp ?? 'lib/' !! 'lib/Perl5/') ~ "{$basename}.pm.{$*VM.precomp-ext}";
            my $dir        = $bc.split('/')[0..(*-2)].join('/');

            %build_time{$module<name>} //= $bc.IO.e ?? $bc.IO.changed !! 0;

            next if $bc.IO.e && (!$module<deps>.elems
                              || %build_time{$module<name>} >= all @($module<deps>).map({ %build_time{$_} }));

            shell("mkdir -p $dir") unless $dir.path.d;

            say "Compiling ({$i}) $module<name> to $*VM.precomp-target()";
            my $cmd = $perl6 ~ " --target=$*VM.precomp-target() --output=$bc $pm";
            shell($cmd).status == 0
                or die X::Perl5::CannotBuildModule.new( :$module, :$cmd);
            %build_time{$module<name>} = nqp::time_n;

            NEXT { $i++ }
        }
    }
}

multi MAIN('build') {
    Build.build
}

multi MAIN('test') {
    
}

multi MAIN('summary') {
    %*ENV<V5DEBUG>   = '0';
    %*ENV<STATUS_MD> = 'STATUS-' ~ $*VM.name.substr(0,1) ~ '.md';
    %*ENV<PERL6_EXE> = $perl6;
    shell 'perl t/test_summary'
}

multi MAIN('clean') {
    my sub recurse-and-clean($path) {
        if $path.d {
            recurse-and-clean($_) for $path.contents
        }
        elsif $path ~~ / '.' <{$*VM.precomp-ext}> $/ {
            unlink $path
        }
    }
    recurse-and-clean('blib'.path);
    recurse-and-clean('lib'.path)
}

multi MAIN('install') {
    
}
