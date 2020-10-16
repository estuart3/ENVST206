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
#glaciers in 2015
g2015 <- readOGR("/Users/emmastuart/Documents/a06/GNPglaciers/GNPglaciers_2015.shp")
str(g2015)
#map the glaciers
plot(g1966, col = "lightblue2", border = "grey50")
#data stores all accompanying info/measurements for each spatial object
head(g2015@data)
g1966@proj4string
help("proj4string")
#check glacier names
g1966@data$GLACNAME
g2015@data$GLACNAME
