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

png("plot2.png", width = 480, height = 480)

plot(datetime,global_active_power, type = "l",xlab = " ",ylab = "Global Active Power (Kilowatts)")
dev.off()
