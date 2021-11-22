#Este ciclo while es un super resumen de los tres scripts posteriores
#Contiene las funciones generadas para generar y guardar un reporte completo
#Las funciones contienen las variables pre-establecidas
#Siempre que el usuario lo quiera se puede generar nuevos reportes
#El poner nuevo con la funci?n readline le permite al usuario llenar nuevos reportes o salir
#_________________________

nuevo <- 1
while (nuevo == 1) {
  print(bienvenida)
  print(datos())
  print(correcto())
  print(enfermedad())
  print(reporte())
  print(agradecimiento)
  nuevo<-readline(prompt = "¿Deseas generar otro reporte (si = 1, no = 0)?")
  nuevo<-as.numeric(respuesta)
}

#___________________________

#Hasta aquí mi proyecto final 2.0
#   "If at first you don't succeed; call it version 1.0"

#######
## Ultima modificacion: 21-nov-2021
## Por Carolina ?lvarez
#######