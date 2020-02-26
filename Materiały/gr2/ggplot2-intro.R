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

mutate(gd, budget_numeric = as.numeric(gsub(pattern = "[a-z: ]", 
                                            replacement = "", x = budget, 
                                            ignore.case = TRUE)))
       