## Set working directory and Load Data
setwd("/Users/adrianromano/Downloads")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

## Filter dates from 2007/02/01 to 2007/02/02
subset_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Format and combine Date and Time columns
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
dateTime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$dateTime <- as.POSIXct(dateTime)

## Plot 3
with(subset_data, {
    plot(Sub_metering_1 ~ dateTime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ dateTime, col = "red")
    lines(Sub_metering_3 ~ dateTime, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
