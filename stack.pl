#! /usr/bin/perl
use Stack;
use warnings;

my $s = Stack->new(10);
# push something
print "please push some word :\n";
while (<>) 
{
	chomp($_);
	$s -> push($_);
}
# pop number
print "How many word are you want pop:\n";
chomp (my $num = <STDIN>);
for (my $xx = 0; $xx < $num; $xx++) 
{
	$s ->pop;
}
# copy stack info
my $size = $s ->size;
my $top = $s ->top;
printf "current_size = %d\n",$size;
printf "top is %s\n",$top;

my $in = $$s{"current_size"};
for (my $num = 0; $num < $in; $num++) 
{
	printf "array[$num] = %s\n",$$s{"array"}[$num];
}