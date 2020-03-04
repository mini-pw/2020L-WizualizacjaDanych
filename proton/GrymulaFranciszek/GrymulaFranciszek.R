
#install.packages("BetaBit")
library(BetaBit)
proton()
#install.packages('dplyr')
library(dplyr)
Slawomir Pietraszko

BetaBit::employees %>% filter(name == 'John')
proton(action = "login", login="johnins")

for (x in BetaBit::top1000passwords) {
  if (proton(action = "login", login="johnins", password = x) == 'Success! User is logged in!'){
    print(x)
  }
}
q1w2e3r4t5



logs %>% select(login) %>% distinct() %>% arrange(login) %>% View




proton(action = "server", host="194.29.178.13")



