setwd("C:/Users/user/Documents/Data Science/Plotting Assignment 1 for Exploratory Data Analysis/ExData_Plotting1")

fulldata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_a <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
data_a$Date <- as.Date(data_a$Date,"%d/%m/%Y")

datetime <- paste(as.Date(data_a$Date), data_a$Time)
data_a$datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480, units='px')
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_a, { 
  plot(Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()