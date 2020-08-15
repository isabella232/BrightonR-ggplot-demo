library(tidytuesdayR)
library(dplyr)
library(ggplot2)

beer <- tt_load(2020, week = 14)

beer_states <- beer$beer_states %>%
  filter(!is.na(barrels), barrels != 0)

beer_states <- beer_states %>%
  filter(state != "total")

df <- data.frame(
  x = 10, 
  y = 100,
  type = "On Premises",
  label = "An increase in recent years"
)

ggplot(data = beer_states,
       mapping = aes(x = factor(year),
                     y = barrels)) +
  geom_boxplot(fill = "orange") +
  labs(x = "Year",
       y = "Beer production (# of barrels)",
      title = "Beer produced in each state, split by type and year") +
  scale_y_log10(labels = scales::comma) +
  facet_grid(rows = vars(type)) +
  geom_text(mapping = aes(x = x, y = y, label = label),
            data = df,
            size = 3) +
  theme_minimal()

# GitHub:
#   MangoTheCat/BrightonR-ggplot-demo
# 
# jtalboys@mango-solutions.com
  

