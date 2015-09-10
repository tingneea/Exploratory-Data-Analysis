# Reading the data from file (assuming file has been downloaded, unzipped and copied to R home directory)
hh.power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Subset the data 
hh.power <- hh.power[hh.power$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(hh.power$Date, hh.power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(hh.power$Global_active_power)

# plot the graph
png(filename="plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
