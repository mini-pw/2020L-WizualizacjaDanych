library(dplyr)
library(ggplot2)

grants_df <- read.csv("./data/grants_larger.csv", stringsAsFactors = FALSE)

remove_empty <- function(x)
  x[x != ""]

# example_fun_only_side_effects <- function() {
#   invisible(NULL)
# }

keep_numbers <- function(x)
  as.numeric(gsub(pattern = "[^0-9]", replacement = "", x = x))

mutate(grants_df, type = type %>% 
  strsplit(split = " ") %>% 
  lapply(remove_empty) %>% 
  sapply(function(i) paste0(i[2:(grep(pattern = "[0-9-]", x = i)[1] - 1)], 
                            collapse = " ")), 
  subpanel = strsplit(subpanel, split = " ") %>% 
    sapply(first)
) %>% 
  mutate_at(c("coinvestigators", "duration", "budget"), keep_numbers)
