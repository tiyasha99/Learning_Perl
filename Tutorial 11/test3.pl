use strict;
use warnings;

sub main() {

  # atleast 1 alphanumeric character
  # 1 @ sign
  # atleast 1 alphanumeric character
  # followed by a .
  # atleast 1 more alphanumeric character

  my @emails = ('tiyashadas369@gmail.com','@gmail..com',
                'tiyashadas391@gmail.com','@@..//');
  
  for my $email(@emails) {
    if($email =~ /(\w+)@(\w+).(\w+)/) { #/\w+\@\w+\.\w+/
      print "Valid email: $email\n";
    }
    else {
      print "Invalid email: $email\n";
    }
  }

}

main();