#rm(list=ls())
//Exploratory Data Analysis  Class, Week 1 assignments
// Print to PDF 4 plots
// NOTE:  Saving this same file 4 times with sections commented out since all the work really in common


power<-read.table("household_power_consumption.txt", 
                  sep=";", 
                  header=TRUE, 
                  stringsAsFactors=FALSE)

# Covert DATE from just the DAY to hold the DAY and TIME
power$Date <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
# Eliminate the now unnecessary TIME variable
power$Time<-NULL


dateStart<-as.POSIXlt("2007-02-01 00:00:00")
dateEnd<-as.POSIXlt("2007-02-03 00:00:00")


#Create a small dateset of just the dates i need
powerSmall<-power[((power$Date>=dateStart[1]) & (power$Date<dateEnd[1])),]

#Eliminate NA rows which were created by date-match
ps<-powerSmall[!is.na(powerSmall$Date),]


# conver to numers (could have done on load)
ps$Global_active_power = as.numeric(ps$Global_active_power)
ps$Global_reactive_power = as.numeric(ps$Global_reactive_power)
ps$Voltage = as.numeric(ps$Voltage)
ps$Global_intensity = as.numeric(ps$Global_intensity)
ps$Sub_metering_1 = as.numeric(ps$Sub_metering_1)
ps$Sub_metering_2 = as.numeric(ps$Sub_metering_2)
ps$Sub_metering_3 = as.numeric(ps$Sub_metering_3)

# 
# #Plot #1
# 
# png(filename="plot1.png", width=480,height=480,units="px")
# par(mfcol=c(1,1))
# hist(ps$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
# dev.off()
# 
# 
# 
# #Plot #2  (but need it as LINES)
# par(mfcol=c(1,1))
# png(filename="plot2.png", width=480,height=480,units="px")
# plot(ps$Date,ps$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
# dev.off()
# 


#Plot #3

png(filename="plot3.png", width=480,height=480,units="px")
par(mfcol=c(1,1))
plot(ps$Date,ps$Sub_metering_1, type="n",
     ylab="Energy sub metering",xlab="")
points(ps$Date,ps$Sub_metering_1, col="black", type="l")
points(ps$Date,ps$Sub_metering_2, col="red", type="l")
points(ps$Date,ps$Sub_metering_3, col="blue", type="l")

legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"),lty=c(1,1,1))
dev.off()

# 
# #Plot #4
# 
# # do plot #2, #3, plus two new ones with datetime
# png(filename="plot4.png", width=480,height=480,units="px")
# ## first set up 2 x 2 with col first layout
# par(mfcol=c(2,2))
# 
# ## chart 1
# plot(ps$Date,ps$Global_active_power, type="l", ylab="Global Active Power",xlab="")  
# 
# ## chart 2
# plot(ps$Date,ps$Sub_metering_1, type="n",
#      ylab="Energy sub metering",xlab="")
# points(ps$Date,ps$Sub_metering_1, col="black", type="l")
# points(ps$Date,ps$Sub_metering_2, col="red", type="l")
# points(ps$Date,ps$Sub_metering_3, col="blue", type="l")
# legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
#        col=c("black","red","blue"),lty=c(1,1,1),lwd=1,pch=c(NA,NA,NA),bty="n")
# 
# 
# ## chart 3 
# plot(ps$Date,ps$Voltage, type="l", ylab="Voltage",xlab="datetime")
# 
# ## chart 4 
# plot(ps$Date,ps$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")
# 
# dev.off()
