library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3, z = c('a', 'b', 'c'))
ggplot(df, aes(x,y)) + geom_point(size = 4, colour = 'grey20') +
  geom_point(aes(colour = z), size =2)
ggplot(df, aes(x,y)) + geom_point(size = 4, colour = 'grey20', show.legend = TRUE) +
  geom_point(aes(colour = z), size =2)

norm <- data.frame(x = rnorm(1000), y = rnorm(1000))
norm$z <- cut(norm$x, 3, labels = c('a', 'b', 'c'))
ggplot(norm, aes(x,y)) + geom_point(aes(color = z), alpha = 0.1)
ggplot(norm, aes(x,y)) + geom_point(aes(color = z), alpha = 0.1) +
  guides(colour = guide_legend(override.aes = list(alpha = 1)))

df <- data.frame(x=1, y = 1:3, z =c('a','b','c'))
ggplot(df, aes(x,y)) + geom_point(aes(colour = z))
ggplot(df, aes(x,y)) + geom_point(aes(shape = z))
ggplot(df, aes(x,y)) + geom_point(aes(colour = z))
ggplot(df, aes(x,y)) + geom_point(aes(shape = z, colour = z))

df <- data.frame(x = 1:3, y = 1:3, z = c('a', 'b', 'c'))
base <- ggplot(df, aes(x,y)) + geom_point(aes(colour = z), size =3) +
  xlab(NULL) + ylab(NULL)
base
base + theme(legend.position = 'right', legend.direction = 'horizontal')
base + theme(legend.position = 'left')
base + theme(legend.position = 'top')
base + theme(legend.position = 'bottom')
base + theme(legend.position = 'none')

base + theme(legend.position = c(0.1,0.9), legend.justification = c(0.1,0.9))
base + theme(legend.position = c(0.5,0.5), legend.justification = c(0.5,0.5))

df <- data.frame(x=1, y = 1:3, z =1:3)
base <- ggplot(df, aes(x,y)) + geom_raster(aes(fill = z))
base
base +scale_fill_continuous(guide = guide_legend())
base + guides(fill = guide_legend())

df <- data.frame(x =1, y = 1:4, z = letters[1:4])
p <- ggplot(df, aes(x,y)) + geom_raster(aes(fill =z))
p
p+ guides(fill = guide_legend(ncol = 2))
p+ guides(fill = guide_legend(ncol = 2, byrow = TRUE))

p <- ggplot(df, aes(1,y)) + geom_bar(stat  = 'identity', aes(fill =z))
p + guides(fill = guide_legend(reverse = TRUE))


df <- data.frame(x=1, y =1:4, z=4:1)
p <- ggplot(df, aes(x,y)) + geom_tile(aes(fill =z))
p
p + guides(fill = guide_colorbar(reverse = TRUE))
p + guides(fill = guide_colorbar(barwidth = unit(1, 'cm')))
