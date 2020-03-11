install.packages("BetaBit")
library(BetaBit)
proton()
index <- which(employees$name == "John" & employees$surname == "Insecure")
login <- employees$login[index]

# John login = johnins

proton(action = "login", login = login)

for (password in top1000passwords)
{
  result <- proton(action = "login", login = login, password = password)
  if(result == "Success! User is logged in!")
  {
    john_pass <- password
    break
  }
}

#John password = q1w2e3r4t5

proton(action = "login", login = login, password = john_pass)

pietraszko_login <- employees$login[which(employees$surname == "Pietraszko")]

pietraszko_logs <- logs$host[which(logs$login == pietraszko_login)]

pc <- sort(table(pietraszko_logs),decreasing=TRUE)[1]
val = "194.29.178.16"

# Most common Pietraszko IP = 194.29.178.16

proton(action = "server", host =val)
