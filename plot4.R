library(tidyverse)
library(lubridate)

# download / unzip file
file_url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip'

if(!file.exists('power_consumption.zip'))
{
  download.file(file_url, destfile = 'power_consumption.zip', 
                method = 'curl')
  unzip(zipfile = 'power_consumption.zip') 
}

# reads data, replacing '?' with NA
table <- read_delim('household_power_consumption.txt', delim = ';', 
                    na = c('?', 'NA', ''), 
                    col_types = list(col_date(format = "%d/%m/%Y"), 
                                     col_time(), 
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number(),
                                     col_number())) 

# convert Date field to Date data type; subset records between 2007-02-01 
# and 2007-02-02; create Date_time field for time series 
table <- table %>% 
  filter(between(Date, as.Date('2007-02-01'), as.Date('2007-02-02'))) %>%
  unite(Date_time, Date, Time, sep = ' ') %>% 
  mutate(Date_time = ymd_hms(Date_time))


# create/annotate graphs

# specify global graphics parameters 
par(mfrow = c(2,2), mar = c(3,4,2,2)) 

# plot 1 'Global Active Power' (Time Series)
plot(table$Date_time, table$Global_active_power, type = 'l', 
     xlab = '', ylab = 'Global Active Power (KW)', cex.axis = 0.8,
     cex.lab = 0.8) 

# plot 2 'Voltage' (Time Series)
plot(table$Date_time, table$Voltage, type = 'l', 
     ylab = 'Voltage (V)', xlab = '', cex.axis = 0.8, cex.lab = 0.8) 

# plot 3 'Energy sub metering' (Time Series)
plot(table$Date_time, table$Sub_metering_1, type = 'l',
     xlab = '', ylab = 'Energy Sub Metering (Wh)', cex.lab = 0.8, 
     cex.axis = 0.8)
lines(table$Date_time, table$Sub_metering_2, col = 'red')
lines(table$Date_time, table$Sub_metering_3, col = 'blue')
legend("topright",col=c("black","red","blue"),
       c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"), lty = 1, 
       cex = 0.4, xjust = 1) 

#plot 4 'Global_reactive_power' (Time Series)
plot(table$Date_time, table$Global_reactive_power, type = 'l', 
     ylab = 'Global Reactive Power (KW)', xlab = '', cex.axis = 0.8, 
     cex.lab = 0.8) 
