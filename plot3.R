dataFile <- "./data/household_power_consumption.txt" #load the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #read the data to the table
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #subset data from feb 1st 2007 to feb 2nd 2007
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #reformat the date
globalActivePower <- as.numeric(subSetData$Global_active_power) #turn var global active power to numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1) #turn var sub_metering_1 to numeric
subMetering2 <- as.numeric(subSetData$Sub_metering_2) #turn var sub_metering_2 to numeric
subMetering3 <- as.numeric(subSetData$Sub_metering_3) #turn var sub_metering_3 to numeric

png("plot3.png", width=480, height=480) #open png device
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") #make plot with submetering1
lines(datetime, subMetering2, type="l", col="red") #add plot with submetering2
lines(datetime, subMetering3, type="l", col="blue") #add plot with submetering3
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) #add legends
dev.off() #close device