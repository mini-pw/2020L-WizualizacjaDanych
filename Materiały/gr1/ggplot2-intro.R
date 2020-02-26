library(ggplot2)
library(dplyr)

gd <- read.csv("./data/grants_small.csv", stringsAsFactors = FALSE)
# edit(gd)
# summary(gd)

# scoping w R
stats::filter
dplyr::filter

# factor i character w R
x_c <- c("a", "b", "a")
x_f <- factor(x_c)

as.numeric(x_c)
as.numeric(x_f)

# manipulowanie danymi
gd[["budget"]]

gd$budget

toupper(budget) # brak takiej zmiennej
toupper(gd[["budget"]])
mutate(gd, budget_large = toupper(budget))

gd[["budget"]]

# geometrie

