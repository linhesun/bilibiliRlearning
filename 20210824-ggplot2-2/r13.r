library(ggplot2)
install.packages('ggplot2')
mpg

View(mpg)
head(mpg)
structure(mpg)
summary(mpg)
names(mpg)

?`ggplot2-package`
diamonds

(1/mpg$cty)*(3.79/0.0161)

tapply(mpg$model, mpg$manufacturer, unique)

# 数据、图形属性映射、几何对象
ggplot(mpg, aes(displ,hwy)) + geom_point()

cor.test(mpg$displ, mpg$hwy)

ggplot(mpg, aes(model, manufacturer)) + geom_point()

ggplot(mpg, aes(model, manufacturer, label = model)) + geom_text()

ggplot(mpg, aes(cty, hwy)) + geom_point()
ggplot(diamonds, aes(carat, price)) + geom_point()
ggplot(economics, aes(date, unemploy)) + geom_line()
ggplot(mpg, aes(cty)) + geom_histogram()


ggplot(mpg, aes(displ,hwy, colour = class)) + geom_point()

ggplot(mpg, aes(displ,hwy)) + geom_point(colour = 'blue')

ggplot(mpg, aes(displ,hwy, colour = class, size = cyl, shape = drv)) + geom_point()

ggplot(mpg, aes(displ,hwy)) + geom_point() + facet_wrap(~class)

ggplot(mpg, aes(displ,hwy)) + geom_point() + facet_wrap(~hwy)

ggplot(mpg, aes(displ,hwy)) + geom_point() + facet_wrap(~cyl)

?facet_wrap
ggplot(mpg, aes(displ,hwy)) + geom_point() + facet_wrap(~cyl, nrow = 1)
ggplot(mpg, aes(displ,hwy)) + geom_point() + facet_wrap(~cyl, nrow = 1, scales = 'free_x')

#几何对象
# 平滑曲线
ggplot(mpg, aes(displ,hwy)) + geom_point() + geom_smooth(se = FALSE)
ggplot(mpg, aes(displ,hwy)) + geom_point() + geom_smooth(span = .2)
ggplot(mpg, aes(displ,hwy)) + geom_point() + geom_smooth(span = 1)

ggplot(mpg, aes(displ,hwy)) + geom_point() + geom_smooth(method = 'lm')

# 箱线图和扰动点图
ggplot(mpg, aes(drv, hwy)) + geom_point()

ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(mpg, aes(drv, hwy)) + geom_violin()
ggplot(mpg, aes(drv, hwy)) + geom_jitter()
ggplot(mpg, aes(drv, hwy))  + geom_violin() + geom_jitter()

# 直方图和频数多边图
ggplot(mpg, aes(hwy)) + geom_histogram()
ggplot(mpg, aes(hwy)) + geom_freqpoly()
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 2.5)
ggplot(mpg, aes(hwy)) + geom_freqpoly(binwidth = 1)

ggplot(mpg, aes(displ, color = drv)) + geom_freqpoly(binwidth = 0.5)
ggplot(mpg, aes(displ)) + geom_histogram(binwidth = 0.5) + facet_wrap(~drv, ncol = 1)

# 条形图
ggplot(mpg, aes(manufacturer)) + geom_bar()

drug <- data.frame(drug = c('a','b','c'), effect = c(4.2, 9.7, 6.1))
drug
ggplot(drug, aes(drug, effect)) + geom_bar(stat = 'identity')

# 折线图和路径图
View(economics)
ggplot(economics, aes(date, unemploy/pop)) + geom_point() + geom_line(color = 'red')
ggplot(economics, aes(date, uempmed)) + geom_line()

ggplot(economics, aes(unemploy/pop, uempmed))  + geom_path() + geom_point()
economics2 <- economics[(nrow(economics)-100):nrow(economics),]
ggplot(economics2, aes(unemploy/pop, uempmed))  + geom_path() + geom_point() +
  xlim(0,0.06) + ylim(0,25)

year <- function(x) as.POSIXlt(x)$year + 1900
ggplot(economics, aes(unemploy/pop, uempmed))  + 
  geom_path(color = 'grey50') + 
  geom_point(aes(colour = year(date)))

ggplot(mpg, aes(cty, hwy)) + geom_point() + geom_smooth(method = 'lm')

mpg2 <- mpg
mpg2$class <- factor(mpg2$class, 
                     levels = c("compact" ,   "midsize"  ,  "suv"   ,     "2seater"  ,  "minivan"  ,  "pickup"   ,  "subcompact"))
ggplot(mpg2, aes(class, hwy)) + geom_boxplot()

ggplot(mpg, aes(reorder(class,hwy), hwy)) + geom_boxplot()
?reorder
ggplot(mpg, aes(reorder(class,hwy,min), hwy)) + geom_boxplot()

View(diamonds)
ggplot(diamonds, aes(carat)) + geom_histogram()
ggplot(diamonds, aes(carat)) + geom_histogram(binwidth = .1)

ggplot(diamonds, aes(price)) + geom_freqpoly(aes(color = cut)) + xlim(0,2500)

?geom_bar
g <- ggplot(mpg, aes(class)) 
g + geom_bar()
g + geom_bar(aes(weight = displ))

# 坐标轴
ggplot(mpg, aes(cty, hwy)) + geom_point(alpha = 1/3)
ggplot(mpg, aes(cty, hwy)) + geom_point(alpha = 1/3) + xlab('city driving') + ylab('high way driving')
ggplot(mpg, aes(cty, hwy)) + geom_point(alpha = 1/3) + xlab('') + ylab(NULL)

ggplot(mpg, aes(cty, hwy)) + geom_point(alpha = 1/3) + xlab('') + ylab(NULL)+
   xlim(NA,30)

p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) + geom_point()
p
print(p)
summary(p)
p + geom_smooth(method = 'lm')

ggsave('p.png', p, width = 5, height = 5)
