library(dplyr)
library(ggplot2)
d1 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/Source_Classification_Code.rds")
d2 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/summarySCC_PM25.rds")
amount <- d2 %>% group_by(year) %>% summarise(total = sum(Emissions))

# Plot 4.
# Find coal combustion-related sources
is.combustion.coal <- grepl("Fuel Comb.*Coal", d1$EI.Sector)
combustion.coal.sources <- d2[is.combustion.coal,] %>% group_by(year) %>% summarise(total = sum(Emissions))
png(file = "plot4.png", height = 480, width = 480)
with(combustion.coal.sources, barplot(height = total, names.arg = year, col = 'purple', xlab = "Years", ylab = "Total Emissions in Ton", main = "Total Emisions of PM2.5 from coal combustion-related."))
dev.off()