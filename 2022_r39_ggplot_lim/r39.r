library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x,y)) + geom_point(size = 4)
base
base + scale_x_continuous(limits = c(1.5, 2.5))
base + scale_x_continuous(limits = c(0,4))

base + xlim(0,4)
base + xlim(4,0)
base + lims(x = c(0,4))

ggplot(faithfuld, aes(waiting, eruptions)) + geom_raster(aes(fill = density)) +
  theme(legend.position = 'none')
ggplot(faithfuld, aes(waiting, eruptions)) + geom_raster(aes(fill = density)) +
  theme(legend.position = 'none') +
  scale_x_continuous(expand = c(0,0)) + scale_y_continuous(expand = c(0,0))

ggplot(mpg, aes(x = drv)) + geom_bar()
ggplot(mpg, aes(x = drv)) + geom_bar() + ylim(10,200)
ggplot(mpg, aes(x = drv)) + geom_bar() +
  coord_cartesian(ylim = c(10,200))

ggplot(mpg, aes(displ, hwy)) + geom_point() +
  scale_y_continuous(trans = 'reciprocal')
ggplot(diamonds, aes(price, carat)) +
  geom_bin2d() + 
  scale_x_continuous(trans = 'log10') +
  scale_y_continuous(trans = 'log10')

base <- ggplot(economics, aes(date, psavert)) +
  geom_line(na.rm = TRUE) + labs(x = NULL, y = NULL)
base
base + scale_x_date(date_labels = '%y', date_breaks = '5 years')
base + scale_x_date(
  limits = as.Date(c('2004-01-01', '2005-01-01')), 
  date_labels = '%b %y', date_minor_breaks = '1 month'
)
Sys.setlocale("LC_TIME", "English")
base + scale_x_date(
  limits = as.Date(c('2004-01-01', '2005-01-01')), 
  date_labels = '%b %y', date_minor_breaks = '1 month'
)

base + scale_x_date(
  limits = as.Date(c('2004-01-01', '2005-01-01')), 
  date_labels = '%m/%d', date_minor_breaks = '2 weeks'
)
