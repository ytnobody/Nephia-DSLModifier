package PrimalNephia::Plugin::Test::DSLModifier::Around;

use PrimalNephia::DSLModifier;
use Carp ();

around base_dir => sub {
    my $orig = pop;
    my $res = $orig->(@_);
    return "dir=$res";
};

1;
