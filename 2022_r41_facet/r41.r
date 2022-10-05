library(ggplot2)
base <- ggplot(mpg, aes(displ, hwy)) +geom_point(aes(colour = class)) + xlab(NULL) + ylab(NULL)

base + facet_wrap(~ class)

base + facet_wrap(~class, ncol = 4)
base + facet_wrap(~class, nrow = 4)

base + facet_grid(. ~ cyl)
base + facet_grid(drv ~ .)
base + facet_grid(drv ~ cyl) 
mpg2 <- mpg[,c(3,9)]
ggplot(mpg, aes(displ, hwy)) +
  xlab(NULL) + ylab(NULL) +
  facet_grid(drv ~ cyl) + 
  geom_point(data = mpg2, aes(x = displ, y = hwy), color = 'grey', alpha = 0.3) + 
  geom_point(aes(colour = class)) +
  theme_bw()

base + geom_abline(intercept = 20)+ facet_wrap(~drv)
base + geom_abline(intercept = 20)+ facet_wrap(~drv, scales = 'free')

base + facet_grid(drv ~ .,scales = 'free', space = 'free') 
