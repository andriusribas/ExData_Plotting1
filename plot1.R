# read the dataset (assuming it is inside the working dir)
ds <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset into ds1
ds1 <- ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007",]

# open png device 480x480, white background
png(filename="plot1.png", width=480, height=480, bg="white")

# create histogram
hist(ds1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
