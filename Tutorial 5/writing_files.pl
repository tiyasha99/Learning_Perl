use strict;
use warnings;

sub main() {
=pod
In Perl, the my keyword is used to declare a new lexical (or scoped) variable. 
The my keyword gives a variable a limited, localized scope, which means the 
variable is only accessible within the block or scope in which it is defined. 
This is in contrast to global variables, which can be accessed from anywhere
 in the program.
=cut
# To write into a file we need to put a greater than symbol before the filename
#my $output = '>output_file.txt';

=pod
The above approach works, but a person reading the code might mistake the '>'
symbol as part of the file name. So instead we may use simple string concatenation in the open
subroutine
=cut
my $output = 'output_file.txt';


open(OUTPUT, '>'.$output) or die "Can't create $output.\n";
print "Hello\n"; #Prints on the screen
print OUTPUT "Yellow"; # Inserts in output.txt
close(OUTPUT);
}

main();