# Class: Exploratory Data Analysis
# Project 1 6/16/2016 
# File: plot1.R
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
png(file="plot1.png")

# Generate a basic histogram plot, per spec
hist(as.numeric(as.character(subset$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Close device
dev.off()
