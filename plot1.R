## John Hopkins Exploratory Data Analysis
## Course Project 1

## Our overall goal here is simply to examine how household energy usage
## varies over a 2-day period in February, 2007.

## Plot 1: Global Active Power Histogram

# Load packages and data
library(dplyr)
power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Subset data for dates 2007-02-01 and 2007-02-02
# Convert variables to desired data classes
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
power_data_sub <- power_data[power_data$Date >= "2007-02-01" & power_data$Date <= "2007-02-02", ]
power_data_sub$DateTime <- strptime(paste(power_data_sub$Date, power_data_sub$Time), 
                                    format = "%Y-%m-%d %H:%M:%S", tz = "America/Los_Angeles")
power_data_sub <- mutate_at(power_data_sub, names(power_data_sub[3:9]), as.numeric)

# Plot histogram
png(file = "plot1.png", width = 480, height = 480)
par(mfrow = c(1, 1))
hist(power_data_sub$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")
dev.off
