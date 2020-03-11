install.packages("BetaBit")
library(BetaBit)


proton()

JohnsLogin = employees[which(employees$name == "John" & employees$surname== "Insecure"),]$login
proton(action = "login", login=JohnsLogin)

for (password in top1000passwords)
proton(action = "login", login=JohnsLogin, password = password)

