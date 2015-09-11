# Reading the data from file (assuming file has been downloaded, unzipped and copied to R home directory)
hh.power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Subsetting the data
hh.power <- hh.power[hh.power$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hh.power$Date, hh.power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(hh.power$Global_active_power)
globalReactivePower <- as.numeric(hh.power$Global_reactive_power)
voltage <- as.numeric(hh.power$Voltage)
sub_metering_1 <- as.numeric(hh.power$Sub_metering_1)
sub_metering_2 <- as.numeric(hh.power$Sub_metering_2)
sub_metering_3 <- as.numeric(hh.power$Sub_metering_3)

# Arrange 4 graph in 2 rows and 2 column
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_active_power")
dev.off()

