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
