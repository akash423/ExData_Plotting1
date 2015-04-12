# Read data file and filter for required dates

file_loc = "C:/Akash/Interests/Coursera/Data course/Exploratory Data analysis/Project 1/cons_power.txt"
cons_power <- read.csv(file_loc,header = T,stringsAsFactors = FALSE,sep=";",)
##Check column heading
#str(cons_power)
#Change data format
cons_power$Date = as.Date(cons_power$Date,format = "%d/%m/%Y")

#Subset dataset for required data
cons_power<-subset(cons_power,as.character(cons_power$Date) %in% c("2007-02-01","2007-02-02"))
#Change required columns format
cons_power$DateTime <- as.POSIXct(paste(cons_power$Date, cons_power$Time), format="%Y-%m-%d %H:%M:%S")
cons_power$Sub_metering_1 <- as.numeric(cons_power$Sub_metering_1)
cons_power$Sub_metering_2 <- as.numeric(cons_power$Sub_metering_2)
cons_power$Sub_metering_3 <- as.numeric(cons_power$Sub_metering_3)
#plot Data
plot(cons_power$DateTime,cons_power$Sub_metering_1,main = "",xlab="",ylab="Energy sub metering",type="l",col="black")
lines(cons_power$DateTime,cons_power$Sub_metering_2,col="red")
lines(cons_power$DateTime,cons_power$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1), cex = 0.7)
dev.copy(png,filename="C:/Akash/Interests/Coursera/Data course/Exploratory Data analysis/Project 1/plot3.png", width = 480, height = 480);
dev.off ()

