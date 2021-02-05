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

# create/annotate graph
par(mfrow = c(1,1))
plot(table$Date_time, table$Sub_metering_1, type = 'l',
     xlab = '', ylab = 'Energy sub metering', cex.lab = 0.8, 
     cex.axis = 0.8)
lines(table$Date_time, table$Sub_metering_2, col = 'red')
lines(table$Date_time, table$Sub_metering_3, col = 'blue')
legend("topright",col=c("black","red","blue") ,
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty = 1, 
       cex = 0.6)
