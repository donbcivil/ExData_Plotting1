setwd("C:/Data Study/Class 4 Exploratory Data Analysis/Project1")

infile <- "household_power_consumption.txt"
project_data <- read.table(file=infile, sep=";",header = TRUE) 

date1 <- as.Date( "2007-02-01")
date2 <- as.Date( "2007-02-02")

 subset <- project_data[as.Date(as.character( project_data$Date),format = "%d/%m/%Y") == date1|as.Date(as.character( project_data$Date),format = "%d/%m/%Y") == date2 ,] 

png(file="plot1.png")
 hist(as.numeric(as.character(subset$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
