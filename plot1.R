## Exploratory Data Analysis: Course Project 1

## @Joan Cardona Sanchez, 2015, Plot 1

Sys.setlocale("LC_TIME", "English") # So that the days come out in english

library(dplyr)

data <- read.table("household_power_consumption.txt", header =  T, sep = ";")

data$Date <- as.character(data$Date)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# 2880 observations = 24 hours * 2 days * 60 minutes per hour
g_act_pow <- data$Global_active_power
g_act_pow <- as.character(g_act_pow)
g_act_pow <- as.numeric(g_act_pow)
png(file = "plot1.png", width = 480, height = 480)
hist(g_act_pow, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# dev.copy(png, file = "plot1.png", width = 200, height = 200): This solution is not good practice
dev.off()
