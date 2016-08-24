#! /usr/bin/perl
use RoundQueue;
# use strict;
my $queue = RoundQueue ->new(6);
print "input push word:\n";
while (<>) 
{
	chomp($_);
	$queue -> push($_);
}	
$queue -> pop;
$queue -> pop;
$queue ->push("yang");
$queue ->push("ling");
my $max_size = $queue ->max_size;
for (my $num = 0; $num < $max_size; $num++) 
{
	printf "array[%g] = %s\n",$num,$$queue{"array"}[$num];
}
print "max_size = $max_size\n";
printf "front = %g,rear = %g\n",$$queue{"front"},$$queue{"rear"};