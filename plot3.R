library(dplyr)
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
df$datetime <- paste(df$Date, df$Time, sep =" ") %>% strptime("%d/%m/%Y %H:%M:%S")
png("Plot3.png")
plot(df$datetime, df$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = "solid")
dev.off()