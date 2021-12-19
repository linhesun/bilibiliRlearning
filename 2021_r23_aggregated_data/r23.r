library(ggplot2)
library(ggpubr)
View(midwest)
p1 <- ggplot(midwest,aes(percwhite, percbelowpoverty)) + 
  geom_point()
p1
p2 <- ggplot(midwest,aes(percwhite, percbelowpoverty)) + 
  geom_point(aes(size = poptotal / 1e6)) + 
  scale_size_area("Population\n(millions)", breaks = c(0.5, 1, 2, 4))
p2
ggarrange(p1,p2, labels = c('a','b'),
          ncol = 2, nrow = 1)

p1 <- ggplot(midwest,aes(percwhite, percbelowpoverty)) + 
  geom_point() + 
  geom_smooth(method = lm, size = 1)
p1
p2 <- ggplot(midwest,aes(percwhite, percbelowpoverty)) + 
  geom_point(aes(size = poptotal / 1e6)) + 
  geom_smooth(aes(weight = poptotal),method = lm, size = 1) +
  scale_size_area(guide = 'none')
p2
ggarrange(p1,p2, labels = c('a','b'),
          ncol = 2, nrow = 1)

p1 <- ggplot(midwest, aes(percbelowpoverty)) +
  geom_histogram(binwidth = 1) + ylab('Counties')
p1
p2 <- ggplot(midwest, aes(percbelowpoverty)) +
  geom_histogram(aes(weight = poptotal),binwidth = 1) + 
  ylab('Population(1000s)')
p2
ggarrange(p1,p2, labels = c('a','b'),
          ncol = 2, nrow = 1)
