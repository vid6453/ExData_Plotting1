setwd("C:/D/Datascience/MyRepoInGitHub")

data <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
globalActivePower <- as.numeric(data$Global_active_power)
sub_metering_1 <- as.numeric(data$Sub_metering_1)
sub_metering_2 <- as.numeric(data$Sub_metering_2)
sub_metering_3 <- as.numeric(data$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime, sub_metering_2,type="l", col="red")
lines(datetime, sub_metering_3,type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2.5, col=c("black", "red", "blue"))
dev.off()