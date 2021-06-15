install.packages("BetaBit")
library(BetaBit)
proton()

i <- which(employees$name == "John" & employees$surname == "Insecure")
login <-employees[i,]$login
proton(action = "login", login = login)

for(pwd in top1000passwords){
  proton(action = "login", login = login, password=pwd)
}

pIndex <- which(employees$surname == "Pietraszko")
plogin <- employees[pietraszkoIndex,]$login
pLogs <- subset(logs, plogin == logs$login)
mostCommon <- names(sort(table(pLogs[,2]),decreasing=TRUE)[1])
proton(action="server", host=mostCommon)

