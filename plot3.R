setwd("/Users/ilin/Documents/EDA/P1")
data1 <- read.table("household_power_consumption.txt", sep=";", header=FALSE, skip=grep("31/1/2007;23:59:00", readLines("household_power_consumption.txt")), nrows=1440)
data2 <- read.table("household_power_consumption.txt", sep=";", header=FALSE, skip=grep("1/2/2007;23:59:00", readLines("household_power_consumption.txt")), nrows=1440)
total <- rbind(data1, data2)
total[, 'V1'] <- as.Date(total[, 'V1'], format="%d/%m/%Y")
total$V10 <- as.POSIXct(paste(total$V1, total$V2, sep = " "), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(total$V10, total[, 'V7'], type="l", xlab="", ylab="Energy sub metering", cex.lab=0.8, cex.axis=0.8)
lines(total$V10, total[, 'V8'], type="l", col="red")
lines(total$V10, total[, 'V9'], type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=0.8, col=c("black","red","blue"), lty=1)
dev.off()

