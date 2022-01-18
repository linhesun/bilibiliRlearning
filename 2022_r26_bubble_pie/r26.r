# Y叔教程： https://guangchuangyu.github.io/2016/12/scatterpie-for-plotting-pies-on-ggplot/

library(ggplot2)
library(scatterpie)
library(rgdal)

map1 <- readOGR(dsn = "china.geojason", stringsAsFactors = FALSE)
Encoding(map1@data$name) <- "UTF-8"
map2 <- fortify(map1)

p <- ggplot(map2) + 
  geom_polygon(aes(long, lat, group = group),fill = NA, colour = 'grey',
               show.legend = F)+
  coord_quickmap() +
  theme_bw()  + theme(panel.grid.major = element_line(colour = NA), panel.grid.minor = element_blank())

set.seed(123)
long = c(120, 102, 115, 128)
lat = c(32, 30, 24, 46)
d <- data.frame(long=long, lat=lat)
n <- nrow(d)
d$region <- factor(1:n)
d$A <- abs(rnorm(n, sd=1))
d$B <- abs(rnorm(n, sd=2))
d$C <- abs(rnorm(n, sd=3))
d$D <- abs(rnorm(n, sd=4))
d$radius <- 1:4
head(d)
p + geom_scatterpie(aes(x=long, y=lat, group=region, r=radius),
                    data=d, cols=LETTERS[1:4], color=NA, alpha=.8) +
  geom_scatterpie_legend(d$radius, x=80, y=10)
  
