# Coursera Exploratory Data Analysis
# Plot 1

# setting wd
setwd("~/Desktop/Training/Coursera/Exploratory Data Analysis/")

# reading in dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
# dim(hpc)
# head(hpc)

hpc_subset <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")
# head(hpc_subset)
str(hpc_subset)

# Create png file
png("plot1.png", width=480, height=480)

# plot using basic plot function
hist(as.numeric(as.character(hpc_subset$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
