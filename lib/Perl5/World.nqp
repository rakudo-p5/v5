
class Perl5::World {
    # Given a sigil and the the value type specified, works out the
    # container type (what should we instantiate and bind into the
    # attribute/lexpad), bind constraint (what could we bind to this
    # slot later), and if specified a constraint on the inner value
    # and a default value.
    our sub container_type_info($/, $sigil, @value_type, $shape?) {
        my %info;
        if $sigil eq '@' {
            %info<container_base> := $*W.find_symbol(['Array']);
            %info<bind_constraint> := $*W.find_symbol(['Positional']);
            if @value_type {
                %info<container_type> := $*W.parameterize_type_with_args(
                    %info<container_base>, [@value_type[0]], nqp::hash());
                %info<bind_constraint> := $*W.parameterize_type_with_args(
                    %info<bind_constraint>, [@value_type[0]], nqp::hash());
                %info<value_type> := @value_type[0];
                %info<default_value> := @value_type[0];
            }
            else {
                %info<container_type> := %info<container_base>;
                %info<value_type> := $*W.find_symbol(['Any']);
                %info<default_value> := $*W.find_symbol(['Any']);
            }
            %info<default_value> := %info<value_type>;
            if $shape {
                $*W.throw($/, 'X::Comp::NYI', feature => 'Shaped arrays');
            }
        }
        elsif $sigil eq '%' {
            %info<container_base> := $*W.find_symbol(['Hash']);
            %info<bind_constraint> := $*W.find_symbol(['Associative']);
            if $shape {
                @value_type[0] := $*W.find_symbol(['Any']) unless +@value_type;
                my $shape_ast := $shape[0].ast;
                if $shape_ast.isa(QAST::Stmts) {
                    if +@($shape_ast) == 1 {
                        if $shape_ast[0].has_compile_time_value {
                            @value_type[1] := $shape_ast[0].compile_time_value;
                        } elsif (my $op_ast := $shape_ast[0]).isa(QAST::Op) {
                            if $op_ast.op eq "call" && +@($op_ast) == 2 {
                                if !nqp::isconcrete($op_ast[0].value) && !nqp::isconcrete($op_ast[1].value) {
                                    $*W.throw($/, 'X::Comp::NYI',
                                        feature => "coercive type declarations");
                                }
                            }
                        } else {
                            $*W.throw($/, "X::Comp::AdHoc",
                                payload => "Invalid hash shape; type expected");
                        }
                    } elsif +@($shape_ast) > 1 {
                        $*W.throw($/, 'X::Comp::NYI',
                            feature => "multidimensional shaped hashes");
                    }
                } else {
                    $*W.throw($/, "X::Comp::AdHoc",
                        payload => "Invalid hash shape; type expected");
                }
            }
            if @value_type {
                %info<container_type> := $*W.parameterize_type_with_args(
                    %info<container_base>, @value_type, nqp::hash());
                %info<bind_constraint> := $*W.parameterize_type_with_args(
                    %info<bind_constraint>, @value_type, nqp::hash());
                %info<value_type> := @value_type[0];
                %info<default_value> := @value_type[0];
            }
            else {
                %info<container_type> := %info<container_base>;
                %info<value_type> := $*W.find_symbol(['Any']);
                %info<default_value> := $*W.find_symbol(['Any']);
            }
        }
        elsif $sigil eq '&' {
            %info<container_base> := $*W.find_symbol(['Scalar']);
            %info<container_type> := %info<container_base>;
            %info<bind_constraint> := $*W.find_symbol(['Callable']);
            if @value_type {
                %info<bind_constraint> := $*W.parameterize_type_with_args(
                    %info<bind_constraint>, [@value_type[0]], nqp::hash());
            }
            %info<value_type> := %info<bind_constraint>;
            %info<default_value> := $*W.find_symbol(['Any']);
            %info<scalar_value> := $*W.find_symbol(['Any']);
        }
        elsif $sigil eq '*' {
            %info<container_base> := $*W.find_symbol(['Typeglob']);
            %info<container_type> := %info<container_base>;
            if @value_type {
                %info<bind_constraint> := @value_type[0];
                %info<value_type> := @value_type[0];
                %info<default_value> := $*PACKAGE; #@value_type[0];
            }
            else {
                %info<bind_constraint> := $*W.find_symbol(['Mu']);
                %info<value_type> := $*W.find_symbol(['Any']);
                %info<default_value> := $*PACKAGE; #@value_type[0];
            }
            %info<scalar_value> := %info<default_value>;
        }
        else {
            %info<container_base> := $*W.find_symbol(['Scalar']);
            %info<container_type> := %info<container_base>;
            if @value_type {
                %info<bind_constraint> := @value_type[0];
                %info<value_type> := @value_type[0];
                %info<default_value> := @value_type[0];
            }
            else {
                %info<bind_constraint> := $*W.find_symbol(['Mu']);
                %info<value_type> := $*W.find_symbol(['Any']);
                %info<default_value> := $*W.find_symbol(['Any']);
            }
            %info<scalar_value> := %info<default_value>;
        }
        %info
    }

    # Imports symbols from the specified stash into the current package.
    our sub import($/, %stash, $source_package_name) {
        # What follows is a two-pass thing for historical reasons.
        my $target := $*W.cur_lexpad();
        
        # First pass: QAST::Block symbol table installation. Also detect any
        # outright conflicts, and handle any situations where we need to merge.
        my %to_install;
        my @clash;
        my @clash_onlystar;
        for %stash {
            if $target.symbol($_.key) -> %sym {
                # There's already a symbol. However, we may be able to merge
                # if both are multis and have onlystar dispatchers.
                my $installed := %sym<value>;
                my $foreign := $_.value;
                if $installed =:= $foreign {
                    next;
                }
                if nqp::can($installed, 'is_dispatcher') && $installed.is_dispatcher
                && nqp::can($foreign, 'is_dispatcher') && $foreign.is_dispatcher {
                    # Both dispatchers, but are they onlystar? If so, we can
                    # go ahead and merge them.
                    if $installed.onlystar && $foreign.onlystar {
                        # Replace installed one with a derived one, to avoid any
                        # weird action at a distance.
                        $installed := $*W.derive_dispatcher($installed);
                        $*W.install_lexical_symbol($target, $_.key, $installed, :clone(1));
                        
                        # Incorporate dispatchees of foreign proto, avoiding
                        # duplicates.
                        my %seen;
                        for $installed.dispatchees {
                            %seen{$_.static_id} := $_;
                        }
                        for $foreign.dispatchees {
                            unless nqp::existskey(%seen, $_.static_id) {
                                $*W.add_dispatchee_to_proto($installed, $_);
                            }
                        }
                    }
                    else {
                        nqp::push(@clash_onlystar, $_.key);
                    }
                }
                else {
                    nqp::push(@clash, $_.key);
                }
            }
            else {
                $target.symbol($_.key, :scope('lexical'), :value($_.value));
                $target[0].push(QAST::Var.new(
                    :scope('lexical'), :name($_.key), :decl('static'), :value($_.value)
                ));
                $*W.install_package_symbol($*PACKAGE, $_.key, $_.value);
                $target[0].push(QAST::Op.new(
                    :op('bindkey'),
                    QAST::Op.new( :op('who'), QAST::WVal.new( :value($*PACKAGE) ) ),
                    QAST::SVal.new( :value($_.key) ),
                    QAST::Var.new( :name($_.key), :scope('lexical') )
                ));
                %to_install{$_.key} := $_.value;
                
            }
        }

        if +@clash_onlystar {
            $*W.throw($/, 'X::Import::OnlystarProto',
                symbols             => @clash_onlystar,
                source-package-name => $source_package_name,
            );
        }

        if +@clash {
            $*W.throw($/, 'X::Import::Redeclaration',
                symbols             => @clash,
                source-package-name => $source_package_name,
            );
        }
        
        # Second pass: make sure installed things are in an SC and handle
        # categoricals.
        for %to_install {
            my $v := $_.value;
            
            if nqp::isnull(nqp::getobjsc($v)) { $*W.add_object($v); }
            my $categorical := match($_.key, /^ '&' (\w+) ':<' (.+) '>' $/);
            if $categorical {
                $/.CURSOR.add_categorical(~$categorical[0], ~$categorical[1],
                    ~$categorical[0] ~ ':sym<' ~$categorical[1] ~ '>',
                    $_.key, $_.value);
            }
        }
    }
}

# vim: ft=perl6
