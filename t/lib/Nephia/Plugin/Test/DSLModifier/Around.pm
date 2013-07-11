package Nephia::Plugin::Test::DSLModifier::Around;

use Nephia::DSLModifier;
use Carp ();

around base_dir => sub {
    my $orig = pop;
    my $res = $orig->(@_);
    return "dir=$res";
};

1;
