# Plot One:

# Set working directory
setwd("C:/Users/Emma/Desktop/DataHouse")

# Read file into a table as PRC.
PRC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

# filtered/subset data with desired date range
subSetPRC <- PRC[PRC$Date %in% c("1/2/2007","2/2/2007") ,]

# coerced the Global_active_power column to be ploted as numeric.
globalActivePower <- as.numeric(subSetPRC$Global_active_power)
# Opens and creates a png file, setting the plot parameters.
png("plot1.png", width=480, height=480)
# Plots a histogram, labeling axis and bringing in title.
hist(globalActivePower, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
# Closing opened graphic file.
dev.off()