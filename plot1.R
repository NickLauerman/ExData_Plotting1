# Plot 1
# Histogram of Global Active Power 
# 
file = "household_power_consumption.txt"
data <- read.table(file = file,
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
data$Date <- as.Date (data$Date, "%d/%m/%Y")
work <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "plot1.png",
    units = "px",
    width = 480,
    height = 480)
hist(work$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
