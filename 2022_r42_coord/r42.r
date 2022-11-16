library(ggplot2)
library(ggpubr)

base <- ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth()
base

p1 <- base + xlim(4,7)
p2 <- base + coord_cartesian(xlim = c(4,7))

ggarrange(p1,p2)



base2 <- ggplot(mpg, aes(hwy, displ)) + geom_point() + geom_smooth()
p3 <- base + coord_flip()

ggarrange(base, base2, p3, nrow=1)

base3 <- base + coord_fixed()
ggarrange(base, base3)

ggplot(mpg, aes(model)) + geom_bar(aes(fill = manufacturer)) + 
  coord_polar('x') + 
  geom_text(data = data.frame(model = unique(mpg$model), y = 20),aes(x = model,y = y,label = model)) +
  theme_void()   + ylim(-10, 20)

