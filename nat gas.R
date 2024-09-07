fileurl2<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileurl2, destfile = 'C:/Users/giova/Documents/datasciencecoursera/nat_gas.xlsx', method = "curl")
list.files("nat_gas.xlsx")

xldata <- read.xlsx("nat_gas.xlsx")
