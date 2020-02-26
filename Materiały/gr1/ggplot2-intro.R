library(ggplot2)
library(data.table)
library(magrittr)

gd <- fread("./data/grants_small.csv", encoding = 'UTF-8', stringsAsFactors = FALSE)

colnames(gd)

gd[, budget := as.numeric(gsub(pattern = '[a-z A-Z:]', replacement = '', x = budget))]
gd[, institution := sapply(strsplit(institution, ', '), function(x) x[1])]

gd[institution %in% c('Uniwersytet Warszawski',
                      'Politechnika Warszawska',
                      'AGH'),
   .(mean_budget=mean(budget)), by=institution] %>%
  ggplot(aes(x = institution, y = mean_budget)) +
  geom_col() +
  coord_flip()



# aktualizacja forka

# manipulowanie danymi

# geometrie

