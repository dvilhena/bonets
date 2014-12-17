##################################################################################### 
#   Script takes a file with grid cells organized by cluster and outputs a crude map
#   
#       1  -78	-76	-2	0
#       1	-76	-74	-10	-8
#       2	-74	-72	-10	-8
#       2	-74	-72	-4	-2
#       3	-78	-76	-8	-6
#
#   Daril Vilhena
#   daril@uw.edu
####################################################################################
args = commandArgs(TRUE)

# file name from created file
filename = args[1]

# load in the dataset
grid_data = read.table(paste(filename,sep=""))

# Load the maps library to draw a map. note it's installing and saving
# to local directory
#install.packages("maps", lib='r_packages', repos="http://cran.rstudio.com/")
library(maps, lib.loc='r_packages')

# create pdf 
pdf("network_map.pdf",width=8,height=5)

  # create a random color scheme
  color_scheme=runif( max(grid_data[,1]) )
  
  # initiate the map 
  map('world',bg="white",myborder=0,boundary=T,interior=F,col="#F1F1F1")
  
  # for each grid cell in the dataset, draw a square with the proper color (from line 29)
  for ( i in 1:length(grid_data[,1]) ) {
    # use hsv colors, varying the first value in the hsv function call 
    rect(  grid_data[i,2],grid_data[i,5],grid_data[i,3],grid_data[i,4], 
           col=hsv( color_scheme[grid_data[i,1]],1,1,1),
           border=0
        )
  }
# create the pdf
dev.off()

