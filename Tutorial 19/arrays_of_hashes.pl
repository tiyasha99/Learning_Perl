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

    my @test;
    #push(@test, %foods);
    # Prints all values in different variables
    #print(Dumper(@test));
    push(@test, \%foods);
    # Now on pushing the reference, data is printing correctly
    #print(Dumper(@test));

    #printing values
   print($test[0]{"lion"} . "\n");

   # Instead of pushing we could also do

   $test[1] = \%foods;
   print($test[1]{"lion"} . "\n");

}

main();