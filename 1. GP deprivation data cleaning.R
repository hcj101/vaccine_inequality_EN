options(repos = "https://cloud.r-project.org")
install.packages("readxl")
library(readxl)
install.packages("data.table")
library(data.table)
install.packages("xlsx")
library("xlsx")

#Load the dataset from PHE Fingertips API dashboard including GP codes and IMD scores for 2019
file <- file.choose()
data <- read.csv('Full dataset API deprivation scores.csv')

#Limit the dataset to include only GP surgeries and 2019 IMD score (most recent estimate of deprivation available)
data_fGP <- data[data$Area.Type == 'GPs', ]
data_fGP_date <- data_fGP[data_fGP$Time.period == '2019', ]

#Ensure any duplicates are removed
duplicates_GPcode_check <- duplicated(data_fGP_date$Area.Code)
count_duplicates_GPcode <- sum(duplicates_GPcode_check)
print(count_duplicates_GPcode)

duplicates_indicatorname <- duplicated(data_fGP_date$Indicator.Name)
count_duplicates_indicatorname <- sum(duplicates_indicatorname)
print(count_duplicates_indicatorname)

#Create the final tidied dataset
final_df <- data_fGP_date[,c(5,6,12,13)]

#Assign deciles to deprivation scores
final_df$Decile <- cut(final_df$Value, breaks = quantile(final_df$Value, probs = seq(0, 1, by = 0.1)), labels = FALSE, include.lowest = TRUE)

#Save the data frame as a CSV file
write.csv(final_df, "GP codes with deprivation.csv")

