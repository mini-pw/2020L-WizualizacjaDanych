johnlogin <- subset(employees, name == "John" & surname == "Insecure")
proton(action = "login", login = johnlogin$login)
