use strict;
use warnings;
use Getopt::Std;
=pod 
    - pod is plain old documentation
    - Functions don't need to be defined in a particular order
=cut

sub main() {

    my %opts;
    getopts('a:b:c:', \%opts);

    if(!checkusage(%opts)) {
        usage();
    }

}

sub checkusage() {
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

