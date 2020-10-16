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
## plot
####################
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

dev.off()