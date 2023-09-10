# Install and load packages
install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
install.packages("sqldf")
library(sqldf)
install.packages("ggplot2")
library(ggplot2)
install.packages("readr")
library(readr)

# Read the CSV file(s)
foodWasteData <- read_csv("foodwastedata.csv")

# Making backup of original food waste dataframe for reference
foodWasteDataOriginal <- foodWasteData

# Making backup of modified foodWasteData before performing joins
foodWasteDataPreJoin <- foodWasteData

# Restoring backup of original food waste dataframe
foodWasteData <- foodWasteDataOriginal

# Load dataset linking M49 codes to ISO-alpha3 codes and join with foodWasteData
codesData <- read_csv("M49 and ISO-alpha3 codes.csv")
names(codesData)[names(codesData) == 'M49 code'] <- 'm49_code'
names(codesData)[names(codesData) == 'ISO-alpha3 code'] <- 'iso_alpha3_code'
codesData <- sqldf("SELECT m49_code, iso_alpha3_code FROM codesData")
foodWasteData <- sqldf("SELECT * FROM foodWasteData INNER JOIN codesData 
                 ON foodWasteData.m49_code = codesData.m49_code")

# Join population dataset with foodWasteData using ISO-alpha3 codes
populationData <- read_csv("2021_population.csv")
names(populationData)[names(populationData) == 'iso_code'] <- 'iso_alpha3_code'
names(populationData)[names(populationData) == '2021_last_updated'] <- 'population_2021'
populationData <- sqldf("SELECT iso_alpha3_code, population_2021 FROM populationData")
foodWasteData <- merge(foodWasteData, populationData, by = "iso_alpha3_code", all.x = TRUE)
# Reorder foodWasteData and remove unnecessary duplicate m49 column
foodWasteData <- foodWasteData[, -14]
foodWasteData <- foodWasteData[, c(2,3,4,5,6,7,8,9,10,11,12,1,14)]

# Quick loading for future sessions
library(tidyverse)
library(dplyr)
library(sqldf)
library(ggplot2)
library(readr)