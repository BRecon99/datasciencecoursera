#Again use the same filtered data, and set the new device for plot 4:
png("plot4.png", width=480, height=480)

#to make it into a screen with 4 plots in it we set parameters to a 2x2 plots on the device.
par(mfrow=c(2,2))

#here the plot one will be the same as the png2, and plot three remains the same.
# Plot 1
plot(data[, datetime], data[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
#plot two will follow the same idea of plot 1 but relative to voltage.
# Plot 2
plot(data[, datetime], data[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(data[, datetime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, datetime], data[, Sub_metering_2], col="red")
lines(data[, datetime], data[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
# Now, to the plot three we did a couple changes:
##bty to change the type of legend box from standard "o" to"n"
##and cex to expande the characters relative to the new plot and make it readable.

# Plot 4
plot(data[, datetime], data[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
#plot 4 has the same patters as plots 1 and 2
dev.off()