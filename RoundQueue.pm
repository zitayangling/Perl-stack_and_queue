#! /usr/bin/perl
#限制只能添加(max_size-1)个元素

package RoundQueue;

sub new {
	my ($class,$size) = @_;
	my @array = ();
	$#array = $size;
	my $self = {
		array => @array,
		front => "0",#队首
		rear => "0",#队尾
		max_size => $size,#
	};
	bless ($self, $class);
	return $self;
}

sub push{
	my ($self,$data) = @_;
	&isFull;
	my $rear = ($$self{"rear"} + 1) % $$self{"max_size"};
	$$self{"array"}[$rear] = $data;
	# printf "front = %g,rear = %g\n",$$self{"front"},$rear;
	# printf "array[%g] = %s\n",$rear,$data;
	$$self{"rear"} = $rear;
	return $data;

}

sub pop {
	my $self = shift;
	
	if($$self{"front"} == $$self{"rear"})
	{
		&isEmpty;
	}
	my $front = ($$self{"front"} + 1) % $$self{"max_size"};
	# printf "front = %g,rear = %g\n",$front,$$self{"rear"};
	# printf "array[%g] = %s\n",$front,$$self{"array"}[$front];
	$$self{"array"}[$front] = undef;
	$$self{"front"} = $front;
}
sub isEmpty {		
	die "This queue is empty!\n";
}
sub isFull {
	my $self = shift;
	my $rear = $self->{rear};
	my $max_size = $self->{max_size};
	my $front = $self->{front};
	if(($rear + 1) % $max_size == $front)
	{
		die "This queue is full!\n Can't push!\n";
	}
}
sub number {
	my $self = shift;

	my $xx = $$self{"rear"} - $$self{"front"} + $$self{"max_size"};
	my $zz = $xx % $max_size;
	return $zz;
}
sub max_size {
	my $self = shift;
	return $$self{"max_size"};
}

1;