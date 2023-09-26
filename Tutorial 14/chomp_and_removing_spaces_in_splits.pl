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

    # the chomp function is used to remove the trailing newline character (\n) from a string. 
    # It is commonly used to process input read from a file or standard input (e.g., user input from the keyboard) 
    # to ensure that the input does not include the newline character, which can interfere with further processing.
    chomp $line;
    #print "'$line'\n";
    # Removing extra spaces in between - we can change "," seperator to regex
    my @values = split /\s*,\s*/, $line;
    
    #In Perl, Dumper typically refers to a function provided by the Data::Dumper module. 
    #The Data::Dumper module is commonly used for debugging and inspecting complex data structures
    # in Perl programs. It allows you to generate human-readable representations of Perl data structures, 
    #making it easier to understand their contents and structure during debugging or testing.
    #in different variables
    print Dumper(@values);
    
  }
  close(INPUT);

}

main()