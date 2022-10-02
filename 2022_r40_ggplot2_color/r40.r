library(ggplot2)
# continuous
erupt <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster() + 
  scale_x_continuous(NULL, expand = c(0,0)) + scale_y_continuous(NULL, expand = c(0,0))
erupt
erupt + scale_fill_gradient(low = 'white', high = 'black')
mid <- median(faithfuld$density)
erupt + scale_fill_gradient2(midpoint = mid)
erupt + scale_fill_gradientn(breaks = c(0, 0.01, 0.02, 0.03, 0.04), colours = c('white', 'green', 'yellow', 'blue', 'red'))
erupt + scale_fill_gradientn(colours = rainbow(7))
erupt + scale_fill_distiller(palette = 'Set1')

df <- data.frame(x =1, y = 1:5, z = c(1,3,2,NA,5))
p <- ggplot(df, aes(x,y)) + geom_tile(aes(fill = z))
p
p + scale_fill_gradient(na.value = NA)
p + scale_fill_gradient(low = 'black', high = 'white', 
                        na.value = 'red')

# discrete
df <- data.frame(x = letters[1:4], y = c(3,4,1,2))
bars <- ggplot(df, aes(x,y, fill = x)) +
  geom_bar(stat = 'identity') + labs(x = NULL, y = NULL) +
  theme(legend.position = 'none')
bars
bars + scale_fill_brewer(palette = 'Accent')
bars + scale_fill_grey()
bars + scale_fill_manual(values = c(a='red', b = 'green', c='yellow', d='blue'))
bars + scale_fill_manual(values= rainbow(4))

