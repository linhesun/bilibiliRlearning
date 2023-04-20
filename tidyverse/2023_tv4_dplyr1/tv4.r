library(tidyverse)
library(dplyr)
mpg
# filter
filter(mpg, manufacturer == 'audi', displ == 2)
filter(mpg, manufacturer == 'audi', hwy > 25)
filter(mpg, cty < 12 |  hwy > 28)

# arrange
dat <- arrange(mpg, year, hwy)
dat <- arrange(mpg, desc(year), hwy)
p1 <- ggplot(mpg, aes(cty, hwy)) + geom_point(aes(color = drv))
p2 <- ggplot(dat, aes(cty, hwy)) + geom_point(aes(color = drv))
library(ggpubr)
ggarrange(p1,p2)

# select
select(mpg, 1,2, year:trans)
select(mpg, -(year:trans))
select(mpg, year:trans, everything())

# mutate
mutate(mpg, new = cty + hwy) %>%
  select(new, everything()) %>%
  arrange(new)

mutate(mpg, new = log2(cty))

# summarise
summarise(mpg, cty = mean(cty))
group_by(mpg, manufacturer) %>%
  summarise(mean = mean(cty), sd = sd(cty))

group_by(mpg, manufacturer, year) %>%
  summarise(mean = mean(cty), sd = sd(cty)) %>%
  ggplot(aes(manufacturer, mean,fill = factor(year))) + 
  geom_col( position = 'dodge') +
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), 
                position = position_dodge(width = 0.9), color = 'gray30') +
  theme(axis.text.x.bottom = element_text(angle = 90,hjust = 1, vjust = 0.5))

