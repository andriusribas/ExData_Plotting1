# read the dataset (assuming it is inside the working dir)
ds <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset into ds1
ds1 <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007",]

# normalize dates
ds1$Datetime <- strptime(paste(ds1$Date, ds1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# open png device 480x480, white background
png(filename="plot2.png", width=480, height=480, bg="white")

# create plot
par(mar=c(3,3,0,0))
plot(x=ds1$Datetime, y=ds1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")

# close png file
dev.off()
