#Author - Adam Ficke
#Exporatory Data Analysis Peer Graded Assignment

#read in data table
elec.data <-
  read.table(
    "household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    stringsAsFactors = FALSE
  )

#convert date & time factors to date/time

elec.data$DateTime <- paste(elec.data$Date, elec.data$Time)
elec.data$DateTime <-
  strptime(elec.data$DateTime, format = "%d/%m/%Y %H:%M:%S")
#elec.data$DateTime <- as.POSIXct(elec.data$DateTime)
elec.data$Date <- as.Date(elec.data$Date, format = "%d/%m/%Y")

#subset to days in question
elec.data.small <-
  subset(elec.data, Date >= "2007-02-01" & Date <= "2007-02-02")

#convert to numeric

elec.data.small$Global_active_power <-
  as.numeric(elec.data.small$Global_active_power)

#Plot2

library(datasets)
library(ggplot2)
#elec.data.small$Weekday <- weekdays.Date(elec.data.small$Date)

elec.data.small$weekday<-weekdays.Date(elec.data.small$DateTime)

#qplot(elec.data.small$DateTime,elec.data.small$Global_active_power)
#ggplot(data = elec.data.small, aes(x=DateTime,y=Global_active_power)) +
# geom_smooth(method = "lm")

#plot(Global_active_power ~ DateTime, elec.data.small,type="l")

plot(elec.data.small$DateTime,
     elec.data.small$Global_active_power,ylab = "Gobal Average Power (kilowatts)",type = "l")


dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
