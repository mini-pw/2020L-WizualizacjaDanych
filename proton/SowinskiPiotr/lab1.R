#johnis
john <- which(employees$surname == 'Insecure')
proton(action = "login", login=employees[john,]$login)

#nie pamiętam
tt = as.matrix(top1000passwords)
f <- function(p) proton(action = "login", login="johnins", password=p)
apply(tt, 1, f)

#194.29.178.16
pietr <- which(employees$surname == 'Pietraszko')
plogin <- employees[pietr,]$login
plogins = logs[logs$login == "slap",]
mostfreq = summary(plogins$host)[2]
proton(action = "server", host=mostfreq)
