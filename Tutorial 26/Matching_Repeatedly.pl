use strict;
use warnings;
use LWP::UserAgent;
use IO::Socket::SSL;

=pod
m| # Use a pipe character as the quote, since we don't need to use it inside the regex.
		<\s*a\s+ # Match the opening <a, with or without space around the 'a'
		[^>]* # Match any amount of gumpf, as long as it's not the closing angle bracket quote
		
		href\s*=\s* # Match href=, with or without space around the '='
		
		['"] # Match either a single or double quote
		
		([^>"']+) # Match any text, as long as it doesn't include a closing '>' bracket or a quote
		
		['"] # Close the quote
		
		[^>]*> # Match anything other than the closing bracket, followed by the closing bracket.
	
	\s*([^<>]*)\s*</ # Match the hyperlinked text; any characters other than angle brackets
	
	|sigx # s: match across new lines; i: case insensitive match; g: global (repeated) match; x:
     allow whitespace and comments 
=cut

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
    # // by default means you are matching a regex
    # if you are using any other character like | in this case,
    # to identify it as a regex you have to put 'm' in front
    # g - global
    # i - Ignore case
    # s - Treat new lines as just another character in 
    # <a href="http://news.bbc.co.uk">BBC News</a>
	# []<>
    while($content =~ m|\s*<a\s+[^>]*href\s*=\s*['"]([^>'"]+)['"][^>]*>([^<>]*)</|isg) {
        print("$2: $1 \n");
    }

}

main();