data<-read.delim(file='household_power_consumption.txt', header = TRUE, sep = ";", dec = ".")
data$Datetime<-paste(data$Date,data$Time,sep=" ")
data$Datetime<-strptime(x=as.character(data$Datetime),format='%d/%m/%Y %H:%M:%S')
data2<-data[data$Datetime>=as.POSIXct("2007-02-01 00:00:00", tz="Asia/Singapore"),]
data2<-data2[data2$Datetime<as.POSIXct("2007-02-03 00:00:00", tz="Asia/Singapore"),]
data2$Global_active_power<- as.numeric(as.character(data2$Global_active_power))
png(file = "plot2.png")
plot(data2$Datetime,data2$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab="")
dev.off()