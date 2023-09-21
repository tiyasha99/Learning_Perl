use strict;
use warnings;

sub main {
  my $input = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 5\text_file.txt';
  my $output_file = 'output.txt';

  open(INPUT, $input) or die "Input file $input not found.\n";
  open(OUTPUT, '>'.$output_file) or die "Output file $output_file can't be created.\n";
  while(my $line = <INPUT>) {
    #print "$line";
    #Replacing
    #i - ignore case
    #g - global
    #s - replace
    #first word to replace between slashes
    #word to replace the first word with
    if($line =~ /am/) {
      $line =~ s/am/AM/ig;
      print OUTPUT $line;
    }
    
    if($line =~ /\bliv\b/) {
      print "Yes it does: $line\n";
    }
  }
  close(INPUT);
  close(OUTPUT);
}
main()