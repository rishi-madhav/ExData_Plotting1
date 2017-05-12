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
str(data2007)

data2007$Time <- strptime(data2007$Time, "%H:%M")
str(data2007)

data2007$Global_active_power <- as.numeric(data2007$Global_active_power)
data2007$Sub_metering_1 <- as.numeric(data2007$Sub_metering_1)
data2007$Sub_metering_2 <- as.numeric(data2007$Sub_metering_2)
data2007$Sub_metering_3 <- as.numeric(data2007$Sub_metering_3)

str(data2007)

#................Plotting Sub Metering with DateTime
png("plot3.png", width = 480, height = 480)

plot(data2007$Time, data2007$Sub_metering_1, 
     type = "l", xlab = "DateTime", ylab = "Energy Sub Metering (Kilowatts)")
lines(data2007$Time, data2007$Sub_metering_2, type = "l", col = "red")
lines(data2007$Time, data2007$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1,
       lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
