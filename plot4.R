# Plot 4
#  4 way figure
# 

file = "household_power_consumption.txt"
zip = "exdata-data-household_power_consumption.zip"
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists(zip)){download.file(url = url, destfile = zip)}

data <- read.table(unz(zip, file),
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE,
                   nrows = 100000 )

data$datetime  <-  as.POSIXct(paste(data$Date, data$Time), 
                              format = "%d/%m/%Y %H:%M:%S")

work <- subset(data, (datetime >= as.POSIXct("2007-02-01 00:00:00") &
                          datetime < as.POSIXct("2007-02-03 00:00:00")))

png(filename = "plot4.png",
    units = "px",
    width = 480,
    height = 480)

par(mfcol=c(2,2))

plot(work$datetime, work$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

plot(work$datetime, work$Sub_metering_1, 
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(work$datetime, work$Sub_metering_1,
      col = "black")
lines(work$datetime, work$Sub_metering_2,
      col = "red")
lines(work$datetime, work$Sub_metering_3,
      col = "blue")
legend("topright", 
       lty = 1, 
       col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_1"),
       bty = "n")

with(work, 
     plot(datetime, Voltage, 
          type = "l"))

with(work, 
     plot(datetime, Global_reactive_power, 
          type = "l"))


par(mfrow=c(1,1))
dev.off()


