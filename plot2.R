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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(data$DateTime, data$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")

dev.off()