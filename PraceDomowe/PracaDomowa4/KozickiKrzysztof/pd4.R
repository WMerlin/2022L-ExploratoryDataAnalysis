bestsellers <- read.csv("bestsellers.csv")

library(ggplot2)
library(plotly)
library(dplyr)

bestsellers <- bestsellers %>% 
  group_by(Year) %>% 
  summarise(User.Rating = mean(User.Rating), Reviews = sum(Reviews), Price = mean(Price))





wykres <- plot_ly(data = bestsellers, type = "scatter", mode = "lines") %>%
  add_lines(x=~Year, y=~User.Rating) %>%
  add_lines(x=~Year, y=~Reviews) %>%
  add_lines(x=~Year, y=~Price) %>% 
  layout(title = "Ilo�� Opini",
         showlegend=FALSE,
         xaxis=list(title="Rok"),
         yaxis=list(title="Ilo�� Opinii"),
         updatemenus=list(
           list(
             active = -1,
             type= 'buttons',
             buttons = list(
               list(
                 label = "Ilo�� Opinii",
                 method = "update",
                 args = list(list(visible = c(FALSE, FALSE, TRUE)),
                             list(title = "Ilo�� Opinii",
                                  yaxis = list(title = "Ilo�� Opinii")))),
               list(
                 label = "�rednia Ocen",
                 method = "update",
                 args = list(list(visible = c(FALSE, TRUE, FALSE)),
                             list(title = "�rednia Ocen",
                                  yaxis = list(title = "�rednia Ocen")))),
               list(
                 label = "�rednia Cena",
                 method = "update",
                 args = list(list(visible = c(TRUE, FALSE, FALSE)),
                             list(title = "�rednia Cena",
                                  yaxis = list(title = "�rednia Cena"))))))))

wykres
