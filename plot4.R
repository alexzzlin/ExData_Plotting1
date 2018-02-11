setwd("E://Coursera//Specializations//Data_Science_JHU//C04_Data Exploratory Analysis//Week1") 
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.zip"))
{
  download.file(fileurl, "household_power_consumption.zip")
}
df <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"),
               stringsAsFactors = FALSE, header = TRUE, sep = ";")

str(df)
head(df$Date)
df$Dates <- as.Date(df$Date,"%d/%m/%Y")
head(df$Dates)
df_s1 <- subset(df, Dates >= "2007-02-01")
df_ss <- subset(df_s1, Dates <= "2007-02-02")
df_ss$DateTime <- as.POSIXct(paste(df_ss$Dates, df_ss$Time))
str(df_ss)

png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(as.numeric(df_ss$Global_active_power) ~ df_ss$DateTime, xlab="", col='black',
     ylab="Global Active Power (killograms)",type="l")

plot(as.numeric(df_ss$Sub_metering_1) ~ df_ss$DateTime, xlab="", col='black',
     ylab="Energy sub-metering", type='l')
lines(as.numeric(df_ss$Sub_metering_2) ~ df_ss$DateTime,col='red', type='l')
lines(as.numeric(df_ss$Sub_metering_3) ~ df_ss$DateTime,col='blue', type='l')
legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, box.lty=1, box.lwd=1, box.col="black")

plot(as.numeric(df_ss$Voltage) ~ df_ss$DateTime, xlab="", col='black',
     ylab="Voltage", type='l')

plot(as.numeric(df_ss$Global_reactive_power) ~ df_ss$DateTime, xlab="", col='black',
     ylab="Global Reactive Power",type="l")

dev.off()

# Symbol	Meaning	                Example
#   %d	  day as a number (0-31)	01-31
#   %a    abbreviated weekday     Mon
#   %A    unabbreviated weekday	  Monday
#   %m	  month (00-12)	          00-12
#   %b    abbreviated month       Jan
#   %B	  unabbreviated month     January
#   %y    2-digit year            07  
#   %Y	  4-digit year	          2007