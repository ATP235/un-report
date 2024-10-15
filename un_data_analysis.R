#gapminder_data <- read_csv("data/gapminder_data.csv")\

library(tidyverse)
gapminder_data <- read_csv("data/gapminder_data.csv")

summarize(gapminder_data, averageLifeExp=mean(lifeExp))

#alternative: averageExp is just a name being used for the output
summarize(gapminder_data, averageExp=mean(lifeExp))

gapminder_data %>% summarize(averageLifeExp=mean(lifeExp))

summarize(gapminder_data, mostRecentYear=max(year))

gapminder_data %>%
  filter(year == 2007) %>%
  summarize(average=mean(lifeExp))

summarize(gapminder_data, first_year=min(year))

gapminder_data %>% summarize(averageGDP=mean(gdpPercap))

gapminder_data %>%
  filter(year == 1952) %>%
  summarize(average_gdp=mean(gdpPercap))
#you can use underscores in the names of output, but do
#not use hyphen, because it yields an error

# more direct way to embed min(), although it needs to be assigned
# to a vector 'year' by ==
gapminder_data %>%
  filter(year == min(year)) %>%
  summarize(average_gdp=mean(gdpPercap))

#Rather that doing a bunch of different filter() statements, 
#we can instead use group_by() unction to 
# tell the code to treat the rows in logical groups.

gapminder_data %>%
  group_by(year) %>%
  summarize(average=mean(lifeExp))

gapminder_data %>%
  group_by(continent) %>%
  summarize(average=mean(lifeExp))

gapminder_data %>%
  group_by(continent) %>%
  summarize(average=mean(lifeExp), min=min(lifeExp))

#an additional attempt (of mine)
gapminder_data %>%
  group_by(continent) %>%
  summarize(max(lifeExp))

gapminder_data %>%
  mutate(gdp = pop * gdpPercap)
# this doesn't right the new column to the file though.

gapminder_data %>%
  mutate(gdp = pop * gdpPercap, popInMillions = pop / 100000)
# this doesn't right the new column to the file though.

# show only some columns
gapminder_data %>%
  select(pop, year)

# show all but some column(s)
gapminder_data %>%
  select(-continent)

# show only some columns
gapminder_data %>%
  select(country, continent, year, lifeExp)

# you can also reorder the columns you choose
gapminder_data %>%
  select(continent, year, lifeExp, country)

gapminder_data %>%
  select(-pop, -gdpPercap)

gapminder_data %>%
  select(year, starts_with("c"))

gapminder_data %>%
  select(country, continent, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp )

gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007 & continent == "Americas") %>%
  select(-year, -continent)

gapminder_data_2007

#you can show the continent column
gapminder_data_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007 & continent == "Americas") %>%
  select(-year)

gapminder_data_2007

gapminder_data_2007