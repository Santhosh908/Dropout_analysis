library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datas<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\Database_SIH.csv")

datas <- datas[!is.na(datas$cast), ]

cast_counts <- table(datas$cast)

cast_data <- as.data.frame(cast_counts)
colnames(cast_data) <- c("cast", "Count")

cast_data$Percentage <- (cast_data$Count / sum(cast_data$Count)) * 100

ggplot(data = cast_data, aes(x = "", y = Count, fill = cast)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(cast, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Caste Distribution with Percentages",
    fill = "Caste"
  ) +
  theme_void()

