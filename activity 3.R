# activity 3
ch4 <- read.csv("/Users/emmastuart/Documents/a03/lemming_herbivory.csv")
ch4$herbivory <- as.factor(ch4$herbivory)
plot(ch4$CH4_Flux ~ ch4$herbivory, xlab = "Treatment", 
     ylab = "CH4 fluxes (mgC m -2 day-1)")
#Shapiro-Wilkes Test
shapiro.test(ch4$CH4_Flux[ch4$herbivory == "Ctl"])
