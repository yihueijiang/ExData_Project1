rm(list=ls())

#read data
data<- read.table(file="c:/Users/Yi-Huei/Desktop/ExData/Project1/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# select subdata with two days from the full data
subdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# create Plot1
png("c:/Users/Yi-Huei/Desktop/plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()