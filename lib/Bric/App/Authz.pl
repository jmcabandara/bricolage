#!/usr/bin/perl -w
use Bric::BL::Default qw(:all);
use Bric::BL::Authz qw(:all);
use Bric::BC::Person::User;
use Test;


BEGIN { plan tests => 4 }

eval {
    if (@ARGV) {
	print "Instantiating a user object.\n";
	my $u = Bric::BC::Person::User->lookup({ id => 1 });

	my $obj = Bric::BC::Person::User->lookup({ id => 2 });
	print "I do ", can_i($obj, READ) ? '' : 'not ', "have the permission\n";
	exit;
    }

    # Do the Test::Harness stuff here.
    ok my $u = Bric::BC::Person::User->lookup({ id => 1 });

    ok my $obj = Bric::BC::Person::User->lookup({ id => 2 });
    ok !can_i($obj, READ);
};

if (my $err = $@) {
    print "Error: ", ref $err ? $err->get_msg . ":\n\n" . $err->get_payload
      . "\n" : "$err\n";
}
