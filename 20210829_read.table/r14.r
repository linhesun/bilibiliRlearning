# txt file
txtdat <- read.table('trans.txt', header = TRUE, sep = '\t', row.names = 1)

# csv file
csvdat <- read.table('trans.csv', header = TRUE, sep = ',', row.names = 1)
csvdat <- read.csv('trans.csv', header = TRUE, row.names = 1)

# excel file
install.packages('readxl')
library(readxl)
xlsxdat <- read_xlsx('trans.xlsx', sheet = 1, col_names = TRUE)

# company excel file
comdat <- read_xls('trans.xls', sheet = 1, col_names = TRUE) # does not work
comdat <- read.table('trans.xls', header = TRUE, sep = '\t')
