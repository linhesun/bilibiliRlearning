library(ggplot2)
p <- ggplot(mpg,aes(trans, cty)) + geom_boxplot()
print(p)

# stat_summary
p + stat_summary(geom = 'point', fun = 'mean', color = 'red', size = 4)

p + geom_point(stat = 'summary' , fun = 'mean', color = 'blue', size = 4)

# the use of '..'
?stat_density
ggplot(diamonds, aes(price)) + geom_histogram(binwidth = 500)
ggplot(diamonds, aes(price)) + geom_histogram(aes(y = ..density..), binwidth = 500)

ggplot(diamonds, aes(price, color = cut)) + geom_freqpoly(binwidth = 500)
ggplot(diamonds, aes(price, color = cut)) + geom_freqpoly(aes(y = ..density..), binwidth = 500)

#stat_sum
d <- ggplot(diamonds, aes(x = cut, y = clarity))
d + geom_point()
d + geom_point(stat = 'sum')
d + geom_point(stat = 'sum', aes(color = ..n..), size = 6)
