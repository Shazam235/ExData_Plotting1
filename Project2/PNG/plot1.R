library(dplyr)
library(ggplot2)
d1 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/Source_Classification_Code.rds")
d2 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/summarySCC_PM25.rds")
amount <- d2 %>% group_by(year) %>% summarise(total = sum(Emissions))

# Plot 1.
png(file = "plot1.png", height = 480, width = 480)
with(amount, plot(year, total, type = "b", col = 'red', xlab = "Years.", ylab = "Total Emissions in Ton.", main = "Total emissions of PM2.5 in the U.S."))
dev.off()