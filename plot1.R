# Plot 1
# Histogram of Global Active Power 
# 

#set information to retrieve and load data
file = "household_power_consumption.txt"
zip = "exdata-data-household_power_consumption.zip"
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#if source data file is not present downloads the file.
if(!file.exists(zip)){download.file(url = url, destfile = zip)}

# reads the text from from the downloaded zip
#       the seperator between values is a semi-colon ";"
#       the source data using "?" to indication missing values
#       only the first 100,000 rows are loaded to save time and memory
data <- read.table(unz(zip, file),
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE,
                   nrows = 100000 )

# convert the Date variable to type Date for selection
data$Date <- as.Date (data$Date, "%d/%m/%Y")

# select data in the desired range
work <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# create a graphics device. creating a png type image file with an image area
# of 480 by 480 pixels.
# The background by default is set to "WHITE" and is left in that state
# verse the transparent of the example
png(filename = "plot1.png",
    units = "px",
    width = 480,
    height = 480)

# create the histogram with proper axis labels and title
hist(work$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

#close the graphic device created above.
dev.off()
