namesData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

subsetData <- read.table("household_power_consumption.txt", sep=";", 
                         na.strings=c("NA","?"), skip=66637, nrows=2880)

names(subsetData) <- names(namesData)

dates <- paste(subsetData$Date, subsetData$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(datetime, subsetData$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, subsetData$Voltage, type="l", ylab="Voltage", 
     xlab="datetime")

plot(datetime, subsetData$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(datetime, subsetData$Sub_metering_2, col="red")
lines(datetime, subsetData$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, subsetData$Global_reactive_power, cex=0.95, type="l", 
     ylab="Global_reactive_power", xlab="datetime", xaxt="n")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()