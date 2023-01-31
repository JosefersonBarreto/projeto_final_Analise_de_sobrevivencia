#================================================================================
# tratamento de dados  projeto final analise de sobrevivencia 
#===============================================================================


library(tidyverse)
library(plotly)
#library(readxl)

r
rm
dados<-read.csv("base_nao_identificada_1832.csv",sep = ";",encoding = "latin1")

dados<-read.csv("base_nao_identificada_1832.csv",sep = ";")
# dados$Data.do.Óbito-dados$Data.de.Diagnostico

library(lubridate)



dados$Data.de.Diagnostico)))
# 
# 
# 
# (( as.Date(dados$Data.do.Óbito)) - (as.Date( dados$Data.de.Diagnostico)))


 (month( as.Date(dados$Data.do.Óbito)) - month(as.Date( dados$Data.de.Diagnostico)))
# 
 floor_date(as.Date(dados$Data.do.Óbito),"month")
# 
# mdy(dados$Data.do.Óbito)

 dados %>%
   # dplyr::select(where(is.factor)) %>% 
   glimpse()
 
 
 difftime(as.Date(dados$Data.de.Último.Contato), as.Date(dados$Data.de.Diagnostico), units = "weeks")
 
 pulmao<-dados %>% 
   dplyr::filter(Descrição.da.Topografia =="PULMAO, SOE")
 
 ymd(dados$Data.do.Óbito) - ymd(dados$Data.de.Diagnostico)
t<- pulmao %>% arrange(desc(Data.do.Óbito)) %>% 
   head(1)  
 
 pulmao %>% 
   dplyr::filter(Data.do.Óbito== '') %>% 
  dplyr::transmute(Data.do.Óbito=(as.Date('31/12/2016')-as.Date(pulmao$Data.de.Diagnostico) ))

 
 
 
pulmao$Data.do.Óbito[pulmao$Data.do.Óbito == ""] <- (as.Date('31/12/2016')-as.Date(pulmao$Data.de.Diagnostico) )
 
 
 
 
pulmao$Data.de.Último.Contato<- ymd(pulmao$Data.de.Diagnostico)
 
 as.Date(pulmao$Data.de.Último.Contato)
          