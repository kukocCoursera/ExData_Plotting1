
#PLOT 4


the_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")


# plot series
newdata <- subset(the_data, Date == '1/2/2007' | Date == '2/2/2007')



#let's have 2 rows of plots and one column of plots
png('plot4.png')
par(mfrow = c(2,2))
par(mar=rep(3.9,4))


#WORKS!!!
dates <- strptime(paste(as.Date(newdata$Date, "%d/%m/%Y"), newdata$Time), format="%Y-%m-%d %H:%M:%S")


#the line plot!
plot(dates, as.numeric(newdata$Global_active_power)/1000, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Voltage Plot

plot(dates, as.numeric(newdata$Voltage), type="l", ylab="Voltage", xlab="datetime")



#set up the plotting area, but don't plot anything just yet
plot(dates,newdata$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")

#let's add the data one 

points(dates, newdata$Sub_metering_2, col="red", type="l")
points(dates, newdata$Sub_metering_3, col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       col=c("black","red","blue"), bty="n", cex=0.8) # gives the legend lines the correct color and width



#Global Reactive Power Plot

plot(dates, as.numeric(newdata$Global_reactive_power), type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()