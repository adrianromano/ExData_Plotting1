## Set working directory and Load Data
setwd("/Users/adrianromano/Downloads")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

## Filter dates from 2007/02/01 to 2007/02/02
subset_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## Format and combine Date and Time columns
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
dateTime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$dateTime <- as.POSIXct(dateTime)

## Plot 1
hist(subset_data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

