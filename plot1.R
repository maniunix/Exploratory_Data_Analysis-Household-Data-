#Read and load the data
data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#check the columns names of the dataset
#names(data)

#Since we have to subset the data from two dates i.e. 2007-02-01 and 2007-02-02
#View(data)

#Subset the data
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

glimpse(sub_data)

global_active_power <- as.numeric(sub_data$Global_active_power)
png("plot1.png", width = 480, height = 480)

# Plot the data
global_active_power %>%
  hist(col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power(kilowatts)",
       ylab = "Frequency")

dev.off()
