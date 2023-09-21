use strict;
use warnings;

sub main() {

  my $text = "The code for this device is GP8765.";


  # Pick the machine code containing two alphanumeric characters and two digits

  if($text =~ /(\w{2}\d{4})/) {
    print "Found: $1\n";
  }
  else {
    print "Not found!";
  }

  # Match all of the string post "is" uptil the . that you encounter

  if($text =~ /\sis\s(.+?)\./) {
    print("Found second one: $1");
  }

}

main();