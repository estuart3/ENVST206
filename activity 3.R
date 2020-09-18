# activity 3
ch4 <- read.csv("/Users/emmastuart/Documents/a03/lemming_herbivory.csv")
ch4$herbivory <- as.factor(ch4$herbivory)
plot(ch4$CH4_Flux ~ ch4$herbivory, xlab = "Treatment", 
     ylab = "CH4 fluxes (mgC m -2 day-1)")
#Shapiro-Wilkes Test
shapiro.test(ch4$CH4_Flux[ch4$herbivory == "Ctl"])
shapiro.test(ch4$CH4_Flux[ch4$herbivory == "Ex"])
bartlett.test(ch4$CH4_Flux ~ ch4$herbivory)
t.test(ch4$CH4_Flux ~ ch4$herbivory)
#insect data
datI <- read.csv("/Users/emmastuart/Documents/a03/insect_richness.csv")
datI$urbanName <- as.factor(datI$urbanName)
shapiro.test(datI$Richness[datI$urbanName == "Suburban"])
shapiro.test(datI$Richness[datI$urbanName == "Developed"])
shapiro.test(datI$Richness[datI$urbanName == "Dense"])
shapiro.test(datI$Richness[datI$urbanName == "Natural"])
bartlett.test(datI$Richness ~ datI$urbanName)
in.mod <- lm(datI$Richness ~ datI$urbanName)
in.aov <- aov(in.mod)
summary(in.aov)
tukeyT <- TukeyHSD(in.aov)
tukeyT
plot(tukeyT, cex.axis=0.75)
tapply(datI$Richness, datI$urbanName, "mean")
#chi squared
species <- matrix(c(18,8,15,32), ncol = 2, byrow = TRUE)
colnames(species) <- c("Not protected", "Protected")
rownames(species) <- c("Declining", "Stable/Increase")
mosaicplot(species, xlab = "population statuas", ylab = "legal protection",
           main = "Legal protection impacts on populations")
chisq.test(species)
