#!/usr/bin/env perl

use strict ;
use warnings ;

open(my $fh,"cascadia1234.events") ;
my $n = "0000" ;
while(my $l=<$fh>){
	chomp($l) ;
	$n++ ;
	$n = sprintf("%+05d",$n) ;
	$n=~s/^\+// ;
	my @c = split(",",$l) ;
	my ($y,$m,$d,$H,$M,$S) = split("[- :]",$c[1]) ;
	#print "skip on\n" ;
	#print "dir data01/$n\n" ;
	print "dir data01/$n\n" ;
	print "evt $y/$m/$d,$H:$M:$S $c[2] $c[3] $c[4] $c[8]($c[7]) O(-200) O(1800) 7D % -- BHZ\n" ;
	print "evt $y/$m/$d,$H:$M:$S $c[2] $c[3] $c[4] $c[8]($c[7]) O(-200) O(1800) 7D % -- HHZ\n" ;
	}
close($fh) ;
