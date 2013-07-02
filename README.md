# NAME

Nephia::DSLModifier -  DSL Modifier feature for Nephia

# SYNOPSIS

    use Nephia::DSLModifier;
    

    # fetch coderef of "res" DSL
    my $coderef = origin 'res';
    

    # add logic before "res" DSL
    before 'res' => sub {
        ...
    };
    

    # add logic after "res" DSL
    after 'res' => sub {
        ...
    };
    

    # modify "res" DSL
    around 'res' => sub {
        my $origin = pop;
        my $reponse = $origin->( @_ );
        ...
        return $response;
    };

# DESCRIPTION

Nephia::DSLModifier provides modifier commands that modifies Nephia DSL.

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
