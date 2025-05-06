## theme 3 : visualisation des données

## etape 1 : load packages

library(dplyr)#manipulation
library(ggplot2)#visualisation
library(gapminder)#jeux de données
library(plotly)# graphe interactif

data("gapminder")

## etape 2 : Data structure 


View(gapminder)
help("gapminder")# information sur la base
str(gapminder)
glimpse(gapminder)


# etape 3 : visualisation 
## 1. Bar plot

## Application 1 : presenter dans un 
## bar plot les 5 pays ayant l'esperance de vie 
## la plus élevée pour l'année 2007

# preparation des données

top_five_lifeexp <- gapminder %>% 
  filter(year==2007) %>% 
  select(country,lifeExp) %>% 
  arrange(desc(lifeExp)) %>% 
  head(n=5)

## représentation graphique 

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp))+
  geom_bar(stat = 'identity')

## ajout d'autre couche 
## modifier la couleur des barres 

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp))+
  geom_bar(stat = 'identity',
           color="green",
           fill="green")

### modifier la couleur de remplissage (fill)
### des bar par pays

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country))+
  geom_bar(stat = 'identity',
           color="green")



### modifier la largeur des barres 

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)

### changer les barres horizantale

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)+
  coord_flip()


### ajouter un titre au graphe , la sources de données , changer
## les noms des axes 
## hint:utiliser la fonction labs()


ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)+
  labs(title = "Top 5 pays ayant l'esperence de vie la plus élevée",
       x="Pays",
       y="Esperence de vie",
       caption = "Source : Propre calcul de l'auteur ",
       subtitle = "Données : gapminder(1952-2007)")

### Modifier le theme du graphique : 
## utiliser theme_..()

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)+
  labs(title = "Top 5 pays ayant l'esperence de vie la plus élevée",
       x="Pays",
       y="Esperence de vie",
       caption = "Source : Propre calcul de l'auteur ",
       subtitle = "Données : gapminder(1952-2007)")+
  theme_dark()


### Ajouter les valeurs de l'esperance de vie sur les barres 

## hint : utiliser geom_text() et l'argument label

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country,label=lifeExp))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)+
  labs(title = "Top 5 pays ayant l'esperence de vie la plus élevée",
       x="Pays",
       y="Esperence de vie",
       caption = "Source : Propre calcul de l'auteur ",
       subtitle = "Données : gapminder(1952-2007)")+
  theme_dark()+
  geom_text(size = 4 , vjust= -0.5 )


### modifier la couleur des barres d'une maniere manuelle :
## utiliser la couche scale_fill_manual
## couleurs : pink, blue , lightblue,gray, yellow

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country,label=lifeExp))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)+
  labs(title = "Top 5 pays ayant l'esperence de vie la plus élevée",
       x="Pays",
       y="Esperence de vie",
       caption = "Source : Propre calcul de l'auteur ",
       subtitle = "Données : gapminder(1952-2007)")+
  theme_dark()+
  geom_text(size = 4 , vjust= -0.5 )+
  scale_fill_manual(values = c( "pink", "blue" , "lightblue","gray", "yellow"))



### changer la position de la legende : couche:theme

ggplot(data=top_five_lifeexp,
       aes(x=country,y=lifeExp,fill = country,label=lifeExp))+
  geom_bar(stat = 'identity',
           color="green",
           width = 0.5)+
  labs(title = "Top 5 pays ayant l'esperence de vie la plus élevée",
       x="Pays",
       y="Esperence de vie",
       caption = "Source : Propre calcul de l'auteur ",
       subtitle = "Données : gapminder(1952-2007)")+
  theme_dark()+
  geom_text(size = 4 , vjust= -0.5 )+
  scale_fill_manual(values = c( "pink", "blue" , "lightblue","gray", "yellow"))+
  theme(legend.position = "top")




