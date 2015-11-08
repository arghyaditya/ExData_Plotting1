testread <- function(data){
    # Reads only two days of data from the text file
    
    header=read.table("household_power_consumption.txt", nrows = 1, header = T, sep = ";")
    datasource_p4=read.table("household_power_consumption.txt", skip = 66636, nrows = (2*24*60), header = T, sep = ";", stringsAsFactors = F, na.strings = "?")
    a=colnames(header)
    colnames(datasource_p4)=paste(a)
    
    datasource_p4$Date_Time=strptime(paste(datasource_p4$Date,datasource_p4$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

    # Prints the plot in png file
    png("plot4.png", width = 480, height = 480)
    
    # Divides the screen into 4 sections
    
    par(mfrow=c(2,2))
    
    plot(datasource_p4$Date_Time, as.numeric(datasource_p4$Global_active_power), xlab = "", ylab = "Global Active Power", type = "l")
    plot(datasource_p4$Date_Time, as.numeric(datasource_p4$Voltage), ylab = "Voltage", xlab = "datetime", type = "l")
    plot(datasource_p4$Date_Time, as.numeric(datasource_p4$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "l")
    lines(datasource_p4$Date_Time, as.numeric(datasource_p4$Sub_metering_2), type = "l", col="red")
    lines(datasource_p4$Date_Time, as.numeric(datasource_p4$Sub_metering_3), type = "l", col="blue")
    legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 2.5, lty = 1, col = c("black","red","blue"))
    plot(datasource_p4$Date_Time, as.numeric(datasource_p4$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    dev.off()
    
}

testread("household_power_consumption.txt")