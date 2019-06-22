


my $params=@ARGV;

my ($input);

if($params < 1){
  die "Not enough parameters";
}else{
  ($input)= @ARGV;
}


my $file = $input;

#my $file = 'Michel_Foucault_The_Order_of_Things.txt';

my $dic;

open my $info, $file or die "Could not open $file: $!";

open FH, ">", $file.".out.txt" or die "$!\n";

while( my $line = <$info>)  {   
    if ($line =~ /[a-zA-Z]/i)
    {
          
		
		my @token = split(' ',$line);
		
		if (length($token[0])==5)  #3자리 단어
			{print FH $token[0]."\n"; 
			}
	}
        
}


close FH;


close $info;


sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}


print $file;

open my $fh, $file.".out.txt";
open FH2, '>', $file.".out2.txt";

my @lines = <$fh>;
#print @lines;

#my @array = qw(one two three two three);
my @filtered = uniq(@lines);

#print "@filtered\n";
#my @sorted = sort_arr(\@filtered);
@sarray = sort @filtered;

foreach (@sarray) {
	if ($_ =~ /[a-zA-Z]/i)
    {
		print FH2 "$_";
	}
}

 
