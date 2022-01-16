library(ggplot2)
ggplot(diamonds, aes(depth)) + geom_histogram()
ggplot(diamonds, aes(depth)) + geom_histogram(binwidth = 0.1) + xlim(55,70)

ggplot(diamonds, aes(depth)) + geom_histogram() + facet_wrap(~color)
ggplot(diamonds, aes(depth)) + geom_freqpoly()

ggplot(diamonds, aes(depth)) + 
  geom_freqpoly(aes(colour = cut), binwidth = .1, na.rm = TRUE) +
  xlim(58,68) +
  theme(legend.position = 'none')

ggplot(diamonds, aes(depth)) + 
  geom_histogram(aes(fill = cut), binwidth = .1, position = 'fill', na.rm = TRUE) +
  xlim(58,68) +
  theme(legend.position = 'none')

ggplot(diamonds, aes(depth)) + 
  geom_density(na.rm = TRUE) + 
  xlim(58,68) +
  theme(legend.position = 'none')

ggplot(diamonds, aes(depth, fill = cut, colour = cut)) + 
  geom_density(alpha = 0.2, na.rm = TRUE) +
  xlim(58,68) +
  theme(legend.position = 'none')

ggplot(diamonds, aes(clarity, depth)) + geom_boxplot()
ggplot(diamonds, aes(carat, depth)) + 
  geom_boxplot(aes(group = cut_width(carat, 0.1))) +
  xlim(NA, 2.05)

ggplot(diamonds, aes(clarity, depth)) + geom_violin()
ggplot(diamonds, aes(carat, depth)) + 
  geom_violin(aes(group = cut_width(carat, 0.1))) +
  xlim(NA, 2.05)

ggplot(diamonds, aes(carat))+ geom_histogram()
ggplot(diamonds, aes(carat)) + geom_histogram(binwidth = 0.1)
ggplot(diamonds, aes(price))+ geom_histogram()

ggplot(diamonds, aes(carat, fill = clarity, colour = clarity)) + 
  geom_density(alpha = 0.2, na.rm = TRUE) +
  xlim(1,3) +
  theme(legend.position = 'none')

ggplot(diamonds, aes(depth)) +   geom_density() 
ggplot(diamonds, aes(depth)) +   geom_freqpoly() 
