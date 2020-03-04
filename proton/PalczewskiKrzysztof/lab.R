install.packages("BetaBit")
library(BetaBit)

proton()
employees
login = subset(employees, name=='John'& surname=='Insecure')
#johnins
proton(action = "login", login="johnins")
top1000passwords
for (x in top1000passwords) {
  if (proton(action = "login", login="johnins", password = x) == 'Success! User is logged in!'){
    pass = x
  }
}
pass
#"q1w2e3r4t5"