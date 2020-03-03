install.packages("BetaBit")
library(BetaBit)
proton()
install.packages("dplyr")
library(dplyr)

head(employees)
filter(employees, name == "John", surname == "Insecure")

proton(action = "login", login="johnins")

head(top1000passwords)

for(i in 1:1000){
  proton(action = "login", login="johnins", password=top1000passwords[i])
}

head(logs)
filter(employees, surname == "Pietraszko")


slap_group <- group_by(filter(logs, login == "slap"), host)
summarise(slap_group, count = n())