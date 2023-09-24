use strict;
use warnings;

use Data::Dumper;

sub main() {

  my $file = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 12\test.csv';
  open(INPUT, $file);
  # Remove Headers
  <INPUT>;
  # Parsing file
  while(my $line = <INPUT>) {
    my @values = split ',', $line;
    #print $values[1] . "\n";

    # join is oposite of split
    #print join '|', @values;
    
    # Returns a string format from any input data structure
    print Dumper(@values);
    
  }
  close(INPUT);

}

main()