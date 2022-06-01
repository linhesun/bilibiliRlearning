library(ggplot2)
p <- ggplot(diamonds, aes(color, fill = cut)) 
p + geom_bar(position = 'stack')
p + geom_bar(position = 'fill')
p + geom_bar(position = 'dodge')

p + geom_bar(position = 'identity')
p + geom_bar(position = 'identity', alpha = 0.3, color = 'grey50')
p + geom_line(aes(color = cut, group = cut), stat = 'count')


q <- ggplot(mpg, aes(displ, hwy))
q + geom_point() + xlim(0,8)
q + geom_point(position = position_nudge(x = 1))+ xlim(0,8)
q + geom_point(position = 'jitter')
q + geom_point(position = position_jitter(width = 0.05, height = 0.5))
