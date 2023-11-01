use strict;
use warnings;
use Getopt::Std;
use Data::Dumper;
=pod 
    - pod is plain old documentation
    - Functions don't need to be defined in a particular order
=cut

sub main() {

    my %opts;
    getopts('a:b:c:', \%opts);

    if(!checkusage('Hello', 3)) {
        usage();
    }

}
# To check if the number of arguments have been passed correctly,
# You have to put one '$' for each argument
# For Example:
# Calling function checkusage('Hello', 2)
# Function definition checkusage($$)
sub checkusage() {
    # Getting arguments in the form of an array
    # print(Dumper(@_));
    # my ($string, $number) = @_;
    
    # In Perl, the shift function is used to remove and 
    # return the first element from an array. It shifts 
    # the array by removing the element at index 0 (the first element) 
    # and reindexes the remaining elements.
    my $string = shift; #or shift @_;
    my $number = shift; #or shift @_;
    print("$string $number \n");
    # Returning 0 is like returning false
    return 0;
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

