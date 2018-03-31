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

##creating the plot1
  #define parameter to display
  #assign x axis label, y is assigned automatically
  #atribute colour to red
  #title

hist(subdata$Global_active_power,xlab ="Global Active Power (kilowatts)",col = "red",main = "Global Active Power")

## Saving to png file 
  #creating png file
  #closing the graphic device
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
