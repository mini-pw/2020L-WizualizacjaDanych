john = employees[which(employees$name=='John' & employees$surname == 'Insecure'),]

proton(action= 'login', login=john$login)

success <- "Success! User is logged in!"
for (pass in top1000passwords) {
  status = proton(action='login', login=john$login, password=pass)
  if(status == success)
    {
    john_pass <-  pass
    break
  }
}
