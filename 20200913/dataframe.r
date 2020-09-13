dat <- read.table('dataframe.txt', header = TRUE, sep = '\t')
dat$control <- factor(dat$control, levels = c('H', 'M', 'L'))
dat[dat$control == 'H', ]
tapply(dat$dent, dat$sample, mean)
library(ggplot2)
ggplot(data = dat, aes(x = date, y = dent, colour = sample, shape = sample)) + 
  geom_point() + geom_line() +
  facet_wrap(~control) +
  geom_errorbar(aes(ymin = dent - sd, ymax = dent + sd), width = 0.2)
