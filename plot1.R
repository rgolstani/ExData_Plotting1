##### The required data is downloaded in working directory in zip format

setwd("~/Desktop/ExploratoryCoursera")  ## my working directory
# Read data set after unzipping the data file
pwruse <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                               header=T, sep=";")
# extracting power consumption for Feb. 1 and 2, 2007 only
pwrusetwodays <- pwruse[as.character(pwruse$Date) %in% c("1/2/2007", "2/2/2007"),]
# pasting Date and Time variables and defining the new column for it
pwrusetwodays$dateTime = paste(pwrusetwodays$Date, pwrusetwodays$Time)
# Convert to Date/Time class
pwrusetwodays$dateTime <- strptime(pwrusetwodays$dateTime, "%d/%m/%Y %H:%M:%S")
attach(pwrusetwodays)
png("plot1.png", width=480, height=480, units="px")
# Plot the distribution of global active power
p1<- hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
print(p1)
dev.off()
