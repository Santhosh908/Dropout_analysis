library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datas<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\Database_SIH.csv")
datas <- datas[!is.na(datas$scl_name), ]

scl_name_counts <- table(datas$scl_name)

scl_name_data <- as.data.frame(scl_name_counts)
colnames(scl_name_data) <- c("scl_name", "Count")

scl_name_data$Percentage <- (scl_name_data$Count / sum(scl_name_data$Count)) * 100

ggplot(data = scl_name_data, aes(x = "", y = Count, fill = scl_name)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(scl_name, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "school_name Distribution with Percentages",
    fill = "school_name"
  ) +
  theme_void()