library(ggplot2)
library(dplyr)

gd <- read.csv("./data/grants_small.csv", stringsAsFactors = FALSE)

gd$budget

mutate(gd,
       budget_numeric = as.numeric(gsub(pattern = "[a-z: ]", "", budget, ignore.case = TRUE)),
       institution = sapply(strsplit(gd$institution, ", "), first)
       ) %>%
  group_by(institution) %>%
  summarise(mean_budget = mean(budget_numeric)) %>% 
  filter(institution %in% c("Politechnika Warszawska", "Politechnika Łódzka", "Uniwersytet Wrocławski")) %>% 
  ggplot(aes(x = institution, y = mean_budget)) + 
  geom_col() + 
  coord_flip()



sapply(strsplit(gd$institution, ", "), first)
sapply(strsplit(gd$institution, ", "), function(i) i[1])



ggplot()







