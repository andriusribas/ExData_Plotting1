# read the dataset (assuming it is inside the working dir)
ds <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset into ds1
ds1 <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007",]

# normalize dates
ds1$Datetime <- strptime(paste(ds1$Date, ds1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# open png device 480x480, white background
png(filename="plot4.png", width=480, height=480, bg="white")

# set global properties
par(mfcol=c(2,2))

# create 1st plot
plot(x=ds1$Datetime, y=ds1$Global_active_power, type="l", ylab="Global Active Power", xlab = "")

# create 2nd plot
plot(ds1$Datetime, ds1$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(ds1$Datetime, ds1$Sub_metering_2, col="red")
lines(ds1$Datetime, ds1$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# create 3rd plot
plot(x=ds1$Datetime, y=ds1$Voltage, type="l", ylab="Voltage", xlab = "datetime")

# create 4th plot
plot(x=ds1$Datetime, y=ds1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")

# close png file
dev.off()
