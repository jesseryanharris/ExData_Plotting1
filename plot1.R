# The household_power_consumption.txt file should be in your R working directory
# in order for the code below to work

# Read the file into R
power <- read.table(file = "household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")

# Combine/convert date and time readings
power$Timestamp <- with(power, as.POSIXct(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))

# Subset for desired date range (Feb 1 & 2, 2007)
subset <- subset(power, Timestamp >= as.POSIXct("2007-02-01") & Timestamp < as.POSIXct("2007-02-03"), select = -(c(Date, Time)))

# Create plot in PNG format
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()