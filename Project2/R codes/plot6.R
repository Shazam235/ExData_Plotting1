library(dplyr)
library(ggplot2)
d1 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/Source_Classification_Code.rds")
d2 <- readRDS("C:/Users/epenaloza/Documents/R/Proyecto 2 Data exploratory analisys/summarySCC_PM25.rds")
amount <- d2 %>% group_by(year) %>% summarise(total = sum(Emissions))

# Plot 6.
vehicles.sources <- grepl("vehicle", d1$SCC.Level.Two, ignore.case=TRUE)
bal.and.la <- d2[(d2$SCC %in% d1[vehicles.sources, ]$SCC),] %>% filter(fips == "06037" | fips == "24510") %>% group_by(fips, year) %>% summarise(total = sum(Emissions)) 
bal.and.la$city <- c('Los Angeles','Los Angeles','Los Angeles','Los Angeles', 'Baltimore','Baltimore','Baltimore','Baltimore')
png(file = "plot6.png", height = 480, width = 480)
ggplot(bal.and.la, aes(x = as.factor(year), y = total, fill = as.factor(year))) + facet_wrap(~city) + geom_bar(stat = "identity")+ labs(title="Total Emissions of PM2.5 in Los Angeles and Baltimore from vehicles.", x = "Years", y = "Total Emissions in Ton.")  + scale_fill_manual("Years", values = as.factor(baltimore2$year))
dev.off()
