use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;
use XML::Simple;

sub main() {

    my %opts;
    getopts('rd:', \%opts);

    if(!checkusage(\%opts)) {
        usage();
        exit();
    }

    my $input_dir = $opts{"d"};

    my @files = get_files($input_dir);
    process_files(\@files, $input_dir);
    #print(Dumper(\@files));
    
}
sub process_files {
    my ($files, $input_dir) = @_;
    # print($input_dir . "\n");
    # print(Dumper($files));
    # Casting reference array to array using @
   	foreach my $file(@$files) {
		process_file($file, $input_dir);
	}

}
sub process_file {
    my ($file, $input_dir) = @_;
    print("Processing $file of $input_dir");
    my $path = "$input_dir/$file";
    open(INPUTFILE, $path) or die "Unable to open $path\n";
    my $c = 0;
    # $/ is a special global perl variable - it is a record seperator
    # reading chunk wise
    undef $/; # Undefining the record seperator so that it reads the file as a whole and not chunk by chunk
    
    my $content = <INPUTFILE>;
    close(INPUTFILE);
    #print($content);
    my $parser = new XML::Simple; # creating an object
=pod
    In perl objects are just glorified hashes 
    we can use a lot of hash syntax with them
    Here parser is a 'blessed hash'
    Since we are creating an object, we can now call the functions of XML::Simple
    """
=cut

    my $dom = $parser->XMLin($content);
    # print(Dumper($dom)); # JSON like stuff
    # hash of hashes

    #print(Dumper($dom->{"book"}));

    while(my($key, $value) = each %{$dom->{"book"}}) {
        print("Book id: $key\n");
        print("Author: $value->{author} Title: $value->{title}\n");
        

    }


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
    return @files;
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

