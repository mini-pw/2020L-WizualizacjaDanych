john = subset(employees, name=="John" & surname=="Insecure")
johnlogin = john$login
proton(action = "login", login=johnlogin)
#top1000passwords
msg = proton(action = "login", login=johnlogin, password="ABC")

for (pw in top1000passwords) {
  msg = proton(action = "login", login=johnlogin, password=pw)
  msg
}