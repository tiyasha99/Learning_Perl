use strict;
use warnings;
use Data::Dumper;

sub main() {
    my @animals = ('dog', 'cat', 'rabbit');
    my @fruits = ('apple', 'banana', 'grapes');
    my @values;
    
    # Taking individual contents and pushing into @values
    push(@values, @animals);
    push(@values, @fruits);
    print(Dumper(@values));

    # Putting a \ takes a reference to the arrays
    # And a reference is a scalar value

    my $animal_ref = \@animals;
    my $fruits_ref = \@fruits;

    #Say you want to print dog name with ref
    print $animal_ref -> [0] . "\n";

    my @array_of_array;
    push(@array_of_array, $animal_ref);
    push(@array_of_array, $fruits_ref);
    
    print(Dumper(@array_of_array));  # Print the contents of @array_of_array
}

main();