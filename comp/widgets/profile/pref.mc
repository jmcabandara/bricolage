<%doc>
###############################################################################

=head1 NAME

/widgets/profile/preferences.mc - Processes submits from Preferences Profile.

=head1 VERSION

$Revision: 1.1 $

=head1 DATE

$Date: 2001-09-06 21:52:21 $

=head1 SYNOPSIS

  $m->comp('/widgets/profile/preferences.mc', %ARGS);

=head1 DESCRIPTION

This element is called by /widgets/profile/callback.mc when the data to be
processed was submitted from the Preferences Profile page.

=head1 REVISION HISTORY

$Log: pref.mc,v $
Revision 1.1  2001-09-06 21:52:21  wheeler
Initial revision

</%doc>

%#-- Once Section --#
<%once>;
my $type = 'pref';
my $disp_name = get_disp_name($type);
</%once>

<%args>
$widget
$param
$field
$obj
</%args>
<%init>;
return unless $field eq "$widget|save_cb";
my $pref = $obj;
my $name = "&quot;" . $pref->get_name . "&quot;";
$pref->set_value($param->{value});
$pref->save;
log_event('pref_save', $pref);
add_msg("$disp_name $name updated.");
set_redirect('/admin/manager/pref');
</%init>
