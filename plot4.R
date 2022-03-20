dataFile <- "./data/household_power_consumption.txt" #load the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #read the data to the table
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #subset data from feb 1st 2007 to feb 2nd 2007
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #reformat the date
globalActivePower <- as.numeric(subSetData$Global_active_power) #turn var global active power to numeric
globalReactivePower <- as.numeric(subSetData$Global_reactive_power) #turn var global reactive power to numeric
voltage <- as.numeric(subSetData$Voltage) #turn var voltage to numeric
subMetering1 <- as.numeric(subSetData$Sub_metering_1) #turn var sub_metering_1 to numeric
subMetering2 <- as.numeric(subSetData$Sub_metering_2) #turn var sub_metering_2 to numeric
subMetering3 <- as.numeric(subSetData$Sub_metering_3) #turn var sub_metering_3 to numeric
png("plot4.png", width=480, height=480) #open png device
par(mfrow = c(2, 2)) #device the screen to 2row and 2collumn

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) #make 1st plot

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") #make 2nd plot

#make 3rd plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#make 4th plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() #close png device