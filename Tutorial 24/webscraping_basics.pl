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
    # m tells perl that inside single quotes there is a regex - m for matches
    if($content =~ m'<a href=".+?">(.+?)</a>'i) {
        my $title = $1;
        print("Title:$title\n");
    }
    else {
        print("Title not found\n");
    }

    #print($content);

}

main();