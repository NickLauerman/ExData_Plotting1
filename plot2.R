# Plot 2
# Time series of Global Active Power 
# 

# Set information to retrieve and load data
file = "household_power_consumption.txt"
zip = "exdata-data-household_power_consumption.zip"
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# If source data file is not present downloads the file.
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
png(filename = "plot2.png",
    units = "px",
    width = 480,
    height = 480)

# Create the plot with proper axis labels
plot(work$datetime, work$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# Close the graphic device created above.
dev.off()