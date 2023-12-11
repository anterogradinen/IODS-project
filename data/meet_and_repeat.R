### Data wrangling
### Antero Salminen

# 1. Load the data sets (BPRS and RATS) 
   
BPRS_ <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep =" ", header = T)

RATS_ <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep ="\t", header = T)

# 2. Quick look at data sets

names(BPRS_)
names(RATS_)

str(BPRS_)
str(RATS_)

summary(BPRS_)
summary(RATS_)

# 3. Conversion of the categorical variables to factors.

library(dplyr)
BPRS_$treatment <- factor(BPRS_$treatment)
BPRS_$subject <- factor(BPRS_$subject)
RATS_$ID <- factor(RATS_$ID)
RATS_$Group <- factor(RATS_$Group)
 
str(BPRS_)
str(RATS_)

# 4a. Data sets to long form.

BPRSL_ <- pivot_longer(BPRS_, cols = -c(treatment, subject), 
                       names_to = "weeks",
                       values_to = "bprs") %>% arrange(weeks)
BPRSL_ <-  BPRSL_ %>% mutate(week = as.integer(substr(weeks,5,5)))

# 4b. RATS_ wide form data to long form RATSL_

RATSL_ <- pivot_longer(RATS_, cols = -c(ID, Group), 
                      names_to = "WD",
                      values_to = "Weight") %>% 
  mutate(Time = as.integer(substr(WD, 3, 4))) %>%
  arrange(Time)

# 4. Quick look on new data sets.

# Unfortunately no time to make more detail description.

View(BPRSL_)
str(BPRSL_)
summary(BPRSL_)

View(RATSL_)
str(RATSL_)
summary(RATSL_)
