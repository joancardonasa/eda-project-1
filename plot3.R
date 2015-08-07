## Exploratory Data Analysis: Course Project 1

## @Joan Cardona Sanchez, 2015, Plot 3

Sys.setlocale("LC_TIME", "English") # So that the days come out in english

library(dplyr)

data <- read.table("household_power_consumption.txt", header =  T, sep = ";")

data$Date <- as.character(data$Date)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# 2880 observations = 24 hours * 2 days * 60 minutes per hour
data <- tbl_df(data)
data <- select(data, Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
## Date and Time Shenaniganz
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data <- mutate(data, DateTime = paste(Date, Time)) ##We now have a fourth column

data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
## The DateTime column is now of part of the the POSIXct Class

png(file = "plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1, ylab = "", xlab = "", type = "l")
par(new = T)
plot(data$DateTime, data$Sub_metering_2, ylab = "", xlab = "", type = "l", ylim = range(data$Sub_metering_1), col = "red")
par(new = T)
plot(data$DateTime, data$Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", ylim = range(data$Sub_metering_1), col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),,col=c("black","red","blue")) 

dev.off()

