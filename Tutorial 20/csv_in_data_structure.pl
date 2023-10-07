use strict;
use warnings;
use Data::Dumper;

sub main() {

    my $input = 'C:\Users\User1\Learning_Perl\Tutorial 20\tes.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open file: $input\n";
    }

    <INPUT>;

    my @data;
    while(my $line = <INPUT>) {
        chomp($line);

        my ($name, $payment, $date) = split(/\s*,\s*/, $line);
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
    print $data[3]{"Name"};
}
main();