<%doc>
###############################################################################

=head1 NAME

/widgets/server/callback.mc - Server Callback to delete Servers.

=head1 VERSION

$Revision: 1.1 $

=head1 DATE

$Date: 2001-09-06 21:52:27 $

=head1 SYNOPSIS

  $m->comp('/widgets/servers/callback.mc', %ARGS);

=head1 DESCRIPTION

This element is called by submits from the Distribution Profile, where one or
more servers have been marked for deletion.

=head1 REVISION HISTORY

$Log: callback.mc,v $
Revision 1.1  2001-09-06 21:52:27  wheeler
Initial revision

</%doc>

<%once>;
my $type = 'server';
my $disp_name = get_disp_name($type);
my $class = get_package_name($type);
my $dest_class = get_package_name('dest');
</%once>

<%args>
$widget
$field
$param
</%args>

<%init>;
return unless $field eq "$widget|delete_cb";
my $dest = $dest_class->lookup({ id => $param->{dest_id} });
chk_authz($dest, EDIT);
foreach my $id (@{ mk_aref($param->{$field}) }) {
    my $s = $class->lookup({ id => $id }) || next;
    $s->del;
    $s->save;
    log_event('server_del', $s);
}
return;
</%init>
