library(BetaBit)
library(data.table)

proton()

head(employees)
data.table(employees)[name == "John" & surname == "Insecure"]

proton(action = "login", login="johnins")

head(top1000passwords)
for (pass in top1000passwords){
  proton(action = "login", login="johnins", password=pass)
}

head(logs)
data.table(logs)[login == "johnins", .(.N), by = "host"]