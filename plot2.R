#Author - Adam Ficke
#Exporatory Data Analysis Peer Graded Assignment
#plot 2

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

#Plot2
png(filename = "plot2.png",width = 480,height = 480)

plot(
  elec.data.small$DateTime,
  elec.data.small$Global_active_power,
  ylab = "Gobal Average Power (kilowatts)",
  type = "l",
  xlab = NA
)
dev.off()
