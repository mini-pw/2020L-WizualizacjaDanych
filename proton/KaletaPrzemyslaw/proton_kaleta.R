install.packages("BetaBit")
library(BetaBit)
library(dplyr)

###### Problem statement
proton()

# Employees data frame
head(employees)

### Problem 1: Find the login of John Inscecure
employees[employees["surname"] == "Insecure"]  # login = "johnins"

# Logging in
proton(action="login", login="johnins")

### Problem 2: Find John's password
top1000passwords
for (passwd in top1000passwords) {
  message <- proton(action="login", login="johnins", password=passwd)
  if (message == "Success! User is logged in!") {
    print(passwd)
    john_passwd <- passwd
  }
}

# Password
proton(action="login", login="johnins", password=john_passwd)  # "q1w2e3r4t5"

### Problem 3: logs
head(logs)
for (login in unique(logs[["login"]])) {
  if (grepl("pie", login)) {
    print(login)
  }
}

# most common usages
logs["login"] %>% group_by(login) %>% count %>% arrange(desc(n))

proton(action = "server", host="XYZ")
