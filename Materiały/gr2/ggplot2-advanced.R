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

# atrybuty wizualne

ggplot(grants_df, aes(x = type, fill = panel)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45))

ggplot(grants_df, aes(x = type, fill = panel)) +
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 45))

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  ggplot(aes(x = type, fill = panel)) +
  geom_bar(position = "dodge")

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel) %>% 
  summarise(count = length(panel)) %>% 
  mutate(prop = count/sum(count)) %>% 
  ggplot(aes(x = type, y = prop, fill = panel)) +
  geom_bar(stat = "identity") # geom_col
  
filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel) %>% 
  summarise(count = length(panel)) %>% 
  mutate(prop = count/sum(count)) %>% 
  ggplot(aes(x = type, y = prop, fill = panel)) +
  geom_bar(stat = "identity") +
  coord_polar()

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel) %>% 
  summarise(count = length(panel), budget = mean(budget)) %>% 
  ggplot(aes(x = count, y = budget, shape = type, color = panel)) +
  geom_point(size = 6)

# geometrie

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel, subpanel) %>% 
  summarise(count = length(panel)) %>% 
  ggplot(aes(x = type, y = subpanel, fill = count, color = panel)) +
  geom_tile(size = 2) +
  scale_fill_gradient(low = "white", high = "black")

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel, subpanel) %>% 
  summarise(count = length(panel)) %>% 
  ggplot(aes(x = 1, y = count, fill = panel)) +
  geom_col() +
  facet_grid(subpanel ~ type) +
  theme(axis.text.y = element_blank()) +
  coord_flip()


filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel, subpanel) %>% 
  summarise(count = length(panel)) %>% 
  ggplot(aes(x = subpanel, y = count, fill = panel)) +
  geom_col() +
  facet_wrap( ~ type) +
  coord_flip()

library(ggrepel)

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel, subpanel) %>% 
  summarise(count = length(panel),
            budget = mean(budget)) %>% 
  ggplot(aes(x = count, y = budget, shape = type, color = panel,
             label = subpanel)) +
  geom_point(size = 4) +
  geom_label_repel()




filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel, subpanel) %>% 
  summarise(count = length(panel),
            budget = mean(budget)) %>%
  mutate(type_font = factor(type, levels = c("OPUS", "PRELUDIUM", "SONATA"),
                            label = c("sans", "serif", "mono"))) %>% 
  ggplot(aes(x = count, y = budget, shape = type, color = panel,
             label = subpanel, family = type_font)) +
  geom_point(size = 4) +
  geom_label_repel()

filter(grants_df, type %in% c("OPUS", "PRELUDIUM", "SONATA")) %>% 
  group_by(type, panel, subpanel) %>% 
  summarise(count = length(panel),
            budget = mean(budget)) %>% 
  ggplot(aes(x = count, y = budget, shape = type, color = panel)) +
  geom_point(size = 4) +
  facet_wrap(~ subpanel)
