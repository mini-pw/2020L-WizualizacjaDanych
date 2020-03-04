install.packages("BetaBit")
library(BetaBit)
proton()

login <- employees$login[which(employees$surname == 'Insecure')]
proton(action = "login", login = login)

for (pass in top1000passwords){
  proton(action = "login", login = login, password = pass)
}

login_pietraszko <- employees$login[which(employees$surname == 'Pietraszko')]
host_pietraszko <- logs$host[which(logs$login == login_pietraszko)]
most_freq_host <- sort(host_pietraszko,decreasing=TRUE)[1]
