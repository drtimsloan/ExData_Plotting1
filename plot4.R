## Exploratory Data Analysis Assignment 1: Plot4

# This script assumes the household power consumption file is in the parent directory, 
# to avoid downloading it again or including it in the git repository!
setwd("..")
hpc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
setwd("./ExData_Plotting1/")

# Combines the date and time into a new variable and converts to POSIXlt
hpc$Date_Time <- paste(hpc$Date, hpc$Time)
hpc$Date_Time <- strptime(hpc$Date_Time, format="%d/%m/%Y %H:%M:%S")

# Creates the png file and plots the graphs to it
png(file = "plot4.png")
par(mfrow=c(2,2))

# Plot 1
with(hpc, plot(Date_Time,Global_active_power, type="l", xlab="", ylab="Global Active Power"))
# Plot 2
with(hpc, plot(Date_Time,Voltage, type="l", xlab="datetime", ylab="Voltage"))
# Plot 3
with(hpc, plot(Date_Time,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc, lines(Date_Time,Sub_metering_2,col="red"))
with(hpc, lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black","red","blue"),bty="n")
# Plot 4
with(hpc, plot(Date_Time,Global_reactive_power, type="l", xlab="datetime"))

dev.off()