# Plot 3
# Time series of sub metering 
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

work <- subset(data, (as.Date(datetime) >= "2007-02-01" &
                          as.Date(datetime) <= "2007-02-02"))


png(filename = "plot3.png",
    units = "px",
    width = 480,
    height = 480)

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
                  "Sub_metering_1")
)

dev.off()
