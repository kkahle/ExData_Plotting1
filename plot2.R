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
plot(raw.time,raw.sub1$Global_active_power,
      main="",ylab="Global Active Power (kilowatts)",
     type="n")
lines(raw.time,raw.sub1$Global_active_power)

#export

dev.copy(png,file="plot2.png")
dev.off()
dev.off()