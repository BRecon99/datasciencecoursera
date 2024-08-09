#Read the data again as for plot 1:
setwd("C:/Users/giova/Documents/datasciencecoursera/Module4/exdata_data_household_power_consumption")

data <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

#Remake the steps, to start with fresh date and filter in a different fashion. 
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

##Now add the col data and time and change the filter with the new plot in mind

#add the col datatime that count for date and time together to plot each point.
data[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# The format chosen will return the week days of the data that we filtered on the obs.
#reset the filter for the new plot (somehow it did not plot as weekdays)
data <- data[(datetime >= "2007-02-01") & (datetime < "2007-02-03")]

#plot2
png("plot2.png", width=480, height=480)
plot(x = data[, datetime]
     , y = data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
#we plot datatime with no label on x-axis to return the week days and voltage on y-axist.
#type "l" gives us the observation points on plot connected by straight lines.(l stand for lines)

