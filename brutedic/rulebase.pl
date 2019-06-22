

#my $file = 'Michel_Foucault_The_Order_of_Things.txt';

my @rules;

@rules = ("{w4}{w3}{d2}","{w4}{w3}{d2}");

#print $rules[0];

my $str = $rules[0];

my $used;
my @matches = $str =~ /\{.*?\}/g; 
foreach (@matches) {
    #print "$_\n";
	$str1 = substr($_, 1, 1);
	$str2 = substr($_, 2, 1);
	print $str2;
}