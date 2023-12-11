### Data wrangling
### Antero Salminen

#   1. Load the data sets (BPRS and RATS) into R using as the source the GitHub repository of MABS, where they are given in the wide form:
#   
BPRS_ <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep =" ", header = T)

RATS_ <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep ="\t", header = T)

# Also, take a look at the data sets: check their variable names, view the data contents and structures, and create some brief summaries of the variables , so that you understand the point of the wide form data. (1 point)

str(BPRS_)
str(RATS_)

summary(BPRS_)
summary(RATS_)

# 2. Convert the categorical variables of both data sets to factors. (1 point)

library(dplyr)
BPRS_$treatment <- factor(BPRS_$treatment)
BPRS_$subject <- factor(BPRS_$subject)
RATS_$ID <- factor(RATS_$ID)
RATS_$Group <- factor(RATS_$Group)
 
str(BPRS_)
str(RATS_)

# 3. Convert the data sets to long form. Add a week variable to BPRS and a Time variable to RATS. (1 point)

BPRSL_ <- pivot_longer(BPRS_, cols = -c(treatment, subject), 
                       names_to = "weeks",
                       values_to = "bprs") %>% arrange(weeks)
BPRSL_ <-  BPRSL_ %>% mutate(week = as.integer(substr(weeks,5,5)))

# RATS_ data to long form RATSL_

RATSL_ <- pivot_longer(RATS_, cols = -c(ID, Group), 
                      names_to = "WD",
                      values_to = "Weight") %>% 
  mutate(Time = as.integer(substr(WD, 3, 4))) %>%
  arrange(Time)

# 4. Now, take a serious look at the new data sets and compare them with their wide form versions: Check the variable names, view the data contents and structures, and create some brief summaries of the variables. Make sure that you understand the point of the long form data and the crucial difference between the wide and the long forms before proceeding the to Analysis exercise. (2 points)

View(BPRSL_)
str(BPRSL_)
summary(BPRSL_)

View(RATSL_)
str(RATSL_)
summary(RATSL_)
