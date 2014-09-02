plot2 <- function() {
    
    #read the data
    data2<-read.csv("household_power_consumption.txt", sep=";")
    
    #select the required rows, i.e. data from the dates 2007-02-01 and 2007-02-02
    data<-data2[(strptime(data2$Date, "%d/%m/%Y")=="2007-02-01" | strptime(data2$Date, "%d/%m/%Y")=="2007-02-02"), ]
    
    #convert Global_active_power to numeric
    data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
    
    #create datetime variable
    Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
    data$DateTime<-paste(data$Date, data$Time, sep=" ")
    data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
    
    #ensure the proper environment
    par(mfrow=c(1,1))
    
    #create the plot
    with(data, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
    lines(data$DateTime, data$Global_active_power)
    
    #copy the plot to a png file
    dev.copy(png, file="plot2.png")
    dev.off()
}