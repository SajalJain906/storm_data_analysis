sum(is.na(data$EVTYPE))
sum(is.na(data$FATALITIES))
sum(is.na(data$INJURIES))

fatalities <- aggregate(FATALITIES~EVTYPE,data,sum)
injuries <- aggregate(INJURIES~EVTYPE,data,sum)
health_effect <- merge(fatalities,injuries,by="EVTYPE")
health_effect <- health_effect[order(health_effect$FATALITIES,health_effect$INJURIES,decreasing = TRUE),]
health_effect[1:20,]

with(health_effect[1:5,],barplot(FATALITIES,col = 1:5,names.arg=EVTYPE))
title("TOTAL FATALITIES IN US")

econ_damage <- data$PROPDMG + data$CROPDMG
data <- cbind(data,econ_damage)

economic_damage <- economic_damage[order(economic_damage$econ_damage,decreasing = TRUE),]
economic_damage[1:20,]
with(economic_damage[1:5,],barplot(econ_damage,col=1:5,names.arg = EVTYPE))
title("TOTAL ECONOMIC DAMAGE IN US")