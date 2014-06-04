# Plot 3
# Time series of sub metering 
# 

# Set information to retrieve and load data
file = "household_power_consumption.txt"
zip = "exdata-data-household_power_consumption.zip"
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# If source data file is not present downloads the file
if(!file.exists(zip)){download.file(url = url, destfile = zip)}

# Reads the text from from the downloaded zip
#       the seperator between values is a semi-colon ";"
#       the source data using "?" to indication missing values
#       only the first 100,000 rows are loaded to save time and memory
data <- read.table(unz(zip, file),
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE,
                   nrows = 100000 )

# The datetime variable is created as a POSITct data type
data$datetime  <-  as.POSIXct(paste(data$Date, data$Time), 
                              format = "%d/%m/%Y %H:%M:%S")

# Data for the date range of 1 Feb to 2 Feb 2007 is selected
#       The ceiling cut off is set at midnight 3 Feb but the selection critera
#       is to not inlude that time, this was done to insure all observations for
#       2 Feb were included.
work <- subset(data, (datetime >= as.POSIXct("2007-02-01 00:00:00") &
                          datetime < as.POSIXct("2007-02-03 00:00:00")))


# Create a graphics device. creating a png type image file with an image area
# of 480 by 480 pixels.
png(filename = "plot3.png",
    units = "px",
    width = 480,
    height = 480)

# Create the plot area without any data being ploted.
#    With the correct axis labels.
plot(work$datetime, work$Sub_metering_1, 
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")

# Add data to the chart
# add a plot line for the sub_metering_1 variable.
lines(work$datetime, work$Sub_metering_1,
      col = "black")
# add a plot line for the sub_metering_2 variable.
lines(work$datetime, work$Sub_metering_2,
      col = "red")
# add a plot line for the sub_metering_3 variable.
lines(work$datetime, work$Sub_metering_3,
      col = "blue")

# Add a legend
legend("topright", 
       lty = 1, 
       col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_1"))

# close the graphic device created above.
dev.off()
