#set working directory
setwd("C:/D/Datascience/MyRepoInGitHub")
#read the text file with read.table
data <- read.table("household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)
#assigning column names
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                    "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#converting to required format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
#plotting required graph, labelling x and y axis
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()