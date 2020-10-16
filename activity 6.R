#activity 6
#package for vector data
library(sp)
#package for reading spatial data
library(rgdal)
#data management package
library(dplyr)
#read in shapefiles
#glaciers in 1966
g1966 <- readOGR("/Users/emmastuart/Documents/a06/GNPglaciers/GNPglaciers_1966.shp")
