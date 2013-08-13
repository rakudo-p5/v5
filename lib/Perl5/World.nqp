
class Perl5::World {
    # Given a sigil and the the value type specified, works out the
    # container type (what should we instantiate and bind into the
    # attribute/lexpad), bind constraint (what could we bind to this
    # slot later), and if specified a constraint on the inner value
    # and a default value.
    our sub container_type_info($/, $sigil, @value_type, $shape?) {
        my %info;
        if $sigil eq '@' {
            %info<container_base>  := $*W.find_symbol(['Array']);
            %info<bind_constraint> := $*W.find_symbol(['Positional']);
            if @value_type {
                %info<container_type>  := $*W.parameterize_type_with_args(
                    %info<container_base>, [@value_type[0]], nqp::hash());
                %info<bind_constraint> := $*W.parameterize_type_with_args(
                    %info<bind_constraint>, [@value_type[0]], nqp::hash());
                %info<value_type>      := @value_type[0];
            }
            else {
                %info<container_type> := %info<container_base>;
                %info<value_type>     := $*W.find_symbol(['Mu']);
            }
            if $shape {
                $*W.throw($/, 'X::Comp::NYI', feature => 'Shaped arrays');
            }
        }
        elsif $sigil eq '%' {
            %info<container_base>  := $*W.find_symbol(['Hash']);
            %info<bind_constraint> := $*W.find_symbol(['Associative']);
            if $shape {
                @value_type[0] := $*W.find_symbol(['Mu']) unless +@value_type;
                my $shape_ast := $shape.ast;
                if $shape_ast.isa(QAST::Stmts) && +@($shape_ast) == 1 && $shape_ast[0].has_compile_time_value {
                    @value_type[1] := $shape_ast[0].compile_time_value;
                }
                else {
                    nqp::die("Invalid hash shape; type expected");
                }
            }
            if @value_type {
                %info<container_type>  := $*W.parameterize_type_with_args(
                    %info<container_base>, @value_type, nqp::hash());
                %info<bind_constraint> := $*W.parameterize_type_with_args(
                    %info<bind_constraint>, @value_type, nqp::hash());
                %info<value_type>      := @value_type[0];
            }
            else {
                %info<container_type> := %info<container_base>;
                %info<value_type>     := $*W.find_symbol(['Mu']);
            }
        }
        elsif $sigil eq '&' {
            %info<container_base>  := $*W.find_symbol(['Scalar']);
            %info<container_type>  := %info<container_base>;
            %info<bind_constraint> := $*W.find_symbol(['Callable']);
            if @value_type {
                %info<bind_constraint> := $*W.parameterize_type_with_args(
                    %info<bind_constraint>, [@value_type[0]], nqp::hash());
            }
            %info<value_type>     := %info<bind_constraint>;
            %info<default_value>   := $*W.find_symbol(['Any']);
        }
        else {
            %info<container_base>     := $*W.find_symbol(['Scalar']);
            %info<container_type>     := %info<container_base>;
            if @value_type {
                %info<bind_constraint> := @value_type[0];
                %info<value_type>      := @value_type[0];
                %info<default_value>   := @value_type[0];
            }
            else {
                %info<bind_constraint> := $*W.find_symbol(['Mu']);
                %info<value_type>      := $*W.find_symbol(['Any']);
                %info<default_value>   := $*W.find_symbol(['Any']);
            }
        }
        %info
    }
}

# vim: ft=perl6
