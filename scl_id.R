library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datas<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\Database_SIH.csv")

datas <- datas[!is.na(datas$scl_id), ]

scl_id_counts <- table(datas$scl_id)

scl_id_data <- as.data.frame(scl_id_counts)
colnames(scl_id_data) <- c("scl_id", "Count")

scl_id_data$Percentage <- (scl_id_data$Count / sum(scl_id_data$Count)) * 100

ggplot(data = scl_id_data, aes(x = "", y = Count, fill = scl_id)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(scl_id, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "school_id Distribution with Percentages",
    fill = "school_id"
  ) +
  theme_void()

