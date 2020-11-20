utica_tavg <- read.csv("/Users/emmastuart/Documents/Utica_tavg.csv")
utica_tavg$Year <- as.factor(utica_tavg$Year)
utica_tavg$Tavg <- as.numeric(utica_tavg$Tavg)
