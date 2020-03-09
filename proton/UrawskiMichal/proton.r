

log <- employees[employees$name=='John' & employees$surname=='Insecure', c("login")]

proton(action='login', login = log)
for (value in top1000passwords) {
  proton(action='login', login = log, password = value)
}

pietraszko <- employees[employees$surname=='Pietraszko', c("login")]

log <- logs[logs$login == pietraszko, c('host')]
proton(action = "server", host="194.29.178.16")