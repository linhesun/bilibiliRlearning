library(ggplot2)
ggplot(mpg, aes(displ,hwy, colour = class)) +
  geom_point()
ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour = class))
ggplot(mpg, aes(displ)) +
  geom_point(aes(y = hwy, colour = class))
ggplot(mpg) +
  geom_point(aes(displ,hwy, colour = class))
ggplot() +
  geom_point(data = mpg,aes(displ,hwy, colour = class))

ggplot(mpg, aes(displ,hwy, colour = class)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  theme(legend.position = 'none')
ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(method = 'lm', se = FALSE) +
  theme(legend.position = 'none')


ggplot(mpg, aes(cty, hwy)) +
  geom_point(colour = 'darkblue')
ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(colour = 'darkblue'))


ggplot(mpg, aes(cty, hwy)) +
  geom_point(aes(colour = 'darkblue')) +
  scale_colour_identity()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(colour = 'loess'),
              method = 'loess', se = FALSE) +
  geom_smooth(aes(colour = 'lm'),
              method = 'lm', se = FALSE)

