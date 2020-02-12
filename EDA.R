#Adam Ficke
#Exporatory Data Analysis Peer Graded Assignment 

#read in data table 
elec.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE) 

#convert factors to date/time 

elec.data$DateTime <- paste(elec.data$Date,elec.data$Time)
elec.data$DateTime <- strptime(elec.data$DateTime, format = "%d/%m/%Y %H:%M:%S")
elec.data$Date <- as.Date(elec.data$Date, format = "%d/%m/%Y")

#check format
str(elec.data)

#subset to days in question 
elec.data.small<- subset(elec.data,Date>="2007-02-01" & Date <= "2007-02-02")
  
  


#Global Active Power

hist(elec.data$Global_active_power)


summary(elec.data)

