# Reading the data from file (assuming file has been downloaded, unzipped and copied to R home directory)
hh.power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Subset the data 
hh.power <- hh.power[hh.power$Date %in% c("1/2/2007","2/2/2007") ,]

# plot the graph in png format with 480X480
png(filename="plot1.png", width=480, height=480)
hist(hh.power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
