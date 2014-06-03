# Plot 3
# Time series of sub metering 
# 
library(lubridate)
file = "household_power_consumption.txt"
data <- read.table(file = file,
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
data$newDate  <-  as.POSIXct(paste(data$Date, data$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date (data$Date, "%d/%m/%Y")
work <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")


png(filename = "plot3.png",
    units = "px",
    width = 480,
    height = 480)

plot(work$newDate, work$Sub_metering_1, 
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(work$newDate, work$Sub_metering_1,
      col = "black")
lines(work$newDate, work$Sub_metering_2,
      col = "red")
lines(work$newDate, work$Sub_metering_3,
      col = "blue")

legend("topright", 
       lty = 1, 
       col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_1")
)

dev.off()
