<%doc>
###############################################################################

=head1 NAME

/widgets/profile/desk.mc - Processes submits from Desk Profile

=head1 VERSION

$Revision: 1.1 $

=head1 DATE

$Date: 2001-09-06 21:52:18 $

=head1 SYNOPSIS

  $m->comp('/widgets/profile/desk.mc', %ARGS);

=head1 DESCRIPTION

This element is called by /widgets/profile/callback.mc when the data to be
processed was submitted from the Desk Profile page.

=head1 REVISION HISTORY

$Log: desk.mc,v $
Revision 1.1  2001-09-06 21:52:18  wheeler
Initial revision

</%doc>
<%once>;
my $type = 'desk';
my $wf_type = 'workflow';
my $disp_name = get_disp_name($type);
my $class = get_package_name($type);
my $wf_disp_name = get_disp_name($wf_type);
</%once>
<%args>
$widget
$param
$field
$obj
</%args>
<%init>;
return unless $field eq "$widget|save_cb";
# Grab the element type object and its name.
my $desk = $obj;
my $name = "&quot;$param->{name}&quot;" if $param->{name};
if ($param->{delete}) {
    # Deactivate it.
    $desk->deactivate;
    $desk->save;
    $c->set('__WORKFLOWS__', 0);
    log_event("${type}_deact", $desk);
    add_msg("$disp_name profile $name deleted from all workflows.");
    set_redirect(defined $param->{worflow_id} ?
		 "/admin/profile/workflow/$param->{workflow_id}"
		 : last_page());
} else {
    my $desk_id = $param->{"${type}_id"};
    # Make sure the name isn't already in use.
    my $used;
    if ($param->{name}) {
	my @desks = $class->list_ids({ name => $param->{name} });
	if (@desks > 1) { $used = 1 }
	elsif (@desks == 1 && !defined $desk_id) { $used = 1 }
	elsif (@desks == 1 && defined $desk_id
	       && $desks[0] != $desk_id) { $used = 1 }
	add_msg("The name $name is already used by another $disp_name.")
	  if $used;
    }

    # Roll in the changes.
    $desk->set_name($param->{name}) if exists $param->{name} && !$used;
    $desk->set_description($param->{description}) if exists $param->{description};
    $desk->make_publish_desk if exists $param->{name} && exists $param->{publish};
    unless ($used) {
	$desk->save;
	$c->set('__WORKFLOWS__', 0);
	log_event($type . (defined $param->{desk_id} ? '_save' : '_new'), $desk);
    } else {
	$param->{new_desk} = 1;
	return $desk;
    }
    if (defined $param->{workflow_id}) {
	# It's a new desk for this profile. Add it.
	my $wf = Bric::Biz::Workflow->lookup({ id => $param->{workflow_id} });
	$wf->add_desk({ allowed => [$desk->get_id] });
	$wf->save;
	$c->set('__WORKFLOWS__', 0);
	log_event('workflow_add_desk', $wf, { Desk => $desk->get_name });
	set_redirect("/admin/profile/workflow/$param->{workflow_id}");
    } else {
	set_redirect(last_page());
    }
}
</%init>
