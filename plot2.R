# Plot 2
# Time series of Global Active Power 
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

png(filename = "plot2.png",
    units = "px",
    width = 480,
    height = 480)

plot(work$datetime, work$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()