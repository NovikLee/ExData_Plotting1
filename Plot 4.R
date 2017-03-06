##Create Plot 4
##Download and Subset Data
      if(!file.exists("./data")){dir.create("./data")}
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile = "./data/power.zip")
      unzip(zipfile = "./data/power.zip",exdir = "./data")
      pwr <- read.table(".data/household_power_consumption.txt", skip = 1, sep = ";")
      names(pwr) <- c("date","time","gactive","greactive","voltage","gintesity","submeter1","submeter2","submeter3")
      subpwr <- subset(pwr, pwr$date == '1/2/2007' | pwr$date == '2/2/2007')

#Transform Global Active Power into Numeric, Date and Time into time stamp, and Submeter variables into numeric
      subpwr$gactive <- as.numeric(as.character(subpwr$gactive))
      subpwr$timestmp <- strptime(paste(subpwr$date,subpwr$time), format = "%d/%m/%Y %H:%M:%S")
      subpwr$submeter1 <- as.numeric(as.character(subpwr$submeter1))
      subpwr$submeter2 <- as.numeric(as.character(subpwr$submeter2))
      subpwr$submeter3 <- as.numeric(as.character(subpwr$submeter3))
      subpwr$voltage <- as.numeric(as.character(subpwr$voltage))
      subpwr$greactive <- as.numeric(as.character(subpwr$greactive))
      
#Create the row layout
      par(mfrow = c(2,2))
      
#Create plots 
      plot(subpwr$timestmp,subpwr$gactive,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
      plot(subpwr$timestmp,subpwr$voltage,type = "l",xlab = "datetime", ylab = "Voltage")
      plot(subpwr$timestmp,subpwr$submeter1,type = "n",xlab = "",ylab = "Energy sub metering")
      with(subpwr,lines(timestmp,submeter1))
      with(subpwr,lines(timestmp,submeter2, col = "red"))
      with(subpwr,lines(timestmp,submeter3, col = "blue"))
      legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      plot(subpwr$timestmp,subpwr$greactive,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

#Copy to PNG
      dev.copy(png, file = "Plot4.png")
      dev.off()
