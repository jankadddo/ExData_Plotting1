# Plot Three:

# Set working directory
setwd("C:/Users/Emma/Desktop/DataHouse")

# Read file into a table as PRC.
PRC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

# filtered/subset data with desired date range
subSetPRC <- PRC[PRC$Date %in% c("1/2/2007","2/2/2007") ,]

# Converting data and time date/time class.
datetime <- strptime(paste(subSetPRC$Date, subSetPRC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# coerced the columns as numeric.
globalActivePower <- as.numeric(subSetPRC$Global_active_power)

subMetering1 <- as.numeric(subSetPRC$Sub_metering_1)

subMetering2 <- as.numeric(subSetPRC$Sub_metering_2)

subMetering3 <- as.numeric(subSetPRC$Sub_metering_3)

# Opens and creates a png file, setting the plot parameters.
png("plot3.png", width=480, height=480)
# Plotting graph and labeling axes, specifying the internal storage mode using the typeof argument.
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

# Plotting and Specifying line colors. 
lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

#adding in legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# Closing opened graphic file.
dev.off()