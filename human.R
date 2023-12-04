# Antero Salminen

library(readr)
human <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human1.csv")

dim(human)
str(human)
summary(human)
library(dplyr)
glimpse(human)

# The data combines several indicators from most countries in the world (from: https://github.com/KimmoVehkalahti/Helsinki-Open-Data-Science/blob/master/datasets/human_meta.txt) 
# Data set contains 19 variables and 195 rows representing different countries and couple regions. 
# Data set's variables are integers except variable Country which is character type.

# Exclude unneeded variables & keep following:
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))

# Remove all rows with missing values 
complete.cases(human)

# print out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))

human2 <- data.frame(human, comp = complete.cases(human))
human2

# filter out all rows with NA values
human_ <- filter(human2, comp == TRUE)
human_

#Remove the observations which relate to regions instead of countries.
# choose everything until the last 7 observations
# define the last indice we want to keep
human2_ <- human_[1:155, ]
tail(human2_)
