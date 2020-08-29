
data <- read.csv("repdata_data_StormData.csv.bz2")

head(data)
str(data)

sum(is.na(data$PROPDMG))
sum(is.na(data$PROPDMGEXP))
sum(is.na(data$CROPDMG))
sum(is.na(data$CROPDMGEXP))

## for the property damage

foo <- data$PROPDMGEXP == "K" | data$PROPDMGEXP == "k"
data$PROPDMG[foo] <- data$PROPDMG[foo] * 1000

foo <- data$PROPDMGEXP == "M" | data$PROPDMGEXP == "m"
data$PROPDMG[foo] <- data$PROPDMG[foo] * 1000000

foo <- data$PROPDMGEXP == "B" | data$PROPDMGEXP == "b"
data$PROPDMG[foo] <- data$PROPDMG[foo] * 1000000000

foo <- data$PROPDMGEXP == "H" | data$PROPDMGEXP == "h"
data$PROPDMG[foo] <- data$PROPDMG[foo] * 100

foo <- data$PROPDMGEXP == "+"
data$PROPDMG[foo] <- data$PROPDMG[foo] * 10

foo <- data$PROPDMGEXP >= "0" & data$PROPDMGEXP <= "8"
data$PROPDMG[foo] <- data$PROPDMG[foo] * 10

## same for the crop damage

foo <- data$CROPDMGEXP == "K" | data$CROPDMGEXP == "k"
data$CROPDMG[foo] <- data$CROPDMG[foo] * 1000

foo <- data$CROPDMGEXP == "M" | data$CROPDMGEXP == "m"
data$CROPDMG[foo] <- data$CROPDMG[foo] * 1000000

foo <- data$CROPDMGEXP == "B" | data$CROPDMGEXP == "b"
data$CROPDMG[foo] <- data$CROPDMG[foo] * 1000000000

foo <- data$CROPDMGEXP == "H" | data$CROPDMGEXP == "h"
data$CROPDMG[foo] <- data$CROPDMG[foo] * 100

foo <- data$CROPDMGEXP == "+"
data$CROPDMG[foo] <- data$CROPDMG[foo] * 10

foo <- data$CROPDMGEXP >= "0" & data$CROPDMGEXP <= "8"
data$CROPDMG[foo] <- data$CROPDMG[foo] * 10