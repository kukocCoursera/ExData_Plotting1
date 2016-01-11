
#PLOT 2

the_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


png('plot2.png')

par(mfrow = c(1,1))

# plot series
newdata <- subset(the_data, Date == '1/2/2007' | Date == '2/2/2007')

#get the date times
dates <- strptime(paste(as.Date(newdata$Date, "%d/%m/%Y"), newdata$Time), format="%Y-%m-%d %H:%M:%S")

#the line plot!
plot(dates, as.numeric(newdata$Global_active_power)/1000, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()