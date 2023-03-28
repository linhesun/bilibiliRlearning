setwd('/Users/linhesun/OneDrive/文档/up/R/tv3')
library(tidyverse)
library(readxl)

read_xlsx('2022impactfactor.xlsx', na ='N/A')
read_excel('2022impactfactor.xlsx', na ='N/A')
# library(readr)
read_csv('2022impactfactor.csv')
read_csv('2022impactfactor.csv', na  ='N/A')
read_excel('pca_rotation.xls')
read_tsv('pca_rotation.xls')


read_csv('2022impactfactor.csv', na  ='N/A', skip = 2)
  
read_csv("1,2,3\n4,5,6", col_names = FALSE)
read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))
 
iris2 <- mutate(iris, Petal.Width = as.character(Petal.Width))
write_csv(iris2, 'iris.csv')
write_rds(iris2, 'iris.rds')

read_csv('iris.csv')
read_rds('iris.rds') 
