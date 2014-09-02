plot4 <- function() {
    
    #read the data
    data2<-read.csv("household_power_consumption.txt", sep=";")
    
    #select the required rows, i.e. data from the dates 2007-02-01 and 2007-02-02
    data<-data2[(strptime(data2$Date, "%d/%m/%Y")=="2007-02-01" | strptime(data2$Date, "%d/%m/%Y")=="2007-02-02"), ]
    
    #convert variables to numeric
    data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
    data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
    data$Voltage<-as.numeric(as.character(data$Voltage))
    data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
    
    #create datetime variable
    Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
    data$DateTime<-paste(data$Date, data$Time, sep=" ")
    data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
    
    #open a png file device
    png(filename="plot4.png")
    
    #prepare the environment for 2 rows and 2 coloumns
    par(mfrow=c(2,2))
    
    #the first plot (topleft)
    with(data, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="n"))
    lines(data$DateTime, data$Global_active_power)
    
    #second plot (topright)
    with(data, plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="n"))
    lines(data$DateTime, data$Voltage)
    
    #third plot (bottomleft)
    with(data, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", yaxt="n", type="n"))
    axis(side=2, at=c(0, 10, 20, 30), labels=T)
    lines(data$DateTime, data$Sub_metering_1, col="Black")
    lines(data$DateTime, data$Sub_metering_2, col="Red")
    lines(data$DateTime, data$Sub_metering_3, col="Blue")
    legend("topright", bty="n", lty=c(1, 1, 1), col=c("Black", "Red", "Blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    #fourth plot (bottomright)
    with(data, plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n"))
    lines(data$DateTime, data$Global_reactive_power)
    
    #close the file device
    dev.off()
    
}