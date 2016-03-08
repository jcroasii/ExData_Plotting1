mydata<-read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

mydata$date_time <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %T")


newdata<-mydata[mydata$date_time >= as.POSIXct("2007-2-1") & mydata$date_time < as.POSIXct("2007-2-3"),]

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
par(mar=c(4,4,4,1))
plot(newdata$date_time, as.numeric(newdata$Global_active_power), type="l", xlab = "", ylab = "Global Active Power")
plot(newdata$date_time, newdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(newdata$date_time, newdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(newdata$date_time, newdata$Sub_metering_1, type="l", col='black')
points(newdata$date_time, newdata$Sub_metering_2, type="l", col='red')
points(newdata$date_time, newdata$Sub_metering_3, type="l", col='blue')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1,1), bty = "n")
plot(newdata$date_time, newdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")

dev.off()
