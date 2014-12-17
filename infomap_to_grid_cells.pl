#!/usr/bin/perl

# open the tree file
open(TXT, $ARGV[0] ); 
	my @data = <TXT>; 
close(TXT);


# for each line in the tree file, print out the grid cell and cluster
#1:1 0.25 "-72_-70_8_10" 1
for (@data) { 
	if ( $_ =~ m/-?\d*_-?\d*/ ) {  
		$_ =~ s/\"//g;		
		my @line = split(/ /, $_);
		my @coords = split(/_/, $line[2]);
		my @assignment = split(/:/, $line[0]);
		print $assignment[0]."\t".join("\t", @coords)."\n";
	}
}
