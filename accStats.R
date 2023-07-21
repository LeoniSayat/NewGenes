library(tidyverse)
library(plotly)
library(glue)
library(htmlwidgets)

imp_data <- read_csv("data/Impressions.csv") %>%
  mutate(
    radius = Impressions,
    theta = 2 * pi * (Time-1)/24,
    x = radius * sin(theta),
    y = radius * cos(theta),
    z = Time,
    time = Time%%24,
    day = floor(Time/24) + 1,
    label = glue("Day {day}\n{time}:00\nImpressions: {Impressions}")
    ) 

axx <- list(
  
  title = "",
  showgrid = FALSE,
  zeroline = FALSE,
  showticklabels = FALSE
  
)


axy <- list(
  
  title = "",
  showgrid = FALSE,
  zeroline = FALSE,
  showticklabels = FALSE
  
)


axz <- list(
  
  title = "Hours Since Launch"
  
)

p <- plot_ly(imp_data, x = ~x, y = ~y, z = ~z, text = ~label,
             hoverinfo = "text",   
             type = 'scatter3d', 
             mode = 'lines',
             line = list(width = 10, color = ~Impressions, 
                         colorscale = list(c(0,"purple"), 
                                           c(65,"orange")))) %>%
  layout(scene = list(xaxis=axx,
                      yaxis=axy,
                      zaxis=axz))

p
saveWidget(p, "figures/impressions_spiral.html")
