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
DateTime <- as.POSIXct(paste(myData$Date, myData$Time), format="%Y-%m-%d %H:%M:%S")

## Creating Plot 2
plot(DateTime, myData$Global_active_power, 
     type = "l",
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Creating plot file
dev.copy(png, file = "plot2.png")
dev.off()

