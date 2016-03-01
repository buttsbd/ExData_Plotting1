namesData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)


subsetData <- read.table("household_power_consumption.txt", sep=";", 
                         na.strings=c("NA","?"), skip=66637, nrows=2880)

names(subsetData) <- names(namesData)


par(mfrow=c(1,1))
hist(subsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()