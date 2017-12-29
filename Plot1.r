setwd("C:/D/Datascience/MyRepoInGitHub")

data <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()