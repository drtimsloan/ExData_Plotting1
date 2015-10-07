## Exploratory Data Analysis Assignment 1: Plot3

# This script assumes the household power consumption file is in the parent directory, 
# to avoid downloading it again or including it in the git repository!
setwd("..")
hpc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
hpc <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")
setwd("./ExData_Plotting1/")

# Combines the date and time into a new variable and converts to POSIXlt
hpc$Date_Time <- paste(hpc$Date, hpc$Time)
hpc$Date_Time <- strptime(hpc$Date_Time, format="%d/%m/%Y %H:%M:%S")

# Creates the png file and plots the graph to it
png(file = "plot3.png")
with(hpc, plot(Date_Time,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc, lines(Date_Time,Sub_metering_2,col="red"))
with(hpc, lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black","red","blue"))
dev.off()