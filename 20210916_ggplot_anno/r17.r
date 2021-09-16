library(ggplot2)
ggplot(economics, aes(date, unemploy)) + geom_line()
presidential <- subset(presidential, start > economics$date[1])

ggplot(economics) +
  geom_rect(aes(xmin = start, xmax = end, fill = party), ymin = -Inf, ymax = Inf, alpha = 0.2, data = presidential) +
  geom_vline(aes(xintercept = as.numeric(start)), data = presidential, colour = 'grey50', alpha = 0.5) +
  geom_text(aes(x = start, y = 2500, label = name), data = presidential, size = 3,
            hjust = 0, vjust = 0, nudge_x = 50) +
  geom_line(aes(date, unemploy)) + 
  scale_fill_manual(values = c('blue', 'red'))

ggplot(diamonds, aes(log10(carat), log10(price))) + 
  geom_bin2d() + facet_wrap(~cut, nrow = 1)
  #geom_point() + facet_wrap(~cut, nrow = 1)

mod_coef <- coef(lm(log10(price)~log10(carat), data = diamonds))

ggplot(diamonds, aes(log10(carat), log10(price))) + 
  geom_bin2d() + facet_wrap(~cut, nrow = 1) +
  geom_abline(intercept = mod_coef[1], slope = mod_coef[2], colour = 'white', size =1)
