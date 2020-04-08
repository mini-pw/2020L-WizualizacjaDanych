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

proton(action = "login", login = john_login, password = john_password)

pietraszko = subset(employees, name == 'Slawomir' & surname == "Pietraszko")
pietraszko_login = pietraszko$login
pietraszko_logs = subset(logs, login == pietraszko_login)

library(plyr)
servers = count(pietraszko_logs, vars = 'host')

# order servers 1 - most visited, n - least visited
sorted_servers = servers[order(-servers$freq),]
top_server = sorted_servers[1,]

# login to Pietraszko's favorite server
top_host_ip = as.character(top_server$host)
proton(action = "server", host = top_host_ip)

commands <- gsub(" .*", "", bash_history)
command_count <- count(commands)
reversed_command_count <- command_count[order(command_count$freq),]
pietraszko_password = as.character(reversed_command_count[1,'x'])

proton(action = 'login', login = pietraszko_login, password = pietraszko_password)
