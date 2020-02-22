#Author - Adam Ficke
#Exporatory Data Analysis Peer Graded Assignment
#plot 4

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
elec.data$Date <- as.Date(elec.data$Date, format = "%d/%m/%Y")

#subset to days in question
elec.data.small <-
  subset(elec.data, Date >= "2007-02-01" & Date <= "2007-02-02")

#convert Voltage to numeric
elec.data.small$Global_active_power <-
  as.numeric(elec.data.small$Global_active_power)

elec.data.small$Voltage <-
  as.numeric(elec.data.small$Voltage)

elec.data.small$Voltage <-
  as.numeric(elec.data.small$Voltage)

#Plot4
png(filename = "plot4.png",width = 480,height = 480)
#establish 2x2 plot
par(mfrow=c(2,2))
#topleft
plot(
  elec.data.small$DateTime,
  elec.data.small$Global_active_power,
  ylab = "Gobal Average Power",
  type = "l",
  xlab = NA
)

#top right 
plot(
  elec.data.small$DateTime,
  elec.data.small$Voltage,
  ylab = "Voltage",
  type = "l",
  xlab = "datetime"
)

#bottomleft
plot(
  elec.data.small$DateTime,
  elec.data.small$Sub_metering_1,
  ylab = "Energy sub metering",
  type = "l",
  xlab = NA
)
lines(elec.data.small$DateTime,
      elec.data.small$Sub_metering_2,
      col = "red")
lines(elec.data.small$DateTime,
      elec.data.small$Sub_metering_3,
      col = "blue")
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lwd = c(2, 2),
  col = c("black", "red", "blue"),
  bty = "n"
)

#bottom right
plot(
  elec.data.small$DateTime,
  elec.data.small$Global_reactive_power,
  ylab = "Global_reactive_power",
  type = "l",
  xlab = "datetime"
)
dev.off()
