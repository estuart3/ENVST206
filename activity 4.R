#activity 4
datB <- read.csv("/Users/emmastuart/Documents/a04/beaver_dam.csv")
head(datB)
plot(datB$dams.n, datB$area.ha, pch = 19, 
     col = "royalblue4", 
     ylab = "Surface water area (ha)",
     xlab = "Number of beaver dams")
