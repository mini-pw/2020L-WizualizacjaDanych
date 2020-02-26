install.packages("BetaBit")
library(BetaBit)
proton()

john = subset(employees, name == "John" & surname == "Insecure")
john_login = john$login

proton(action='login', login= john_login)
john_password = NA

for(password in top1000passwords) {
  mes = proton(action='login', login=john_login,password=password)
  if(mes == 'Success! User is logged in!') {
    john_password = password
  }
}

pietraszko = subset(employees, name == 'Sławomir' & surname == "Pietraszko")
pietraszko_login = pietraszko$login
pietraszko_logs = subset(logs,login == pietraszko_login)

library(plyr)
servers = count(pietraszko_logs, vars = 'host')

top_server = servers[order(),]$freq
