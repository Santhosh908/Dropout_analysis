library(sqldf)
library(readr)
library(ggplot2)
library(dplyr)
library(ggrepel)
datas<-readr::read_csv("C:\\Users\\Santhosh\\Downloads\\database_SIH.csv")
query <- "SELECT age FROM datas"
result <- sqldf(query)

datas <- datas[!is.na(datas$age), ]


age_counts <- datas %>%
  group_by(age) %>%
  summarize(Member_Count = n())


age_counts <- age_counts %>%
  mutate(Percentage = (Member_Count / sum(Member_Count)) * 100)

plot0<-ggplot(age_counts, aes(x = "", y = Percentage, fill = factor(age))) +
  geom_bar(stat = "identity") +
  coord_polar(theta = "y") +
  geom_text_repel(
    aes(label = paste(age, "\n", sprintf("%.1f%%", Percentage))),
    position = position_stack(vjust = 0.5),
    max.overlaps = Inf  # Increase max.overlaps to allow all labels
  ) +
  labs(
    title = "Pie Chart of Age Distribution",
    fill = "Age"
  ) +
  theme_void()

