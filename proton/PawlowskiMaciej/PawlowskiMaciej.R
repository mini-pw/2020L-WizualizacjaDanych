library(BetaBit)
proton()

colnames(employees)
employees[employees$name == 'John',]
proton(action = "login", login="johnins")

top1000passwords

for (i in top1000passwords){
  if (proton(action = "login", login="johnins", password=i) == "Success! User is logged in!"){
    print(i)
  }
}
#q1w2e3r4t5
proton(action = "login", login="johnins", password="q1w2e3r4t5")

View(logs)

library(data.table)

logs <- as.data.table(logs)
logs[login == "slap",.(ilosc = .N),by = .(host)]

proton(action = "server", host="194.29.178.16")


View(bash_history)

bash_history[!grepl("/", bash_history) &  !grepl(" ", bash_history)] #DHbb7QXppuHnaXGN

proton(action = "login", login="slap", password="DHbb7QXppuHnaXGN")
