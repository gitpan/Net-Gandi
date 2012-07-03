#
# This file is part of Net-Gandi
#
# This software is copyright (c) 2012 by Natal Ngétal.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Net::Gandi::Operation;
{
  $Net::Gandi::Operation::VERSION = '1.121851';
}

# ABSTRACT: Operation interface

use Moose;
use Net::Gandi::Types Client => { -as => 'Client_T' };

use Carp;


has 'id' => ( is => 'rw', isa => 'Int' );

has client => (
    is       => 'rw',
    isa      => Client_T,
    required => 1,
);


sub info {
    my ( $self ) = @_;

    carp 'Required parameter id is not defined' if ( ! $self->id );
    return $self->client->call_rpc( 'operation.info', $self->id );
}

1;


__END__
=pod

=head1 NAME

Net::Gandi::Operation - Operation interface

=head1 VERSION

version 1.121851

=head1 METHODS

=head2 info

  $operation->info;

Get operation information.

  input: None
  output: (HashRef) : Operation information

=head1 AUTHOR

Natal Ngétal

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Natal Ngétal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

