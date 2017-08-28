#!/usr/bin/perl
use AnyEvent;
use AnyEvent::I3;

# data variables
#
my $clients_no = 0;
#

print "Trying to connect to i3\n";

my $i3 = i3();

if($i3->connect->recv)
{
	print "Connected to i3\n";
}

if($i3->subscribe({
	window => sub {
		my ($c) = @_;

		if($c->{'change'} eq "new")
		{
			$clients_no += 1;
			print "Window created: $clients_no\n";
		}
		elsif($c->{'change'} eq "close")
		{
			$clients_no -= 1;
			print "Window closed: $clients_no\n";
		}
	},
	binding => sub {
		my ($msg) = @_;

		if($msg->{'binding'}->{'command'} eq "nop exit")
		{
			if($clients_no <= 0)
			{
				system("i3-msg exit");
			} else {
				system("i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'");
			}
		}
	},
	_error => sub {
		my ($msg) = @_;
		print "Sorry, but: $msg";
	}
})->recv->{success})
{
	print "Subscribed\n";
}

AE::cv->recv;

# vim:ts=3:sw=3:noet
