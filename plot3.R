
#PLOT 3

the_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


par(mfrow = c(1,1))

# plot series
newdata <- subset(the_data, Date == '1/2/2007' | Date == '2/2/2007')

png('plot3.png')

#set up the plotting area, but don't plot anything just yet
plot(dates,newdata$Sub_metering_1,type="l", ylab="Energy sub metering")

#let's add the data one 

points(dates, newdata$Sub_metering_2, col="red", type="l")
points(dates, newdata$Sub_metering_3, col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5), col=c("black","red","blue")) # gives the legend lines the correct color and width

dev.off()

