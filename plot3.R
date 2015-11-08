testread <- function(data){
    # Reads only two days of data from the text file
    
    header=read.table("household_power_consumption.txt", nrows = 1, header = T, sep = ";")
    datasource_p3=read.table("household_power_consumption.txt", skip = 66636, nrows = (2*24*60), header = T, sep = ";", stringsAsFactors = F, na.strings = "?")
    a=colnames(header)
    colnames(datasource_p3)=paste(a)
    
    datasource_p3$Date_Time=strptime(paste(datasource_p3$Date,datasource_p3$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
    # datasource_p3$Weekday=weekdays(datasource_p3$Date_Time)
    
    # colnames(datasource_p3)
    # head(datasource_p3,10)
    
    # nrow(datasource_p3)
    
    # Prints the plot in png file
    png("plot3.png", width = 480, height = 480)
    plot(datasource_p3$Date_Time, as.numeric(datasource_p3$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "l")
    lines(datasource_p3$Date_Time, as.numeric(datasource_p3$Sub_metering_2), type = "l", col="red")
    lines(datasource_p3$Date_Time, as.numeric(datasource_p3$Sub_metering_3), type = "l", col="blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2.5, lty = 1, col = c("black","red","blue"))
    dev.off()
    
}

testread("household_power_consumption.txt")