# Class: Exploratory Data Analysis
# Project 1 6/16/2016 
# File: plot4.R
# By: Don Baldwin

# One way to simplify file I/O is to just set a single working directory like this
setwd("C:/Data Study/Class 4 Exploratory Data Analysis/Project1")

# Tried a couple different approaches and then discovered that the data file wasn't
# so prohibitively large that just loading via read.table it was a problem
infile <- "household_power_consumption.txt"
project_data <- read.table(file=infile, sep=";",header = TRUE) 

# Set up dates for subsetting data and pull the subset
date1 <- as.Date( "2007-02-01")
date2 <- as.Date( "2007-02-02")
subset <- project_data[as.Date(as.character( project_data$Date),format = "%d/%m/%Y") == date1|as.Date(as.character( project_data$Date),format = "%d/%m/%Y") == date2 ,] 

# N.B. In the real world, most of the common code above would have been pulled into a separate
# file. But the project spec called for exactly 4 independent scripts, so that what I produced.

# Open PNG Graphic Device
png(file="plot4.png")

# Prepare to generate 4 subgraphs by row
par(mfrow=c(2,2))

# Number 1
plot(as.POSIXct( paste(as.character(as.Date(as.character( subset$Date),format = "%d/%m/%Y")),as.character(subset$Time),sep=" ") ), as.numeric(as.character(subset$Global_active_power)), type="o",pch=NA, xlab="",ylab="Global Active Power")

# Number 2
plot(as.POSIXct( paste(as.character(as.Date(as.character( subset$Date),format = "%d/%m/%Y")),as.character(subset$Time),sep=" ") ), as.numeric(as.character(subset$Voltage)), type="o",pch=NA, xlab="datetime",ylab="Voltage")

# Number 3
plot(as.POSIXct( paste(as.character(as.Date(as.character( subset$Date),format = "%d/%m/%Y")),as.character(subset$Time),sep=" ") ),as.numeric(as.character(subset$Sub_metering_1)), type="o",pch=NA,ylim = c(0,40), xlab="",ylab="Energy sub metering")
par(new=TRUE)
plot(as.POSIXct( paste(as.character(as.Date(as.character( subset$Date),format = "%d/%m/%Y")),as.character(subset$Time),sep=" ") ), as.numeric(as.character(subset$Sub_metering_2)), type="o",pch=NA,col="red",ylim = c(0,40), xlab="",ylab="Energy sub metering")
par(new=TRUE)
plot(as.POSIXct( paste(as.character(as.Date(as.character( subset$Date),format = "%d/%m/%Y")),as.character(subset$Time),sep=" ") ),as.numeric(as.character(subset$Sub_metering_3)), type="o",pch=NA,col="blue",ylim = c(0,40), xlab="",ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.col=c("black","red","blue"),bty="n")

# Number 4
plot(as.POSIXct( paste(as.character(as.Date(as.character( subset$Date),format = "%d/%m/%Y")),as.character(subset$Time),sep=" ") ), as.numeric(as.character(subset$Global_reactive_power)), type="o",pch=NA, xlab="datetime",ylab="Global_reactive_power")

# Close device
dev.off()
