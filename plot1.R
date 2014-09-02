
plot1 <- function() {
        
    #read the data
    data<-read.csv("household_power_consumption.txt", sep=";")
    
    #select the 3. coloumn (Global active power) and required rows, i.e. data from the dates 2007-02-01 and 2007-02-02
    data2<-data[(strptime(data$Date, "%d/%m/%Y")=="2007-02-01" | strptime(data$Date, "%d/%m/%Y")=="2007-02-02"), 3]
    data2<-as.numeric(as.character(data2))
    
    #ensure the proper environment
    par(mfrow=c(1,1))
    
    #plot histogram
    hist(data2, col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
    
    #copy the histogram to a png file
    dev.copy(png, file="plot1.png")
    dev.off()
}