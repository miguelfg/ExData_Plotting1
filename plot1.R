library("sqldf")
# get the data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv2.sql(myFile,mySql)

# plot the data
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(myData$Global_active_power, col = "red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
