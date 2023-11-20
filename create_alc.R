#Antero Salminen 20.11.2023
# Data: ("http://www.archive.ics.uci.edu/dataset/320/student+performance")

#### 1 ####

#Go to the UCI Machine Learning Repository, Student Performance Data (incl. Alcohol consumption) page here. Then choose "Download" to download the .zip file. Unzip the file and move the two .csv files (student-mat.csv) and (student-por.csv) to the data folder in your course project folder. DONE

getwd()
setwd("data")
getwd()



#### 2 ####

#Create a new R script with RStudio. Write your name, date and a one sentence file description as a comment on the top of the script (include a reference to the data source). Save the script as 'create_alc.R' in the ‘data’ folder of your project. Complete the rest of the steps in that script. DONE

date()
# started doing: "Tue Nov 14 15:40:16 2023"

#### 3 ####

# Read both student-mat.csv and student-por.csv into R (from the data folder) and explore the structure and dimensions of the data. (1 point)

student_mat2 <- read.csv(file = "student-mat.csv", sep = ";", header = TRUE)
student_por2 <- read.csv(file = "student-por.csv", sep = ";", header = TRUE)

view(student_mat2)
view(student_por2)

library(tidyverse)
library(finalfit)
glimpse(student_mat2)
ff_glimpse(student_mat2)
glimpse(student_por2)
ff_glimpse(student_por2)

# Join the two data sets using all other variables than "failures", "paid", "absences", "G1", "G2", "G3" as (student) identifiers. Keep only the students present in both data sets. Explore the structure and dimensions of the joined data. (1 point)

library(dplyr)
free_cols2 <- c("failures", "paid", "absences", "G1", "G2", "G3")
join_cols2 <- setdiff(colnames(student_por2), free_cols2)
join_cols2

math_por2 <- inner_join(student_mat2, student_por2, by = join_cols2)
math_por2

#### 4 ####

# Get rid of the duplicate records in the joined data set. Either a) copy the solution from the exercise "3.3 The if-else structure" to combine the 'duplicated' answers in the joined data, or b) write your own solution to achieve this task. (1 point)

##### I chose to copy-paste from the exercise. #####

# create a new data frame with only the joined columns
alc2 <- select(math_por2, all_of(join_cols2))

free_cols2

for(col_name in free_cols2) {
  # select two columns from 'math_por' with the same original name
  two_cols <- select(math_por2, starts_with(col_name))
  # select the first column vector of those two columns
  first_col <- select(two_cols, 1)[[1]]
  
  # then, enter the if-else structure!
  # if that first column vector is numeric...
  if(is.numeric(first_col)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc2[col_name] <- round(rowMeans(two_cols))
  } else { # else (if the first column vector was not numeric)...
    # add the first column vector to the alc data frame
    alc2[col_name] <- first_col
  }
}

# glimpse at the new combined data

glimpse(alc2)


# Take the average of the answers related to weekday and weekend alcohol consumption to create a new column 'alc_use' to the joined data. Then use 'alc_use' to create a new logical column 'high_use' which is TRUE for students for which 'alc_use' is greater than 2 (and FALSE otherwise). (1 point)

alc2 <- mutate(alc2, alc_use = (Dalc + Walc) / 2)
alc2 <- mutate(alc2, high_use = alc_use > 2)

summary(alc$alc_use)
summary(alc2$alc_use)
summary(alc$high_use)
summary(alc2$high_use)


# Glimpse at the joined and modified data to make sure everything is in order. The joined data should now have 370 observations. Save the joined and modified data set to the ‘data’ folder, using for example write_csv() function (readr package, part of tidyverse). (1 point)

write_csv(alc2, "create_alc.csv")

#checking is the structure of the data is correct
testing_data <- read_csv("create_alc.csv", header = TRUE)
head(alc2)
head(testing_data)

glimpse(alc2)
glimpse(testing_data)