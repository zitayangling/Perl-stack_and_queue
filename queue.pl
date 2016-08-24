#! /usr/bin/perl
use Queue;
# use strict;
my $queue = Queue ->new(10);
print "input push word:\n";
while (<>) 
{
	chomp($_);
	$queue -> push($_);
}
print "input pop number:\n";
chomp(my $i = <STDIN>);
if($i =~ /[0-9]+/)
{
	for (my $j = 0; $j < $i; $j++) 
	{
		$queue -> pop;
	}	
}
else{
	print "input error!!\n";
}

my $max_size = $$queue{"max_size"};
print "max_size = $max_size\n";

my $index = $queue -> number;
for (my $num = 0; $num < $index; $num++) 
{
	printf "array[$num] = %s\n",$$queue{"array"}[$num];
}
