# Look for correlation between population size and total food waste
# Create the scatterplot with a regression line
ggplot(foodWasteData, aes(x = population_2021, y = combined_estimate_tpy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add regression line
  labs(
    title = "Population vs. Combined Food Waste Estimate",
    x = "Population in 2021",
    y = "Combined Food Waste Estimate (tonnes/year)"
  ) +
  theme_minimal()

# Calculate the regression coefficient r^2
foodwaste_regression <- lm(population_2021 ~ combined_estimate_tpy, data = foodWasteData)
r_squared <- summary(foodwaste_regression)$r.squared   
print(r_squared)