testread <- function(data){
    # Reads only two days of data from the text file
    
    header=read.table("household_power_consumption.txt", nrows = 1, header = T, sep = ";")
    datasource_p2=read.table("household_power_consumption.txt", skip = 66636, nrows = (2*24*60), header = T, sep = ";", stringsAsFactors = F, na.strings = "?")
    a=colnames(header)
    colnames(datasource_p2)=paste(a)
    
    datasource_p2$Date_Time=strptime(paste(datasource_p2$Date,datasource_p2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
    datasource_p2$Weekday=weekdays(datasource_p2$Date_Time)
    
#     colnames(datasource_p2)
#     head(datasource_p2,10)
    
    # nrow(datasource_p2)
    
    # Prints the plot in png file
    png("plot2.png", width = 480, height = 480)
    plot(datasource_p2$Date_Time, as.numeric(datasource_p2$Global_active_power), main="Weekday Based Power Consumption", xlab = "", ylab = "Global Active Power (kilowats)", type = "l")
    dev.off()
    
}

testread("household_power_consumption.txt")