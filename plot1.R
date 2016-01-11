# READ IN TEXT DATA FILE

the_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# using subset function 
#PLOT 1

png('plot1.png')

par(mfrow = c(1,1))

newdata <- subset(the_data, Date == '1/2/2007' | Date == '2/2/2007')
hist(newdata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()