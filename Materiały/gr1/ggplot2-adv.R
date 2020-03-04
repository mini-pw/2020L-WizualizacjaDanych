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

# atrybuty wizualne 1

ggplot(grants_df, aes(x = duration, y = budget)) +
  geom_point()

ggplot(grants_df, aes(x = as.factor(duration), y = budget)) +
  geom_boxplot()

mutate(grants_df, duration = factor(duration, 
                                    levels = as.character(1L:60))) %>% 
  ggplot(aes(x = duration, y = log(budget, base = 10))) +
  geom_boxplot() +
  scale_x_discrete(drop = FALSE)

group_by(grants_df, duration) %>% 
  summarise(budget = mean(budget)) %>% 
  ggplot(aes(x = duration, y = budget)) +
  geom_col()
