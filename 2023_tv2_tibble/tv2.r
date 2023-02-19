library(tidyverse)
iris
as_tibble(iris)

data.frame(x = 1:5,
           y = 1,
           z = 2:6)
tibble(x = 1:5,
       y = 1,
       z = x + y)

tibble(`:)` = 1:5,
       ` ` = 1,
       `2x` = `:)` + ` `)

tribble(~x, ~y, ~z,
        1,1,2,
        2,1,3,
        3,1,4,
        4,1,5,
        5,1,6)

mpg
as.data.frame(mpg)

tb <- tibble(x = 1:5,
             y = 1,
             z = x + y)
tb$x
tb[['x']]
tb[[1]]

tb %>% .$x
tb %>% .[['x']]
tb[ ,1]
as.data.frame(tb)[,1]
