require(data.table)
require(dplyr)

#using fread to read the  data faster
fread("household_power_consumption.txt", na.strings = "?") -> data

#filtering the data for the required days
data <- data %>% filter(Date=="1/2/2007" | Date=="2/2/2007")

#opening the png device
png("plot1.png", width = 480, height = 480)

#plotting the histogram
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#closing the device
dev.off()
