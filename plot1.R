
plot1<- function(){

  #date restrictions
  Date1=as.Date("2007-02-01")
  Date2=as.Date("2007-02-02")
  
  #read data
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  data$Global_active_power<-as.numeric(data$Global_active_power)

  #fromat dates
  data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
  format(data$Date, "%Y-%m-%d")
  data$Date=as.Date(data$Date)

  #constrain dates
  subSetData <- data[data$Date %in% c(Date1,Date2) ,]

  #plot histogram
  hist(subSetData$Global_active_power, col='red',main = "Global Active Power", xlab = "Global Active Power (Kw)", ylim = c(0,1200))
  
  #save histogram
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()

}