## Exercice 1.1 : ----

install.packages("nycflights13")

library(nycflights13)
library(dplyr)

flights %>%
  slice(100:105)

flights %>%
  filter(month %in% c(7, 9))

flights %>%
  filter(arr_delay >= 10 & arr_delay <= 15)

flights %>%
  filter(carrier %in% c("DL", "UA", "AA"))

flights %>%
  arrange(desc(dep_delay))

airports %>%
  select(name, lat, lon)

airports %>%
  select(-tz, -tzone)

airports %>%
  mutate(alt_m = alt / 3.2808) %>%
  select(alt, alt_m) %>%
  head(12)

flights %>%
  filter(dest == "SFO") %>%
  arrange(desc(dep_delay))

flights %>%
  filter(month %in% c(1, 3)) %>%
  select(dest, dep_delay) %>%
  mutate(retard_h = dep_delay / 60) %>%
  arrange(desc(retard_h)) %>%
  head(15)

flights %>%
  group_by(month) %>%
  summarise(n = n()) %>%
  arrange(n)

flights %>%
  group_by(origin) %>%
  summarise(distance_moyenne = mean(distance, na.rm = TRUE))

flights %>%
  filter(origin == "JFK") %>%
  group_by(month) %>%
  summarise(n = n())

flights %>%
  group_by(month, dest) %>%
  summarise(n = n())

flights %>%
  group_by(month) %>%
  summarise(n = n()) %>%
  mutate(pourcentage = n / sum(n) * 100)

flights %>%
  group_by(month, dest) %>%
  summarise(retard_moyen = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(month, desc(retard_moyen)) %>%
  group_by(month) %>%
  slice_head(n = 3)



## Exercice 1.2 : ----
library(gapminder)
library(dplyr)

data("gapminder")
str(gapminder)
summary(gapminder)
dim(gapminder)
names(gapminder)
sapply(gapminder, class)

gapminder %>%
  filter(country == "United States",
         year %in% c(1997, 2002, 2007))

gapminder %>%
  filter(country == "United States", 
         year == 2007)

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(mean_lifeExp = mean(lifeExp))


gapminder %>%
  filter(year == 2007) %>%
  group_by(country) %>%
  summarise(mean_gdpPercap = mean(gdpPercap))

gapminder %>%
  group_by(continent, year) %>%
  summarise(mean_gdpPercap = mean(gdpPercap))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(total_population = sum(pop)) %>%
  arrange(desc(total_population))

gapminder %>%
  filter(year == 2007) %>%
  summarise(total_gdp = sum(gdpPercap * pop))

gapminder %>%
  filter(year == 2007) %>%
  mutate(lifeExp_percentile = ntile(lifeExp, 100))

gapminder_2007 <- gapminder %>%
  filter(year == 2007) %>%
  mutate(lifeExp_percentile = ntile(lifeExp, 100))
head(gapminder_2007)

gapminder_2007 %>%
  filter(lifeExp_percentile >= 90) %>%
  arrange(desc(lifeExp)) %>%
  select(continent, country, lifeExp, lifeExp_percentile) %>%
  head(10)

gapminder_2007 %>%
  filter(lifeExp_percentile <= 10) %>%
  arrange(lifeExp) %>%
  select(continent, country, lifeExp, lifeExp_percentile) %>%
  head(10)

## Exercice 1.3 : ----

library(hflights)
data("hflights")
str(hflights)
summary(hflights)
dim(hflights)
names(hflights)
sapply(hflights, class)

hflights[325, ]
hflights[400:650, ]

sample_hflights <- dplyr::sample_n(hflights, 100)
head(sample_hflights)

hflights %>%
  filter(Month == 1) %>% 
  DT::datatable()

hflights %>%
  filter(DepDelay >= 10 & DepDelay <= 15) %>% 
  DT::datatable()
names(hflights)

hflights %>%
  arrange(desc(Distance)) %>%
  head(1)

hflights %>%
  select(starts_with("dep"))

hflights %>%
  filter(ArrDelay == 0)

hflights %>%
  filter( DepDelay == 0 & ArrDelay == 0)

hflights %>%
  select(where(is.character))

hflights %>%
  select(where(is.numeric))

names(hflights)

hflights %>%
  filter(Distance == "LAX") %>%
  arrange(desc(DepDelay), desc(ArrDelay)) %>%
  head(10)

hflights %>%
  group_by(Month, UniqueCarrier) %>%
  summarise(
    max_dep_delay = max(DepDelay, na.rm = TRUE),
    min_dep_delay = min(DepDelay, na.rm = TRUE),
    max_arr_delay = max(ArrDelay, na.rm = TRUE),
    min_arr_delay = min(ArrDelay, na.rm = TRUE)
  )

hflights %>%
  summarise(
    avg_dep_delay = mean(DepDelay, na.rm = TRUE),
    avg_arr_delay = mean(ArrDelay, na.rm = TRUE)
  )

names(hflights)

hflights %>%
  group_by(Month, Distance) %>%
  summarise(
    max_dep_delay = max(DepDelay, na.rm = TRUE),
    min_dep_delay = min(DepDelay, na.rm = TRUE),
    avg_dep_delay = mean(DepDelay, na.rm = TRUE)
  )
