library(dplyr)
library(ggplot2)

grants_larger <- read.csv("./data/grants_larger.csv",
                          stringsAsFactors = FALSE)

head(grants_larger)

mutate(grants_larger, 
       type = strsplit(grants_larger[["type"]], 
                                      split = "Konkurs: ") %>% 
         sapply(function(i) i[2]) %>% 
         strsplit(split = "-") %>% 
         sapply(first) %>% 
         gsub(pattern = "[0-9]", replacement = "", x = .) %>% 
         gsub(pattern = "[ ]+$", replacement = "", x = .))

