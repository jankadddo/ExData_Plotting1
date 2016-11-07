# Plot Four:

# Set working directory
setwd("C:/Users/Emma/Desktop/DataHouse")

# Read file into a table as PRC.
PRC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

# filtered/subset data with desired date range
subSetPRC <- PRC[PRC$Date %in% c("1/2/2007","2/2/2007") ,]
# Converting data and time date/time class.
datetime <- strptime(paste(subSetPRC$Date, subSetPRC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# coerced the columns to numeric.
globalReactivePower <- as.numeric(subSetPRC$Global_reactive_power)
globalActivePower <- as.numeric(subSetPRC$Global_active_power)
voltage <- as.numeric(subSetPRC$Voltage)

subMetering1 <- as.numeric(subSetPRC$Sub_metering_1)

subMetering2 <- as.numeric(subSetPRC$Sub_metering_2)

subMetering3 <- as.numeric(subSetPRC$Sub_metering_3)

# Opens and creates a png file, setting the plot parameters.
png("plot4.png", width=480, height=480)

# Setting up the number of plot on the graphic device
par(mfrow = c(2, 2)) 


# Plotting graph and labeling axes, specifying the internal storage mode using the typeof argument.
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

#adding in legend to the plot.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1.0, col=c("black", "red", "blue"), bty="o")

# Plotting forth graph and labeling axes, specifying the internal storage mode using the typeof argument
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Closing opened graphic file.
dev.off()