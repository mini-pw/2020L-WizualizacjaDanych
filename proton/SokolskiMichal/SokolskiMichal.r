employees[employees$name == 'John',]
#    name  surname   login
#217 John Insecure johnins
#432 John    Scott    jsc
for (p in top1000passwords) {proton(action = "login", login="johnins", password=p)}
employees[employees$surname == 'Pietraszko',]
#        name    surname login
#477 Slawomir Pietraszko  slap
hist(logs[logs$login=="slap",]$host)
