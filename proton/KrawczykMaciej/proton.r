johnInsecure <- subset(employees, name == "John" && surname == "Insecure")$login
proton(action = "login", login = johnInsecure)

for (val in top1000passwords) {
  res <- proton(action = "login", login=johnInsecure, password=val)
  if (res == "Success! User is logged in!") {
    break
  }
}