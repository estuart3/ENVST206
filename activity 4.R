#activity 4
datB <- read.csv("/Users/emmastuart/Documents/a04/beaver_dam.csv")
head(datB)
plot(datB$dams.n, datB$area.ha, pch = 19, 
     col = "royalblue4", 
     ylab = "Surface water area (ha)",
     xlab = "Number of beaver dams")
#set up regression
dam.mod <- lm(datB$area.ha ~ datB$dams.n)
#get standardized residuals
dam.res <- rstandard(dam.mod)
#set up qq plot
qqnorm(dam.res)
#add qq line
qqline(dam.res)
shapiro.test(dam.res)
#make residual plot
plot(datB$dams.n, dam.res,
     xlab = "beaver dams",
     ylab = "standardized residual")
#add a horizontal line at zero
abline(h=0)
summary(dam.mod)
#make plot of beaver dams and surface water
plot(datB$dams.n, datB$area.ha,
     pch = 19,
     col = "royalblue4",
     ylab = "Surface water area (ha)",
     xlab = "Number of beaver dams")
#add regression line
#make line width thicker
abline(dam.mod, lwd=2)
#read in red maple data
pheno <- read.csv("/Users/emmastuart/Documents/a04/red_maple_pheno.csv")
#set up panel of plots with one row and two columns
par(mfrow=c(1,2))
plot(pheno$Tmax, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Maximum temperature (C)")
plot(pheno$Prcp, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Precipitation (mm)")
plot(pheno$Tmax, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Maximum temperature (C)")
plot(pheno$Tmax, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Maximum temperature (C)")
plot(pheno$Lat, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Latitude")
plot(pheno$elev, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Elevation (m)")
plot(pheno$siteDesc, pheno$doy,
     pch = 19,
     col = "royalblue4",
     ylab = "Day of leaf out",
     xlab = "Site type (urban or rural)")
plot( ~ pheno$Lat + pheno$Tmax + pheno$Tmin + pheno$Prcp + pheno$elev + pheno$siteDesc)
pheno$urID <- ifelse(pheno$siteDesc == "Urban", 1, 0)
mlr <- lm(pheno$doy ~ pheno$Tmax + pheno$Prcp + pheno$elev + pheno$urID)
mlfitted <- fitted(mlr)
pheno.res <- rstandard(mlr)
qqnorm(pheno.res)
qqline(pheno.res)
shapiro.test(pheno.res)
plot(mlfitted, pheno.res,
     xlab = "fitted values",
     ylab = "standarad residuals")
abline(h=0)
