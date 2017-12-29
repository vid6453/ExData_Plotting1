#setting the working directory
setwd("C:/D/Datascience/MyRepoInGitHub")
#reading the required data using read.table
data <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)
#assigning the column names
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#converting to required format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

#drawing the plot
png("plot4.png", width=480, height=480)
#setting the rows and columns for graphs
par(mfrow = c(2, 2)) 
#plotting the graph and labelling x and y axiz
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", xlab="" ,ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
#naming the graph, giving legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
#closing the png
dev.off()

