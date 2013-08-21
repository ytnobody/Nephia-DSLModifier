package PrimalNephia::DSLModifier;
use 5.008005;
use strict;
use warnings;
use Carp ();
use Scalar::Util qw/set_prototype/;

our $VERSION = "0.04";

use parent 'Exporter';

our @EXPORT = qw/before around after/;

sub around ($&) {
    PrimalNephia::DSLModifier::_modify(@_);
}

sub before ($&) {
    my ($method_name, $coderef) = @_;
    PrimalNephia::DSLModifier::_modify($method_name, sub {
        my $orig = pop; 
        $coderef->(@_);
        $orig->(@_);
    });
}

sub after ($&) {
    my ($method_name, $coderef) = @_;
    PrimalNephia::DSLModifier::_modify($method_name, sub {
        my $orig = pop; 
        my @res = $orig->(@_);
        $coderef->(@_);
        ( @res );
    });
}

sub _modify {
    my ($method_name, $coderef) = @_;
    my $caller = caller(6);
    no strict 'refs';
    no warnings qw/redefine prototype/;
    my $orig = *{$caller.'::'.$method_name}{CODE} or Carp::croak "specified unsupported DSL '$method_name' on package $caller"; ### anyway, we must use magic...
    my $modifi_coderef = sub { $coderef->(@_, $orig) };
    if (my $proto_str = prototype $coderef) {
        $modifi_coderef = set_prototype sub { $coderef->(@_, $orig) },  $proto_str;
    }
    *{$caller.'::'.$method_name} = $modifi_coderef;
}

1;
__END__

=encoding utf-8

=head1 NAME

PrimalNephia::DSLModifier -  DSL Modifier feature for PrimalNephia

=head1 SYNOPSIS

    use PrimalNephia::DSLModifier;
    
    # add logic before "res" DSL
    before 'res' => sub {
        ... ### do stuff 
    };
    
    # add logic after "res" DSL
    after 'res' => sub {
        ... ### do stuff
    };
    
    # modify "res" DSL
    around 'res' => sub {
        my $origin = pop;
        my $reponse = $origin->( @_ );
        ... ### do stuff
        return $response;
    };

=head1 DESCRIPTION

PrimalNephia::DSLModifier provides modifier commands that modifies PrimalNephia DSL.

=head1 FUNCTIONS 

=over 4 

=item before $dsl => $coderef

=item after $dsl => $coderef

=item around $dsl => $coderef

=back

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

