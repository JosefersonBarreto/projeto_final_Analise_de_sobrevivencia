#================================================================================
# tratamento de dados  projeto final analise de sobrevivencia 
#===============================================================================


library(tidyverse)
library(plotly)
#library(readxl)

pulmao<-read.csv("analise_de_sobrevivencia.csv",sep = ";",encoding = "latin1")


pulmao<-pulmao %>% 
  dplyr::filter(Descrição.da.Topografia =="PULMAO, SOE")


pulmao<- pulmao %>% 
  dplyr::filter(Extensão != "SEM INFORMAÇÃO")

table(pulmao$Extensão)

table(pulmao$Nome.do.RCBP)
table(pulmao$Sexo)

table(pulmao$Idade)
table(pulmao$Raca.Cor)
table(pulmao$Nacionalidade)
table(pulmao$Naturalidade.Estado)
table(pulmao$Grau.de.Instrução)

table(pulmao$Descrição.da.Topografia)

table(pulmao$Descrição.da.Morfologia)
#vamos uitilizar 

table(pulmao$Descrição.da.Doenca)
table(pulmao$Descrição.da.Doenca.Infantil)
table(pulmao$Indicador.de.Caso.Raro)
table(pulmao$Descrição.da.Doenca)
#vamos utilizar

table(pulmao$Meio.de.Diagnostico)


table(pulmao$Lateralidade)

table(pulmao$Estadiamento)

table(pulmao$TNM)

table(pulmao$Status.Vital)




pulmao<- pulmao %>% 
  dplyr::filter(Status.Vital != "SEM INFORMAÇÃO")




pulmao<-pulmao%>% distinct()

glimpse(pulmao)


pulmaot<-pulmao %>% select(Sexo,Idade,Descrição.da.Topografia,Código.da.Topografia,
                  Descrição.da.Topografia,
                  Descrição.da.Morfologia,Descrição.da.Doenca,Meio.de.Diagnostico,Extensão,Status.Vital,
                  Data.de.Último.Contato,Data.de.Diagnostico,Data.do.Óbito,Metástase.à.distância,dias)



write.csv(pulmaot,"pulmaot.csv",row.names = FALSE)
