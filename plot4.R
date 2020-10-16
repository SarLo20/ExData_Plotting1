####################
## load data
####################
fileHouseholdPowerConsumption <- "/home/sarah/ownCloud/Sarah/Data Science Course/4 Exploratory Data Analysis/Project_Week1/household_power_consumption.txt"
# determine which rows to load
start <- grep("1/2/2007", readLines(fileHouseholdPowerConsumption))[1]
end <- grep("3/2/2007", readLines(fileHouseholdPowerConsumption))[1] - 1
n <- end - start + 1

data <- read.table(file = fileHouseholdPowerConsumption,
                   skip = start,
                   nrows = n,
                   sep = ";",
                   col.names = colnames(read.table(fileHouseholdPowerConsumption, 
                                                   nrow = 1,
                                                   header = TRUE,
                                                   sep = ";")))

####################
## preprocessing
####################
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time, format = "%H:%M:%S"), "%H:%M:%S")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

####################
## plot
####################
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

# top left
plot(data$DateTime, data$Global_active_power,
     ylab = "Global Active Power",
     xlab = "",
     type = "l")

# top right
plot(data$DateTime, data$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")

# bottom left
plot(data$DateTime, data$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = "",
     type = "l",
     col = "black")
lines(data$DateTime, data$Sub_metering_2,
      col = "red")
lines(data$DateTime, data$Sub_metering_3,
      col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1,1,1))

# bottom right
plot(data$DateTime, data$Global_reactive_power,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")

dev.off()