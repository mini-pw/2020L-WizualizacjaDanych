install.packages("BetaBit")
library(BetaBit)
proton()

e <- employees
jins <- subset(e, surname == "Insecure")
proton(action = "login", login="johnins")


for(pass in top1000passwords) {
  #print(pass)
  proton(action = "login", login="johnins", password=pass)
}

#q1w2e3r4t5

logs
library(stringr)
library(dplyr)
logs %>%
  filter(str_detect(login, "sla"))

library(plyr)
lp <- subset(logs, login = "slap")
ips <- count(lp, host)




