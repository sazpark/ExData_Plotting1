# Pablo Saz Parkinson
# Exploratory Data Analysis
# Project 1 (Plot 4)
# 2015-04-10

# Load the lubridate package to deal with dates more easily
library(lubridate)

# First download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("exdata-data-household_power_consumption.zip")) {
        download.file(fileUrl, destfile = "exdata-data-household_power_consumption.zip", method = "curl")
}

# Read data (without unzipping the file)
data <- read.table(unz("exdata-data-household_power_consumption.zip", 
                       "household_power_consumption.txt"), 
                   header=TRUE, 
                   sep=";",
                   na.strings = "?")

# Use lubridate to generate dates
dates <- dmy(data$Date)

# Subset the data
x <- ymd_hms(paste(dmy(data$Date[(dates>"2007-02-01")&(dates<"2007-02-03")]), 
                   data$Time[(dates>"2007-02-01")&(dates<"2007-02-03")])) 
y <- data$Global_active_power[(dates>"2007-02-01")&(dates<"2007-02-03")]
voltage <- data$Voltage[(dates>"2007-02-01")&(dates<"2007-02-03")]
y1 <- data$Sub_metering_1[(dates>"2007-02-01")&(dates<"2007-02-03")]
y2 <- data$Sub_metering_2[(dates>"2007-02-01")&(dates<"2007-02-03")]
y3 <- data$Sub_metering_3[(dates>"2007-02-01")&(dates<"2007-02-03")]
grp <- data$Global_reactive_power[(dates>"2007-02-01")&(dates<"2007-02-03")]

# Open PNG device for output
png(filename = "plot4.png", width=480, height=480)

# Create the plots
par(mfrow = c(2, 2))

# Plot 4.1
plot(x, y,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     "n")
lines(x, y)

# Plot 4.2
plot(x, voltage,
     ylab = "Voltage",
     xlab = "datetime",
     "n")
lines(x, voltage)

# Plot 4.3
plot(x, y,
     ylab = "Energy sub metering",
     xlab = "",
     ylim = c(0,max(y1)),
     "n")
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(x, y1, col = "black")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")

# Plot 4.4
plot(x, grp,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     "n")
lines(x, grp)
par(mfrow = c(1, 1))

# Close the device
dev.off()

