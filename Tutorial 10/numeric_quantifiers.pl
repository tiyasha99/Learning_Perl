use strict;
use warnings;

sub main( ) {
  # * zero or more of the preceding character, as many as possible
	# + one or more of the preceding, as many as possible
	# *? zero or more of the preceding character, as few as possible
	# +? one or more of the preceding, as few as possible
	# {5} five of the preceding
	# {3,6} at least three and at most 6
	# {3,} at least three 

  my $text = 'DE75883';

 

  if($text =~ /(DE.....)/) {
    print("Matched using .:$1\n");
  }

  #OR

  if($text =~ /(DE\d\d\d\d\d)/) {
    print("Matched using 'slash d':$1\n");
  }

  #OR

  if($text =~ /(DE\d{5})/) {
    print("Matched using numeric quantifier:$1\n");
  }

  # Say we are not sure if the text has 5 digits only. But you know that it has atleast 3 digits
  if($text =~ /(DE\d{3,})/) {
    print("Matched using 'atleast' numeric quantifier:$1\n");
  }

  # But you know that it has atleast 3 digits and atmost 4
  if($text =~ /(DE\d{3,4})/) {
    print("Matched using 'atleast' and at 'atmost' numeric quantifier:$1\n");
  }
  if($text =~ /(DE\d{7})/) {
    print("Nothing will match because these many characters dont exist:$1\n");
  }

}

main();