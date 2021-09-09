library(ggplot2)
df <- data.frame(x =1, y = 3:1, family = c('sans', 'serif','mono'))
ggplot(df, aes(x,y)) + geom_text(aes(label = family, family = family), size = 15)

df <- data.frame(x =1, y = 3:1, face = c('plain', 'bold','italic'))
ggplot(df, aes(x,y)) + geom_text(aes(label = face, fontface = face), size = 15)

df <- data.frame(x = c(1,2,1,2,1.5), y = c(1,1,2,2,1.5),
                 text = c('bottom-left', 'bottom-right', 'top-left',
                          'top-right', 'center'))
ggplot(df, aes(x,y)) + geom_point(size = 100)
ggplot(df, aes(x,y)) + geom_text(aes(label = text), size = 10)
ggplot(df, aes(x,y)) + geom_text(aes(label = text), size = 10, vjust = 'inward', hjust = 'inward')

label <- data.frame(waiting = c(55,80), eruptions = c(2,4.3), label = c('peak one', 'peak two'))
ggplot(faithfuld, aes(waiting, eruptions)) + geom_tile(aes(fill = density)) +
  #geom_text(data = label, aes(label = label))
  geom_label(data = label, aes(label = label))

ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()

install.packages('directlabels')
library(directlabels)
ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point(show.legend = FALSE) +
  geom_dl(data=mpg, aes(label = class), method = 'smart.grid')
