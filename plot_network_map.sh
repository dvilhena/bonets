#!/bin/bash
input_file=$1

# Convert ::: format to a pajek file (standard network format)
perl convert_to_pajek.pl $input_file > $input_file.net

# run infomap clustering
./Infomap/Infomap ./test.net . -u -i pajek --two-level

# convert infomap output to a form R can easily read
perl infomap_to_grid_cells.pl $input_file.tree > $input_file.gridcells

# plot a crude netowrk
Rscript plot_network.R $input_file.gridcells
