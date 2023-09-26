use strict;
use warnings;
use Data::Dumper;

my $FILE = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 12\test.csv';
open(INPUT, $FILE) or die "Can't open$FILE: $FILE\n";
<INPUT>;
 # To store the lines along the way
 my @lines;

sub main() {

  my $count = 0;
  while(my $line = <INPUT>) {
    chomp $line;
    my @values = split /\s*,\s*/, $line;
    # You did not need to give a size to the array
    # Adding all the lines to an array
    $lines[$count] = $line;
    $count++;
    #print Dumper(@values);
  }
  close INPUT;
  
}

sub using_push() {

  while(my $line = <INPUT>) {
    chomp $line;
    my @values = split /\s*,\s*/, $line;
    push @lines, $line;
  
  }
}


#main();
using_push();
# Printing each element of an array
foreach my $line(@lines) {
  print $line . "\n";
}
