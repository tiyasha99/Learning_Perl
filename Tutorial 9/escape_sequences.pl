use strict;
use warnings;

# \d digit
	# \s space
	# \S non-space
	# \w alphanumeric
	
	# Some examples; in the following examples,
	# each example shows the text, the regular expression
	# and the output, in that order.
	
	# Digits:
	# 'I am 117 years old tomorrow.'
	# (\d+)
	# Matched: '117'
	
	# Space (will also match a tab)
	# I am 117 years old tomorrow.
	# (am\s*\d+)
	# Matched: 'am 117'
	
	# \S (non space -- note, capital 'S')
	# 'I am 117 years old tomorrow.'
	# (y\S+)
	# Matched: 'years'
	
	# Alphanumeric, including underscore
	# \w
	# 'Iam117yearsold_tomorrow.'
	# (\w*)
	# Matched: 'Iam117yearsold_tomorrow'

sub main {
  # \d will match any single digit
  # \s space
  # \S non-space character
  # \w alphanumeric including the underscore
  my $text = 'I am 117 years old tomorrow.';
  my $text2 = 'Iam117yearsold_tomorrow.';
  
  
  #Extract the numeric part

  # if($text =~ /(\d*)/){
  #   # It will go inside if but it will not print anything
  #   # because * matches 0 or more characters that are preceding it
  #   # So it matches with nothing also (0 characters, first point that it finds in this case the starting of the string)
  #   print "$1\n";
  # }
  
  # Greedy search - One or more of preceding character
  if($text =~ /(\d+)/){
    print("Matched Number:$1\n");
  }
  #Matching "am 117"
  if($text =~ /(am\s\d+)/){
    print("Matched am 117:$1\n");
  }

  # Matching nonspace characters after y
  if($text =~ /(y\S*)/){
    print("Matched y with nonspace:$1\n");
  }
  
  # Matching alphanumeric
  if($text2 =~ /(\w*)/){
    print("Matched am 117:$1\n");
  }
}


main();