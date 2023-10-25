use strict;
use warnings;
use Data::Dumper;

sub main() {

    my $input = 'C:\Users\User1\Learning_Perl\Tutorial 21\tes.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open file: $input\n";
    }

    <INPUT>;

    my @data;
# Here LINE is a label
LINE:    while(my $line = <INPUT>) {
        # If $line is a non space character continue
        # Else skip the line
        $line =~ /\S+/ or next;
        chomp($line);
        my @values = split(/\s*,\s*/, $line);

        # Checking if all three values are present using length.
        # Explicitly converting @values to a scalar
        # if(scalar(@values) < 3) {
        #     print("Invalid line.\n");
        #     print(Dumper(@values));
        #     next;
        # }

        # We can also do
        # Referencing @values as scalar
        # Implicitly converting it to scalar
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
    print $data[3]{"Name"};
}
main();