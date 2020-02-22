#Author - Adam Ficke
#Exporatory Data Analysis Peer Graded Assignment
#plot 3

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

#convert Power to numeric
elec.data.small$Global_active_power <-
  as.numeric(elec.data.small$Global_active_power)

#Plot3
#dev.new(width = 480, height = 480, unit = "px")
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
  col = c("black", "red", "blue")
)

#print plot to png
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
