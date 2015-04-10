# Pablo Saz Parkinson
# Exploratory Data Analysis
# Project 1 (Plot 1)
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

# Open PNG device for output
png(filename = "plot1.png", width=480, height=480)

# Create the histogram
hist(data$Global_active_power[(dates>"2007-02-01")&(dates<"2007-02-03")], 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)"
)

# Close the device
dev.off()
