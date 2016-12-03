#read raw data
raw=read.csv("household_power_consumption.txt",sep=";",
             nrows=100000,as.is=c(1,2))

##subset correct dates

raw.sub1=raw[raw$Date %in% c(as.character("1/2/2007"),
                             as.character("2/2/2007")),]
cols=c(3:9)
raw.sub1[,cols]=apply(raw.sub1[,cols],2,
                      function(x) as.numeric(x))

raw.date=as.Date(raw.sub1[,1],format="%d/%m/%Y")
raw.time=as.POSIXlt(paste(as.character(raw.date),
                          " ",raw.sub1$Time))

#plot
quartz()
plot(raw.time,raw.sub1$Sub_metering_1,mar=c(0,2,0,0),oma=c(0,0,0,0),
       main="",ylab="Energy sub metering",xlab="",
      type="n")
lines(raw.time,raw.sub1$Sub_metering_1,col="153")
lines(raw.time,raw.sub1$Sub_metering_2,col="red")
lines(raw.time,raw.sub1$Sub_metering_3,col="28")
legend("topright",lty=c(1,1,1),col=c("153","red","28"),
       legend=c("Sub_Metering_1","Sub_Metering_2",
                "Sub_Metering_3"),text.width(1))

#output
dev.copy(png,file="plot3.png")
dev.off()
dev.off()