# The household_power_consumption.txt file should be in your R working directory
# in order for the code below to work

# Read the file into R
power <- read.table(file = "household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")

# Combine/convert date and time readings
power$Timestamp <- with(power, as.POSIXct(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))

# Subset for desired date range (Feb 1 & 2, 2007)
subset <- subset(power, Timestamp >= as.POSIXct("2007-02-01") & Timestamp < as.POSIXct("2007-02-03"), select = -(c(Date, Time)))

# Create plot in PNG format
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(subset$Timestamp, subset$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(subset$Timestamp, subset$Sub_metering_2, type = "l", col = "red")
lines(subset$Timestamp, subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()