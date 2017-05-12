getwd()
setwd("F:\\Personal\\Insofe\\DSC Coursera\\EDA Week 1 Project")
getwd()
library(lubridate)
installed.packages("data.table")
library(data.table)
library(dplyr)

rm(energydata)
#................Reading in the file
energydata <- read.table("household_power_consumption.txt", header = T, sep = ";")

#................Subsetting to the required dates
data2007 <- energydata[energydata$Date %in% c("1/2/2007", "2/2/2007"), ]
str(data2007)

#................Histogram for Global Active Power
globalactivepower <- as.numeric(data2007$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(globalactivepower, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts", ylab = "Frequency")

dev.off()
