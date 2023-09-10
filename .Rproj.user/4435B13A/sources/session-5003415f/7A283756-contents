# Create new column for combined estimate in tonnes/year, then reorder columns
foodWasteData <- mutate(foodWasteData, combined_estimate_tonnes_per_year = foodWasteData$`Household estimate (tonnes/year)` + foodWasteData$`Retail estimate (tonnes/year)` + foodWasteData$`Food service estimate (tonnes/year)`)
foodWasteData <- foodWasteData[, c(1,2,13,3,4,5,6,7,8,9,10,11,12)]

# Changing column names to make them lowercase and include underscores
new_col_names <- c("country", "combined_estimate_kpcpy", "combined_estimate_tpy", "household_estimate_kpcpy", "household_estimate_tpy", "retail_estimate_kpcpy", "retail_estimate_tpy", "food_service_estimate_kpcpy", "food_service_estimate_tpy", "estimate_confidence", "m49_code", "region", "source")
names(foodWasteData) <- new_col_names

# Moving source to a separate dataframe to get it out of the way
dataSources <- sqldf("SELECT country, m49_code, source FROM foodWasteData")
foodWasteData<- foodWasteData[, -13]