library(dplyr)

stats::filter
filter
dplyr::filter

# filter <- "a"
# filter
# rm(filter)

library(ggplot2)

gd <- read.csv("./data/grants_small.csv", fileEncoding = "UTF-8",
               stringsAsFactors = FALSE)

x <- c("a", "a", "aa")
class(x)
x_f <- factor(x)
class(x_f)
as.numeric(x)
as.numeric(x_f)
gd$budget

lapply(strsplit(gd[["institution"]], split = ","), first)
lapply(strsplit(gd[["institution"]], split = ","), function(i) i[1])

mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]", 
                                            replacement = "", x = budget, 
                                            ignore.case = TRUE)),
       institution = sapply(strsplit(institution, split = ","), first)) %>% 
  group_by(institution) %>% 
  summarise(cum_budget = sum(budget_numeric)) %>% 
  filter(institution %in% c("Politechnika Warszawska",
                            "Uniwersytet Warszawski",
                            "Uniwersytet Wrocławski",
                            "Politechnika Wrocławska")) %>% 
  ggplot(mapping = aes(x = institution, y = cum_budget)) +
  geom_col()

panel_budget <- mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]", 
                                            replacement = "", x = budget, 
                                            ignore.case = TRUE)),
       subpanel = sapply(strsplit(gd[["subpanel"]], " "), first)) %>% 
  group_by(subpanel) %>% 
  summarise(mean_budget = mean(budget_numeric)) %>% 
  mutate(panel = gsub(pattern = "[0-9]", replacement = "", x = subpanel)) 

ggplot(data = panel_budget, aes(x = subpanel, y = mean_budget)) +
  geom_col() +
  facet_wrap(~ panel, scales = "free_x")


