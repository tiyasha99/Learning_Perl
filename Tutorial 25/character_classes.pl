use strict;
use warnings;
=pod
Character classes, also known as character sets or character groups,
 are a concept used in regular expressions (regex) and some programming 
 languages to match a set of characters in a string. They provide a way 
 to define a group of characters that can be matched at a specific position in a string.

In a regular expression, character classes are enclosed in square brackets [ ]. 
Within these brackets, you can specify a list of characters, character ranges, 
or predefined character classes to define what you want to match.

# Ranges
	# [0-9] any number
	# [A-Z] any uppercase letter (in the English alphabet)

# Alternatives
	# [ABC] -- list of alternates
	# [\=\%] - simply list alternatives. Backslash any character that might have a special meaning in regex
	# [A-Za-z_0-9] -- specify alternatives just by listing them; can include ranges.
	


=cut

sub main() {
    my $content = "The 39 Steps - a GREAT book - Colours_15 ==%== ABBCCBBCCABCA";
    # Without character classes
    # if($content =~ /(\d+)/) {
    #     print("Matched: $1\n");
    # }
    # else {
    #     print("Nothing matched");
    # }
    
    # With character classes
    # if($content =~ /([0-9]+)/) {
    #     print("Matched Number: $1\n");
    # }

    # if($content =~ /([A-Z]{2,})/) {
    #     print("Matched upper class characters: $1\n");
    # }
    # if($content =~ /(C[A-Za-z_0-9]{2,})/) {
    #     print("Matched upper class characters: $1\n");
    # }
    # if($content =~ /([\=\%]{2,})/) {
    #      print("Matched ==%==: $1\n");
    # }
    # if($content =~ /([ABC]{3,})/) {
    #      print("Last word: $1\n");
    # }
    
    if($content =~ /([^0-9T\s]{3,})/) {
         print("Match anything except what follows ^: $1\n");
    }
    else {
        print("Nothing matched");
    }
}

main();