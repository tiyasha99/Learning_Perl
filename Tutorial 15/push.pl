use strict;
use warnings;

my @array;
# push inserts elements into an array like  queue
push @array,"hello";
push @array,"How are you?";
push @array, "How is your family doing?";

foreach my $line(@array) {
  print $line . "\n";
}