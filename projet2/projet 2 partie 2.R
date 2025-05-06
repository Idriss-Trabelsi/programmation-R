## Exercice 1 : ----

library(dplyr)
library(hflights)

data("hflights")

top_5_airlines <- hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(total_flights = n()) %>%
  arrange(desc(total_flights)) %>%
  slice_head(n = 5)
top_5_airlines


avg_dep_delay <- hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(avg_dep_delay = mean(DepDelay, na.rm = TRUE)) %>%
  arrange(desc(avg_dep_delay))
avg_dep_delay


median_arr_delay <- hflights %>%
  filter(DepTime >= 600 & DepTime <= 1200) %>%
  group_by(UniqueCarrier) %>%
  summarise(median_arr_delay = median(ArrDelay, na.rm = TRUE))
median_arr_delay


cancelled_flights <- hflights %>%
  filter(Cancelled == 1) %>%
  summarise(total_cancelled = n())
cancelled_flights 


avg_air_time_iah <- hflights %>%
  filter(Origin == "IAH") %>%
  summarise(avg_air_time = mean(AirTime, na.rm = TRUE))
avg_air_time_iah 


avg_arr_delay_day <- hflights %>%
  group_by(DayOfWeek) %>%
  summarise(avg_arr_delay = mean(ArrDelay, na.rm = TRUE))
avg_arr_delay_day


diverted_summary <- hflights %>%
  summarise(
    total_diverted = sum(Diverted == 1, na.rm = TRUE),
    total_flights = n(),
    percent_diverted = 100 * total_diverted / total_flights)
diverted_summary


busiest_day <- hflights %>%
  group_by(DayOfWeek) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count)) %>%
  slice(1)
busiest_day 


delayed_proportion <- hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(
    total_flights = n(),
    delayed_flights = sum(ArrDelay > 0, na.rm = TRUE),
    proportion_delayed = delayed_flights / total_flights)
delayed_proportion


hou_to_ord_avg_air_time <- hflights %>%
  filter(Origin == "HOU", Dest == "ORD") %>%
  summarise(avg_air_time = mean(AirTime, na.rm = TRUE))
hou_to_ord_avg_air_time 


## Exercice 2 : ----

library(dplyr)
library(gapminder)
library(tidyr)

data("gapminder")

mean_lifeExp_gdp <- gapminder %>%
  group_by(continent, year) %>%
  summarise(
    mean_lifeExp = mean(lifeExp, na.rm = TRUE),
    mean_gdpPercap = mean(gdpPercap, na.rm = TRUE))
mean_lifeExp_gdp


mean_pop_millions <- gapminder %>%
  mutate(pop_millions = pop / 1e6) %>%
  group_by(continent, year) %>%
  summarise(mean_pop_millions = mean(pop_millions, na.rm = TRUE))
mean_pop_millions


countries_80plus_2007 <- gapminder %>%
  filter(year == 2007, lifeExp >= 80) %>%
  group_by(continent) %>%
  summarise(num_countries = n_distinct(country))
countries_80plus_2007


avg_gdp_2002 <- gapminder %>%
  filter(year == 2002) %>%
  group_by(continent) %>%
  summarise(mean_gdpPercap = mean(gdpPercap, na.rm = TRUE)) %>%
  arrange(desc(mean_gdpPercap))
avg_gdp_2002


asia_big_countries <- gapminder %>%
  filter(continent == "Asia", pop > 100e6) %>%
  group_by(country) %>%
  summarise(
    mean_lifeExp = mean(lifeExp),
    mean_gdpPercap = mean(gdpPercap))
asia_big_countries


lifeExp_change <- gapminder %>%
  filter(year %in% c(1952, 2007)) %>%
  select(country, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp) %>%
  mutate(percent_change = (`2007` - `1952`) / `1952` * 100)
lifeExp_change


gdp_category_summary <- gapminder %>%
  mutate(
    gdp_category = case_when(
      gdpPercap < 5000 ~ "low",
      gdpPercap >= 5000 & gdpPercap <= 20000 ~ "medium",
      gdpPercap > 20000 ~ "high")) %>%
  group_by(continent, gdp_category) %>%
  summarise(num_countries = n_distinct(country))
gdp_category_summary


## Exercice 3 : ----

library(dplyr)
library(tidyr)
library(ggstatsplot)

data("movies_long")

dimensions_movies <- dim(movies_long)
dimensions_movies

unique_genres <- unique(movies_long$genre)
unique_genres 

top_5_rated_movies <- movies_long %>%
  arrange(desc(rating)) %>%
  select(title, rating) %>%
  slice_head(n = 5)
top_5_rated_movies

avg_rating_by_genre <- movies_long %>%
  group_by(genre) %>%
  summarise(mean_rating = mean(rating, na.rm = TRUE))
avg_rating_by_genre

movies_per_genre <- movies_long %>%
  count(genre)
movies_per_genre

most_common_rating <- movies_long %>%
  count(rating) %>%
  arrange(desc(n)) %>%
  slice(1)
most_common_rating


library(tidytext)

top_words <- movies_long %>%
  select(title) %>%
  distinct() %>%
  mutate(words = strsplit(title, " ")) %>%
  unnest(words) %>%
  mutate(words = tolower(words)) %>%
  count(words, sort = TRUE) %>%
  slice_head(n = 10)

top_words

longest_title <- movies_long %>%
  mutate(title_length = nchar(title)) %>%
  arrange(desc(title_length)) %>%
  slice(1) %>%
  select(title, title_length)
longest_title

highest_budget_movie <- movies_long %>%
  arrange(desc(budget)) %>%
  slice(1) %>%
  select(title, budget)
highest_budget_movie

earliest_year <- min(movies_long$year, na.rm = TRUE)
earliest_year

latest_year <- max(movies_long$year, na.rm = TRUE)
latest_year

movies_by_decade <- movies_long %>%
  mutate(decade = paste0(floor(year / 10) * 10, "s")) %>%
  count(decade)
movies_by_decade 

avg_votes_by_genre <- movies_long %>%
  group_by(genre) %>%
  summarise(avg_votes = mean(votes, na.rm = TRUE))
avg_votes_by_genre

highly_rated_movies_count <- movies_long %>%
  filter(rating > 8.5) %>%
  summarise(count = n())
highly_rated_movies_count

above_avg_by_genre <- movies_long %>%
  group_by(genre) %>%
  mutate(mean_genre_rating = mean(rating, na.rm = TRUE)) %>%
  ungroup() %>%
  filter(rating > mean_genre_rating) %>%
  select(title, genre, rating, mean_genre_rating)
above_avg_by_genre


