install.packages("BetaBit")
library(BetaBit)
require(dplyr)
proton(action ="login", login="johnins")
for(value in top1000passwords){
  if(proton(action = "login", login="johnins", password=value) == "Password or login is incorrect"){
    
  }else{
    print(value)
    break
  }
  
}
x <- "q1w2e3r4t5"

p <- logs%>% count(login,host) %>% filter(login == "johnins")
host <- "194.29.178.13"
proton(action = "server", host ="194.29.178.13")
