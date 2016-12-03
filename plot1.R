#read raw data
raw=read.csv("household_power_consumption.txt",sep=";",nrows=100000,as.is=c(1))

##subset correct dates

raw.sub1=raw[raw$Date %in% c(as.character("1/2/2007"),as.character("2/2/2007")),]
cols=c(3:9)
raw.sub1[,cols]=apply(raw.sub1[,cols],2,function(x) as.numeric(x))

#plot
quartz()
hist(raw.sub1$Global_active_power,breaks=12,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()
dev.off()