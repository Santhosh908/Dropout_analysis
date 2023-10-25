library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datas<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\Database_SIH.csv")

datas <- datas[!is.na(datas$area), ]

area_counts <- table(datas$area)

area_data <- as.data.frame(area_counts)
colnames(area_data) <- c("area", "Count")

area_data$Percentage <- (area_data$Count / sum(area_data$Count)) * 100

ggplot(data = area_data, aes(x = "", y = Count, fill = area)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(area, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Area Distribution with Percentages",
    fill = "Area"
  ) +
  theme_void()

