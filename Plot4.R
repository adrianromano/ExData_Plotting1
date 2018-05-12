## Set working directory and Load Data
setwd("/Users/adrianromano/Downloads")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

## Filter dates from 2007/02/01 to 2007/02/02
subset_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Format and combine Date and Time columns
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
dateTime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$dateTime <- as.POSIXct(dateTime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset_data, {
    plot(Global_active_power ~ dateTime, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ dateTime, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ dateTime, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ dateTime, col = "red")
    lines(Sub_metering_3 ~ dateTime, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ dateTime, type = "l", ylab="Global_reactive_power", xlab = "datetime")
})
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
