#! /usr/bin/perl
package Queue;

sub new {
	my ($class,$size) = @_;
	my @array = ();
	$#array = $size;
	my $self = {
		array => @array,
		front => -1,#队首
		rear => -1,#队尾
		max_size => $size,
	};
		bless ($self, $class);
	return $self;
}
sub number {
	my $self = shift;
	return $$self{"rear"}+1;
}
sub max_size {
	my $self = shift;
	return $$self{"max_size"};
}
sub isEmpty {	
	my $self = shift;
	if($$self{"front"} == $$self{"rear"})
	{
		die "This queue is empty!\n";
	}
}
sub isFull {
	my $self = shift;
	if($$self{"rear"} == $$self{"max_size"}-1)
	{
		die "This queue is full!\n";
	}
}

sub push{
	my ($self,$data) = @_;
	my $index = $$self{"rear"} + 1;
	$$self{"array"}[$index] = $data;
	$$self{"rear"} = $index;
	if($$self{"rear"} >= 1)
	{
		$$self{"front"} = 0;
	}else{
		$$self{"front"} = -1;
	}
	&isFull;
	printf "front = %g,rear = %g\n",$$self{"front"},$$self{"rear"};
	return $data;

}
sub pop {
	my $self = shift;
    my $bottom = $$self{"front"} + 1;
    my $top = $$self{"rear"};
   	for (my $num = $bottom; $num < $top+1; $num++) 
   	{
   		$$self{"array"}[$num-1] = $$self{"array"}[$num];
   	}
   	$$self{"rear"} -= 1;
   	if($$self{"rear"} >= 1)
	{
		$$self{"front"} = 0;
	}else{
		$$self{"front"} = -1;
	}
	printf "front = %g,rear = %g\n",$$self{"front"},$$self{"rear"};
	&isEmpty;
	return;
}

1;