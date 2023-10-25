library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datas<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\Database_SIH.csv")

datas <- datas[!is.na(datas$standard), ]

std_counts <- datas %>%
  group_by(standard) %>%
  summarize(class_Count = n())

std_counts <- std_counts %>%
  mutate(Percentage = (class_Count / sum(class_Count)) * 100)

ggplot(std_counts, aes(x = "", y = Percentage, fill = factor(standard))) +
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
