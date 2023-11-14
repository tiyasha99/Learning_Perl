use strict;
use warnings;
use Getopt::Std;
use Data::Dumper;

sub main() {

    my %opts;
    getopts('rd:', \%opts);

    if(!checkusage(\%opts)) {
        usage();
        exit();
    }

    my $input_dir = $opts{"d"};

    my @files = get_files($input_dir);
    print(Dumper(\@files));
=pod
    In perl, even if you are not returning a value from a function,
    it will return a value. Default is 1.
=cut
    
}

sub get_files {
    my $input_dir = shift;
    # Here <INPUT> is a file handle
    unless(opendir(INPUT, $input_dir)) {
        die "Unable to open dir: $input_dir\n";
    }
    my @files =readdir(INPUT);
    closedir(INPUT);
    # print("Input: $input_dir\n");
    # opendir, readdir, closedir are all builtin subroutines
    # grep will only return files ending in .xml
    @files = grep(/(.+)\.xml$/i, @files);
    return \@files;
}


sub checkusage {
    my $opts_ref = shift;
    
    my $r = $opts_ref->{"r"};
    my $d = $opts_ref->{"d"};

    # r is optional
    # d is mandatory
    unless(defined($d)) {
        return 0;
    }
    return 1;

}

sub usage {
    my $help = <<USAGE;

    usage: perl main.pl <options>
	-d <directory>	specify directory in which to find XML files
	-r	run the program; process the files

    example usage:
	# Process files in currect directory.
	perl finding_all_files_filter_array.pl -d . -r

USAGE
print($help);

}

main();

