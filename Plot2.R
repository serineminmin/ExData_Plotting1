# Coursera Exploratory Data Analysis
# Plot 2

# setting wd
setwd("~/Desktop/Training/Coursera/Exploratory Data Analysis/")

# reading in dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
# dim(hpc)
# head(hpc)

hpc_subset <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
# head(hpc_subset)
str(hpc_subset)

# Transform Date Time columns into date time variables
hpc_subset$Date <- as.Date(hpc_subset$Date, format="%d/%m/%Y")
hpc_subset$DateTime <- as.POSIXct(paste(hpc_subset$Date, hpc_subset$Time))

# Create png file
png("plot2.png", width=480, height=480)

# plot using basic plot function
plot(as.numeric(as.character(hpc_subset$Global_active_power))~hpc_subset$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
