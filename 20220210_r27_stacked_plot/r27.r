install.packages('alluvial')
install.packages('ggalluvial')
install.packages('ggpubr')
install.packages('ggplot2')
library(ggalluvial)
library(alluvial)
library(ggplot2)
data(Refugees, package = "alluvial")


p1 <- ggplot(data = Refugees,
       aes(x = year, y = refugees, alluvium = country)) +
  geom_alluvium(aes(fill = country, colour = country),
                alpha = .3, width = 0.5) +
  scale_x_continuous(breaks = seq(2003, 2013, 1),expand=c(0,0)) +
  theme_bw() + 
  theme(axis.text.x = element_text(angle = -30, hjust = 0),
        panel.grid.major = element_line(colour = NA)) +
  scale_fill_brewer(type = "qual", palette = "Set3") +
  scale_color_brewer(type = "qual", palette = "Set3") +
  geom_bar(stat = "identity", aes(fill = country), width=0.5) +
  scale_y_continuous(expand=c(0,0)) 
p1

perc <- NULL
for(i in min(Refugees$year):max(Refugees$year)){
  op <- Refugees$refugees[Refugees$year == i]/sum(Refugees$refugees[Refugees$year == i])
  perc <- c(perc, op)
}
Refugees$percent <- perc

p2 <- ggplot(data = Refugees,
       aes(x = year, y = percent, alluvium = country)) +
  geom_alluvium(aes(fill = country, colour = country),
                alpha = .3, width = 0.5) +
  scale_x_continuous(breaks = seq(2003, 2013, 1),expand=c(0,0)) +
  theme_bw() + 
  theme(axis.text.x = element_text(angle = -30, hjust = 0),
        panel.grid.major = element_line(colour = NA)) +
  scale_fill_brewer(type = "qual", palette = "Set3") +
  scale_color_brewer(type = "qual", palette = "Set3") +
  geom_bar(stat = "identity", aes(fill = country), width=0.5) +
  scale_y_continuous(expand=c(0,0))
p2

library(ggpubr)
ggarrange(p1,p2,  labels= c('(a)','(b)'),
          ncol = 2,nrow = 1)
