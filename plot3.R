plot3<- function(){
  
  #date restrictions
  Date1=as.Date("2007-02-01")
  Date2=as.Date("2007-02-02")
  
  #read data
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
  data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
  data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
  
  #fromat dates
  data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
  format(data$Date, "%Y-%m-%d")
  data$Date=as.Date(data$Date)
  
  #constrain dates
  subSetData <- data[data$Date %in% c(Date1,Date2) ,]
  
  #combine date and time
  datetime <- paste(subSetData$Date, subSetData$Time)
  datetime =as.POSIXct(datetime)
  
  #plot line
  png("plot3.png", width=480, height=480)
  plot(datetime,subSetData$Sub_metering_1, type="l",xlab="", ylab="energy sub metering")
  lines(datetime,subSetData$Sub_metering_2, type="l", col="red")
  lines(datetime,subSetData$Sub_metering_3, type="l", col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('black', 'red', 'blue'))
  
 
  
}