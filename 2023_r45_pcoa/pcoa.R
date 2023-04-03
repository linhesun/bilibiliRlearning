library(tidyverse)

library(vegan) # 计算bray距离
otu  <-  read.table("16S.txt",sep="\t",header = T, row.names=1)
bray.dist = vegdist(t(otu), method="bray")


library(ape) # pcoa分析
spe.h.pc <- pcoa(bray.dist)
str(spe.h.pc)#记录一二轴解释率“Eigenvalues”
spe.h.pcoa <- spe.h.pc$vectors

spe.pcoa <- data.frame(spe.h.pcoa[,1:2]) %>%
  mutate(Types = rep(c('Hv', 'MV'), each = 6),
         Treatments = rep(rep(c('CK', 'P'), each = 3), 2))
# 置换多元方差分析
spe <- bray.dist
env <- select(spe.pcoa, Types, Treatments)
permanova <- adonis(spe ~ Types*Treatments, data = env, permutations = 999,method="bray")
permanova2 <- adonis2(spe ~ Types*Treatments, data = env, permutations = 999,method="bray")
fcnames <- row.names(permanova$aov.tab)
fcnames2 <- row.names(permanova2)

#获取双因素的数据
lab <- paste('PERMANOVA\n',fcnames[1],':R^2=',round(permanova$aov.tab[1,5],2),' p=', 
             round(permanova$aov.tab[1,6],3), '\n',
             fcnames[2],':R^2=',round(permanova$aov.tab[2,5],2),' p=', 
             round(permanova$aov.tab[2,6],3), '\n',
             fcnames[3],':R^2=',round(permanova$aov.tab[3,5],2),' p=', 
             round(permanova$aov.tab[3,6],3),
  sep = ''
)
lab2 <- paste('PERMANOVA\n',fcnames2[1],':R^2=',round(permanova2[1,3],2),' p=', 
             round(permanova2[1,5],3), '\n',
             fcnames2[2],':R^2=',round(permanova2[2,3],2),' p=', 
             round(permanova2[2,5],3), '\n',
             fcnames2[3],':R^2=',round(permanova2[3,3],2),' p=', 
             round(permanova2[3,5],3),
             sep = ''
)


ggplot(spe.pcoa, aes(x=Axis.1, y=Axis.2, shape= Types, colour=Treatments)) + 
  geom_point(size=5) +
  theme_bw()+
  # 把两个轴的贡献度写出来
  xlab(paste('Axis.1: ', round(spe.h.pc$values$Relative_eig[1],3)*100, '%', sep = '')) +
  ylab(paste('Axis.2: ', round(spe.h.pc$values$Relative_eig[2],3)*100, '%', sep = '')) +
  theme(panel.background = element_rect(fill = "transparent",colour = NA),
        aspect.ratio = 1) +
  # 用annotate把双因素结果写在左上角
  annotate(geom = 'text',label = lab, size =4,
           x = min(spe.pcoa$Axis.1), y = max(spe.pcoa$Axis.2),
           hjust = 0,
           vjust =1)

