use strict;
use warnings;
use Data::Dumper;
my @scientists;
my $pay=0;
sub main() {
    
    my $file = 'C:\Users\User1\Learning_Perl\Tutorial 23\test.csv';
    open(INPUT, $file) or die("Can't open file!");
    my @names = split(",", <INPUT>);
    chomp($names[2]);
    LINE: while(my $line = <INPUT>) {
        chomp $line;
        $line =~ /\S+/ or next;
        $line =~ s/^\s*|\s*$//g;
        $line =~ s/\$|\?|approx\.//g;
        # Read line and print
        # print $line . "\n";
        # Get all values in variables and print
        # my ($name, $payment, $date) = split(/\s*,\s*/, $line);
        # print("Name: $name Payment:$payment Date:$date \n");

        my @line = split(/\s*,\s*/, $line);
        if(scalar(@line) < 3) {
            next;
        }
        foreach my $value(@line){
            if(length($value) == 0){
                next LINE;
            }
        }
        

      
        my ($name, $payment, $date) = @line;
        my %data = (
            $names[0]=> $name,
            $names[1]=> $payment,
            $names[2]=> $date,
        );
        push(@scientists, \%data);
        $pay = $pay + $payment;

    }
    print(Dumper(@scientists));
    print($pay . "\n");
    close(INPUT);
}

main();