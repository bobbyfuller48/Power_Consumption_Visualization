# Power_Consumption_Visualization 

Data for these visualizations comes from the UC Irvine Machine Learning Repository (https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption). 
The data consists of measurements of electric power consumption in one household recorded every minute for close to four years. 
The data contains nine variables, the description of each variable below is taken from the UCI web site (linked above):
1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
   It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates 8. are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and    a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner. 

The code contained in this repository consists of different visualizations of the power consumption measured from February 1, 2007 to February 2, 2007.
File plot1.R creates a histogram of the frequency of global active power (kilowatts) consumed over the two days. 
File plot2.R creates a time series presenting the global active power (kilowatts) consumed over the two days. 
File plot3.R creates a time series presenting the power consumption of the three different sub-meterings over the two days. 
File plot4.R creates four time series plots: global reactive power consumption (bottom right), voltage (top right), global active power (top left), 
and the three different sub-meterings (bottom left). 

Each .R file is accompanied by a .png file containing the graphs.
