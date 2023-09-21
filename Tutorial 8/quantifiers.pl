use strict;
use warnings;

sub main() {

  my $file = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 6\file.txt';

  open(INPUT, $file) or die("Input file not found:$file\n");
  while(my $line = <INPUT>) {
    # Plus(+) is a quantifier showing how many times you want to match the regex
    # Here I want two consecutive 'l'
    # if($line =~ /(l+)/) {
    #   print "$1\n";  
    # }
    # Dot means any character
    # Dot star means zero or more as much as possible of any character
    # if($line =~ /(s.*n)/){
    #   print "$1\n"; 
    # }
    # Dot star question mark zero or more of any character but as little as possible compatible with matching
    # the rest of the expression
    if($line =~ /(s.*?n)/){
      print "$1\n"; 
    }
    

  }
  close(INPUT);
}

main();