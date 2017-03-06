## Create Plot 1
#Download and Subset Data
      if(!file.exists("./data")){dir.create("./data")}
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile = "./data/power.zip")
      unzip(zipfile = "./data/power.zip",exdir = "./data")
      pwr <- read.table(".data/household_power_consumption.txt", skip = 1, sep = ";")
      names(pwr) <- c("date","time","gactive","greactive","voltage","gintesity","submeter1","submeter2","submeter3")
      subpwr <- subset(pwr, pwr$date == '1/2/2007' | pwr$date == '2/2/2007')
      
#Transform Global Active Power into numeric variable      
      subpwr$gactive <- as.numeric(as.character(subpwr$gactive))
      
#Create histogram
      hist(subpwr$gactive, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")