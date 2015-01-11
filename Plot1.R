# Load Data
data <- read.table(file = "./household_power_consumption.txt" , header = TRUE , sep = ";" , quote = "" , dec = "." , stringsAsFactors = FALSE , strip.white = TRUE , na.strings = "?")

# Subsetting
adata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Plot
hist(x = adata$Global_active_power , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency" , main = "Global Active Power" , col = "red")

# Copy to png
dev.copy( png , filename = "plot1.png")
dev.off()