library(ggplot2)
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class))
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_continuous() + scale_y_continuous() + scale_color_discrete()

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_continuous('this is x') + scale_y_continuous('this is y') + scale_color_discrete()

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_continuous('this is x') + 
  scale_x_continuous('this is not y') + scale_color_discrete()

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = class)) +
  scale_x_sqrt() + scale_color_brewer(palette = "Set3")

df <- data.frame(x = 1:2, y =1, z ='a')
p <- ggplot(df, aes(x,y)) + geom_point(aes(colour = z))
p + scale_x_continuous('X axis')
p + scale_x_continuous(quote(a + x ^ y))
p + labs(x = 'X axis', y = "Y axis", color = 'Colour\nlegend')


p + labs(x ='', y ='')
p + labs(x = NULL, y= NULL)

# breaks labels
df <- data.frame(x =c(1000, 3000, 5000), y = 1)
axs <- ggplot(df, aes(x,y)) + geom_point() +
  labs(x = NULL, y = NULL)
axs
axs + scale_x_continuous(breaks = c(2000, 4000))
axs + scale_x_continuous(breaks = c(2000, 4000), labels = c('2k', '4k'))

leg <- ggplot(df, aes(y,x,fill =x)) + geom_tile() + labs(x = NULL, y = NULL, fill = NULL)
leg
leg + scale_fill_continuous(breaks = c(2000, 4000))
leg + scale_fill_continuous(breaks = c(2000, 4000), labels = c('2k', '4k'))

df2 <- data.frame(x =1:3, y = c('a', 'b', 'c'))
p <- ggplot(df2, aes(x,y)) + geom_point()
p + scale_y_discrete(labels = c(a='apple', b='banana', c='cherry'))


axs + scale_x_continuous(breaks = NULL)
axs + scale_x_continuous(labels = NULL)

leg + scale_fill_continuous(breaks = NULL)
leg + scale_fill_continuous(labels = NULL)

axs + scale_x_continuous(labels = scales::comma_format())
axs + scale_x_continuous(labels = scales::unit_format(unit = 'k', scale = 1e-3))
