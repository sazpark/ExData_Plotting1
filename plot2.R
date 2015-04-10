# Pablo Saz Parkinson
# Exploratory Data Analysis
# Project 1 (Plot 2)
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
y <- data$Global_active_power[(dates>"2007-02-01")&(dates<"2007-02-03")]
x <- ymd_hms(paste(dmy(data$Date[(dates>"2007-02-01")&(dates<"2007-02-03")]), 
                   data$Time[(dates>"2007-02-01")&(dates<"2007-02-03")])) 

# Open PNG device for output
png(filename = "plot2.png", width=480, height=480)

# Create the plot
plot(x, y,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     "n")
lines(x, y)

# Close the device
dev.off()
