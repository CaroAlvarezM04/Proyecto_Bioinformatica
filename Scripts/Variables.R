#BASES DE DATOS CRUDOS

#Productos nacionales
productos <- read.csv("Raw data\\Productos.csv", header=TRUE, sep=",")
as.matrix(productos)
#Lugares de comida locales
restaurantes <- read.csv("Raw data\\Restaurantes.csv", header=TRUE, sep=",")
as.matrix(restaurantes)

#En base a los datos obtenidos se generaron una serie de vectores

#VECTORES DE CADA EMPRESA MEXICANA QUE PRODUCEN LOS SIGUIENTES PRODUCTOS:
#Edulcorantes
Edulcorantes <- c(1:18) #vector con el número de marcas
Edulcorantes_marcas <- (productos[,2])#nombre de las marcas tomado de la base de datos
names(Edulcorantes) <- Edulcorantes_marcas #Juntar ambos vectores para asignar un número a cada marca
Edulcorantes #Vector final que se va a usar 

#Carne de cerdo
Carne_cerdo <- c(1:18)
Cerdo_marcas <- c (productos[,3])
names(Carne_cerdo) <- Cerdo_marcas
Carne_cerdo

#Concentrados
Concentrados <- c(1:18)
concentrados_marcas <- c (productos[,4])
names(Concentrados) <- concentrados_marcas
Concentrados

#Salsas
Salsas <- c(1:18)
salsas_marcas <- c (productos[,5])
names(Salsas) <- salsas_marcas
Salsas

#Condimentos y especias
Condimentos <- c(1:16)
condimentos_marcas <- c(productos[1:16,6])
names(Condimentos)<-condimentos_marcas
Condimentos

#Comida preparada
Comida_preparada <- c(1:11)
comida_marcas <- c(productos[1:11,7])
names(Comida_preparada)<-comida_marcas
Comida_preparada

#Lacteos
Lacteos <- c(1:10)
lacteos_marcas <- c(productos[1:10,8])
names(Lacteos)<-lacteos_marcas
Lacteos

#Conservas
Conservas <- c(1:9)
conservas_marcas <- c(productos[1:9,9])
names(Conservas)<-conservas_marcas
Conservas

#Frutas en almibar
Frutas_almibar <- c(1:9)
almibar_marcas <- c(productos[1:9,10])
names(Frutas_almibar)<-almibar_marcas
Frutas_almibar

#Frutas
Frutas <- c(1:9)
frutas_marcas <- c(productos[1:9,11])
names(Frutas)<-frutas_marcas
Frutas

#Granos y semillas
Granos <- c(1:9)
granos_marcas <- c(productos[1:9,12])
names(Granos)<-granos_marcas
Granos

#Jugos
Jugos <- c(1:9)
jugos_marcas <- c(productos[1:9,13])
names(Jugos)<-jugos_marcas
Jugos

#Bebidas azucaradas
Bebidas_azucaradas <- c(1:9)
bebidas_marcas <- c(productos[1:9,14])
names(Bebidas_azucaradas)<- bebidas_marcas
Bebidas_azucaradas

#Verduras
Verduras <- c(1:9)
verduras_marcas <- c(productos[1:9,15])
names(Verduras)<- verduras_marcas
Verduras

#Chiles secos
Chiles_secos <- c(1:8)
chiles_marcas <- c(productos[1:8,16])
names(Chiles_secos) <- chiles_marcas
Chiles_secos

#Aderezos
Aderezos <- c(1:8)
aderezos_marcas <- c(productos[1:8,17])
names(Aderezos) <- aderezos_marcas
Aderezos

#Sopas
Sopas <- c(1:8)
sopas_marcas <- c(productos[1:8,18])
names(Sopas) <- sopas_marcas
Sopas

#Pastas
Pastas <- c(1:8)
pastas_marcas <- c(productos[1:8,19])
names(Pastas) <- pastas_marcas
Pastas

#Sardina enlatada
Sardina <- c(1:7)
sardina_marcas <- c(productos[1:7,20])
names(Sardina) <- sardina_marcas
Sardina

#Pescados y mariscos
Pescados <- c(1:7)
pescado_marcas <- c(productos[1:7,21])
names(Pescados) <- pescado_marcas
Pescados

#Carne de res 
Carne_res <- c(1:7)
res_marcas <- c(productos[1:7,22])
names(Carne_res) <- res_marcas
Carne_res

#Pures de frutas y verduras
Pures <- c(1:5)
pures_marcas <- c(productos[1:5,23])
names(Pures) <- pures_marcas
Pures

#Cremas
Cremas <- c(1:5)
crema_marcas <- c(productos[1:5,24])
names(Cremas) <- crema_marcas
Cremas

#Pollo
Pollo <- c(1:4)
pollo_marcas <- c(productos[1:4,25])
names(Pollo) <- pollo_marcas
Pollo

#Atún
Atun <- c(1:4)
atun_marcas <- c(productos[1:4,26])
names(Atun) <- atun_marcas
Atun

#Champiñones y cuitlacoche
Hongos <- c(1:3)
hongos_marcas <- c(productos[1:3,27])
names(Hongos) <- hongos_marcas
Hongos

#Botanas
Botanas <- c(1:3)
botanas_marcas <- c(productos[1:3,28])
names(Botanas) <- botanas_marcas
Botanas

#Caldos
Caldos <- c(1:3)
caldos_marcas <- c(productos[1:3,29])
names(Caldos) <- caldos_marcas
Caldos

#Agua
Agua <- c(1:2)
agua_marcas <- c(productos[1:2,30])
names(Agua) <- agua_marcas
Agua

#VECTORES DE CADA LUGAR DE COMIDA LOCAL EN SAN LUIS DE LA PAZ:
#Pizzas
Pizza <- c(1:17)#alimento consumido
  marcas_pizza <- c(restaurantes[1:17,1])#vector de los establecimientos que lo venden
names(Pizza)<- marcas_pizza #asignar un numero de identificación al establecimiento
Pizza#vector final que se va a usar

#Hamburguesas
Hamburguesas <-c(1:19)
  marcas_ham <- c(restaurantes[1:19,2])
names(Hamburguesas)<- marcas_ham
Hamburguesas

#Hot dogs
Hotdogs <-c(1:17)
  marcas_hot <- c(restaurantes[1:17,3])
names(Hotdogs)<- marcas_hot
Hotdogs

#Tacos
Tacos <-c(1:17)
  marcas_taco <- c(restaurantes[1:17,4])
names(Tacos)<-marcas_taco
Tacos

#Mariscos
Mariscos <-c(1:17)
  marcas_mar <- c(restaurantes[1:17,5])
names(Mariscos)<-marcas_mar
Mariscos

#Cafeterias
Cafeterias <-c(1:21)
  marcas_cafe <- c(restaurantes[1:21,6])
names(Cafeterias)<-marcas_cafe
Cafeterias

#Loncherias
Loncherias <-c(1:15)
marcas_lonc <- c(restaurantes[1:15,7])
names(Loncherias)<- marcas_lonc
Loncherias

#Gorditas
Gorditas <-c(1:10)
  marcas_gor <- c(restaurantes[1:10,8])
names(Gorditas)<-marcas_gor
Gorditas

#Comida oriental
Oriental <-c(1:4)
marcas_ori <- c(restaurantes[1:4,9])
names(Oriental)<-marcas_ori
Oriental

#Carnitas y barbacoa
Carnitas_barbacoa <-c(1:18)
  marcas_car <- c(restaurantes[1:18,10])
names(Carnitas_barbacoa) <- marcas_car
Carnitas_barbacoa

#Bares
Bares <- c(1:18)
  marcas_bar <- c(restaurantes[1:18,11])
names(Bares)<-marcas_bar
Bares

#Otros restaurantes
Otros <-c(1:21)
  marcas_otros <- c(restaurantes[1:21,12])
names(Otros)<- marcas_otros
Otros

#Cortes de carne
Cortes_carne <-c(1:7)
  marcas_cortes <- c(restaurantes[1:7,13])
names(Cortes_carne)<- marcas_cortes
Cortes_carne

#Pollerias
Pollo <-c(1:15)
  marcas_pollo <- c(restaurantes[1:15,14])
names(Pollo)<- marcas_pollo
Pollo

#Postres
Postres <-c(1:19)
  marcas_pos <- c(restaurantes[1:19,15])
names(Postres)<- marcas_pos
Postres

#Neverias
Neverias <-c(1:7)
  marcas_nie <- c(restaurantes[1:7,16])
names(Neverias)<- marcas_nie
Neverias


#LISTA DE VECTORES FINALES USADOS COMO VARIABLES:
#Productos procesados de marcas nacionales
Edulcorantes #incluye cualquier alimento que sirva como aditivo alimenticio
Carne_cerdo #carne de cerdo empaquetada que debe permanecer en refrigeración
Concentrados #concentrado de frutas y verduras al cual se le ha eliminado parte del agua
Salsas #mezcla liquida de ingredientes liquida o semiliquida
Condimentos #sustancia que se le añade a la comida para darle mas sabor o hacerla mas gustosa
Comida_preparada #comida empaquetada lista para comer o que solo requiere aplicar calor
Lacteos #cualquier producto derivado de la leche
Conservas #mermeladas, ates, aceitunas y cualquier otro alimento en conserva
Frutas_almibar #frutas enlatadas que usa como conservante al azucar o almibar
Frutas #cualquier fruta que se vende sea empaquetadas o no y requiere conservación
Granos #granos y semillas como las leguminosas que no se venden a granel sino empaquetadas
Jugos #bebidas azucaradas hechas a base de pulpa de frutas
Bebidas_azucaradas #refrescos, coca cola y otras bebidas endulzadas
Verduras #cualquier verdura que se vende empaquetada o requiere conservación
Chiles_secos #chiles secos enteros o molidos que requieren conservación
Aderezos #complemento alimenticio para saborizar una preparación gastronomica
Sopas #solo requiere calentarse para ser consumido
Pastas #pasta seca que requiere cocimiento para ser consumida
Sardina #sardinas enlatadas o en conserva
Pescados #cualquier pescado o marisco que requiere refrigeración y no se vende a granel
Carne_res #cualquier corte de carne de res que requiere refrigeración y no se vende a granel
Pures #preparación de hortalizas, frutas u otros alimentos cocidos y triturados
Cremas #alimento cremoso hecho a base de vegatales u otro alimento
Pollo #cualquier pieza derivada del pollo que requiere refrigeración y no se vende a granel
Atun #atun enlatado o en conserva con aceite o listo para comer
Hongos #champiñones, cuitlacoche y otros hongos empaquetados
Botanas #alimentos empaquetados para satisfacer temporalmente el hambre
Caldos #cualquier alimento o el estracto de este en presentación liquida que requiere conservación
Agua #agua purificada embotellada

marcas <- c("Edulcorantes: incluye cualquier alimento que sirva como aditivo alimenticio",
  "Carne de cerdo: carne de cerdo empaquetada que debe permanecer en refrigeración",
  "Concentrados: concentrado de frutas y verduras al cual se le ha eliminado parte del agua",
  "Salsas: mezcla liquida de ingredientes liquida o semiliquida",
  "Condimentos: sustancia que se le añade a la comida para darle mas sabor o hacerla mas gustosa",
  "Comida preparada: comida empaquetada lista para comer o que solo requiere aplicar calor",
  "Lacteos: cualquier producto derivado de la leche",
  "Conservas: mermeladas, ates, aceitunas y cualquier otro alimento en conserva",
  "Frutas en almibar: frutas enlatadas que usa como conservante al azucar o almibar",
  "Frutas: cualquier fruta que se vende sea empaquetadas o no y requiere conservación",
  "Granos: granos y semillas como las leguminosas que no se venden a granel sino empaquetadas",
  "Jugos: bebidas azucaradas hechas a base de pulpa de frutas", 
  "Bebidas azucaradas: refrescos, coca cola y otras bebidas endulzadas",
  "Verduras: cualquier verdura que se vende empaquetada o requiere conservación",
  "Chiles secos: chiles secos enteros o molidos que requieren conservación",
  "Aderezos: complemento alimenticio para saborizar una preparación gastronomica",
  "Sopas: solo requiere calentarse para ser consumido",
  "Pastas: pasta seca que requiere cocimiento para ser consumida",
  "Sardina: sardinas enlatadas o en conserva",
  "Pescados: cualquier pescado o marisco que requiere refrigeración y no se vende a granel",
  "Carne de res: cualquier corte de carne de res que requiere refrigeración y no se vende a granel",
  "Pures: preparación de hortalizas, frutas u otros alimentos cocidos y triturados",
  "Cremas: alimento cremoso hecho a base de vegatales u otro alimento",
  "Pollo: cualquier pieza derivada del pollo que requiere refrigeración y no se vende a granel",
  "Atun: atun enlatado o en conserva con aceite o listo para comer",
  "Hongos: champiñones, cuitlacoche y otros hongos empaquetados",
  "Botanas: alimentos empaquetados para satisfacer temporalmente el hambre",
  "Caldos: cualquier alimento o el estracto de este en presentación liquida que requiere conservación",
  "Agua: agua purificada embotellada")
marcas <- as.list(marcas)
marcas

#Productos no procesados locales
Pizza
Hamburguesas
Hotdogs
Tacos
Mariscos
Cafeterias
Loncherias
Gorditas
Oriental
Carnitas_barbacoa
Bares
Otros
Cortes_carne
Pollo
Postres
Neverias

comida <- c("Pizza","Hamburguesas","Hotdogs",
                       "Tacos","Mariscos","Cafeterias",
                       "Loncherias","Gorditas","Oriental",
                       "Carnitas/barbacoa","Bares","Otros",
                       "Cortes de carne","Pollo","Postres",
                       "Neverias")
comida <- as.list(comida)
comida

#####

##Carolina Álvarez

##Ultimo cambio: 10 de noviembre de 2021

#####