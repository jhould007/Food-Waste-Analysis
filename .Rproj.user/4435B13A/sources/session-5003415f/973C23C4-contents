# Find total global food waste every year
total_foodwaste <- sqldf("SELECT SUM(combined_estimate_tpy) FROM foodWasteData")[[1]]
print(total_foodwaste)

# Find countries with highest and lowest combined per-capita food waste
highestFoodWasteKpcpy <- sqldf("SELECT country, MAX(combined_estimate_kpcpy), estimate_confidence FROM foodWasteData")
lowestFoodWasteKpcpy <- sqldf("SELECT country, MIN(combined_estimate_kpcpy), estimate_confidence FROM foodWasteData")

# Subset the dataframe to select the top 10 countries with the highest and lowest combined per-capita food waste
topCountries <- tail(foodWasteData[order(foodWasteData$combined_estimate_kpcpy), ], 10)
bottomCountries <- head(foodWasteData[order(foodWasteData$combined_estimate_kpcpy), ], 10)

# Show the 10 countries with the highest combined per-capita food waste
ggplot(topCountries, aes(x = reorder(country, -combined_estimate_kpcpy), y = combined_estimate_kpcpy)) +
  geom_bar(stat = "identity", fill = "blue", width = 0.7) +
  geom_text(aes(label = combined_estimate_kpcpy), hjust = 0.5, vjust = -0.3, size = 3) +  # Add labels
  labs(
    title = "The 10 Countries with Highest Combined Per-Capita Food Waste",
    x = "Country",
    y = "Per-Capita Food Waste (kg/year)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(
    values = c("blue" = "Combined"),
    name = "Waste Type",
    labels = c("Combined")
  ) +
  guides(fill = FALSE)  # Hide the legend

# Show the 10 countries with the lowest combined per-capita food waste
ggplot(bottomCountries, aes(x = reorder(country, -combined_estimate_kpcpy), y = combined_estimate_kpcpy)) +
  geom_bar(stat = "identity", fill = "blue", width = 0.7) +
  geom_text(aes(label = combined_estimate_kpcpy), hjust = 0.5, vjust = -0.3, size = 3) +  # Add labels
  labs(
    title = "The 10 Countries with Lowest Combined Per-Capita Food Waste",
    x = "Country",
    y = "Per-Capita Food Waste (kg/year)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(
    values = c("blue" = "Combined"),
    name = "Waste Type",
    labels = c("Combined")
  ) +
  guides(fill = FALSE)  # Hide the legend

# Find the countries with the highest and lowest combined amounts of food waste
highestFoodWaste <- sqldf("SELECT country, MAX(combined_estimate_tpy), estimate_confidence FROM foodWasteData")
lowestFoodWaste <- sqldf("SELECT country, MIN(combined_estimate_tpy), estimate_confidence FROM foodWasteData")

# Find the average combined per-capita food waste across all countries
avg_foodwaste_kpcpy <- sqldf("SELECT AVG(combined_estimate_kpcpy) FROM foodWasteData")[[1]]
print(avg_foodwaste_kpcpy)

# Compare per-capita food waste between regions
print(unique(foodWasteData$region))
# Group the data by the 'region' column
foodWasteData <- foodWasteData %>%
  group_by(region)
# Calculate averages for each per-capita food waste column
averageFoodWasteByRegion <- foodWasteData %>%
  summarize(
    avg_combined_kpcpy = mean(combined_estimate_kpcpy, na.rm = TRUE),
    avg_household_kpcpy = mean(household_estimate_kpcpy, na.rm = TRUE),
    avg_retail_kpcpy = mean(retail_estimate_kpcpy, na.rm = TRUE),
    avg_food_service_kpcpy = mean(food_service_estimate_kpcpy, na.rm = TRUE)
    )
# Order the data by combined averages
averageFoodWasteByRegion <- averageFoodWasteByRegion[order(averageFoodWasteByRegion$avg_combined_kpcpy, decreasing = TRUE), ]

# Remove unneeded variables to keep environment clean
rm(highestFoodwasteKpcpy)
rm(lowestFoodwasteKpcpy)
rm(highestFoodwaste)
rm(lowestFoodwaste)
rm(avg_foodwaste_kpcpy)
rm(american_foodwaste_kpcpy)
rm(averageFoodWasteByRegion)
