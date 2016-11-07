# Plot Two:
# Set working directory
setwd("C:/Users/Emma/Desktop/DataHouse")

# Read file into a table as PRC.
PRC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

# filtered/subset data with desired date range
subSetPRC <- PRC[PRC$Date %in% c("1/2/2007","2/2/2007") ,]


# Converting data and time date/time class.
datetime <- strptime(paste(subSetPRC$Date, subSetPRC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# coerced the Global_active_power column to be ploted as numeric.
globalActivePower <- as.numeric(subSetPRC$Global_active_power)
# Opens and creates a png file, setting the plot parameters.
png("plot2.png", width=480, height=480)
# Plotting graph and labeling axes and title, specifying the internal storage mode using typeof argument.
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Closing opened graphic file.
dev.off()