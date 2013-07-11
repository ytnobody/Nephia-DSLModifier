package Nephia::Plugin::Test::DSLModifier::BeforeAfter;

use Nephia::DSLModifier;

before base_dir => sub { print "foo" };
after base_dir => sub { print "bar" };

1;
