# Plot 4
#  4 way figure
# 
library(lubridate)
file = "household_power_consumption.txt"
data <- read.table(file = file,
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
data$datetime  <-  as.POSIXct(paste(data$Date, data$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date (data$Date, "%d/%m/%Y")
work <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")


#wrap in code to produce the png
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
       bty = "n"
)

with(work, 
     plot(datetime, Voltage, 
          type = "l")
)

with(work, 
     plot(datetime, Global_reactive_power, 
          type = "l")
)


par(mfrow=c(1,1))


