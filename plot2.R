# Plot 2
# Time series of Global Active Power 
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


#wrap in code to produce the png

plot(work$newDate, work$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)")