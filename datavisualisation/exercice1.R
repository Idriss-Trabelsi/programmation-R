## exercice 1 : ----

library(gapminder)
library(ggplot2)
library(dplyr)

data(gapminder)

glimpse(gapminder)
names(gapminder)
help("gapminder")



## scatter plot and bubble plot
## geom_point()

## basic scatter plot


gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(shape=20,
             size=12,
             color="red",
             alpha=0.5)


## question 2 :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,color = continent))+
  geom_point()

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(aes(color = continent))


## question 3 :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(aes(color = continent,size = pop))

## question 4 : 

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)

## question 5 :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)+
  scale_x_log10()

## question 6 Ajout et changement des titre :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,label))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)+
  scale_x_log10()+
  labs(title="Life Expectancy vs GDP per Capita",
       y="Life Expectancy (years)",
       x="GDP per capita (log scale)")
## question 7 :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,label))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)+
  scale_x_log10()+
  labs(title="Life Expectancy vs GDP per Capita",
       y="Life Expectancy (years)",
       x="GDP per capita (log scale)")

## question 8 :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,label))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)+
  scale_x_log10()+
  labs(title="Life Expectancy vs GDP per Capita",
       y="Life Expectancy (years)",
       x="GDP per capita (log scale)")+
  theme_minimal()

## question bonnus  Supprimer la legende :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,label))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)+
  scale_x_log10()+
  labs(title="Life Expectancy vs GDP per Capita",
       y="Life Expectancy (years)",
       x="GDP per capita (log scale)")+
  theme_minimal()+
  theme(legend.position = "none")

## question 9 :

gapminder %>% 
  ggplot(aes(x=gdpPercap,y=lifeExp,label))+
  geom_point(aes(color = continent,size = pop),alpha=0.5)+
  scale_x_log10()+
  labs(title="Life Expectancy vs GDP per Capita",
       y="Life Expectancy (years)",
       x="GDP per capita (log scale)",
       caption = "Source : Gapminder Dataset")+
  theme_minimal()+
  theme(legend.position = "none")










