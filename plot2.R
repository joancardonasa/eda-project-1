## Exploratory Data Analysis: Course Project 1

## @Joan Cardona Sanchez, 2015, Plot 2

Sys.setlocale("LC_TIME", "English") # So that the days come out in english

library(dplyr)

data <- read.table("household_power_consumption.txt", header =  T, sep = ";")

data$Date <- as.character(data$Date)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# 2880 observations = 24 hours * 2 days * 60 minutes per hour
data <- tbl_df(data)
data <- select(data, Date, Time, Global_active_power) ##we now have a three column df
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
## Date and Time Shenaniganz
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data <- mutate(data, DateTime = paste(Date, Time)) ##We now have a fourth column
data <- select(data, DateTime, Global_active_power) ##We now have a two column df
data$DateTime <- as.POSIXct(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
## The DateTime column is now of part of the the POSIXct Class

png(file = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()