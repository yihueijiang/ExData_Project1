rm(list=ls())

#to make sure plot the x axis Thu, Fri, Sat
Sys.setlocale("LC_TIME", "English")

#read data
data<- read.table(file="c:/Users/Yi-Huei/Desktop/Exdata/Project1/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# select subdata with two days from the full data
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))



# convert charcter Date into Date variable
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

# Combine Date and Time variables as the new variable, named "DateTime":
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))


# Create Plot4
png("c:/Users/Yi-Huei/Desktop/plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(subdata$DateTime, subdata$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(subdata$DateTime,subdata$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subdata$DateTime,subdata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()