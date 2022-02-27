library(ggplot2)
ggplot(mpg,aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth() + 
  facet_wrap(~year)


p <- ggplot(mpg, aes(displ, hwy))
p + geom_point(aes(colour = class))
p + layer(mapping = aes(colour = class), data = NULL, geom = 'point', 
          stat = 'identity', position = 'identity')
