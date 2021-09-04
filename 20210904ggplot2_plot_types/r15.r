# 基本图形类型
library(ggplot2)
df <- data.frame(x=c(3,1,5),y=c(2,4,6),label=c('a','b','c'))
p <- ggplot(df,aes(x,y, label = label)) + labs(x=NULL,y=NULL)
p

# 点图
p + geom_point() + ggtitle('point')
# 文本
p + geom_text() + ggtitle('text')
# 柱状图
p + geom_bar(stat = 'identity') + ggtitle('bar')
p + geom_col() + ggtitle('bar')

# 矩形
p + geom_tile() + ggtitle('tile')

# 线条
p + geom_line() + ggtitle('line')

# 面积
p + geom_area() + ggtitle('area')

# 路径
p + geom_path() + ggtitle('path')

# 多边形
p + geom_polygon() + ggtitle('polygon')

install.packages('ggpubr')
library(ggpubr)
p1<-p + geom_line() + ggtitle('      line')
p2<-p + geom_area() + ggtitle('      area')
p3<-p + geom_path() + ggtitle('      path')
p4<-p + geom_polygon() + ggtitle('      polygon')

ggarrange(p1,p2,p3,p4,  labels= c('(a)','(b)', '(c)','(d)'),
          ncol = 2,nrow = 2)
