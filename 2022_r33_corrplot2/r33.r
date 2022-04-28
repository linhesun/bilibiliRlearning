
library(corrplot)

data(mtcars)
mt <- mtcars
M = cor(mt)

testRes = cor.mtest(mt, conf.level = 0.95)
###########
corrplot(M, p.mat = testRes$p, method = 'color', 
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 0.9,
         insig = 'label_sig', pch.col = 'grey20', order = 'AOE', tl.col = 'black')

corrplot(M,  method = 'number', p.mat = testRes$p, insig = 'blank',
         number.cex = 0.8, order = 'AOE', cl.pos = 'n')

###########
corrplot(M, p.mat = testRes$p, method = 'color',  type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 0.9,
         insig = 'label_sig', pch.col = 'grey20', order = 'AOE', tl.col = 'black')

corrplot(M,  method = 'number', type = 'lower',p.mat = testRes$p, insig = 'blank',
         number.cex = 0.8, order = 'AOE', cl.pos = 'n',  tl.pos = 'd')


###############
corrplot(M, p.mat = testRes$p, method = 'color',  type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 0.9,
         insig = 'label_sig', pch.col = 'grey20', order = 'AOE', tl.pos = 'tp', tl.col = 'black')


corrplot(M,  method = 'number', type = 'lower',p.mat = testRes$p, insig = 'blank',
          number.cex = 0.8, order = 'AOE', add = TRUE, tl.pos = 'd', cl.pos = 'n')
