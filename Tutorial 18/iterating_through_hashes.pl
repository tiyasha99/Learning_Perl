use strict;
use warnings;
use Data::Dumper;

sub main() {

    my %foods = (
        "cats" => "fish",
        "dogs" => "meat",
        "birds" => "seeds",
        "lion" => "deer"
    );
    # We can define an array of variables like this
    my ($one, $two, $three) = (1, 2, 3);
    print $one . "\n";

    while( my ($key, $value) = each %foods) {
        print "$key : $value\n";
    }
 
    # Another way to iterate
    my @animals = keys(%foods);
    print Dumper(@animals);

    # Hashes are not sorted 
    # You can sort it like below using the sort function
    foreach my $key(sort @animals) {
        # print $key . "\n";
        my $value = $foods{$key};
        print "$key:$value\n";
    }

}

main();