#activity 2
datW <- read.csv("/Users/emmastuart/Downloads/a02/noaa2011124")
datW <- read.csv("/Users/emmastuart/Documents/a02/noaa2011124.csv")
str(datW)
datW$NAME <- as.factor(datW$NAME)
levels(datW$NAME)
mean(datW$TMAX[datW$NAME == "ABERDEEN, WA US"], na.rm=TRUE)
sd(datW$TMAX[datW$NAME == "ABERDEEN, WA US"], na.rm=TRUE)
datW$TAVE <- datW$TMIN + ((datW$TMAX-datW$TMIN)/2)
#question 2 example vectors
Num <- c(5.4,32,17.1,-6,29)
Char <- c("e","f","g","h","I")
Int <- c(2L,6L,10L,11L,15L)
Fac <- factor(c("stop", "go"))
Fac <- factor(c("red", "green", "blue", "orange", "purple"))
averageTemp <- aggregate(datW$TAVE, by=list(datW$NAME), FUN="mean",na.rm=TRUE)
colnames(averageTemp) <- c("NAME", "MAAT")
datW$siteN <- as.numeric(datW$NAME)
hist(datW$TAVE[datW$siteN == 1], freq=FALSE, main = paste(levels(datW$NAME)[1]), xlab = "Average daily temperature (degrees C)", ylab = "Relative frequency", col = "grey75", border = "white")
help(hist)
hist(datW$TAVE[datW$siteN == 4], freq = FALSE, main = paste(levels(datW$NAME)[4]), xlab = "Average daily temperature (degrees C)", ylab = "Relative frequency", col = "grey75", border = "white")
help(dnorm)
pnorm(0, mean(datW$TAVE[datW$siteN == 1],na.rm=TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
pnorm(5, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
pnorm(5, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE)) - pnorm(0, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
pnorm(20, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
- pnorm(20, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
1 - pnorm(20, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
qnorm(0.95, mean(datW$TAVE[datW$siteN == 1],na.rm = TRUE), sd(datW$TAVE[datW$siteN == 1],na.rm = TRUE))
hist(datW$PRCP[datW$siteN == 1], freq = FALSE, main = paste(levels(datW$NAME)[1]), xlab = "Daily Precipitation (inches)", ylab = "Relative frequnecy", col = "grey75", border = "white")
help(aggregate)
annualPrecip <- aggregate(datW$PRCP, by=list(datW$NAME), FUN=list(datW$year), na.rm=TRUE)
help(sum)
sum(datW$PRCP, na.rm = TRUE)
sum(datW$PRCP[datW$siteN == 1], na.rm = TRUE)
annualPrecip <- aggregate(datW$PRCP, by=list(datW$NAME, datW$year), FUN=sum, na.rm=TRUE)
colnames(annualPrecip) <- c("Name", "Year", "Precipitation")
hist(annualPrecip$Precipitation[annualPrecip$Name == "ABERDEEN, WA US"],
     freq = FALSE,
     main = paste(levels(datW$NAME)[1]),
     xlab = "Total Annual Precipitation (cm)",
     ylab = "Relative Frequency", 
     col = "grey75",
     border = "white")
hist(annualPrecip$Precipitation[annualPrecip$Name == "MANDAN EXPERIMENT STATION, ND US"], 
     freq = FALSE,
     main = paste(levels(datW$NAME)[3]),
     xlab = "Total Annual Precipitation (cm)",
     ylab = "Relative Frequency",
     col = "grey75",
     border = "white")
pnorm(700, mean(annualPrecip$Precipitation[annualPrecip$Name == "ABERDEEN, WA US"],na.rm = TRUE), sd(annualPrecip$Precipitation[annualPrecip$Name == "ABERDEEN, WA US"],na.rm = TRUE))
pnorm(700, mean(annualPrecip$Precipitation[annualPrecip$Name == "MANDAN EXPERIMENT STATION, ND US"],na.rm = TRUE), sd(annualPrecip$Precipitation[annualPrecip$Name == "MANDAN EXPERIMENT STATION, ND US"],na.rm = TRUE))
