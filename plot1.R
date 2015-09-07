# Reading the data from file (assuming file has been downloaded, unzipped and copied to R home directory)
hh.power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Formatting the date
hh.power$Date <- as.Date(hh.power$Date, format="%d/%m/%Y")

# Subsetting the data using between "2007/02/01" to "2007/02/02"
hh.power <- subset(hh.power, as.Date(Date) >= '2007/02/01'& as.Date(Date) <= '2007/02/02')

# plot the graph in png format with 480X480
png(filename="plot1.png", width=480, height=480)
hist(hh.power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
