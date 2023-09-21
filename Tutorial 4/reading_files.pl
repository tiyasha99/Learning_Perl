use strict;
use warnings;

sub main {
  my $file = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 4\text_file.txt';

  # close, open and die are all subroutines. You may choose to ot use brackets

  # File handle (INPUT) - Way of referring to a file
  # open(INPUT, $file);

  # Lines after die are not executed and program exits

  # Line number where the program died is displayed
  #die "Input file $file not found.";

  # Line number where the program died is not displayed due to new line(\n)
  #die "Input file $file not found.\n";

  #Another way to do this
  open(INPUT, $file) or die "Input file $file not found.\n";

  # Reads lines from the file until the end of the file
  while(my $line = <INPUT>) {
    print "$line";
    # =~ means contains/matches. The word between two slashes is actually a regex
    # The thing between the two // is what you wanna find
    # if($line =~ /liv/) {
    #   print "Yes it does: $line\n";
    # }

    # Now say i want to print just liv and not words containing liv
    if($line =~ / liv /) {
      print "Yes it does: $line\n";
    }
  }




  close(INPUT);
}

main()