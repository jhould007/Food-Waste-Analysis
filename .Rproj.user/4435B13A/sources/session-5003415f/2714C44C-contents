# Show how different categories of per-capita food waste compare in each region
# Create a bar graph
ggplot(averageFoodWasteByRegion, aes(x = reorder(region, avg_combined_kpcpy), y = avg_combined_kpcpy, fill = "Combined")) +
  geom_bar(stat = "identity", fill = "blue", width = 0.7) +
  geom_col(aes(y = avg_household_kpcpy, fill = "Household"), width = 0.7) +
  geom_col(aes(y = avg_retail_kpcpy, fill = "Retail"), width = 0.7) +
  geom_col(aes(y = avg_food_service_kpcpy, fill = "Food Service"), width = 0.7) +
  labs(
    title = "Relative Proportions of Food Waste Types by Region",
    x = "Region",
    y = "Average Per-Capita Food Waste (kg/year)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5)) +
  scale_fill_manual(
    values = c("Household" = "green", "Retail" = "blue", "Food Service" = "orange"),
    name = "Food Waste Types",
    labels = c("Retail", "Household", "Food Service")
  ) +
  guides(fill = guide_legend(title = "Food Waste Types")) +
  coord_flip()  # Flip the x and y axes for horizontal bars

# Compare food waste output of households, retail and food service
totalFoodWaste <- sqldf("SELECT SUM(household_estimate_tpy), SUM(retail_estimate_tpy), SUM(food_service_estimate_tpy) FROM foodWasteData")

# Create a bar graph with number labels
ggplot() +
  geom_bar(
    aes(x = c("Household", "Retail", "Food Service"), 
        y = c(as.numeric(totalFoodWaste[1,1]), 
              as.numeric(totalFoodWaste[1,2]), 
              as.numeric(totalFoodWaste[1,3])), 
        fill = c("green", "orange", "blue")),
    stat = "identity", 
    position = "dodge", 
    width = 0.7
  ) +
  geom_text(
    aes(x = c("Household", "Retail", "Food Service"), 
        y = c(as.numeric(totalFoodWaste[1,1]), 
              as.numeric(totalFoodWaste[1,2]), 
              as.numeric(totalFoodWaste[1,3])), 
        label = scales::comma(c(as.numeric(totalFoodWaste[1,1]), 
                                as.numeric(totalFoodWaste[1,2]), 
                                as.numeric(totalFoodWaste[1,3])))),
    position = position_dodge(width = 0.7),
    vjust = -0.5, size = 3
  ) +
  labs(
    title = "Total Food Waste by Source",
    x = "Source",
    y = "Total Food Waste (kg)"
  ) +
  scale_fill_manual(
    values = c("orange" = "orange", "green" = "green", "blue" = "blue"),
    name = "Food Waste Types",
    breaks = c("orange", "green", "blue"),
    labels = c("Retail", "Household", "Food Service")
  ) +
  theme_minimal()
