library(ggplot2)
p <- ggplot(mpg[1:50,], aes(displ,cty, color = drv)) + geom_point() + 
  ggtitle("Laoqing's R course")
p + theme_classic()
p + theme_bw()
p + theme_linedraw()
p + theme_light()
p + theme_dark()
p + theme_minimal()
p + theme_classic()
p + theme_void()

install.packages('ggthemes')
library(ggthemes)

p + theme_few()
p + theme_clean()
p + theme_fivethirtyeight()
p + theme_igray()
p + theme_pander()
p + theme_par()
p + theme_economist_white()


# element
# element function
p + theme(plot.title = element_text(size = 10, face = 'bold', colour = 'blue', hjust = 0.5,
                                    margin = margin(t = 10, b = 10)))
p
p + theme(panel.grid.major = element_line(colour = 'green'),
          panel.grid.minor = element_line(color = NA))

p + theme(plot.background = element_rect(fill = 'pink'),
          panel.background = element_rect(fill = 'linen', colour = 'blue',size = 3))

p + theme(panel.background = element_blank(),
          axis.ticks.y = element_line(colour = 'red'))
