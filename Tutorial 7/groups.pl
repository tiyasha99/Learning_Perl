use strict;
use warnings;

sub main {
  my $file = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 6\file.txt';

  open(INPUT, $file) or die("Input file not found:$file");

  while(my $line = <INPUT>) {
    # Between parenthesis is a group
    #$1 prints the words that matches the first group
    #$2 prints the words that matches the second group
    # You can use single quotes inside double quotes
    if($line =~ /(I..a.)(...)/) {
      print "First group match: '$1'\nSecond group match:'$2'\n";
    }
  }
  close(INPUT);

}

main ();