# Antero Salminen
date()
### IODS2023-course's Assignment 2: Data wrangling (max 5 points)

library(tidyverse)
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep = "\t", header = T)
glimpse(lrn14) # 183 rows and 60 columns
ff_glimpse(lrn14)
summary(lrn14) # Age mean 25.58, Points mean 20.61 and median 22.00
lrn14 |> 
  count(gender) # gender difference: 122 female (67%), 61 male (33%)

# "Create an analysis dataset with the variables gender, age, attitude, deep, stra, surf and points by combining questions in the learning2014 data"
# "Scale all combination variables to the original scales (by taking the mean)." 
# "Exclude observations where the exam points variable is zero. (The data should then have 166 observations and 7 variables)"

# combine questions and calculate means for deep, stra, surf.
lrn14$deep <- rowMeans(lrn14[, deep_questions])
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
lrn14$surf <- rowMeans(lrn14[, surface_questions])
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
lrn14$stra <- rowMeans(lrn14[, strategic_questions])

# Create an analysis dataset
learning2014 <- lrn14[, c("gender","Age","Attitude", "deep", "stra", "surf", "Points")]
colnames(learning2014)
learning2014

#modify column names
colnames(learning2014)[2] <- "age"
colnames(learning2014)[3] <- "attitude"
colnames(learning2014)[7] <- "points"
colnames(learning2014)

#Exclude observations where the exam points variable is zero,  observations and 7 variables
filtered_data <- learning2014 |> 
  filter(points > 0)
glimpse(filtered_data) # Rows: 166 & Columns: 7

###Set the working directory of your R session to the IODS Project folder (study how to do this with RStudio). Save the analysis dataset to the ‘data’ folder, using for example write_csv() function (readr package, part of tidyverse). You can name the data set for example as learning2014.csv. See ?write_csv for help or search the web for pointers and examples. Demonstrate that you can also read the data again by using read_csv().  (Use `str()` and `head()` to make sure that the structure of the data is correct).  (3 points)

#Set the working directory of your R session to the IODS Project folder.
getwd() # IODS Project folder is already wd.

# Set data-folder as a working directory
setwd("data")

#readr package
library(readr)

#Name the data set as learning2014.csv. 
write_csv(filtered_data, "learning2014.csv")

#Demonstrate can also read the data again by using read_csv
testing_data <- read_csv("learning2014.csv")
testing_data

#checking is the structure of the data is correct
head(filtered_data)
head(testing_data)