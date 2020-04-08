library(dplyr)
library(ggplot2)

grants_larger <- read.csv("./data/grants_larger.csv",
                          stringsAsFactors = FALSE)

head(grants_larger)

remove_alpha <- function(x)
  as.numeric(gsub(pattern = "[a-z: óę]", replacement = "", x = x,
                  ignore.case = TRUE))

grants_df <- mutate(grants_larger, 
                    type = strsplit(type, split = "Konkurs: ") %>% 
                      sapply(function(i) i[2]) %>% 
                      strsplit(split = "-") %>% 
                      sapply(first) %>% 
                      gsub(pattern = "[0-9]", replacement = "", x = .) %>% 
                      gsub(pattern = "[ ]+$", replacement = "", x = .),
                    subpanel = strsplit(subpanel, split = "-") %>% 
                      sapply(first) %>% 
                      gsub(pattern = "[ ]+$", replacement = "", x = .)) %>% 
  mutate_at(c("coinvestigators", "duration",
              "budget"), remove_alpha)

# atrybuty wizualne 1

ggplot(grants_df, aes(x = duration, y = budget)) +
  geom_point()

ggplot(grants_df, aes(x = as.factor(duration), y = budget)) +
  geom_boxplot()

mutate(grants_df, duration = factor(duration, 
                                    levels = as.character(1L:60))) %>% 
  ggplot(aes(x = duration, y = log(budget, base = 10))) +
  geom_boxplot() +
  scale_x_discrete(drop = FALSE)

group_by(grants_df, duration) %>% 
  summarise(budget = mean(budget)) %>% 
  ggplot(aes(x = duration, y = budget)) +
  geom_col()

ggplot(grants_df, aes(x = duration, y = coinvestigators,
                      color = budget)) +
  geom_point()

mutate(grants_df, duration = factor(duration, 
                                    levels = as.character(1L:60))) %>% 
  ggplot(aes(x = duration, y = budget)) +
  geom_boxplot() +
  scale_x_discrete(drop = FALSE) +
  facet_wrap(~ coinvestigators)

panel_df <- mutate(grants_df, panel = gsub(pattern = "[0-9]", 
                                           replacement = "",
                                           subpanel),
                   panel_color = ifelse(panel == "HS",
                                        "pink", 
                                        ifelse(panel == "NZ",
                                               "green", "lightblue"))) 

ggplot(panel_df, aes(x = panel)) +
  geom_bar()

ggplot(panel_df, aes(x = panel, fill = subpanel)) +
  geom_bar()

ggplot(panel_df, aes(x = subpanel, fill = panel)) +
  geom_bar()

panel_color_vector <- select(panel_df, subpanel, panel_color) %>% 
  unique %>% {
    subpanel_order <- c("HS1", "HS2", "HS3", "HS4", "HS5", "HS6", "NZ1", "NZ2", "NZ3", 
                        "NZ4", "NZ5", "NZ6", "NZ7", "NZ8", "NZ9", "ST1", "ST2", 
                        "ST3", "ST4", "ST5", "ST6", "ST7", "ST8", "ST9", "ST10")
    res <- setNames(.[["panel_color"]], .[["subpanel"]])
    res[subpanel_order]
  }

ggplot(panel_df, aes(x = panel, fill = subpanel, 
                     label = subpanel)) +
  geom_bar(color = "black") +
  geom_text(stat = "count", position = "stack", 
            vjust = 1.5) +
  scale_fill_manual(values = panel_color, guide = FALSE)

# mutate(panel_df, 
#        subpanel = factor(subpanel, 
#                          levels = names(panel_color_vector))) %>% 
#   group_by(panel, subpanel) %>% 
#   summarise(n = length(subpanel)) %>%
#   arrange(desc(subpanel)) %>% 
#   mutate(n_cum = cumsum(n),
#          text_pos = rev(n_cum - 0.5*n)) %>% 
#   ggplot(aes(x = panel, y = n, 
#              label = subpanel, 
#              fill = subpanel)) +
#   geom_bar(stat = "identity", color = "black") +
#   geom_text(mapping = aes(y = text_pos)) +
#   scale_fill_manual(values = panel_color, guide = FALSE)

group_by(panel_df, panel, subpanel) %>% 
  summarise(budget = sum(budget), n = length(subpanel)) %>% 
  ggplot(aes(x = n, y = budget, color = panel, label = subpanel)) +
  geom_point() +
  geom_label(size = 12)

