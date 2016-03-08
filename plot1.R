mydata<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

mydata$date_time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %T")

newdata<-mydata[mydata$date_time >= as.POSIXct("2007-2-1") & mydata$date_time < as.POSIXct("2007-2-3"),]

png(filename = "plot1.png", width = 480, height = 480)

par(mfrow=c(1,1))
par(mar= c(4,4,4,4))
hist(as.numeric(newdata$Global_active_power), col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()