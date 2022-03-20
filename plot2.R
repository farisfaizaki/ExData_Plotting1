dataFile <- "./data/household_power_consumption.txt" #load the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #read the data to the table
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] #subset data from feb 1st 2007 to feb 2nd 2007
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #reformat the date
globalActivePower <- as.numeric(subSetData$Global_active_power) #turn var global active power to numeric
png("plot2.png", width=480, height=480) #open png device
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") #make line plot
dev.off() #close png device