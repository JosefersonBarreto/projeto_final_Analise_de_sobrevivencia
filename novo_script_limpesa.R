#================================================================================
# tratamento de dados  projeto final analise de sobrevivencia 
#===============================================================================


library(tidyverse)
library(plotly)
#library(readxl)

pulmao<-read.csv("analise_de_sobrevivencia2.csv",sep = ";",encoding = "latin1")

glimpse(pulmao)


pulmao<- pulmao %>% arrange(Data.do.Óbito)



t <- filter()



t<-pulmao %>% filter(Data.do.Óbito == ''  & Data.de.Último.Contato == '')

t$novo_data_obito<-rep('25/03/2018',nrow(t))

t$falhas<-rep(0,nrow(t))


# pulmao %>% filter(Data.do.Óbito == ''  & Data.de.Último.Contato == '') %>% 
#   mutate(Data.do.Óbito2 = rep('25/03/2018',113),
#          falhas2= rep(0,113))
# 
 ti<-pulmao %>% filter(Data.do.Óbito ==   Data.de.Diagnostico   & Data.do.Óbito !="")
 ti$novo_data_obito<-ti$Data.do.Óbito
 
 t$dias<-difftime( dmy(t$Data.do.Óbito), dmy(t$Data.de.Diagnostico), units = "days")
# t$novo_data_obito<-rep('25/03/2018',nrow(t))
ti$dias<-difftime( dmy(ti$Data.do.Óbito), dmy(ti$Data.de.Diagnostico), units = "days")


to<-pulmao %>% filter(Data.do.Óbito ==''  &  Data.de.Último.Contato!= Data.do.Óbito &
                      Data.de.Último.Contato!= Data.de.Diagnostico &
                     Data.de.Último.Contato >  '25/03/1990' )
to$dias<-difftime( dmy(to$Data.de.Último.Contato), dmy(to$Data.de.Diagnostico), units = "days")

to$novo_data_obito<-to$Data.de.Último.Contato
to$falhas<-rep(0,nrow(to))

# criando o ultimo filtro 

pulmao<-pulmao %>% arrange(Data.de.Último.Contato)
tu<-pulmao %>% filter(Data.do.Óbito >Data.de.Diagnostico  & Data.de.Último.Contato != "")

#======================================================================================
  
  vazias <-pulmao[1:688,]

vazias <-vazias %>% arrange(Data.do.Óbito)
 
nVazias<-pulmao[689:934,]


te<-pulmao %>% filter(Data.do.Óbito ==''  &  Data.de.Último.Contato== Data.de.Diagnostico )


ty<-pulmao %>% filter(Data.do.Óbito !=''  &  Data.de.Último.Contato!= Data.do.Óbito  &
                        Data.de.Último.Contato!= "")





#===============================================================================


to<-pulmao %>% filter(Data.do.Óbito ==''  &  Data.de.Último.Contato!= Data.do.Óbito &
                        Data.de.Último.Contato!= Data.de.Diagnostico &
                        Data.de.Último.Contato >  '25/03/1990' )
to$dias<-difftime( dmy(to$Data.de.Último.Contato), dmy(to$Data.de.Diagnostico), units = "days")


tu$dias<-difftime( dmy(tu$Data.do.Óbito), dmy(tu$Data.de.Diagnostico), units = "days")

tu$novo_data_obito<-tu$Data.do.Óbito

tu$falhas<-rep(1,nrow(tu))
ty$novo_data_obito<-ty$Data.do.Óbito
ty$falhas<-rep(1,nrow(ty))

te$novo_data_obito<-te$Data.de.Último.Contato
te$falhas<-rep(0,nrow(te))


tf<-pulmao %>% filter(Data.do.Óbito ==''  &
                        Data.de.Último.Contato=='' & Status.Vital !='SEM INFORMAÇÃO' )

tf$dias<-difftime( dmy('25/03/2018'), dmy(tf$Data.de.Diagnostico), units = "days")


tf$novo_data_obito<-rep('25/03/2018',nrow(tf))
tf$falhas<-rep(0,nrow(tf))
#================================================================================


#juntando tudo 


pulmaonovot<-rbind(t,to,tu,ty,te)

table(teste$falhas)


write.csv(pulmaonovot,"pulmaonovot.csv",row.names = FALSE)
