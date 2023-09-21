use strict;
use warnings;
# to stop output buffering
# $|=1
sub main {

  # If we have a long string that contain 
  # characters that perl might interpret to be something else
  # we need to use single quotes. With double quotes perl will 
  # try to interpret any special control sequences that it may think it contains 

  # scalar variable - variable that holds one value
  my $file = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 2\robot.png';

  #Array
  my @files = (
  'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 2\robot.png', 
  'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 2\download_html.pl',
  'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 2\missing.txt',
  );

  # for loop
  foreach my $file(@files) {

    if(-f $file){
    print "Found file: $file\n\n";
  }
    else {
    print "File not found: $file\n\n"
  }

  }
  # -f means check if file exists
  if(-f $file){
    print "Found file: $file\n";
  }
  else {
    print "File not found: $file\n"
  }
}

main();