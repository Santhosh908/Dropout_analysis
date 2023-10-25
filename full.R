library(gridExtra)

# Create individual scatter plots
plot1 <- ggplot(std_counts, aes(x = "", y = Percentage, fill = factor(standard))) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text_repel(
    aes(label = paste(standard, "\n", sprintf("%.1f%%", Percentage))),
    position = position_stack(vjust = 0.5),
    max.overlaps = Inf  # Increase max.overlaps to allow all labels
  ) +
  labs(
    title = "Pie Chart of Standard Distribution",
    fill = "Standard"
  ) +
  theme_void()

plot2 <- ggplot(data = gender_data, aes(x = "", y = Count, fill = Gender)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(Gender, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Gender Distribution with Percentages",
    fill = "Gender"
  ) +
  theme_void()

plot3 <- ggplot(data = cast_data, aes(x = "", y = Count, fill = cast)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(cast, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Caste Distribution with Percentages",
    fill = "Caste"
  ) +
  theme_void()
plot4 <- ggplot(data = area_data, aes(x = "", y = Count, fill = area)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(area, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Area Distribution with Percentages",
    fill = "Area"
  ) +
  theme_void()
plot5<-ggplot(data = scl_id_data, aes(x = "", y = Count, fill = scl_id)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(scl_id, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "scl_id Distribution with Percentages",
    fill = "scl_id"
  ) +
  theme_void()
plot6<-ggplot(data = scl_name_data, aes(x = "", y = Count, fill = scl_name)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(scl_name, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "scl_name Distribution with Percentages",
    fill = "scl_name"
  ) +
  theme_void()
# Arrange the plots in a 2x2 grid
grid.arrange(plot0,plot1, plot2, plot3, plot4,plot5,plot6, ncol = 2)
