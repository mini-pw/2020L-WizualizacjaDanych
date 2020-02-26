library(ggplot2)
library(dplyr)

gd <- read.csv("./data/grants_small.csv")
gd <- read.csv("./data/grants_small.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8")

# aktualizacja forka

# manipulowanie danymi

# geometrie

#edit(gd)
#summar

#factor i character
x_c <- c("a", "b", "c")
x-f <- factor(x_c)
as.numeric(x_c)
as.numeric(x_f)


gd$budget
gd[["budget"]]

toupper(budget) # brak takiej zmiennej
toupper(gd[["budget"]])

mutate(gd, budget_numeric=toupper(budget))

strsplit(gd[["budget"]], " ")

gsub(pattern = "Przyznana kwota: ", " ", gd[["budget"]])

gsub(pattern = "[a-z: ]", "", gd[["budget"]], ignore.case = TRUE)

mutate(gd, budget_numeric = as.numeric(
  gsub(pattern = "[a-z: ]", "", budget, ignore.case = TRUE)))


gd[["institution"]]
pull(gd, institution)

strsplit(gd[["institution"]], ", ")

lapply(strsplit(gd[["institution"]], ", "), function(i) i[1])
sapply(strsplit(gd[["institution"]], ", "), function(i) i[1])

institution = sapply(strsplit(gd[["institution"]], ", "), function(i) i[1]) %>%
  group_by(institution) %>%
  summarise(mean_budget = mean(budget_numeric)) %>%
  filter(institution %in% c("Politechnika Wrocławska", "Politechnika Łódzka", "Akademia Górniczo-Hutnicza im. St.Staszica w Krakowie"))
  ggplot(aes(x = institution, y = mean_budget)) +
    geom_col() +
    coord_flip()

  mutate(gd, budget_numeric = as.numeric(
    gsub(pattern = "[a-z: ]", "", budget, ignore.case = TRUE)), institution = sapply(strsplit(gd[["institution"]], ", "), function(i) i[1])) %>%
      group_by(institution) %>%
      summarise(mean_budget = mean(budget_numeric)) %>%
      filter(institution %in% c("Politechnika Wrocławska", "Politechnika Łódzka", "Akademia Górniczo-Hutnicza im. St.Staszica w Krakowie")) %>% 
    ggplot(aes(x = institution, y = mean_budget)) +
      geom_col() +
      coord_flip()

