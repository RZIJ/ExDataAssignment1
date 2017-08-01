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
png("Plot1.png")
hist(df$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
