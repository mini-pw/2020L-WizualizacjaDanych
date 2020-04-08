install.packages("BetaBit")
library(BetaBit)
proton()

john=subset(employees, name=='John'& surname=='Insecure')

#proton(action = "login", login=john$login)

for (value in top1000passwords) {
  proton(action = "login", login=john$login, password=value)
}
johnLogs = subset(logs, login==john$login)[,2]
mostCommon = sort(table(johnLogs),decreasing=TRUE)[1]