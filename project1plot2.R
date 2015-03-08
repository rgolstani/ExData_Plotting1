

# move to the directory where the data file exdata_data_household_power_consumption.zip is
setwd("~/Desktop/ExploratoryCoursera")
if(!file.exists("exdata_data_household_power_consumption.zip")) {
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" # internet address of the used data
download.file(url, destfile= "exdata_data_household_power_consumption.zip", method="curl")  # downloading to working directory
}

# Read data set after unzipping the data file
pwruse <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                     header=T, sep=";")
# Household power consumption for Feb. 1 and 2, 2007 only
pwrusetwodays <- pwruse[as.character(pwruse$Date) %in% c("1/2/2007", "2/2/2007"),]
# paste Date and Time variables
pwrusetwodays$dateTime = paste(pwrusetwodays$Date, pwrusetwodays$Time)
# Convert to Date/Time class
pwrusetwodays$dateTime <- strptime(pwrusetwodays$dateTime, "%d/%m/%Y %H:%M:%S")
attach(pwrusetwodays)


png("plot2.png", width=480, height=480, units="px")
# Plot of Global active power time series
with(pwrusetwodays, plot(datetime, as.numeric(as.character(Global_active_power)), 
                    type="l", xlab="", ylab="Global Active Power (kilowatts)"))))
dev.off()
