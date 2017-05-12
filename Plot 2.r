#................Reading in the file
energydata <- read.table("household_power_consumption.txt", header = T, sep = ";")

#................Subsetting to the required dates
rm(data2007)
data2007 <- energydata[energydata$Date %in% c("1/2/2007", "2/2/2007"), ]
str(data2007)

#................Converting to Date and Time variables 

rm(lct)
lct <- Sys.getlocale("LC_TIME"); 
Sys.setlocale("LC_TIME", "C")
data2007$Date <- as.Date(data2007$Date, format = "%m/%d/%Y")
Sys.setlocale("LC_TIME", lct)
head(data2007)
str(data2007)

data2007$Time <- strptime(data2007$Time, "%H:%M")
str(data2007)

data2007$Global_active_power <- as.numeric(data2007$Global_active_power)

str(data2007)

#................Plotting Global Active Power with DateTime
png("plot2.png", width = 480, height = 480)

plot(data2007$Time, data2007$Global_active_power, 
     type = "l", 
     xlab = "DateTime", 
     ylab = "Global Active Power (Kilowatts)")

dev.off()
