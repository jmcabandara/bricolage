<%doc>
###############################################################################

=head1 NAME

/widgets/alert_type/callback.mc - Alert Type Callback to delete Alert Types.

=head1 VERSION

$Revision: 1.1 $

=head1 DATE

$Date: 2001-09-06 21:52:00 $

=head1 SYNOPSIS

  $m->comp('/widgets/alert_types/callback.mc', %ARGS);

=head1 DESCRIPTION

This element is called by submits from the Alert Type Manager, where one or
more Alert Types have been marked for deletion.

=head1 REVISION HISTORY

$Log: callback.mc,v $
Revision 1.1  2001-09-06 21:52:00  wheeler
Initial revision

</%doc>

<%once>;
my $type = 'alert_type';
my $disp_name = get_disp_name($type);
my $class = get_package_name($type);
</%once>

<%args>
$widget
$field
$param
</%args>

<%init>;
return unless $field eq "$widget|delete_cb";
foreach my $id (@{ mk_aref($param->{$field}) }) {
    my $at = $class->lookup({ id => $id }) || next;
    if (chk_authz($at, EDIT, 1)) {
	$at->remove;
	$at->save;
	log_event('alert_type_del', $at);
    } else {
	my $name = '&quot;' . $at->get_name . '&quot';
	add_msg("Permission to delete $name denied.");
    }
}
return;
</%init>
