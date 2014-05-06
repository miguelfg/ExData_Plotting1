library("sqldf")
# get the data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

# subset the data
myData$dt <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")
  
# plot the data
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(myData$dt, myData$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
