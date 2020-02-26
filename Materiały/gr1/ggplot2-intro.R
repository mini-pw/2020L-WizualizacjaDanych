library(ggplot2)
install.packages("dplyr")
library(dplyr)

gd <- read.csv("./data/grants_small.csv", stringsAsFactors = FALSE, fileEncoding = 'UTF-8')

# scoping w R
stats::filter
base::filter

# factor u character w R
x_c <- c("a","b","c")
x_f <- factor(x_c)

as.numeric(x_c)
as.factor(x_c)

# manipulowanie danymi
gd[['budget']]
gd$budget

toupper(budget) # error, nie ma takiej zmiennej
toupper(budget)
# ale to poniżej git
mutate(gd, budget_large = toupper(budget))

as.numeric(gsub(pattern = "[a-z: ]","", gd$budget, ignore.case = TRUE))

mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]","", budget, ignore.case = TRUE)) )



pull(gd, institution) # wariant dla gd$institution

lapply(strsplit(gd[['institution']],", "), first)
# lapply(strsplit(gd[['institution']],", "), function(i) i[1]) - drugi sposób

mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]","", budget, ignore.case = TRUE)),
       institution = sapply(strsplit(gd[['institution']],", "), function(i) i[1])) %>% 
  group_by(institution) %>% 
  summarise(mean_budget = mean(budget_numeric)) %>% 
  filter(institution %in% c("Politechnika Warszawska",
                           "Politechnika Łódzka",
                           "Akademia Górniczo-Hutnicza im. St.Staszica w Krakowie")) %>% 
  ggplot(aes(x= institution, y= mean_budget)) +
  geom_col() +
  coord_flip()

# %>% Wpisuje do funckcji argument z lewej jako pierwszy nienazwany argument

# geometrie

