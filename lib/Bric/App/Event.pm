package Bric::BL::Event;

=head1 NAME

Bric::BL::Event - Exports simple functions for managing events.

=head1 VERSION

$Revision: 1.1 $

=cut

# Grab the Version Number.
our $VERSION = substr(q$Revision: 1.1 $, 10, -1);

=head1 DATE

$Date: 2001-09-06 21:52:58 $

=head1 SYNOPSIS

  use Bric::BL::Event qw(:all);
  log_event($name, $obj, $init);
  commit_events();

=head1 DESCRIPTION



=cut

################################################################################
# Dependencies
################################################################################
# Standard Dependencies
use strict;

################################################################################
# Programmatic Dependences
use Bric::BL::Session qw(get_user_object);
use Bric::Util::Event;
use Bric::Util::Time qw(:all);

################################################################################
# Inheritance
################################################################################
use base qw(Exporter);
our @EXPORT_OK = qw(log_event commit_events clear_events);
our %EXPORT_TAGS = (all => \@EXPORT_OK);

################################################################################
# Function and Closure Prototypes
################################################################################

################################################################################
# Constants
################################################################################
use constant DEBUG => 0;

################################################################################
# Fields
################################################################################
# Public Class Fields
our $events = [];

################################################################################
# Private Class Fields
#my $events = [];

################################################################################

################################################################################
# Instance Fields


################################################################################
# Class Methods
################################################################################

=head1 INTERFACE

=head2 Constructors

NONE.

=head2 Destructors

=over 4

=item $p->DESTROY

Dummy method to prevent wasting time trying to AUTOLOAD DESTROY.

B<Throws:> NONE.

B<Side Effects:> NONE.

B<Notes:> NONE.

=back

=cut

sub DESTROY {}

################################################################################

=head2 Public Class Methods

NONE.

=head2 Public Functions

=over 4

=item my $bool = log_event($key_name, $obj, $init)

Queues an event for logging. Pass in the following arguments:

=over 4

=item $key_name

The key name of the event to log. Required.

=item $obj

The object for which the event is being logged. Required.

=item $init

The attribute values for this event. Required for those event types that require
them. See Bric::Util::EventType and Bric::Util::Event for more information.

B<Throws:> NONE.

B<Side Effects:> NONE.

B<Notes:> NONE.

=back

=cut

sub log_event {
    my ($key_name, $obj, $attr) = @_;
    push @$events, { key_name  => $key_name,
		     obj       => $obj,
		     attr      => $attr,
		     user      => get_user_object(),
		     timestamp => strfdate(),
		   };
}

=item my $bool = commit_events()

Goes through the queue of events created by calls to log_event() and actually
logs them to the database.

B<Throws:> See Bric::Util::Event::new().

B<Side Effects:> NONE.

B<Notes:> NONE.

=cut

sub commit_events {
    foreach (@$events) { Bric::Util::Event->new($_) }
    @$events = ();
    return 1;
}

=item my $bool = clear_events()

Deletes queue of events so that they won't be logged. Used to prevent event
logging when an error has occurred and all changes have been rolled back.

B<Throws:> NONE.

B<Side Effects:> NONE.

B<Notes:> NONE.

=cut

sub clear_events {
    @$events = ();
    return 1;
}

=back

=head1 PRIVATE

=head2 Private Class Methods

NONE.

=head2 Private Instance Methods

NONE.

=head2 Private Functions

NONE.

=cut

1;
__END__

=head1 NOTES

NONE.

=head1 AUTHOR

David Wheeler <david@wheeler.net>

=head1 SEE ALSO

perl(1),
Bric (2),
Bric::Util::Event(3)

=head1 REVISION HISTORY

$Log: Event.pm,v $
Revision 1.1  2001-09-06 21:52:58  wheeler
Initial revision

=cut
