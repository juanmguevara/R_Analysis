## NOTE: To reference data in table which have spaces use ``

# Loading MechaCar_mpg.CSV file into our mechaCarTable
mechaCarTable <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

## --------------------------------------- General Analysis for mpg & `ground clearance` --------------------------------------- ##

## Import dataset into ggplot2
plt <- ggplot(mechaCarTable,aes(x=mpg,y=`ground clearance`)) 
## Create scatter plot
plt + geom_point() 

## Calculate correlation coefficient - Quantify the strength of the correlation between our two variables:
cor(mechaCarTable$mpg,mechaCarTable$`ground clearance`)
### From our correlation analysis, we have determined that the r-value between miles per gallon and `ground clearance` 
### ...time is 0.3287489, which is a positive correlation

## Design a linear model that predicts the mpg of MechaCar prototypes using a number of variables within the MechaCar mpg dataset.
## To create a linear regression model, our R statement would be as follows:
lm(`ground clearance` ~ mpg,mechaCarTable) 

## To determine our p-value and our r-squared value for a simple linear regression model, we'll use the summary() function:
## summarize linear model
summary(lm(`ground clearance`~mpg,mechaCarTable)) 

## ---------------------------------------------- linear model ---------------------------------------------- ##

## First, we need to calculate the data points to use for our line plot using our lm(`ground clearance` ~ mpg,mechaCarTable) 
## coefficients as follows:
## Create linear model
model <- lm(`ground clearance` ~ mpg,mechaCarTable) 
## Determine y-axis values from linear model
yvals <- model$coefficients['mpg']*mechaCarTable$mpg + model$coefficients['(Intercept)'] 

## Once we have calculated our line plot data points, we can plot the linear model over our scatter plot:
## Import dataset into ggplot2
plt <- ggplot(mechaCarTable,aes(x=mpg,y=`ground clearance`)) 
## Plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color = "red") 

## ------------------------------------ Mutiple linear regression model ------------------------------------ ##

# Question 1: Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
# Question 2: Is the slope of the linear model considered to be zero? Why or why not?
# Question 3: Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

## Generate multiple linear regression model
model_multi <- lm(mpg ~ `ground clearance` + `vehicle length` + `vehicle weight` + `spoiler angle` + `AWD`,data=mechaCarTable) 
## Generate summary statistics
summary(lm(mpg ~ `ground clearance` + `vehicle length` + `vehicle weight` + `spoiler angle` + `AWD`,data=mechaCarTable))

yvals_multi <- model_multi$coefficients['`ground clearance`']*mechaCarTable$`ground clearance` + 
  model_multi$coefficients['`vehicle length`']*mechaCarTable$`vehicle length` + 
  model_multi$coefficients['`vehicle weight`']*mechaCarTable$`vehicle weight` + 
  model_multi$coefficients['`spoiler angle`']*mechaCarTable$`spoiler angle` + 
  model_multi$coefficients['AWD']*mechaCarTable$`AWD` + model_multi$coefficients['(Intercept)']

##----------------------------------------- MechaCarWriteUp.txt -----------------------------------------##

# The variable that provides a non-random amount of variance to the mpg values is the vehicale weight. I came to
# this conclusion after looking at the different standard errors that each dependent variables gave. The slope of
# the linear model is not considered to be zero after looking at the generated yvals_multi we can see that the
# values decrease then increase at a staggered rate noting a change in slope for each dependent values. The linear
# model does predict the mpg of MechaCar prototypes effectivley after referencing our p-value. Our p-value being a
# low number notes that our our null hypothesis is bad therfore we reject our null hypothesis.

##----------------------------------------- Suspension Coil Summary -----------------------------------------##

# Loading Suspension_Coil.CSV file into our Suspension_Coil_Table
Suspension_Coil_Table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

## create summary table
psi_summary <- subset(Suspension_Coil_Table)%>%summarize(mean_psi=mean(`PSI`), median_psi=median(`PSI`), 
                                                         variance_psi=var(`PSI`), standardDiv_psi=sd(`PSI`))
psi_summary

##----------------------------------------- MechaCarWriteUp.txt -----------------------------------------##
  
# The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not 
# ...exceed 100 pounds per inch. Does the current manufacturing data meet this design specification? Why or why not?

# The current manufacturing data does meet the design specification from our psi_summary results we can see
# that the variance_psi is lower than 100 pounds per inch which meets the design specification.
  
##----------------------------------------- Suspension Coil T-Test -----------------------------------------##
# Loading Data Set
Suspension_Coil_Table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
# Import dataset into ggplot2
plt <- ggplot(Suspension_Coil_Table,aes(x=log10(`PSI`)))
# Visualize distribution using density plot
plt + geom_density()

# Randomly sample 50 data points
sample_table <- Suspension_Coil_Table %>% sample_n(50) 
# Import dataset into ggplot2
plt <- ggplot(sample_table,aes(x=log10(`PSI`))) 
# Visualize distribution using density plot
plt + geom_density() 

# Compare sample versus population means
t.test(log10(sample_table$`PSI`),mu=mean(log10(Suspension_Coil_Table$`PSI`)))

##----------------------------------------- MechaCarWriteUp.txt -----------------------------------------##

# small writeup of your interpretation and findings for the t-test results.

# I did a One-Sample t-Test for the reason that we are doing our analysis per a population mean result of
# 1,500 pounds per inch. We can see that our p-value has a high p-value which means that our null hypothesis
# is true.

##----------------------------------------- Design My Own Study -----------------------------------------##

# I would recommend to have a study with cost and fuel efficiency. Questions to ask for these two would be:
# How efficient is the fuel? How many miles per gallon would you get on the car? What is a typical car fuel
# efficiency? Compare the cost and fuel efficiency with our MechaCar Prototype to help us determine if 
# design is viable. We would do a Two-Sample t-Test since we will be comparing our Prototype data with
# typical/common vehical types.
