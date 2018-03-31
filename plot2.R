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


##creating the plot2
  #seting parameters to present
  #setting type
  #naming Y axis, keeping X clear
plot(subdata$Global_active_power~subdata$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 


## Saving to png file 
  #creating png file
  #closing the graphic device
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
