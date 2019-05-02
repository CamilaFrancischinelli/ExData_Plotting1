## Clean workspace
rm(list=ls())

## Setting Work Directory
setwd("C:/Users/cmffe/OneDrive - Vestas Wind Systems A S/Documents/R")

## Loading Data Base
myData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

## Formating columns and subsetting only the days we want to explore
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
myData <- subset(myData, Date == "2007-02-01" | Date == "2007-02-02")
myData$Global_active_power <- as.numeric(as.character(myData$Global_active_power))
myData$Global_reactive_power <- as.numeric(as.character(myData$Global_reactive_power))
myData$Sub_metering_1 <- as.numeric(as.character(myData$Sub_metering_1))
myData$Sub_metering_2 <- as.numeric(as.character(myData$Sub_metering_2))
myData$Sub_metering_3 <- as.numeric(as.character(myData$Sub_metering_3))
myData$Voltage <- as.numeric(as.character(myData$Voltage))
DateTime <- as.POSIXct(paste(myData$Date, myData$Time), format="%Y-%m-%d %H:%M:%S")

## Setting the window for 4 plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 2, 0, 0))

## Creating Plot 1
plot(DateTime, myData$Global_active_power, 
     type = "l",
     main = "", 
     xlab = "",
     ylab = "Global Active Power")

## Creating Plot 2
plot(DateTime, myData$Voltage, 
     type = "l",
     main = "", 
     xlab = "datetime",
     ylab = "Voltage")

## Creating Plot 3
plot(DateTime, myData$Sub_metering_1, 
     type = "l",
     col = "black", 
     main = "", 
     xlab = "",
     ylab = "Energy sub metering")
lines(DateTime, myData$Sub_metering_2, 
      type = "l",
      col = "red")
lines(DateTime, myData$Sub_metering_3, 
      type = "l",
      col = "blue")

## Creating a legend for Plot 3
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1,1,1),
       cex = 0.8,
       bty = "n")

## Creating Plot 4
plot(DateTime, myData$Global_reactive_power, 
     type = "l",
     main = "", 
     xlab = "datetime",
     ylab = "Global_reactive_power")


## Creating plot file
dev.copy(png, file = "plot4.png")
dev.off()

