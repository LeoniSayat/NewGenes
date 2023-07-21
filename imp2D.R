library(tidyverse)
library(plotly)
library(glue)
library(htmlwidgets)
library(ggplot2)

imp_data <- read.csv("data/Imp_daily.csv") 

p <- imp_data %>%
  ggplot(aes(x = Time)) +
    geom_line(aes(y = Day_1), color = "#a2d2ff") +
    geom_line(aes(y = Day_2), color = "#bde0fe") +
    geom_line(aes(y = Day_3), color = "#ffafcc") +
    geom_line(aes(y = Day_4), color = "#ffc8dd") +
    geom_line(aes(y = Day_5), color = "#cdb4db") +
   
  labs(x = "Hour",
       y = "Impressions",
       title = "Hourly Impressions",
       subtitle = "Shown From 7/12 to 7/15") +
  theme(
    panel.background = element_blank(),
    panel.grid.minor = element_blank(),
    # panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color="gray", linetype="dotted",
                                      size = 0.25),
    plot.title.position = "plot",
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color="gray", size=10),
    plot.margin = margin(t = 10, r = 15, b = 10, l = 10)
  )
p
