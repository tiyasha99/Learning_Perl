use strict;
use warnings;
use Data::Dumper;

sub main {
    # Look up table like a dictionary
    # Keys in hash can be any type but its most commonly strings and integers
    # Hashes do not have any order, can't be used with indexes
    my %months = (
        "Jan" => 1,
        "Feb" => 2,
        "Mar" => 3,
        "Apr" => 4,
        "Dec" => 6
    );
    # Since we are getting a single value we use curly brackets
    print($months{"Jan"} . "\n");

    my %days = (
        1 => "Monday",
        2 => "Tuesday",
        3 => "Wednesday",
        4 => "Thursday",
    );
    print $days{1} . "\n";

    # keys function will get all the keys
    # iterating hash
    my @months = keys(%months);
    for my $month(@months) {
        my $value = $months{$month};
        print "$month:$value" . "\n";
    }
    # Iterating through while
    while(my ($key,$value) = each %days) {
        print "$key: $value\n";
    }
}

main();