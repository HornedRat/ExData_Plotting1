require(data.table)
require(dplyr)
require(lubridate)

#using fread to read the  data faster
fread("household_power_consumption.txt", na.strings = "?") -> data

#filtering the data for the required days
data <- data %>% filter(Date=="1/2/2007" | Date=="2/2/2007")

#creating the variable DateTime
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$DateTime <- data$Date + data$Time

#opening png device
png("plot3.png", width = 480, height = 480)

#creating the line plot
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#the x axis is in my system language - Polish

#closing the device
dev.off()
