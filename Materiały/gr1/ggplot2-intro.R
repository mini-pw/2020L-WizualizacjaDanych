library(ggplot2)
library(dplyr)

gd <- read.csv("./data/grants_small.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8")

# scoping w R
stats::filter
dplyr::filter

# factor i character w R
x_c <- c("a", "b", "a")
x_f <- factor(x_c)

mutate(gd, budget_large = toupper(budget))

gsub(pattern = "[a-z: ]", "", gd[["budget"]], ignore.case = TRUE)

mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]", "",
                                            budget,
                                            ignore.case = TRUE)))

strsplit(gd[["institution"]], ", ")

sapply(strsplit(gd[["institution"]], ", "), function(i) i[1])

mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]", "",
                                            budget,
                                            ignore.case = TRUE)),
       institution = sapply(strsplit(gd[["institution"]], ", "), 
                            function(i) i[1])) %>%
  group_by(institution) %>%
  summarize(mean_budget = mean(budget_numeric)) %>%
  filter(institution %in% c("Politechnika Warszawska",
                            "Politechnika Łódzka",
                            "Akademia Górniczo-Hutnicza im. St.Staszica w Krakowie",
                            "Uniwersytet Wrocławski")) %>%
  ggplot(aes(x = institution, y = mean_budget)) +
  geom_col() +
  coord_flip()

# manipulowanie danymi

# geometrie

