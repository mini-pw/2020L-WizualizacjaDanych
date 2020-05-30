install.packages("BetaBit")
library(BetaBit)
proton()

# login
login = employees[employees$name=='John' & employees$surname=='Insecure', "login"]
proton(action="login", login=login)

# password
for (i in 1:length(top1000passwords)){
  proton(action="login", login=login, password=top1000passwords[i])
}

View(logs)

library(dplyr)
login_pietraszko <- employees[employees$surname == "Pietraszko","login"]
logs[logs$login==login_pietraszko,] %>% group_by(host) %>% count() %>% arrange(desc(n)) -> hosts_
hosts_
host = "194.29.178.16"
proton(action="server", host=host)

unique(bash_history[!grepl(" ", bash_history)])
password = "DHbb7QXppuHnaXGN"
proton(action="login", login=login_pietraszko, password=password)
