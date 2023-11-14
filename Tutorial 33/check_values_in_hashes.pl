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


sub checkusage {
    my $opts = shift;

    my $a = $opts -> {'a'};
    my $b = $opts -> {'b'};
    my $c = $opts -> {'c'};

    # Image c is optional; don't really need to refer to it here at all.

	# a is mandatory: it means "run the program"
	# b is mandatory.

    unless(defined($b) and defined($a)) {
        print("b and a not defined\n");
        return 0;
    }

    unless($a =~ /\.xml$/i) {
        print "Input file must have the extension .xml\n";
		return 0;
    }
    return 1;


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

