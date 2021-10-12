library(ggplot2)
data(Oxboys, package = 'nlme')
ggplot(Oxboys, aes(age, height)) + geom_point() + geom_line()
ggplot(Oxboys, aes(age, height, group = Subject)) +  geom_line() +
  geom_smooth(method = 'lm', se = FALSE)
ggplot(Oxboys, aes(age, height)) +  geom_line(aes(group = Subject)) +
  geom_smooth(method = 'lm', se = FALSE)

ggplot(Oxboys, aes(Occasion, height)) +  geom_boxplot() +
  geom_line(aes(group = Subject),colour = '#3366FF', alpha = 0.5)
