# NAME

Nephia::DSLModifier -  DSL Modifier feature for Nephia

# SYNOPSIS

    use Nephia::DSLModifier;
    

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

# DESCRIPTION

Nephia::DSLModifier provides modifier commands that modifies Nephia DSL.

# FUNCTIONS 

- before $dsl => $coderef
- after $dsl => $coderef
- around $dsl => $coderef

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
