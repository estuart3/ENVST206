#activity 2
datW <- read.csv("/Users/emmastuart/Downloads/a02/noaa2011124")
datW <- read.csv("/Users/emmastuart/Documents/a02/noaa2011124.csv")
str(datW)
datW$NAME <- as.factor(datW$NAME)
levels(datW$NAME)
