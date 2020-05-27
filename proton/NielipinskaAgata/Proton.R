install.packages("BetaBit")
library(BetaBit)
proton()

JohnLogin <-  employees[which(employees$name == "John"),]
JohnLogin <- JohnLogin[which(JohnLogin$surname == "Insecure"), "login"]

proton(action = "login", login=JohnLogin)
