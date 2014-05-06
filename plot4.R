library("sqldf")
# get the data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

# parse dates
myData$dt <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")

# plot the data
png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow=c(2,2))

plot(myData$dt, myData$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

plot(myData$dt, myData$Voltage, 
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(myData$dt, myData$Sub_metering_1, 
     col="black",
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(myData$dt, myData$Sub_metering_2, col = "red")
lines(myData$dt, myData$Sub_metering_3, col = "blue")
# add a legend 
names_legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend('topright', names_legend, 
       lty=1, 
       cex=0.8, 
       bty="n",
       col=c("black", "red", "blue"),
)


plot(myData$dt, myData$Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
