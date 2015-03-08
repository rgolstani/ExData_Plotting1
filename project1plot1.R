
# Data was downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# to the working directory 

# moving to the working directory where the dowloaded files are in zip format
# exdata_data_household_power_consumption.zip is our data file
setwd("~/Desktop/ExploratoryCoursera")
if(!file.exists("exdata_data_household_power_consumption.zip")) {
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile= "exdata_data_household_power_consumption.zip", method="curl")
}
# Read data set after unzipping the data file
pwruse <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                               header=T, sep=";")
# Household power consumption for two days of Feb. 1 and 2, 2007 only
pwrusetwodays <- pwruse[as.character(pwruse$Date) %in% c("1/2/2007", "2/2/2007"),]
# paste Date and Time variables and creat a 'dateTime' new column
pwrusetwodays$dateTime = paste(pwrusetwodays$Date, pwrusetwodays$Time)
# Convert to Date/Time class
pwrusetwodays$dateTime <- strptime(pwrusetwodays$dateTime, "%d/%m/%Y %H:%M:%S")
attach(pwrusetwodays)

png("plot1.png", width=480, height=480, units="px")
# Plot the distribution of global active power
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
