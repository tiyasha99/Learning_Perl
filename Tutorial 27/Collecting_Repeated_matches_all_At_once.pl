use strict;
use warnings;
use LWP::UserAgent;
use IO::Socket::SSL;

sub main {
    my $ua = LWP::UserAgent->new(cookie_jar=>{});
    $ua->ssl_opts(
    'SSL_verify_mode' => IO::Socket::SSL::SSL_VERIFY_NONE, 
    'verify_hostname' => 0
    );
    my $request = new HTTP::Request('GET', 'https://caveofpython.com/');
    my $response = $ua->request($request);  # Send the request and get the response

    unless($response->is_success) {
        die $response->status_line;
    }
    my $content = $response->decoded_content();
    
    my @classes = $content =~ m|class="([^"']*?)"|ig;
    
    if(@classes == 0) {
        print("No matches!\n");
    }
    else {
        foreach my $class(@classes) {
            print($class . "\n");
        }
    }

}

main();