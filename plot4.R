#Read and load the data
data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#check the columns names of the dataset
#names(data)

#Since we have to subset the data from two dates i.e. 2007-02-01 and 2007-02-02
#View(data)

#Subset the data
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Convert the Date/Time variable in to classes
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

global_active_power <- as.numeric(sub_data$Global_active_power)
global_reactive_power <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)

sub_meter_1 <- as.numeric(sub_data$Sub_metering_1)
sub_meter_2 <- as.numeric(sub_data$Sub_metering_2)
sub_meter_3 <- as.numeric(sub_data$Sub_metering_3)

png("plot4.png", width = 480,height = 480)

#Since we want to plot 4 plots we would assign the parameter
par(mfcol = c(2,2))

plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, sub_meter_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
