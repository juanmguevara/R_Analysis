# R-Script Basics

## Assigning values to a variable
x <- 3

## Creating lists
numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

# Functions in R

## Basic Function Syntax
function_name <- function(arg1, arg2=T, …){
  
  <BODY OF FUNCTION>
    
    return <RETURN VALUE>
}

## function name is the name of the function, which can be used in the R console to call the function itself
## Just like Python methods, R functions can have any number of required or optional arguments, depending on the design of the function
## The function body includes data structures, if-statements, and other logical statements that define what the function does
## The return statement is the last evaluated statement before returning the resulting value out of the function

# Function Help

## If at any point you are unsure what an R function does or what it needs to execute, you can always type:
?<name of function>

# Reading a CSV file

## Provides us helpful information on how to read a CSV file in R:  
?read.csv()

# Import/loading JSONLite
library(jsonlite)
demo_table2 <- fromJSON(txt='demo.json')

# Creating a list and selecting the 3rd element in the list
# Unlike Python, R index starts at 1
x <- c(3, 3, 2, 2, 5, 5, 8, 8, 9)
x[3]

# 













