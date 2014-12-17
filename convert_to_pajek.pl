#!/usr/bin/perl
use strict;

#require 'data.pm';

open( TXT , $ARGV[0]);
	my @data = <TXT>;
close(TXT);

my %nodes;

foreach my $co_occurence (@data) { 
	$co_occurence =~ s/\n//;
	my @line = split(/:::/, $co_occurence);


	if ( exists $nodes{$line[0]} ) { 
	} else {
		$nodes{$line[0]} = 0;
	}
	
	if ( exists $nodes{$line[1]} ) { 
	} else {
		$nodes{$line[1]} = 0;
	}
} 


# give each node a number
my $i=1;
while (my($key, $value) = each(%nodes)){
	$nodes{$key}=$i;
	$i++;
}

my $total_entries = scalar(keys %nodes);
print "*Vertices ".$total_entries."\n";
# print the nodes
while (my($key, $value) = each(%nodes)){
	print $value." \"".$key."\"\n";
}

my %connections;
# get the counts / uniques
foreach my $link (@data) { 
		if ( exists $connections{$link} ) { 
			$connections{$link}++;
		} else { 
			$connections{$link}=1;
		}
}

# remove the asymmetry between connections 
while (my($key, $value) = each(%connections)) {
	my @co_oc = split(/:::/, $key);
	my $undir = $co_oc[1].":::".$co_oc[0];
	if ( exists $connections{$undir} ) { 
		delete $connections{$undir};
	}
}



# print them
print "*Edges\n";
while (my($key, $value) = each(%connections)){
	my @co_oc = split(/:::/, $key); 
	print $nodes{$co_oc[0]} . " " . $nodes{$co_oc[1]} . " " . $connections{$key}."\n"; 		
}




