#using the same filter as before, we just do the plotting with the ramaining data table.
png("plot3.png", width=480, height=480)

#first we set the plot as befeore but with the addition of sub metering 1
#after that we anotate the sub metering 2 and 3 with de desired collors
#the last step was to add legend on right top with the respective colors and set type and size of that legend box.

# Plot 3
plot(data[, datetime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, datetime], data[, Sub_metering_2],col="red")
lines(data[, datetime], data[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()