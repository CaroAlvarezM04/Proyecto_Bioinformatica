#Paquete de R para trabajar con google sheets
install.packages("googlesheets4")
library(googlesheets4)
#Paquete para segun recomendaciones de gente random de corea del sur jajaja funcione mejor google sheets en R
#P.D. si funciono porque me valido muy rapido mi hoja de calculo desde el navegador hasta R, 10/10 los consejos de los chinitos
install.packages("httpuv")
library(httpuv)

#Genere desde el navegador una hoj de calculo con las columnas que queria
# https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0

#esta funcion es del segundo paquete es para validar la hoja de calculo y que puedas trabajar con ella
as_sheets_id("https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
#genera un ID para trabajar en R:
# ID: 1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro
# Spreadsheet name: Reportes_alimentos
# Time zone: America/Mexico_City
#da otros datos extras sobre la hoja de calculo 

#esta funcion es del primer paquete y es para manipular la hoja desde R
dd <- gs4_browse("1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro")
#Si la corres abre en el navegador la hoja de calculo de manera automatica

#Seg?n la ayuda de Tidyverse puedes generar data frames que despues se guarden en la hoja de calculo
#Se crea un data frame vacio
#Se le agregan los datos que quieres en orden renglon, columna al data frame
generales <-data.frame(ncol(4))
generales <- data.frame(c(generales[2,1]<- nombre),
                        c(generales[2,2]<- edad),
                        c(generales[2,3]<- sexo),
                        c(generales[2,4]<- lugar))
#Con esta función se genera una nueva hoja en google sheets con los datos generales
write_sheet(generales, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")

#para el patogeno
sal <- c("Salmonella")
generales[1,5]<- sal 

#para el reporte de procesados
procesados <- data.frame(ncol(1))
procesados <- data.frame(c(procesados[1,1] <- edulcorantes_respuesta),
                         c(procesados[2,1] <- edulcorantes_lote),
                         c(procesados[3,1] <- edulcorantes_caducidad),
                         c(procesados[4,1] <- edulcorantes_otro))
write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")

#para el reporte de locales
noprocesados <- data.frame(ncol(1))
noprocesados <- data.frame(c(noprocesados[1,1] <- pizza_respuesta),
                           c(noprocesados[2,1] <- pizza_fecha),
                           c(noprocesados[3,1] <- pizza_repor))
write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")