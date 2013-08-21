package PrimalNephia::Plugin::Test::DSLModifier::BeforeAfter;

use PrimalNephia::DSLModifier;

before base_dir => sub { print "foo" };
after base_dir => sub { print "bar" };

1;
