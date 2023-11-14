use strict;
use warnings;
use Getopt::Std;
use Data::Dumper;

sub main() {

    my %opts;
    getopts('a:b:c', \%opts);

    if(!checkusage(\%opts)) {
        usage();
    }
=pod
	perl parse.pl -a -f test.xml -c
	
	a => 1
	c => 1
	f => test.xml
=cut

	my $opts_ref = \%opts;
	
	# # Use hash directly.
	# print $opts{"a"} . "\n";
	
	# # Use reference to hash
	# print $opts_ref->{"a"} . "\n";

}


sub checkusage() {
=pod
    This will split the hash into various elements like
    PS C:\Users\User1\Learning_Perl\Tutorial 32> perl passing_hash_as_an_argument.pl -a test.xml -b 3 -c lala
    $VAR1 = 'c';
    $VAR2 = 'lala';
    $VAR3 = 'a';
    $VAR4 = 'test.xml';
    $VAR5 = 'b';
    $VAR6 = '3';
    PS C:\Users\User1\Learning_Perl\Tutorial 32> 
    print(Dumper(@_));
    we cant do my %opts = shift; because what we are 
    receiving is key and values as seperate elements in an array
    Here we are trying to assign a value say 'a' to a hash
    which is wrong and will throw error
=cut   
=pod
    This method is not efficient in terms of memory or CPU
    Here we are first breaking the hash into an array and 
    then rebuilding the hash
    my %opts = @_;
    print($opts{"a"});
=cut
    my $opts_ref = shift;
    print($opts_ref -> {'a'} . "\n" . $opts_ref -> {'b'} . "\n" . $opts_ref -> {"c"});


}

sub usage {
    # Multiline string
    # USAGE is just a label to identify the start and end of a string
    my $help = <<USAGE;

    usage: perl main.pl <options>
	-a <file name>	specify XML file name to parse
	-b	turn off error checking

    example usage:
	perl main.pl -f test.xml -a

USAGE
    die $help;
    #OR
    #exit()

}

main();

