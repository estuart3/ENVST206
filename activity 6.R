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
#fix glacier name to be consistent with entire time period
g2015@data$GLACNAME <- ifelse(g2015@data$GLACNAME == "North Swiftcurrent Glacier", 
                              "N. Swiftcurrent Glacier", 
                              ifelse(g2015@data$GLACNAME == "Miche Wabun", 
                                     "Miche Wabun Glacier",
                                     as.character(g2015@data$GLACNAME)))
#combine area, first with smaller data frame
gdf66 <- data.frame(GLACNAME = g1966@data$GLACNAME,
                    area66 = g1966@data$Area1966)
gdf15 <- data.frame(GLACNAME = g2015@data$GLACNAME, 
                    area15 = g2015@data$Area2015)
#join all data tables by glacier name
gAll <- full_join(gdf66, gdf15, by = "GLACNAME")
library(dplyr)
library(rgdal)
library(sp)
library(rgdal)
gAll <- full_join(gdf66, gdf15, by = "GLACNAME")
#calculate the percent change in area from 1966 to 2015
gAll$gdiff <- ((gAll$area66-gAll$area15)/gAll$area66)*100
plot(gAll$area66, gAll$gdiff)
