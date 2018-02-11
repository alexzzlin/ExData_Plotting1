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
df_s1 <- subset(df, Dates >= "2007-02-01")
df_ss <- subset(df_s1, Dates <= "2007-02-02")
str(df_ss)

png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(df_ss$Global_active_power),
     main="Histogram for Global Active Power", 
     xlab="Global Active Power (killograms)", ylab="Frequency", 
     border="blue", col="red")
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