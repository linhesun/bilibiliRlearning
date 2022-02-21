library(ggplot2)
library(ggpubr)

df <- data.frame(x = rnorm(2000), y = rnorm(2000))
norm <- ggplot(df, aes(x, y)) + xlab(NULL) + ylab(NULL)

# change the shape
p1 <- norm + geom_point()
p1
p2 <- norm + geom_point(shape = 1)
p3 <- norm + geom_point(shape = '.')

ggarrange(p1,p2,p3,  labels= c('(a)','(b)','(c)'),
          ncol = 3,nrow = 1)

# change the alpha
p1 <- norm + geom_point(alpha = 1/3)
p2 <- norm + geom_point(alpha = 1/5)
p3 <- norm + geom_point(alpha = 1/10)

ggarrange(p1,p2,p3,  labels= c('(a)','(b)','(c)'),
          ncol = 3,nrow = 1)

# bin2d
p1 <- norm + geom_bin2d()
p2 <- norm + geom_bin2d(bins = 10)
ggarrange(p1,p2,  labels= c('(a)','(b)'),
          ncol = 2,nrow = 1)

p3 <- norm + geom_hex()
p4 <- norm + geom_hex(bins = 10)
ggarrange(p1,p2,p3,p4,  labels= c('(a)','(b)','(c)', '(d)'),
          ncol = 2,nrow = 2)
