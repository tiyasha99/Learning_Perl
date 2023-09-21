use strict;
use warnings;
=pod
LWP::UserAgent is a Perl module that is part of the libwww-perl (LWP) library, 
which provides a convenient and feature-rich way to make HTTP requests from 
within your Perl programs. It allows you to send HTTP requests to web servers, 
retrieve web content, and interact with web services.
=cut
use LWP::UserAgent;
=pod
IO::Socket::SSL is a Perl module that provides a framework for creating SSL/TLS 
(Secure Sockets Layer/Transport Layer Security) encrypted socket connections. 
It is built on top of the standard Perl IO::Socket module, extending its 
functionality to support secure communication over the network.
=cut
use IO::Socket::SSL;

# Create a new LWP::UserAgent object
# cookie_jar=>{} allows the site to set cookies if it needs to
my $ua = LWP::UserAgent->new(cookie_jar=>{});

# To avoid ssl certificate error message
$ua->ssl_opts(
    'SSL_verify_mode' => IO::Socket::SSL::SSL_VERIFY_NONE, 
    'verify_hostname' => 0
);
# GET request
my $request = new HTTP::Request('GET', 'https://caveofpython.com/');
# ua means user agent. This is like a fake browser without a UI
# Hence we request the fake browser here for data and 
# we see if the request is successful or not.
my $response = $ua->request($request);

# unless is a keyword which is kind of like opposite to if. This means
# if the request was not successful, we will get the status line 
# which will tell us a little more about the problem post which
# and the program quits 
unless($response->is_success()) {
    die $response->status_line();
}

my $content = $response->decoded_content();

print($content);

print("Completed")