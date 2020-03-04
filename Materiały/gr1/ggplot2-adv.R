library(dplyr)
library(ggplot2)

grants_larger <- read.csv("./data/grants_larger.csv",
                          stringsAsFactors = FALSE)

head(grants_larger)

remove_alpha <- function(x)
  as.numeric(gsub(pattern = "[a-z: óę]", replacement = "", x = x,
       ignore.case = TRUE))

grants_df <- mutate(grants_larger, 
       type = strsplit(type, split = "Konkurs: ") %>% 
         sapply(function(i) i[2]) %>% 
         strsplit(split = "-") %>% 
         sapply(first) %>% 
         gsub(pattern = "[0-9]", replacement = "", x = .) %>% 
         gsub(pattern = "[ ]+$", replacement = "", x = .),
       subpanel = strsplit(subpanel, split = "-") %>% 
         sapply(first) %>% 
         gsub(pattern = "[ ]+$", replacement = "", x = .)) %>% 
  mutate_at(c("coinvestigators", "duration",
              "budget"), remove_alpha)
         

