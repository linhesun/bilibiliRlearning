library(ggplot2)
library(ggpubr)

y <- c(18,11,16)
df <- data.frame(x = 1:3, y = y, se = c(1.2,0.5,1.0))
base <- ggplot(df, aes(x,y, ymin = y-se, ymax = y+se))

# 展示区间和中间值
p1 <- base + geom_crossbar()
p2 <- base + geom_pointrange()
p3 <- base + geom_smooth(stat = 'identity')
ggarrange(p1,p2,p3,  labels= c('(a)','(b)', '(c)'),
          ncol = 3,nrow = 1)
# 仅展示区间
p4 <- base + geom_errorbar()
p5 <- base + geom_linerange()
p6 <- base + geom_ribbon()
ggarrange(p4,p5,p6, labels= c('(a)','(b)', '(c)'),
        ncol = 3,nrow = 1)
