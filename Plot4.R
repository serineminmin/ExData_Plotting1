# Coursera Exploratory Data Analysis
# Plot 3

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
png("plot4.png", width=480, height=480)

# create panel of 2by2
par(mfrow = c(2,2))

# plot using basic plot function
with(hpc_subset, {
  plot(Global_active_power~DateTime, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Voltage~DateTime, type = "l", xlab = "datetime")
  plot(Sub_metering_1~DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2~DateTime, col = "Red")
  lines(Sub_metering_3~DateTime, col = "Blue")
  legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type = "l", xlab = "datetime")
})


dev.off()
