setwd("C:/Users/rzij/Documents/Data Science Course/R/Project/Exploratory data analysis/Data/Household")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
df <- read.table("household_power_consumption.txt",
                 sep = ";",
                 header = TRUE,
                 na.strings = "?"
                 ##   ,colClasses = c("Date", "character", "numeric", "numeric", "numeric", 
                 ##                  "numeric", "numeric", "numeric")
)
df <- df[df$Date == "1/2/2007" |df$Date == "2/2/2007" ,]
png("Plot4.png")
par(mfrow=c(2,2))
plot(df$datetime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(df$datetime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$datetime, df$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty = "n", 
       col = c("black", "red", "blue"), lty = "solid")
plot(df$datetime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off() 
