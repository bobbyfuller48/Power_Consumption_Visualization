library(tidyverse)
library(lubridate)

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
par(mfrow = c(2,2)) 

# plot 1 'Global Active Power' (Time Series)
plot(table$Date_time, table$Global_active_power, type = 'l', 
     xlab = '', ylab = 'Global Active Power', cex.axis = 0.8,
     cex.lab = 0.8) 

# plot 2 'Voltage' (Time Series)
plot(table$Date_time, table$Voltage, type = 'l', 
     ylab = 'Voltage', cex.axis = 0.8, cex.lab = 0.8) 

# plot 3 'Energy sub metering' (Time Series)
plot(table$Date_time, table$Sub_metering_1, type = 'l',
     xlab = '', ylab = 'Energy Sub Metering', cex.lab = 0.8, 
     cex.axis = 0.8)
lines(table$Date_time, table$Sub_metering_2, col = 'red')
lines(table$Date_time, table$Sub_metering_3, col = 'blue')
legend("topright",col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, 
       cex = 0.4, xjust = 1) 

#plot 4 'Global_reactive_power' (Time Series)
plot(table$Date_time, table$Global_reactive_power, type = 'l', 
     ylab = 'Global Reactive Power', cex.axis = 0.8, 
     cex.lab = 0.8) 