utica_tavg <- read.csv("/Users/emmastuart/Documents/Utica_tavg.csv")
utica_tavg$Year <- as.numeric(utica_tavg$Year)
utica_tavg$Tavg <- as.numeric(utica_tavg$Tavg)
averagetemp_U <- aggregate(utica_tavg$Tavg, by = list(utica_tavg$Year), FUN = "mean", na.rm = TRUE)
colnames(averagetemp_U) <- c("Year", "MAAT")
plot(averagetemp_U$YEAR, averagetemp_U$MAAT,
     pch = 19,
     col = "royalblue4",
     ylab = "Average annual temperature",
     xlab = "Year")
plot(averagetemp_U$Year, averagetemp_U$MAAT, 
     pch = 19,
     col = "royalblue4", 
     ylab = "Average annual temperature", 
     xlab = "Year")
syracuse_tavg <- read.csv("/Users/emmastuart/Documents/Syracuse_tavg.csv")
syracuse_tavg$Year <- as.factor(syracuse_tavg$Year)
syracuse_tavg$Tavg <- as.numeric(syracuse_tavg$Tavg)
averagetemp_S <- aggregate(syracuse_tavg$Tavg, by = list(syracuse_tavg$Year), 
                           FUN = "mean", na.rm = TRUE)
colnames(averagetemp_S) <- c("Year", "MAAT")
plot(averagetemp_S$Year, averagetemp_S$MAAT, 
     pch=19,
     col="royalblue4", 
     ylab = "Average annual temperature", 
     xlab = "Year")
albany_tavg <- read.csv("/Users/emmastuart/Documents/Albany_tavg.csv")
albany_tavg$Year <- as.factor(albany_tavg$Year)
albany_tavg$Tavg <- as.numeric(albany_tavg$Tavg)
averagetemp_A <- aggregate(albany_tavg$Tavg, by = list(albany_tavg$Year), 
                           FUN = "mean", na.rm = TRUE)
colnames(averagetemp_A) <- c("Year", "MAAT")
plot(averagetemp_A$Year, averagetemp_A$MAAT, 
     pch = 19, 
     col = "royalblue4", 
     ylab = "Average annual temperature", 
     xlab = "Year",
     main = "Albany")
help(plot)
averagetemp_U.mod <- lm(averagetemp_U$Year ~ averagetemp_U$MAAT)
averagetemp_U$Year <- as.numeric(averagetemp_U$Year)
averagetemp_U$MAAT <- as.numeric(averagetemp_U$MAAT)
averagetemp_S.mod <- lm(averagetemp_S$Year ~ averagetemp_S$MAAT)
averagetemp_S$Year <- as.numeric(averagetemp_S$Year)
averagetemp_S$MAAT <- as.numeric(averagetemp_S$MAAT)
averagetemp_A.mod <- lm(averagetemp_A$Year ~ averagetemp_A$MAAT)
averagetemp_A$Year <- as.numeric(averagetemp_A$Year)
averagetemp_A$MAAT <- as.numeric(averagetemp_A$MAAT)
averagetemp_U.res <- rstandard(averagetemp_U.mod)
averagetemp_A.res <- rstandard(averagetemp_A.mod)
averagetemp_S.res <- rstandard(averagetemp_S.mod)
qqnorm(averagetemp_U.res)
qqline(averagetemp_U.res)
qqnorm(averagetemp_S.res)
qqline(averagetemp_S.res)
qqnorm(averagetemp_A.res)
qqline(averagetemp_A.res)
shapiro.test(averagetemp_U.res)
shapiro.test(averagetemp_S.res)
shapiro.test(averagetemp_A.res)
plot(averagetemp_U$MAAT, averagetemp_U.res, 
     xlab = "Mean average air temperature", 
     ylab = "standardized residuals")
abline(h=0)
plot(averagetemp_S$MAAT, averagetemp_S.res, 
     xlab = "Mean average air temperature", 
     ylab = "standardized residuals")
abline(h=0)
plot(averagetemp_A$MAAT, averagetemp_A.res, 
     xlab = "Mean average air temperature", 
     ylab = "standardized residuals")
abline(h=0)
summary(averagetemp_U.mod)
summary(averagetemp_S.mod)
summary(averagetemp_A.mod)
temp_change <- read.csv("/Users/emmastuart/Documents/change in temp over time.csv")
temp_change$Location <- as.factor(temp_change$Location)
temp_change$TempChange <- as.numeric(temp_change$TempChange)
shapiro.test(temp_change$TempChange[temp_change$Location == "Utica"])
shapiro.test(temp_change$TempChange[temp_change$Location == "Syracuse"])
shapiro.test(temp_change$TempChange[temp_change$Location == "Albany"])
bartlett.test(temp_change$TempChange ~ temp_change$Location)
temp_change.mod <- lm(temp_change$TempChange ~ temp_change$Location)
temp_change.aov <- aov(temp_change.mod)
summary(temp_change.aov)
tukeyT <- TukeyHSD(temp_change.aov)
tukeyT
plot(temp_change$TempChange ~ temp_change$Location,
     xlab = "City", ylab = "Change in temperature per year")
