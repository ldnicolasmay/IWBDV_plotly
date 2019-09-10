# ch02/ch02.R

# 2.1

library(plotly)

data(diamonds, package = "ggplot2")
diamonds

plot_ly(diamonds, x = ~cut)
plot_ly(diamonds, x = ~cut, y = ~clarity)
plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")

plot_ly(diamonds, x = ~cut, color = "black")
plot_ly(diamonds, x = ~cut, color = I("red"), stroke = I("black"), span = I(2))

layout(
  plot_ly(diamonds, x = ~cut),
  title = "My beautiful histogram"
)

diamonds %>% 
  plot_ly(x = ~cut) %>% 
  layout(title = "My beautiful histogram")


library(dplyr)

diamonds %>% 
  plot_ly(x = ~cut) %>% 
  add_histogram() %>% 
  group_by(cut) %>% 
  summarize(n = n()) %>% 
  add_text(
    text = ~scales::comma(n), y = ~n,
    # text = ~n, y = ~n,
    textposition = "top middle",
    cliponaxis = FALSE
  )

# usinge `plotly_data` to view plot data
diamonds %>% 
  plot_ly(x = ~cut) %>% 
  add_histogram() %>% 
  group_by(cut) %>% 
  summarize(n = n()) %>% 
  plotly_data()

diamonds %>% 
  plot_ly(x = ~carat, y = ~price, color = ~cut, colors = "Accent") %>% 
  add_markers() %>% 
  group_by(cut)

diamonds %>% 
  plot_ly(x = ~carat, y = ~price, color = ~cut, colors = "Accent") %>% 
  add_markers() %>% 
  group_by(cut) %>% 
  plotly_data()




