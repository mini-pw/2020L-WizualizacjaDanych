# find eployee with surname Insecure
login = employees[employees$surname == 'Insecure',]['login']

# iterate over passwords to find one that matches
for(pass in top1000passwords)
	  proton(action = "login", login=login, password=pass)

# find Pietrazsko user
pietr = employees[employees$surname == 'Pietraszko',]['login']

# show pietraszko logins (not working, dunno why)
logs[logs$login == pietr,,]
