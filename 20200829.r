laoqing <- 3.6
laoqing
class(laoqing)
as.integer(laoqing)
laoqing <- 'shuaige'
laoqing
shuaige
'shuaige'
laove <- 1:10
laove
laove[6]
laove * 2
laove2 <- 11:20
laove2
laove + laove2
laove * laove2
laove3 <- 11:21
laove + laove3
laoch <- c(1,2,4,5)
laoch
laoch <- c('a', 'g', 'laoqing', 'shuaige')
laoch
aa <- 1:4
aa + laoch
aa <- c(1,2,3,4)
aa
aa <- c(1,2,3,4, 'laoqing')
aa
1aa <- 1:10
gene1 <- c(1.49717,2.70919,3.18347,2.09435,1.37927,0.561714,4.00054,5.71317,4.47724,1.52409,2.21519,2.60673,3.09815,3.67094,3.21924,4.42061,3.65855,5.141,3.01257,4.17202,4.15479,0.233809,2.23063)
gene2 <- c(0.52833,1.0615,2.35156,0.469477,0.445778,0.185851,1.01387,1.7659,0.798634,0.28815,0.109937,0.610976,1.50196,1.07825,1.34744,1.58461,1.42415,1.00516,2.16145,2.10903,2.11415,0.0870496,0.249985)
t.test(gene1,gene2)
cor.test(gene1,gene2)
plot(gene2~gene1)
results <- t.test(gene1,gene2)
results
names(results)
results$method
results$p.value
