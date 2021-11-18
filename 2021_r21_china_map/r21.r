# url for map_data download: https://datav.aliyun.com/tools/atlas/index.html
install.packages('rgdal')
install.packages('mapproj')
library(rgdal)
library(ggplot2)
china1 <- readOGR(dsn = "china.geojason", stringsAsFactors = FALSE)
Encoding(china1@data$name) <- "UTF-8"
china2 <- fortify(china1)

ggplot(china2) + 
  geom_polygon(aes(long, lat, group = group, fill = id), colour = 'white',
               show.legend = F)


predat <- data.frame(id = 0:34,
                     val = runif(35,0,1),
                     pro = china1@data$name)
ind <- match(china2$id, predat$id)
china2$val <- predat$val[ind]
china2$pro <- predat$pro[ind]

ggplot(china2) + 
  geom_polygon(aes(long, lat, group = group, fill = pro), colour = NA) +
  coord_map(projection = "azequidistant") +
  theme(text = element_text(family='Kai'))

ggplot(china2) + 
  geom_polygon(aes(long, lat, group = group, fill = val), colour = NA) +
  coord_map(projection = "azequidistant") +
  scale_fill_gradientn(colours = rainbow(10)) +
  theme_bw()
