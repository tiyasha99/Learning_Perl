use strict;
use warnings;
use Data::Dumper;
my @scientists;
my $pay=0;
sub main() {
    
    my $file = 'C:\Users\User1\Learning_Perl\Tutorial 23\test.csv';
    open(INPUT, $file) or die("Can't open file!");
    my $headings = <INPUT>;
    chomp($headings);
    my @headings = split(",", $headings);
    LINE: while(my $line = <INPUT>) {
        chomp $line;
        $line =~ /\S+/ or next;
        $line =~ s/^\s*|\s*$//g;
        $line =~ s/\$|\?|approx\.//g;

        my @line = split(/\s*,\s*/, $line);
        if(scalar(@line) < 3) {
            next;
        }
        foreach my $value(@line){
            if(length($value) == 0){
                next LINE;
            }
        }
        
        for(my $i=0; $i<@headings; $i++) {
            my $heading = $headings[$i];
            my $value = $line[$i];
            print("$heading: $value\n");
        }

    }
    close(INPUT);
}

main();