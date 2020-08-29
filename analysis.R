data <- read.csv("repdata_data_StormData.csv.bz2")
head(data)
str(data)
sum(is.na(data$EVTYPE))
sum(is.na(data$FATALITIES))
sum(is.na(data$INJURIES))

fatalities <- aggregate(FATALITIES~EVTYPE,data,sum)
injuries <- aggregate(INJURIES~EVTYPE,data,sum)
health_effect <- merge(fatalities,injuries,by="EVTYPE")
health_effect <- health_effect[order(health_effect$FATALITIES,health_effect$INJURIES,decreasing = TRUE),]
health_effect[1:5,]

with(health_effect[1:5,],barplot(FATALITIES,col = 1:5,names.arg=EVTYPE))
title("TOTAL FATALITIES IN US")

