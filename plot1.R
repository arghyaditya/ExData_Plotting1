testread <- function(data){
    # Reads only two days of data from the text file
    
    header=read.table("household_power_consumption.txt", nrows = 1, header = T, sep = ";")
    datasource=read.table("household_power_consumption.txt", skip = 66636, nrows = (2*24*60), header = T, sep = ";", stringsAsFactors = F)
    a=colnames(header)
    colnames(datasource)=paste(a)
    # head(datasource,10)
    
    # Prints the histogram in png file
    png("plot1.png", width = 480, height = 480)
    hist(datasource$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowats)", col = "red")
    dev.off()
    
}

testread("household_power_consumption.txt")
