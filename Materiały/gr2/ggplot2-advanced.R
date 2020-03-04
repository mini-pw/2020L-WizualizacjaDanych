library(dplyr)
library(ggplot2)

raw_grants_df <- read.csv("./data/grants_larger.csv", stringsAsFactors = FALSE)

remove_empty <- function(x)
  x[x != ""]

# example_fun_only_side_effects <- function() {
#   invisible(NULL)
# }

keep_numbers <- function(x)
  as.numeric(gsub(pattern = "[^0-9]", replacement = "", x = x))

grants_df <- mutate(raw_grants_df, type = type %>% 
                      strsplit(split = " ") %>% 
                      lapply(remove_empty) %>% 
                      sapply(function(i) paste0(i[2:(grep(pattern = "[0-9-]", x = i)[1] - 1)], 
                                                collapse = " ")), 
                    subpanel = strsplit(subpanel, split = " ") %>% 
                      sapply(first)
) %>% 
  mutate_at(c("coinvestigators", "duration", "budget"), keep_numbers) %>% 
  mutate(panel = substr(subpanel, 0, 2))

ggplot(grants_df, aes(x = type, fill = panel)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45))

ggplot(grants_df, aes(x = type, fill = panel)) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45))

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  ggplot(aes(x = type, fill = panel)) +
  geom_bar(position = "dodge")
