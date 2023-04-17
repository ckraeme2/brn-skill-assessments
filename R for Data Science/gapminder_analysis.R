library(tidyverse)
library(ggpubr)
library(plotly)

# Read in data as tibble
data = read_csv("gapminder_clean.csv")

# Compare and compute correlation between CO2 emissions and gdpPercap in 1962
gg <- data %>%
  filter(Year == 1962) %>%
  ggplot(aes(x = `CO2 emissions (metric tons per capita)`, y = gdpPercap)) +
  geom_point() +
  stat_cor(method = "pearson") + 
  labs(title="GDP with Respect to CO2 Emissions in Tons (per Capita) 1962")
ggsave("co2_gdp_1962.png",plot=gg)

# Find year with strongest correlation between CO2 emissions and gdpPercap
maxCorrYear <- data %>%
  group_by(Year) %>%
  summarise(emissions_gdp_cor=cor(`CO2 emissions (metric tons per capita)`, gdpPercap, use="complete.obs")) %>%
  slice_max(emissions_gdp_cor) %>%
  select(Year)

# Compare and compute correlation between CO2 emissions and gdpPercap in year of strongest correlation
data %>%
  filter(Year == maxCorrYear[[1]]) %>%
  ggplot(aes(x = `CO2 emissions (metric tons per capita)`, y = gdpPercap)) +
  geom_point(aes(size=pop, color=continent)) +
  stat_cor(method = "pearson") +
  labs(title="GDP with Respect to CO2 Emission in Tons (per Capita) 1967")
p <- ggplotly(gg)
p