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
png("plot4.png", width = 480, height = 480)

#setting the device to create 4 plots, 2 by 2
par(mfcol = c(2,2))

#creating the first plot
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")


#creating the second plot
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#creating the third plot
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab="Voltage", type = "l")

#creating the fourth plot
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "l")

#closing the device
dev.off()
