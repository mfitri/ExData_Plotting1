setwd("C:/Users/user/Documents/Data Science/Plotting Assignment 1 for Exploratory Data Analysis/ExData_Plotting1")

fulldata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_a <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
data_a$Date <- as.Date(data_a$Date,"%d/%m/%Y")

png("plot1.png", width=480, height=480)
hist(data_a$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.off()