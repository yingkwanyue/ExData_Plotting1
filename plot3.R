## John Hopkins Exploratory Data Analysis
## Course Project 1

## Our overall goal here is simply to examine how household energy usage
## varies over a 2-day period in February, 2007.

## Plot 2: Global Active Power Line Graph

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

# Plot line graph
png(file = "plot3.png")
par(mfrow = c(1, 1))
with(power_data_sub, {
        plot(DateTime, Sub_metering_1,
             xlab = "",
             ylab = "Energy sub metering",
             type = "l")
        lines(DateTime, Sub_metering_2,
              col = "red")
        lines(DateTime, Sub_metering_3,
              col = "blue")
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = 1,
               col = c("black", "red", "blue"),
               xjust = 1)
})
dev.off
