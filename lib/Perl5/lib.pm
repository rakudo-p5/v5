
use v6.0.0;

module lib { };
our sub EXPORT(*@a) {
    %*CUSTOM_LIB<Perl5>.unshift: @a;
    return ().hash;
}
