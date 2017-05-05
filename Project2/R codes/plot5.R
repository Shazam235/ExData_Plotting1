library(dplyr)
library(ggplot2)
d1 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/Source_Classification_Code.rds")
d2 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/summarySCC_PM25.rds")
amount <- d2 %>% group_by(year) %>% summarise(total = sum(Emissions))

# Plot 5.
vehicles.sources <- grepl("vehicle", d1$SCC.Level.Two, ignore.case=TRUE)
baltimore.v <- d2[(d2$SCC %in% d1[vehicles.sources, ]$SCC),] %>% filter(fips == "24510") %>% group_by(year) %>% summarise(total = sum(Emissions)) 
png(file = "plot5.png", height = 480, width = 480)
with(baltimore.v, barplot(height = total, names.arg = year, col = 'green', xlab = "Years", ylab = "Total Emissions in Ton", main = "Total Emisions of PM2.5 from Vehicles."))
dev.off()
