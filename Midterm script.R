#start
install.packages("plyr")
install.packages("stringr")
install.packages("pastecs")
install.packages("oce")
install.packages("lubridate")
install.packages("dplyr")

library(stringr)
library(plyr)
library(dplyr)
library(lubridate) 

library(readr)
Zoop <- read_csv("~/R/midtermdata/Zoop.csv")
View(Zoop)

z=Zoop

z <- z[,which(unlist(lapply(z, function(x)!all(is.na(x)))))] #using the "lapply" function from the "dplyr" package, remove fields which contain all "NA" values

z$Lat_Min=z$Lat_Min/60
z$Lon_Min=z$Lon_Min/60


#create new fields with decimal degree latitude and longitude values
z$Lat_DecDeg <- z$Lat_Deg + z$Lat_Min
z$Lon_DecDeg <- z$Lon_Deg + z$Lon_Min  
  
z$dateTime <- str_c(z$Tow_Date," ",z$Tow_Time,":00")
z$dateTime <- as.POSIXct(strptime(z$dateTime, tz = "America/Los_Angeles", format = "%m/%d/%Y %H:%M:%S")) #Hint: look up input time formats for the 'strptime' function
z$Tow_Date <- NULL; z$Tow_Time <- NULL
#01/18/1951





