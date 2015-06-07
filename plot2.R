rm(list=ls())

#to make sure plot the x axis Thu, Fri, Sat
Sys.setlocale("LC_TIME", "English")

#read data
data<- read.table(file="c:/Users/Yi-Huei/Desktop/ExData/Project1/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")


# select subdata with two days(1/2/2007-2/2/2007) from the full data
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# convert charcter Date into Date variable
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Combine Date and Time variables as the new variable, named "DateTime":
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# Create Plot2
png("c:/Users/Yi-Huei/Desktop/plot2.png", width = 480, height = 480)
plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()

