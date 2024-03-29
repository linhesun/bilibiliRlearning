
# https://datav.aliyun.com/tools/atlas/index.html
install.packages('rgdal')
install.packages('mapproj')
library(rgdal)
library(ggplot2)
map1 <- readOGR(dsn = "china.geojason", stringsAsFactors = FALSE)
Encoding(map1@data$name) <- "UTF-8"
map2 <- fortify(map1)

ggplot(map2) + 
  geom_polygon(aes(long, lat, group = group, fill = id), colour = 'white',
               show.legend = F)


predat <- data.frame(id = 0:34,
                     val = runif(35,0,1),
                     pro = map1@data$name)
ind <- match(map2$id, predat$id)
map2$val <- predat$val[ind]
map2$pro <- predat$pro[ind]

ggplot(map2) + 
  geom_polygon(aes(long, lat, group = group, fill = pro), colour = NA) +
  coord_map(projection = "azequidistant") +
  theme(text = element_text(family='Kai'))

ggplot(map2) + 
  geom_polygon(aes(long, lat, group = group, fill = val), colour = NA) +
  coord_map(projection = "azequidistant") +
  scale_fill_gradientn(colours = rainbow(10)) +
  theme_bw()
