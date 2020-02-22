#Author - Adam Ficke
#Exporatory Data Analysis Peer Graded Assignment
#plot 1

#read in data table
elec.data <-
  read.table(
    "household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    stringsAsFactors = FALSE
  )

#convert factors to date/time

elec.data$DateTime <- paste(elec.data$Date, elec.data$Time)
elec.data$DateTime <-
  strptime(elec.data$DateTime, format = "%d/%m/%Y %H:%M:%S")
elec.data$Date <- as.Date(elec.data$Date, format = "%d/%m/%Y")

#subset to days in question
elec.data.small <-
  subset(elec.data, Date >= "2007-02-01" & Date <= "2007-02-02")

#check format
str(elec.data.small)

#convert to numeric

elec.data.small$Global_active_power <-
  as.numeric(elec.data.small$Global_active_power)

#plot 1
png(filename = "plot1.png",width = 480,height = 480)
hist(
  elec.data.small$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)

dev.off()
