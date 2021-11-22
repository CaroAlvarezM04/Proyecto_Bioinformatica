#El proyecto esta dividido en funciones que finalmente seran usadas en un ciclo while
#El proposito de cada función es que al ponerlas en un ciclo pueda llevar una congruencia 
#Permite al usuario y al que procesa los datos llevar un orden
#También tiene ciertos mensajes que sirven como base de comunicación o explicación para el usuario
#En este codigo se utilizan las variables y vectores generados en el script de variables y de patogenos,
  #para no alargar o complicar los condicionales que se utilizan en cada función.
#_____________________________________

#Mensaje de justificación y bienvenida para el usuario que llena el reporte
#La función solo contiene un print
bienvenida <- print("Hola extraño, es un placer que accedieras a esta plataforma. El objetivo de esta encuesta es que las empresas y los consumidores puedan garantizar alimentos de calidad para todos los mexicanos. A continuación te realizaremos una serie de preguntas que nos ayudarán a identificar alimentos contaminados por bacterias que causan enfermedades. 
Te pedimos que seas responsable y honesto al responder, si eres menor de edad pide a un adulto que te ayude. Este reporte es útil para productos procesados de las marcas mexicanas más importantes. Además, si radicas en el municipio de San Luis de la Paz, Gto, podrás llenar un reporte para todos los establecimientos de comida registrados ante el SAT.
Con tu ayuda los pequeños y grandes productores mejorarán su proceso y preparación de alimentos, y tambien a prevenir enfermedades transmitidas por alimentos.")
#_______________________________________


#Ingreso de datos personales
#La función datos incluye todos los datos personales del usuario
datos <- function(nombre,edad,sexo,lugar){
  nombre<- readline(prompt = "Ingresa tu nombre completo: ") #indica el nombre del nuevo usuario usando la función readline
  nombre<-as.character.default(nombre)
  edad<- readline(prompt = "Ingresa tu edad: ") #indica la edad del nuevo usuario
  edad<-as.numeric(edad) #convierte la edad del usuario en un caracter numerico
  sexo<- readline(prompt = "Indica con el género con el que te identificas: ") #indica el genero del usuario
  sexo<-as.character.default(sexo)
  lugar<- readline(prompt = "Ingresa el estado donde radicas actualmente: ") #indica el estado donde vive el usuario
  lugar<- as.character.default(lugar)
return(print(paste("Verifica tus datos:",nombre,",",edad,"años, ","género",sexo,",",lugar)))
} 
datos()
#_____________________________________________


#Verificación de datos
#Luego de que el usuario verifique sus datos se le preguntara si son correctos para continuar
correcto <-function(){
  si <- readline(prompt = "Si tus datos son correctos escribe 1, si no escribe 0: ") #se le pide que escriba el 1 para verificar
  si <- as.numeric(si) #convierte la respuesta a un número para leer el condicional de if y de else
if(si == 1){ #si es correcto guarda los datos en un data frame
  generales <-data.frame(ncol(16))
  generales <- data.frame(c(generales[2,1]<- nombre),
                          c(generales[2,2]<- edad),
                          c(generales[2,3]<- sexo),
                          c(generales[2,4]<- lugar))
}else if(si == 0){print("Parece que ocurrió un error, por favor intenta más tarde.")
  }#si los datos son incorrectos se aparece un fallo en el sistema y pide que salga y lo intente de nuevo
}
correcto()
#______________________________________________



#Seleccionar sintomas
#En la función enfermedad se utilizan condicionales para que el consumidor identifique los sintomas que presenta
#se utilizan condicionales para que el programador sepa (pero no el usuario) que patogeno pudo ser el responsable de la enfermedad
enfermedad <- function(){
  print("A continuación se muestran diferentes cuadros clínicos comunes enumerados del V1 al V5, escribe el n?mero del conjunto de sintomas que describe mejor cómo te sientes y/o sentiste al ingerir el alimento: ")
  print(sintomas) #esta matriz contiene en 5 columnas con diferentes cuadros clinicos por columna
  cuadro <- readline(prompt = "Escribe 1,2,3,4 o 5 según la columna que describe mejor tus sintomas: ") 
  cuadro <- as.numeric(cuadro) #con la funci?n readline el usuario elige el cuadro clinico que considera que se adapta mejor a el y se convierte a caracter numerico
  if (cuadro == 1){ #si escribe el numero 1 la computadora reconoce que puede ser salmonella
    sal <- c("Salmonella")
    generales[1,5]<- sal #lo manda a una base de datos existente
}else if (cuadro == 2){ #con else if indicas a cuales de los otros cuadros clinicos se puede referir el usuario
  lis <- c("Listeria")
  generales[1,5]<- lis
}else if (cuadro == 3){
  bc1 <- c("Bacillus diarreico")
  generales[1,5]<-bc1
}else if (cuadro == 4){
  bc2 <- c("Bacillus emetico")
  generales[1,5]<-bc2
}else if (cuadro == 5){
  cam <- c("Campylobacter")
  generales[1,5]<-cam
}
  }
enfermedad()
#__________________________________________

#La función reporte incluye las preguntas que se realizan al usuario
reporte <- function(){
  #primero pregunta si quieres reportar alimentos procesados o no, y se usan condicionales para saber a que cuestionario te vas a dirigir
  print("¿El alimento que quieres reportar es un alimento procesado o un alimento de consumo local?")
  alimento <- readline(prompt = "Si es un alimento procesado escribe 1, si es un alimento de algún establecimiento local escribe 2: ")
  alimento <- as.numeric(alimento) #la respuesta anterior se convierte a caracter numerico 
  
#a partir de lo anterior se abre el primer condicional "grande" que corresponde a la sección de alimentos procesados
  if(alimento == 1){
  print("A continuación te presentamos una lista de los alimentos procesados de las cuales puedes llenar un reporte: ")
  print(marcas) #esta matriz imprime todos los alimentos procesados por empresas mexicanas que puedes reportar asi como una descripción de lo que abarca el alimento
  
#Una vez identificado el alimento del cual se quiere llenar el reporte con la funci?n readline se pide al usuario que lo seleccione
  seleccion <- readline(prompt = "De la lista anterior escribe el número que corresponde al alimento que quieres reportar (del 1 al 29): ")
  seleccion <- as.numeric(seleccion) #lo anterior se convierte a caracter numerico para que lo reconozca un condicional
  #Aqui inicia la sección de condicionales sobre procesados que contiene la siguiente estructura:
  #por la selección del numero te manda a la lista de marcas contenidas en un vector que procesan ese alimento en mexico
  #se le pide que seleccione la marca de la cual se llenara el reporte
  #despues se pide que escriba tal cual viene en el empaque el lote de elaboración y la fecha de caducidad del producto
  #Viene la opción de escribir NA en los dos casos anteriores, este reporte seria poco valido para el consumidor pero se necesita porque la gente esta demente y no guarda el empaque
  #luego se le da una sección con la función readline para que describa detalladamente los problemas que presentaba el producto
  #Todas las respuestas se guardan como nuevos objetos en R, esperando que puedan llegar a guardarse en la hoja de reporte inicial
  if (seleccion == 1){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Edulcorantes)
    edulcorantes_respuesta <- readline(prompt = "escribela:")
    edulcorantes_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    edulcorantes_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    edulcorantes_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- edulcorantes_respuesta),
                             c(procesados[2,1] <- edulcorantes_lote),
                             c(procesados[3,1] <- edulcorantes_caducidad),
                             c(procesados[4,1] <- edulcorantes_otro))
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
#La anterior estructura se repite para cada una de los 29 productos disponibles
    }else if (seleccion == 2){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Carne_cerdo)
    cerdo_respuesta <- readline(prompt = "escribela:")
    cerdo_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    cerdo_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    cerdo_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- cerdo_respuesta),
                             c(procesados[2,1] <- cerdo_lote),
                             c(procesados[3,1] <- cerdo_caducidad),
                             c(procesados[4,1] <- cerdo_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
 }else if (seleccion == 3){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Concentrados)
    concentrados_respuesta <- readline(prompt = "escribela:")
    concentrados_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    concentrados_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    concentrados_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- concentrados_respuesta),
                             c(procesados[2,1] <- concentrados_lote),
                             c(procesados[3,1] <- concentrados_caducidad),
                             c(procesados[4,1] <- concentrados_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 4){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Salsas)
    salsas_respuesta <- readline(prompt = "escribela:")
    salsas_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    salsas_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    salsas_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- salsas_respuesta),
                             c(procesados[2,1] <- salsas_lote),
                             c(procesados[3,1] <- salsas_caducidad),
                             c(procesados[4,1] <- salsas_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 5){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Condimentos)
    condimentos_respuesta <- readline(prompt = "escribela:")
    condimentos_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    condimentos_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    condimentos_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- condimentos_respuesta),
                             c(procesados[2,1] <- condimentos_lote),
                             c(procesados[3,1] <- condimentos_caducidad),
                             c(procesados[4,1] <- condimentos_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 6){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Comida_preparada)
    preparada_respuesta <- readline(prompt = "escribela:")
    preparada_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    preparada_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    preparada_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- preparada_respuesta),
                             c(procesados[2,1] <- preparada_lote),
                             c(procesados[3,1] <- preparada_caducidad),
                             c(procesados[4,1] <- preparada_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 7){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Lacteos)
    lacteos_respuesta <- readline(prompt = "escribela:")
    lacteos_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    lacteos_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    lacteos_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- lacteos_respuesta),
                             c(procesados[2,1] <- lacteos_lote),
                             c(procesados[3,1] <- lacteos_caducidad),
                             c(procesados[4,1] <- lacteos_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 8){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Conservas)
    conservas_respuesta <- readline(prompt = "escribela:")
    conservas_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    conservas_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    conservas_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- conservas_respuesta),
                             c(procesados[2,1] <- conservas_lote),
                             c(procesados[3,1] <- conservas_caducidad),
                             c(procesados[4,1] <- conservas_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 9){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Frutas_almibar)
    almibar_respuesta <- readline(prompt = "escribela:")
    almibar_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    almibar_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    almibar_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- almibar_respuesta),
                             c(procesados[2,1] <- almibar_lote),
                             c(procesados[3,1] <- almibar_caducidad),
                             c(procesados[4,1] <- almibar_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 10){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Frutas)
    frutas_respuesta <- readline(prompt = "escribela:")
    frutas_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    frutas_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    frutas_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- frutas_respuesta),
                             c(procesados[2,1] <- frutas_lote),
                             c(procesados[3,1] <- frutas_caducidad),
                             c(procesados[4,1] <- frutas_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 11){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Granos)
    granos_respuesta <- readline(prompt = "escribela:")
    granos_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    granos_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    granos_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- granos_respuesta),
                             c(procesados[2,1] <- granos_lote),
                             c(procesados[3,1] <- granos_caducidad),
                             c(procesados[4,1] <- granos_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 12){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Jugos)
    jugos_respuesta <- readline(prompt = "escribela:")
    jugos_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    jugos_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    jugos_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- jugos_respuesta),
                             c(procesados[2,1] <- jugos_lote),
                             c(procesados[3,1] <- jugos_caducidad),
                             c(procesados[4,1] <- jugos_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 13){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Bebidas_azucaradas)
    coca_respuesta <- readline(prompt = "escribela:")
    coca_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    coca_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    coca_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- coca_respuesta),
                             c(procesados[2,1] <- coca_lote),
                             c(procesados[3,1] <- coca_caducidad),
                             c(procesados[4,1] <- coca_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 14){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Verduras)
    verduras_respuesta <- readline(prompt = "escribela:")
    verduras_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    verduras_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    verduras_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- verduras_respuesta),
                             c(procesados[2,1] <- verduras_lote),
                             c(procesados[3,1] <- verduras_caducidad),
                             c(procesados[4,1] <- verduras_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 15){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Chiles_secos)
    chiles_respuesta <- readline(prompt = "escribela:")
    chiles_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    chiles_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    chiles_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- chiles_respuesta),
                             c(procesados[2,1] <- chiles_lote),
                             c(procesados[3,1] <- chiles_caducidad),
                             c(procesados[4,1] <- chiles_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 16){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Aderezos)
    aderezo_respuesta <- readline(prompt = "escribela:")
    aderezo_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    aderezo_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    aderezo_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- aderezo_respuesta),
                             c(procesados[2,1] <- aderezo_lote),
                             c(procesados[3,1] <- aderezo_caducidad),
                             c(procesados[4,1] <- aderezo_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 17){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Sopas)
    sopas_respuesta <- readline(prompt = "escribela:")
    sopas_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    sopas_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    sopas_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- sopas_respuesta),
                             c(procesados[2,1] <- sopas_lote),
                             c(procesados[3,1] <- sopas_caducidad),
                             c(procesados[4,1] <- sopas_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 18){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Pastas)
    pasta_respuesta <- readline(prompt = "escribela:")
    pasta_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pasta_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pasta_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- pasta_respuesta),
                             c(procesados[2,1] <- pasta_lote),
                             c(procesados[3,1] <- pasta_caducidad),
                             c(procesados[4,1] <- pasta_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 19){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Sardina)
    sardina_respuesta <- readline(prompt = "escribela:")
    sardina_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    sardina_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    sardina_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- sardina_respuesta),
                             c(procesados[2,1] <- sardina_lote),
                             c(procesados[3,1] <- sardina_caducidad),
                             c(procesados[4,1] <- sardina_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 20){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Pescados)
    pez_respuesta <- readline(prompt = "escribela:")
    pez_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pez_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pez_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- pez_respuesta),
                             c(procesados[2,1] <- pez_lote),
                             c(procesados[3,1] <- pez_caducidad),
                             c(procesados[4,1] <- pez_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 21){
    print("?A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Carne_res)
    res_respuesta <- readline(prompt = "escribela:")
    res_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    res_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    res_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- res_respuesta),
                             c(procesados[2,1] <- res_lote),
                             c(procesados[3,1] <- res_caducidad),
                             c(procesados[4,1] <- res_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion ==22){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Pures)
    pure_respuesta <- readline(prompt = "escribela:")
    pure_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pure_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pure_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- pure_respuesta),
                             c(procesados[2,1] <- pure_lote),
                             c(procesados[3,1] <- pure_caducidad),
                             c(procesados[4,1] <- pure_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 23){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Cremas)
    cremas_respuesta <- readline(prompt = "escribela:")
    cremas_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    cremas_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    cremas_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- cremas_respuesta),
                             c(procesados[2,1] <- cremas_lote),
                             c(procesados[3,1] <- cremas_caducidad),
                             c(procesados[4,1] <- cremas_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 24){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Pollo)
    pollo_respuesta <- readline(prompt = "escribela:")
    pollo_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pollo_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    pollo_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- pollo_respuesta),
                             c(procesados[2,1] <- pollo_lote),
                             c(procesados[3,1] <- pollo_caducidad),
                             c(procesados[4,1] <- pollo_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 25){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Atun)
    atun_respuesta <- readline(prompt = "escribela:")
    atun_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    atun_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    atun_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- atun_respuesta),
                             c(procesados[2,1] <- atun_lote),
                             c(procesados[3,1] <- atun_caducidad),
                             c(procesados[4,1] <- atun_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 26){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Hongos)
    hongo_respuesta <- readline(prompt = "escribela:")
    hongo_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    hongo_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    hongo_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- hongo_respuesta),
                             c(procesados[2,1] <- hongo_lote),
                             c(procesados[3,1] <- hongo_caducidad),
                             c(procesados[4,1] <- hongo_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 27){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Botanas)
    papa_respuesta <- readline(prompt = "escribela:")
    papa_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    papa_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    papa_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- papa_respuesta),
                             c(procesados[2,1] <- papa_lote),
                             c(procesados[3,1] <- papa_caducidad),
                             c(procesados[4,1] <- papa_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 28){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Caldos)
    caldos_respuesta <- readline(prompt = "escribela:")
    caldos_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    caldos_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    caldos_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- caldos_respuesta),
                             c(procesados[2,1] <- caldos_lote),
                             c(procesados[3,1] <- caldos_caducidad),
                             c(procesados[4,1] <- caldos_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion == 29){
    print("¿A cuál de las siguientes marcas pertenece el producto que compraste?")
    print(Agua)
    awa_respuesta <- readline(prompt = "escribela:")
    awa_lote <- readline(prompt = "Escribe el lote de elaboración del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    awa_caducidad <- readline(prompt = "Escribe la fecha de caducidad del producto tal como viene en la etiqueta o empaque, si no lo sabes escribe NA: ")
    awa_otro <- readline(prompt = "Escribe lo que estaba mal con tu producto (daños en el empaque, contaminadores, mal sabor, etc): ")
    procesados <- data.frame(ncol(1))
    procesados <- data.frame(c(procesados[1,1] <- awa_respuesta),
                             c(procesados[2,1] <- awa_lote),
                             c(procesados[3,1] <- awa_caducidad),
                             c(procesados[4,1] <- awa_otro)) 
    write_sheet(procesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }
  
#Aqui comienza el segundo "gran" condicional correspondiente al cuestionario para alimentos no procesados
#Se le presenta una lista al usuario de todos los alimentos de los cuales puede llenar un reporte
}else if(alimento == 2){
  print("A continuación te presentamos una lista de los alimentos de los cuales puedes llenar un reporte: ")
  print(comida) #imprime la lista de comida o establecimiento numerada del 1 al 16
  seleccion2 <- readline(prompt = "De la lista anterior escribe el número que corresponde al alimento o tipo de establecimiento que quieres reportar (del 1 al 16): ")
  seleccion2 <- as.numeric(seleccion2) #despues de que el usuario selecciona que va a reportar se convierte a caracter numerico
  
  #aqui comienzan 16 condicionales uno por cada numero de la lista anterior
  #cada condicional contiene un vector que a su vez contiene totos los establecimientos registrados que venden ese alimento
  #se le pide al usuario que escriba el establecimiento en el cual lo consumio
  #la fecha en que lo consumio
  #se le da una secci?n libre de quejas del establecimiento o la comida
  #la estructura se repite para cada condicional y se asignan a nuevos objetos para guardarlos en el reporte
  if (seleccion2 == 1){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Pizza)
    pizza_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    pizza_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    pizza_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- pizza_respuesta),
                               c(noprocesados[2,1] <- pizza_fecha),
                               c(noprocesados[3,1] <- pizza_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 2){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Hamburguesas)
    burguer_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    burguer_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    buguer_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- burguer_respuesta),
                               c(noprocesados[2,1] <- burguer_fecha),
                               c(noprocesados[3,1] <- buguer_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 3){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Hotdogs)
    hot_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    hot_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    hot_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- hot_respuesta),
                               c(noprocesados[2,1] <- hot_fecha),
                               c(noprocesados[3,1] <- hot_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 4){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Tacos)
    taco_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    taco_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    taco_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- taco_respuesta),
                               c(noprocesados[2,1] <- taco_fecha),
                               c(noprocesados[3,1] <- taco_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 5){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Mariscos)
    mar_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    mar_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    mar_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- mar_respuesta),
                               c(noprocesados[2,1] <- mar_fecha),
                               c(noprocesados[3,1] <- mar_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 6){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Cafeterias)
    cafe_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    cafe_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    cafe_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- cafe_respuesta),
                               c(noprocesados[2,1] <- cafe_fecha),
                               c(noprocesados[3,1] <- cafe_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 7){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Loncherias)
    lonch_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    lonch_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    lonch_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- lonch_respuesta),
                               c(noprocesados[2,1] <- lonch_fecha),
                               c(noprocesados[3,1] <- loch_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 8){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Gorditas)
    gorda_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    gorda_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    gorda_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- gorda_respuesta),
                               c(noprocesados[2,1] <- gorda_fecha),
                               c(noprocesados[3,1] <- gorda_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 9){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Oriental)
    china_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    china_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    china_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- china_respuesta),
                               c(noprocesados[2,1] <- china_fecha),
                               c(noprocesados[3,1] <- china_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 10){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Carnitas_barbacoa)
    cb_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    cb_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    cb_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- cb_respuesta),
                               c(noprocesados[2,1] <- cb_fecha),
                               c(noprocesados[3,1] <- cb_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 11){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Bares)
    bar_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    bar_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    bar_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- bar_respuesta),
                               c(noprocesados[2,1] <- bar_fecha),
                               c(noprocesados[3,1] <- bar_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 12){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Otros)
    x_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    x_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    x_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- x_respuesta),
                               c(noprocesados[2,1] <- x_fecha),
                               c(noprocesados[3,1] <- x_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 13){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Cortes_carne)
    cortes_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    cortes_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    cortes_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- cortes_respuesta),
                               c(noprocesados[2,1] <- cortes_fecha),
                               c(noprocesados[3,1] <- cortes_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 14){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Pollo)
    pollo_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    pollo_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    pollo_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- pollo_respuesta),
                               c(noprocesados[2,1] <- pollo_fecha),
                               c(noprocesados[3,1] <- pollo_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 15){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Postres)
    postres_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    postres_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    postres_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- postres_respuesta),
                               c(noprocesados[2,1] <- postres_fecha),
                               c(noprocesados[3,1] <- postres_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }else if (seleccion2 == 16){
    print("¿En cuál de los siguientes establecimientos consumiste el alimento?")
    print(Neverias)
    nieve_respuesta <- readline(prompt = "Escribe el establecimiento, si no aparece en la lista escribelo: ")
    nieve_fecha <- readline(prompt = "¿Cuándo lo consumiste?: ")
    nieve_repor <- readline(prompt = "¿Qué estaba mal (el sabor, el lugar, el olor, etc)?: ")
    noprocesados <- data.frame(ncol(1))
    noprocesados <- data.frame(c(noprocesados[1,1] <- nieve_respuesta),
                               c(noprocesados[2,1] <- nieve_fecha),
                               c(noprocesados[3,1] <- nieve_repor))
    write_sheet(noprocesados, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
  }
}
}
reporte()
#___________________________________



#Agradecimiento y comentarios finales
#Pues no hay mucho que agregar nomas es un print
agradecimiento <- print("?Gracias por tu participación!")+
  write_sheet(generales, "https://docs.google.com/spreadsheets/d/1dUsg70JDqwvCleeESV__X_aSJucej_Ln9pHYrlnmzro/edit#gid=0")
#___________________________________

#######
## Ultima modificacion: 21-nov-2021
## Por Carolina ?lvarez
#######