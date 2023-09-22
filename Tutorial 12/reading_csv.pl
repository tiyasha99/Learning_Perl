use strict;
use warnings;

sub main {
  my $input = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 12\test.csv';

  unless(open(INPUT, $input)) {
    die "\nCannot open $input\n";
  }

  # Since we are not doing my $line = <INPUT> if we want to print the content that we are parsing we use
  # $_
  # while(<INPUT>) {
  #   print $_;
  # }

  # Remove headers
  <INPUT>; # The angular brackets mean that we are reading a record. But a record by default is interpreted as a line
  # This will just read off the header and do nothing with it

  while(my $line = <INPUT>) {
    my @values = split ',', $line;
    print $values[1] . "\n";
  }
  close(INPUT);
}

main();