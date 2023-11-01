use strict;
use warnings;
use Data::Dumper;
# Getops will allow your arguments to be stored in key-value pairs
use Getopt::Std;

sub main() {

    # All command line arguments in perl come through in an array called ARGV
    #print(Dumper(@ARGV));

    my %opts;
    # Need to find the reference to hash
    # Without colon this just means that f is an option and is supposed to have some value
    # PS C:\Users\User1\Learning_Perl\Tutorial 28> perl .\getting_command_line_options.pl -f test.xml
    # $VAR1 = 'f';
    # $VAR2 = 1;
    # PS C:\Users\User1\Learning_Perl\Tutorial 28> 
    # getopts('f', \%opts);
    # PS C:\Users\User1\Learning_Perl\Tutorial 28> perl .\getting_command_line_options.pl -f test.xml
    # $VAR1 = 'f';
    # $VAR2 = 'test.xml';
    # PS C:\Users\User1\Learning_Perl\Tutorial 28> 
    # getopts('f:', \%opts);
    # if we type an unknown option like getting_command_line_options.pl -a
    # It will output as Unknown Option
    # This is inbuilt in getopts
    # PS C:\Users\User1\Learning_Perl\Tutorial 28> perl .\getting_command_line_options.pl -a
    # Unknown option: a
    # PS C:\Users\User1\Learning_Perl\Tutorial 28> 
    getopts('af:c', \%opts);
    print(Dumper(%opts));
    my $file = $opts{'f'};
    print("The filename is:$file\n");
}

main();