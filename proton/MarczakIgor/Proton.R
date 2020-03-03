install.packages("BetaBit")
library(BetaBit)
library(data.table)
library(stringi)
proton()

str(employees)

employees[employees$name == 'John', ]

for(pass in top1000passwords){
  proton(action='login', login='johnins', password=pass)
}


employees[employees$surname == 'Pietraszko', ]

l <- as.data.table(logs)
l <- l[login=='slap' , length(data), by = .(host)]
l

proton(action='server', host='194.29.178.16')

bash_history[]
