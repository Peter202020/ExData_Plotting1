##Reading data and formating date variable
  #indicate file name
  #set column separator to ";"
  #set header
  #assign "?" for NA values
  #format for date 

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")


#Subseting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates 

datetime <- paste(as.Date(subdata$Date), subdata$Time) 
subdata$Datetime <- as.POSIXct(datetime) 


##creating the plot4
  #setting parameters for layout
  #using with comand to avoid repeating
  #ploting
  #legend

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(subdata, { 
  plot(Global_active_power~Datetime, type="l",  
       ylab="Global Active Power (kilowatts)", xlab="") 
  plot(Voltage~Datetime, type="l",  
       ylab="Voltage (volt)", xlab="") 
  plot(Sub_metering_1~Datetime, type="l",  
       ylab="Global Active Power (kilowatts)", xlab="") 
  lines(Sub_metering_2~Datetime,col='Red') 
  lines(Sub_metering_3~Datetime,col='Blue') 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  plot(Global_reactive_power~Datetime, type="l",  
       ylab="Global Rective Power (kilowatts)",xlab="") 
}) 
## Saving to png file 
  #creating png file
  #closing the graphic device
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 
