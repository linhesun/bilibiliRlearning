if (!require('vegan')) install.packages('vegan')
if (!require('ggplot2')) install.packages('ggplot2')
library(vegan)
library(ggplot2)

otu_table <- read.table('OTU.txt', header = TRUE, sep = '\t')
otu_matrix <- otu_table[, 2:(ncol(otu_table)-1)]
row.names(otu_matrix) <- otu_table$OTU
otu_matrix <- t(otu_matrix)

envdat_raw <- read.table('envi.txt', sep = '\t', header = TRUE, row.names = 1)
envdat <- envdat_raw[match(row.names(otu_matrix), row.names(envdat_raw)),]

print(rownames(envdat) == rownames(otu_matrix))

decorana(otu_matrix)

res <- rda(otu_matrix ~ ., envdat)
plot(res)

xxxx <- summary(res)
aa <- xxxx$concont$importance
aa <- round(aa, 4)

pdat <- res$CCA
samples<-data.frame(sample = row.names(pdat$u),RDA1 = pdat$u[,1],RDA2 = pdat$u[,2])
species<-data.frame(spece = row.names(pdat$v),RDA1 = pdat$v[,1],RDA2 = pdat$v[,2])
envi<-data.frame(en = row.names(pdat$biplot),RDA1 = pdat$biplot[,1],RDA2 = pdat$biplot[,2])

samples$season <- as.factor(envdat_raw$season)
samples$foreststructure <- as.factor(envdat_raw$foreststructure)

p <- ggplot() + 
  geom_hline(aes(yintercept = 0), colour="gray88", linetype="dashed") + 
  geom_vline(aes(xintercept = 0), colour="gray88", linetype="dashed")  +
  
  geom_point(data = species, aes(x=RDA1, y=RDA2),size = 0.5, colour = 'pink', pch = 3) +
  geom_segment(data = species,aes(x=0, xend= RDA1, y=0, yend= RDA2 ), arrow = arrow(length = unit(0.3, "cm")), colour = 'blue') +
  geom_text(data = species,aes(x = RDA1*1.1, y = RDA2*1.1, label = spece), size = 3, colour = 'blue') +
  
  geom_segment(data = envi,aes(x=0, xend= RDA1, y=0, yend= RDA2 ), arrow = arrow(length = unit(0.3, "cm")), colour = 'red') +
  geom_text(data = envi,aes(x = RDA1*1.1, y = RDA2*1.1, label = en), size = 3, colour = 'red', check_overlap = TRUE) +
  
  geom_point(data = samples, aes(x=RDA1, y=RDA2, colour = season, shape = foreststructure),size = 3)  +
  theme_bw() + theme(panel.grid.major=element_line(colour=NA), panel.grid.minor = element_blank()) + 
  
  xlab(paste('RDA1 (', aa[2,1]*100, '%)', sep ='')) + ylab(paste('RDA2 (', aa[2,2]*100, '%)', sep ='')) 
  
print(p)


res <- cca(otu_matrix ~ ., envdat)
plot(res)

xxxx <- summary(res)
aa <- xxxx$concont$importance
aa <- round(aa, 4)

pdat <- res$CCA
samples<-data.frame(sample = row.names(pdat$u),CCA1 = pdat$u[,1],CCA2 = pdat$u[,2])
species<-data.frame(spece = row.names(pdat$v),CCA1 = pdat$v[,1],CCA2 = pdat$v[,2])
envi<-data.frame(en = row.names(pdat$biplot),CCA1 = pdat$biplot[,1],CCA2 = pdat$biplot[,2])

samples$season <- as.factor(envdat_raw$season)
samples$foreststructure <- as.factor(envdat_raw$foreststructure)

p <- ggplot() + 
  geom_hline(aes(yintercept = 0), colour="gray88", linetype="dashed") + 
  geom_vline(aes(xintercept = 0), colour="gray88", linetype="dashed")  +
  
  geom_point(data = species, aes(x=CCA1, y=CCA2),size = 0.5, colour = 'pink', pch = 3) +
#  geom_segment(data = species,aes(x=0, xend= CCA1, y=0, yend= CCA2 ), arrow = arrow(length = unit(0.3, "cm")), colour = 'blue') +
#  geom_text(data = species,aes(x = CCA1*1.1, y = CCA2*1.1, label = spece), size = 3, colour = 'blue') +
  
  geom_segment(data = envi,aes(x=0, xend= CCA1, y=0, yend= CCA2 ), arrow = arrow(length = unit(0.3, "cm")), colour = 'red') +
  geom_text(data = envi,aes(x = CCA1*1.1, y = CCA2*1.1, label = en), size = 3, colour = 'red', check_overlap = TRUE) +
  
  geom_point(data = samples, aes(x=CCA1, y=CCA2, colour = season, shape = foreststructure),size = 3)  +
  theme_bw() + theme(panel.grid.major=element_line(colour=NA), panel.grid.minor = element_blank()) + 
  
  xlab(paste('CCA1 (', aa[2,1]*100, '%)', sep ='')) + ylab(paste('CCA2 (', aa[2,2]*100, '%)', sep ='')) +
  stat_ellipse(data = samples, aes(x = CCA1, y = CCA2, group = foreststructure),type ="t", linetype =2)
print(p)
