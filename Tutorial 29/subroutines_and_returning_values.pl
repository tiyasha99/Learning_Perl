use strict;
use warnings;
use Getopt::Std;
=pod
    - Functions don't need to be defined in a particular order
=cut

sub main() {

    my %opts;
    getopts('a:b:c:', %opts);

    if(!checkusage()) {
        usage();
    }

}

sub checkusage {
    # Returning 0 is like returning false
    return 0;
}

sub usage {
    print("Incorrect options");
}

main();

