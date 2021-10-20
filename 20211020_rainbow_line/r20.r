library(ggplot2)
df <- data.frame(x = 1:3, y = 1:3, colour = c(1,3,5))
ggplot(df, aes(x,y, colour = factor(colour))) + 
  geom_line(aes(group = 1),size = 2) + geom_point(size = 5)
ggplot(df, aes(x,y, colour = colour)) +
  geom_line(aes(group = 1), size = 2) + geom_point(size = 5)

xgrid <- seq(min(df$x), max(df$x), length = 50)
interp <- data.frame(x = xgrid,
                     y = approx(df$x, df$y, xout = xgrid)$y,
                     colour = approx(df$x, df$colour, xout = xgrid)$y)
ggplot(interp, aes(x, y, colour = colour)) +
  geom_line(size = 2) + geom_point(data = df, aes(x,y), size =5) +
  scale_colour_gradientn(colours = rainbow(10))
