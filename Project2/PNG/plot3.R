library(dplyr)
library(ggplot2)
d1 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/Source_Classification_Code.rds")
d2 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/summarySCC_PM25.rds")
amount <- d2 %>% group_by(year) %>% summarise(total = sum(Emissions))

#Plot 3.
baltimore2 <- d2 %>% filter(fips == "24510") %>% group_by(type,year) %>% summarise(total = sum(Emissions))
png(file = "plot3.png", height = 480, width = 480)
ggplot(baltimore2, aes(x = as.factor(year), y = total, fill = as.factor(year))) + facet_wrap(~type) + geom_bar(stat = "identity", position = "dodge")+ labs(title="Total Emissions of PM2.5 for type in Baltimore.", x = "Years", y = "Total Emissions in Ton.")  + scale_fill_manual("Years", values = as.factor(baltimore2$year))
dev.off()