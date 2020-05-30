install.packages("BetaBit")
library(BetaBit)
proton()
john = employees[employees$surname == "Insecure",]

proton(action = "login", login="johnins")

for (pass in top1000passwords){
  print(pass)
  proton(action = "login", login="johnins", password=pass)
}

jpass = "q1w2e3r4t5"

proton(action = "login", login="johnins", password=jpass)


slaw = employees[employees$surname == "Pietraszko",]
res = logs[logs$login == "slap",]
res$host

calculate_mode <- function(x) {
  uniqx <- unique(na.omit(x))
  uniqx[which.max(tabulate(match(x, uniqx)))]
}
most_frequent = calculate_mode(res$host)
most_frequent[1]
proton(action = "server", host=most_frequent)
