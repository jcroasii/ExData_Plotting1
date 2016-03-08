mydata<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

mydata$date_time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %T")


newdata<-mydata[mydata$date_time >= as.POSIXct("2007-2-1") & mydata$date_time < as.POSIXct("2007-2-3"),]

png(filename = "plot3.png", width = 480, height = 480)

par(mfrow=c(1,1))
par(mar= c(4,4,4,4))
plot(newdata$date_time, newdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(newdata$date_time, newdata$Sub_metering_1, type="l", col='black')
points(newdata$date_time, newdata$Sub_metering_2, type="l", col='red')
points(newdata$date_time, newdata$Sub_metering_3, type="l", col='blue')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1))

dev.off()