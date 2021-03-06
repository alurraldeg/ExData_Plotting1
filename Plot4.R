# Load Data
data <- read.table(file = "./household_power_consumption.txt" , header = TRUE , sep = ";" , quote = "" , dec = "." , stringsAsFactors = FALSE , strip.white = FALSE , na.strings = "?")

# Subsetting
adata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Format Date
adata$Date <- as.Date( x = adata$Date , format = "%d/%m/%Y")
adata$DT <- as.POSIXct(x = paste( adata$Date , adata$Time ))

# Plot
par( mfrow = c(2,2) )
plot( x = adata$DT , y = adata$Global_active_power , type = "l" , xlab = "" , ylab = "Global Active Power" )
plot( x = adata$DT , y = adata$Voltage , type = "l" , xlab = "datetime" , ylab = "Voltage" )
plot( x = adata$DT , y = adata$Sub_metering_1 , type = "l" , xlab = "" , ylab = "Energy sub metering" , main = "" )
lines(x = adata$DT , y = adata$Sub_metering_2 , type = "l" , col = "red")
lines(x = adata$DT , y = adata$Sub_metering_3 , type = "l" , col = "blue")
legend( "topright" , c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col = c("black","red","blue") , lty = 1 , bty = "n" , cex = 0.45)
plot( x = adata$DT , y = adata$Global_reactive_power , type = "l" , xlab = "datetime" , ylab = "Global_reactive_power" )

# Copy to png
dev.copy( png , filename = "plot4.png" )
dev.off()