

use utf8;
use Data::Dump qw(dump);



my $params=@ARGV;

my ($input);

if($params < 1){
  die "Not enough parameters";
}else{
  ($input)= @ARGV;
}


my $file = $input;

#open OUTPUT,  "<:encoding(UTF-8)", $file or die "Can't open $file: $!\n"
open (DAT, "<:encoding(UTF-8)", $file) or die "Can't open $file: $!\n";


open FH, ">", $file.".out.txt" or die "$!\n";


my @array;
my @menu;

sub sort_arr {
    my ($arr) = @_;
    my @sorted_arr = sort { $a->[1] cmp $b->[1] } @{ $arr };
    return @sorted_arr;
}

while (<DAT>){
        #print $_;
		
		#my @line = split(/\s+/, $_);
        #print $line[0];
		my $str = $_;
	   
		my @second = ($str =~ m/([\x{AC00}-\x{D7AF}].*)/g);
		#my @first = ($_ =~ m/([A-Za-z].*)/g);
		my @first = split(/[\x{AC00}-\x{D7AF}]/, $_);
		my @line = ($first[0], $second[0]);
		#my @line = ($first[0]);
		#print $second[0];
        
        push (@menu, \@line);
		#push (@menu, \@array1);
        

}
dump(@menu);

my @sorted = sort_arr(\@menu);

#print dump(@sorted);


foreach (@sorted) {
  print FH "@$_\n";
}
