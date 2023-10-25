use strict;
use warnings;
use Data::Dumper;

sub main() {

    my $input = 'C:\Users\User1\Learning_Perl\Tutorial 22\tes.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open file: $input\n";
    }

    <INPUT>;

    my @data;

LINE:    while(my $line = <INPUT>) {
        # Begining with s means a substitution expression
        # If there is one or more space at the begining of the line
        # Replace it with nothing
        # $line =~ s/^\s*//;
        # $line =~ s/\s*$//;

        # We could write the above as below
        # g means global
        # global means match with as many occurrences as possible
        $line =~ s/^\s*|\s*$//g;
        $line =~ s/\?|approx\.|\$//g;
        print($line . "\n");
        
        $line =~ /\S+/ or next;
        chomp($line);
        my @values = split(/\s*,\s*/, $line);
        if(@values < 3) {
            print("Invalid line.\n");
            print(Dumper(@values));
            next;
        }

        for my $value(@values) {
            if($value eq '') {
                print("Invalid line.\n");
                # jump to LINE lable
                # If we did not use the label, it would skip to the next iteration 
                # of this for loop instead of the while loop at the top
                next LINE;
            }
        }

        my ($name, $payment, $date) = @values;
        my %values = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date,
        );
        push(@data, \%values);
    }
    close INPUT;
    for my $data(@data) {
        # Since array data consists of hashes and you pushed it using the reference operator
        # You need an arrow to dereferrence it while accessing the hashes' elements
        print($data->{"Payment"} . "\n");
    }
    # Accessing by index
    print "Descartes: $data[3]{'Name'}; Date: '$data[3]{'Date'}'\n";
}
main();