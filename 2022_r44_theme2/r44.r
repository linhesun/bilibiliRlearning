library(ggplot2)
p <- ggplot(mpg,aes(cty,hwy)) + geom_point(aes(color =drv)) + ggtitle("Laoqing's R course") 
p
# plot
# plot.background
p + theme(plot.background = element_rect(fill = 'pink', colour = 'green', size = 5))
# plot.title
p + theme(plot.title = element_text(color = 'blue', size = 20))
# plot.margin
p + theme(plot.background = element_rect(fill = 'pink', colour = 'green', size = 5), 
          plot.margin = margin(100,100,100,100))

# axis
# axis.line
p + theme_bw() + scale_x_continuous(sec.axis = sec_axis(~., name = 'Add')) +
  theme(axis.line.x.top  = element_line(color = 'red'))
# axis.text
p + theme(axis.text = element_text(size = 18))
# axis.title
p + theme(axis.title = element_text(size = 18))
# axis.ticks
p + theme(axis.ticks = element_line(size = 3, color = 'blue'))
# axis.ticks.length
p + theme(axis.ticks.length = unit(1, 'cm'))

# legend
# legend.background
p + theme(legend.background = element_rect(fill = 'pink'))
# legend.key
p + theme(legend.key = element_rect(fill = 'pink'))
# legend.margin
p + theme(legend.margin = margin(20,20,20,20))
# legend.text
p + theme(legend.text = element_text(color = 'green'))
# legend.title
p + theme(legend.title = element_text(color = 'green'))


# panel

# panel.background
p + theme(panel.background = element_rect(fill = 'pink'))
# panel.border
p + theme(panel.border  = element_rect(fill = 'pink'))
# panel.grid
p + theme(panel.)
# aspect.ratio
p + theme(aspect.ratio = 1)

# facet
# strip.background
p1 <- p + facet_wrap(~drv)
p1 + theme(strip.background = element_rect(fill = 'pink'))
# strip.text
p1 + theme(strip.text = element_text(size = 28))
# panel.spacing
p1 + theme(panel.spacing = unit(1, 'cm'))
