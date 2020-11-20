utica_tavg <- read.csv("/Users/emmastuart/Documents/Utica_tavg.csv")
utica_tavg$Year <- as.factor(utica_tavg$Year)
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
