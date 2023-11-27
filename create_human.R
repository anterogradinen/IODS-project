library(readr)
hd <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")
gii <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")

# Explore the datasets: see the structure and dimensions of the data. 
# Create summaries of the variables. (1 point)

summary(hd)
summary(gii)
colnames(gii)

dim(hd)
dim(gii)

# Look at the meta files and rename the variables with (shorter) descriptive names. (1 point)


gii2 <- gii %>% 
    rename("Rank" = "GII Rank",
           "Index" = "Gender Inequality Index (GII)",               
           "Mat_Mort_ratio" = "Maternal Mortality Ratio",                    
           "Adol_birthrate" = "Adolescent Birth Rate",                       
           "Parl_repr" = "Percent Representation in Parliament",        
           "F_w_2nd_ed" = "Population with Secondary Education (Female)",
           "M_w_2nd_ed" = "Population with Secondary Education (Male)",  
           "F_rate_labour" = "Labour Force Participation Rate (Female)",    
           "M_rate_labour" = "Labour Force Participation Rate (Male)")   

#Mutate the “Gender inequality” data and create two new variables. The first new variable should be the ratio of female and male populations with secondary education in each country (i.e., Edu2.F / Edu2.M). The second new variable should be the ratio of labor force participation of females and males in each country (i.e., Labo.F / Labo.M). (1 point)

# Sorry. Ran short of time :(

# Join together the two datasets using the variable Country as the identifier. Keep only the countries in both data sets (Hint: inner join). The joined data should have 195 observations and 19 variables. Call the new joined data "human" and save it in your data folder (use write_csv() function from the readr package). (1 point)

# Sorry. Ran short of time :(