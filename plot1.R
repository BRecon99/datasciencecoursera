library(data.table)
library(lubridate)
path <- "C:/Users/giova/Documents/datasciencecoursera/Module4/exdata_data_household_power_consumption/household_power_consumption.txt"

setwd("C:/Users/giova/Documents/datasciencecoursera/Module4/exdata_data_household_power_consumption")

#Read the data changing "?" for "na" as indicated for the description of the data.
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?"
                          )

#All the cols will have values in chars, set as numeric and .SD to avoid scientific notation.
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Change date col to the type = date, on the desired format.
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter dates for 2007-02-01 and 2007-02-02 (the demanded time window)
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Open the blank png with the measurements desired.
png("plot1.png", width=480, height=480)

#plotting

hist(data[,Global_active_power], main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red" )

dev.off()
