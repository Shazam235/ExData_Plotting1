library(dplyr)
library(ggplot2)
d1 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/Source_Classification_Code.rds")
d2 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/summarySCC_PM25.rds")
amount <- d2 %>% group_by(year) %>% summarise(total = sum(Emissions))

#Plot 2.
baltimore <- d2 %>% filter(fips == "24510")
amount.b <- d2 %>% filter(fips == "24510") %>% group_by(year) %>% summarise(total = sum(Emissions))
png(file = "plot2.png", height = 480, width = 480)
with(amount.b, barplot(height = total, names.arg = year, col = 'red', xlab = "Years", ylab = "Total Emissions in Ton", main = "Total Emisions of PM2.5 in Baltimore."))
dev.off()