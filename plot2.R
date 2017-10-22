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

#opening the png device
png("plot2.png", width = 480, height = 480)

#plotting the line plot
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
#the x axis is in my system language - Polish

#closing the device
dev.off()
