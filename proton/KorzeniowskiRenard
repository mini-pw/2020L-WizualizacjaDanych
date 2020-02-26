filter(employees, name == "John", surname == "Insecure")
proton(action = "login", login="johnins")
for (i in top1000passwords){
    x <- proton(action = "login", login="johnins", password=i)
    if(length(grep(pattern = "Success", x=x)) == 1){
        print(i)
    }
}
filter(employees, surname == "Pietraszko")
filter(logs, login == "slap")
grp <- group_by(filter(logs, login == "slap"), host)
summarise(grp, count = n())
proton(action = "server", host="194.29.178.16")
