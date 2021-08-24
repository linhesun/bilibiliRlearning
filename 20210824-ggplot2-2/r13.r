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

