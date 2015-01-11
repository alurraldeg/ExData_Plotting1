# Load Data
data <- read.table(file = "./household_power_consumption.txt" , header = TRUE , sep = ";" , quote = "" , dec = "." , stringsAsFactors = FALSE , strip.white = FALSE , na.strings = "?")

# Subsetting
adata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Format Date
adata$Date <- as.Date( x = adata$Date , format = "%d/%m/%Y")
adata$DT <- as.POSIXct(x = paste( adata$Date , adata$Time ))

# Plot
plot(x = adata$DT , y = adata$Global_active_power , type = "l" , ylab = "Global Active Power (kilowatts)" , xlab = "")

# Copy to png
dev.copy(png , filename = "plot2.png")
dev.off()