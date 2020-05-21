# Shortcut to run lines of code in our R-Script
## Command + Enter (Mac)
## CTRL + Enter (Windows)

# Loading Demo.CSV file into our demo_table
demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

# Loading/Importing JSONLite Library to our environment
library(jsonlite)

# Read in the used car data into our R environment
demo_table2 <- fromJSON(txt='demo.json')

# Selecting the third row of the Year column
demo_table[3,"Year"]
## or
demo_table[3,3]

## If we want to select the vector of vehicle classes from demo_table
demo_table$"Vehicle_Class"

## Once we have selected the single vector, we can use bracket notation to select a single value
demo_table$"Vehicle_Class"[2]

## Filter our used car data demo_table2 so that we only have rows where the vehicle price is greater than $10,000
filter_table <- demo_table2[demo_table2$price > 10000,]

## If we want to create a more elaborate filtered dataset from our used car data demo_table2 where price > 10000, drive == 4wd, and "clean" %in% title_status, we would use the following statement
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) #filter by price and drivetrain

## If we want to sample a large vector and create a smaller vector, we can set the vector to “x”
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

## Create a numerical vector that is the same length as the number of rows in the data frame using the colon (:) operator.
## Use the sample() function to sample a list of indices from our first vector.
## Use bracket notation to retrieve data frame rows from sample list.
demo_table[sample(1:nrow(demo_table), 3),]

# Transform

## Loading/Importing tidyverse library
library(tidyverse)

## If we want to use our coworker vehicle data from the demo_table and add a column for the mileage per year, as well as label all vehicles as active, we would use the following statement:
## Add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 

# Group Data

## If we want to group our used car data by the condition of the vehicle and determine the average mileage per condition, we would use the following dplyr statement:
## Create summary table
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer)) 

## If in addition to our previous summary table we wanted to add the maximum price for each condition, as well as add the vehicles in each category, our statement would look as follows:
## Create summary table with multiple columns
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n()) 

# Reshape Data

## Load the demo2.csv file into your R environment
demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

## To change this dataset to a long format, we would use gather() to reshape this dataset:
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)

## Alternatively,
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

## If we want to spread out our previous long-format data frame back to its original format, we would use the following spread() statement:
wide_table <- long_table %>% spread(key="Metric",value="Score")

## If we want to check if our newly created wide-format table is exactly the same as our original demo_table3, we can use R’s all.equal() function:
all.equal(demo_table3,wide_table)

## First, we’ll take a moment to familiarize ourselves with the mpg dataset. In the R console, type the following statement:
head(mpg)

## If we want to create a bar plot that represents the distribution of vehicle classes from the mpg dataset, we would use the following statements in R:
## Import dataset into ggplot2
plt <- ggplot(mpg,aes(x=class))
## Plot a bar plot
plt + geom_bar() 

## If we want to compare the number of vehicles from each manufacturer in the dataset, we can use dplyr’s summarize() function to summarize the data, and ggplot2’s geom_col() to visualize the results:
## Create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n()) 
## Import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))
## Plot a bar plot
plt + geom_col()










