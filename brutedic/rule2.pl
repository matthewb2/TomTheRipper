

use threads;

use Thread::Cancel;                #  Defaults to 'KILL'
 
									
									
sub start_thread{

	@ffs = ("","","", "3wordopendic.txt","4wordopendic.txt", "5wordopendic.txt");
	 my ($str) = @_;
	
	print $str;
	
	my @matches = $str =~ /\{.*?\}/g; 

	my @fi;

	foreach (@matches) {
		#print "$_\n";
		$str1 = substr($_, 1, 1);
		if ($str1 eq "w"){
			$str2 = substr($_, 2, 1);
			print $str2;
			
			#$file = $ffs[$str2];
			
			push @fi, $ffs[$str2];
			
			#searchf
		
		}
	}
		

	open my $fo0, $fi[0] or die "Could not open $fi[0]: $!";
	open my $fo1, $fi[1] or die "Could not open $fi[1]: $!";
	
	my @dg3=(10..99);
	
	  while( my $line0 = <$fo0>)  {   
	   if ($line0 =~ /[a-zA-Z]/i){
		
		$line0 =~ s/\R//g;
		#print $line0;
			seek $fo1, 0, 0;
			while( my $line1 = <$fo1>)  {   
				if ($line1 =~ /[a-zA-Z]/i)
				{
					$line1 =~ s/\R//g;
					for (@dg3){
						my $new = $line0.$line1.$_;
						print "In thread $tid: $new\n";
						if ($new eq "staryman12") {
							print "password found: $new\n";
							exit 1;
							
						}
					}
					
				}
					
			}
		}
	  }
	
}

$sttime = time;


#$file ="3wordopendic.txt";


my @rules;

@rules = ("{w4}{w3}{d2}","{w5}{w3}{d2}");

#print $rules[0];

 my $thr1 = threads->create('start_thread', $rules[0]);


 my $thr2 = threads->create('start_thread', $rules[1]);
 
 $thr1->join();


$entime = time;
$elapse = $entime - $sttime;
use Time::Seconds;

my $t = Time::Seconds->new( $elapse );
print "elapsed time: ".$t->pretty;
