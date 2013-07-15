package Nephia::Plugin::Test::DSLModifier::Around::Prototype;

use Nephia::DSLModifier;
use Carp ();

around base_dir => sub (&@) {
    my $orig = pop;
    my $coderef = shift;
    my $res = $coderef->($orig->(@_));
    return $res;
};

1;
