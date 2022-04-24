library(tidyverse)

ggplot(mpg,aes(cty, hwy)) + geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  theme_bw() 

library(ggpmisc)

ggplot(mpg,aes(cty, hwy)) + geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  theme_bw() + 
  stat_poly_eq(aes(label = paste(..eq.label.., ..adj.rr.label.., ..p.value.label.., sep = '*\", \"*')), 
               formula = y ~ x, parse = T, label.y = "top", label.x = "left")

ggplot(mpg,aes(cty, hwy, color = drv)) + geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  theme_bw() + 
  stat_poly_eq(aes(label = paste(..eq.label.., ..adj.rr.label.., ..p.value.label.., sep = '*\", \"*')), 
               formula = y ~ x, parse = T, label.y = "bottom", label.x = "right")

ggplot(mpg,aes(cty, hwy)) + geom_point() +
  stat_poly_line(formula = y ~ x, se = FALSE) +
  theme_bw() + 
  stat_poly_eq(aes(label = paste(..eq.label..,'\", \"' , ..adj.rr.label..,'\", \"*italic(P)~`=`~\" \"', ..p.value.., sep = '*\" \"*')),
               formula = y ~ x, parse = T, label.y = 'bottom', label.x = 'right')



form <- y ~ x + I(x^2)
ggplot(mpg,aes(cty, hwy)) + geom_point() +
  stat_poly_line(formula = form, se = FALSE) +
  theme_bw() + 
  stat_poly_eq(aes(label = paste(..eq.label.., ..adj.rr.label.., ..p.value.label.., sep = '*\", \"*')), 
               formula = form, parse = T, label.y = "top", label.x = "left")

