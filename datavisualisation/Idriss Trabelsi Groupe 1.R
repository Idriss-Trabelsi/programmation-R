## question 1 :

library(ggplot2)
library(dplyr)
library(gapminder)

## qustion 2 :

data<- gapminder %>%
  filter(year == 2007)

## question 3 :
data <- data %>%
  arrange(desc(gdpPercap)) %>%
  head(15)
data

## question 4 :

ggplot(data,aes(x=country,y=gdpPercap))+
  geom_bar(stat = "identity")

## question 5:

ggplot(data,aes(x=country,y=gdpPercap,fill = country))+
  geom_bar(stat = "identity",width = 0.7)


## question 6 :

ggplot(data,aes(x=country,y=gdpPercap,fill = country))+
  geom_bar(stat = "identity",width = 0.7)+
  labs(title = "GDP per Capita by Country in 2007",
       x="country",
       y="GDP per capita")

## question 7 :

ggplot(data,aes(x=country,y=gdpPercap,fill = country))+
  geom_bar(stat = "identity",width = 0.7)+
  labs(title = "GDP per Capita by Country in 2007",
       x="country",
       y="GDP per capita")+
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5))

ggplot(data,aes(x=country,y=gdpPercap,fill = country))+
  geom_bar(stat = "identity",width = 0.7)+
  labs(title = "GDP per Capita by Country in 2007",
       x="country",
       y="GDP per capita")+
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
        axis.title.x = element_text(face = "bold", size = 13))

ggplot(data,aes(x=country,y=gdpPercap,fill = country))+
  geom_bar(stat = "identity",width = 0.7)+
  labs(title = "GDP per Capita by Country in 2007",
       x="country",
       y="GDP per capita")+
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
        axis.title.x = element_text(face = "bold", size = 13),
        axis.title.y = element_text(face = "bold", size = 13))

ggplot(data,aes(x=country,y=gdpPercap,fill = country))+
  geom_bar(stat = "identity",width = 0.7)+
  labs(title = "GDP per Capita by Country in 2007",
       x="country",
       y="GDP per capita")+
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
        axis.title.x = element_text(face = "bold", size = 13),
        axis.title.y = element_text(face = "bold", size = 13),
        axis.text.x = element_text(angle = 45, hjust = 1))

## question 8 :

ggplot(data,aes(x=reorder(country, -gdpPercap),y=gdpPercap,fill = country))+
  geom_bar(stat = "identity")+
  labs(title = "GDP per Capita by Country in 2007",
       x="country",
       y="GDP per capita")+
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
        axis.title.x = element_text(face = "bold", size = 13),
        axis.title.y = element_text(face = "bold", size = 13),
        axis.text.x = element_text(angle = 45, hjust = 1))



