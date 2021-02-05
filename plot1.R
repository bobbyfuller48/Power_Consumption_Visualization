library(tidyverse)

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
# and 2007-02-02
table <- table %>% 
  filter(between(Date, as.Date('2007-02-01'), as.Date('2007-02-02')))


# create/annotate graph
par(mfrow = c(1,1))

hist(table$Global_active_power, col = 'red', 
     main = 'Global Active Power', cex.main = 0.9, 
     xlab = 'Global Active Power (kilowatts)', cex.axis = 0.7, 
     cex.lab = 0.7)  
