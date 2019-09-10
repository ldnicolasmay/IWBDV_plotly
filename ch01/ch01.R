# ch01/ch01.R

if (!require(remotes)) install.packages("remotes")
remotes::install_github("cpsievert/plotly_book")

library(ggplot2)
ggplot(mpg, aes(displ, hwy)) + geom_point()

library(plotly)
m <- highlight_key(mpg)
p <- ggplot(m, aes(displ, hwy)) + geom_point()
gg <- highlight(ggplotly(p), "plotly_selected")
crosstalk::bscols(gg, DT::datatable(m))

plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")
