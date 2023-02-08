library(tidyverse)
library(magrittr)
mpg1 <- select(mpg,cty, hwy)
mpg2 <- mutate(mpg1, new = cty + hwy)
mpg3 <- filter(mpg2, new > 50)

mpg4 <- filter(
  mutate(
    select(mpg, cty, hwy)
    , new = cty + hwy), new > 50)

mpg5 <- select(mpg, cty, hwy) %>%
  mutate(new = cty + hwy) %>%
  filter(new > 50)

# pipes more than 10 steps.
# multiple inputs or outputs.
# complex dependency structure.

library(magrittr)
c(1:10) %>%
  matrix(ncol = 2) %>%
  plot() %>%
  sum()

c(1:10) %>%
  matrix(ncol = 2) %T>%
  plot() %>% sum()


mpg %$% t.test(cty, hwy)

mpg1 <- mpg
mpg1 <- mpg1 %>% select(cty, hwy)
mpg1 %<>% select(cty, hwy)
