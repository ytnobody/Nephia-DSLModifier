package PrimalNephia::Plugin::Test::DSLModifier::Around::Prototype;

use PrimalNephia::DSLModifier;
use Carp ();

around base_dir => sub (&@) {
    my $orig = pop;
    my $coderef = shift;
    my $res = $coderef->($orig->(@_));
    return $res;
};

1;
