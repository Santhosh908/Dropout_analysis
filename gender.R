library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datasi<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\Database_SIH.csv")
head(datasi)
datasi <- datasi[!is.na(datasi$gender), ]

gender_counts <- table(datasi$gender)

gender_data <- as.data.frame(gender_counts)
colnames(gender_data) <- c("Gender", "Count")

gender_data$Percentage <- (gender_data$Count / sum(gender_data$Count)) * 100

ggplot(data = gender_data, aes(x = "", y = Count, fill = Gender)) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(Gender, "\n", sprintf("%.1f%%", Percentage))), 
            position = position_stack(vjust = 0.5)) +
  labs(
    title = "Gender Distribution with Percentages",
    fill = "Gender"
  ) +
  theme_void()

