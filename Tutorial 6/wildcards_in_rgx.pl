use strict;
use warnings;

sub main() {

  my $file = 'C:\Users\Tiyasha\Desktop\Perl 2023\Tutorial 6\file.txt';
  open(INPUT, $file) or die "Can't read file: $file\n";
  while(my $line = <INPUT>) {
    # 3 letter word beginning with h and s and anything in between
    if($line =~ / h.s.butted /) {
      print $line
    }
  }
  close(INPUT);
}
main();