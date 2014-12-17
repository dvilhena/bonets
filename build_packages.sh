#!/bin/bash
# download infomap and compile it
wget http://www.mapequation.org/downloads/Infomap.zip
unzip Infomap.zip
make -C Infomap

# make a directory for r package
mkdir r_packages
Rscript install_r_packages.R

# perl files correct permissions,
chmod 755 *.pl
