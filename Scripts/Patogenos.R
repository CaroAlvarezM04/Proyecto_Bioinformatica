#PATOGENOS DE IMPORTANCIA ALIMENTARIA

#Salmonella: Se ha informado que, en todo el mundo, hay más de 1300 millones de casos de salmonelosis humana al año, con tres millones de muertes.
  #Controlar la propagación de Salmonella a lo largo de la cadena alimentaria es difícil, particularmente en la producción primaria.
  #Los sintomas incluyen: Náuseas, vómitos, calambres abdominales, diarrea, fiebre, escalofríos, dolor de cabeza, sangre en las heces.
  #Humphrey, T. (2004). Salmonella, stress responses and food safety. Nature Reviews Microbiology, 2(6), 504–509. doi:10.1038/nrmicro907 

#Listeria: Se han notificado brotes de listeriosis en América del Norte, Europa y Japón. Los quesos blandos elaborados con leche cruda y carnes listas para comer son alimentos de alto riesgo para las personas susceptibles.
  #El organismo causante, Listeria monocytogenes, se transmite principalmente a los seres humanos a través de alimentos contaminados.
  #Los sintomas incluyen: Fiebre, escalofríos, dolores musculares, náuseas, diarrea.
  #Swaminathan, B., & Gerner-Smidt, P. (2007). The epidemiology of human listeriosis. Microbes and infection, 9(10), 1236–1243. https://doi.org/10.1016/j.micinf.2007.05.011

#Bacillus cereus: Es responsable de dos tipos de intoxicación alimentaria, la forma emética por intoxicación alimentaria y la forma diarreica que surge de las infecciones alimentarias con cepas enteropatógenas, también conocidas como toxicoinfecciones.
  #El tipo de intoxicación alimentaria diarreica surge después de la producción de enterotoxinas por bacterias viables en el intestino humano.
  #Los sintomas incluyen: Diarreico: diarrea acuosa y calambres abdominales. Emético: náuseas y vómitos.
  #Jessberger, N., Dietrich, R., Granum, P. E., & Märtlbauer, E. (2020). The Bacillus cereus Food Infection as Multifactorial Process. Toxins, 12(11), 701. https://doi.org/10.3390/toxins12110701

#Campylobacter jejuni: es el patógeno bacteriano transmitido por los alimentos más prevalente hasta la fecha en el mundo industrializado.
  #Los reservorios naturales de esta bacteria gramnegativa en forma de espiral son las aves silvestres, cuyos intestinos ofrecen un nicho biológico adecuado para la supervivencia y diseminación de C. jejuni.
  #Los sintomas incluyen: diarrea (frecuentemente sanguinolenta), dolor abdominal, fiebre, dolor de cabeza, náuseas y/o vómitos, y duran por lo general de 3 a 6 días.
  #Dasti, J. I., Tareen, A. M., Lugert, R., Zautner, A. E., & Gross, U. (2010). Campylobacter jejuni: a brief overview on pathogenicity-associated factors and disease-mediating mechanisms. International journal of medical microbiology : IJMM, 300(4), 205–211. https://doi.org/10.1016/j.ijmm.2009.07.002

#Para cada uno de los patogenos se creo un vector para identificar los sintomas que corresponden a la enfermedad que provocan
salmonella <- c("nauseas","vomito","calambres abdominales","diarrea","fiebre","escalofrios","dolor de cabeza","sangre en las heces")
nsal <- c(1,1,1,1,1,1,1,1) #se le asignó un número que sirve para identificar a que patogeno pertenece
names(salmonella)<- nsal #con este nuevo vector se renombró al anterior
salmonella #el proceso se repitio para cada patogeno

listeria <- c("fiebre","escalofrios","dolores musculares","nauseas","diarrea")
nlis <- c(2,2,2,2,2)
names(listeria)<- nlis
listeria

bacillusdiarreico <- c("diarrea acuosa","calambres abdominales")
bacillusemetico <- c("nauseas","vomito")
nbac <- c(3,3)
nbac2 <- c(4,4)
names(bacillusdiarreico)<- nbac
names(bacillusemetico)<- nbac2
bacillusdiarreico
bacillusemetico

campylobacter <- c("diarrea sanguinolenta","dolor abdominal","fiebre","dolor de cabeza","nauseas por mas de 3 días seguidos","vomito")
ncam <- c(5,5,5,5,5,5)
names(campylobacter)<- ncam
campylobacter

#Finalmente se creo un objeto que contiene a cinco patogenos y se transformó en matriz
sintomas <- data.frame(nrow(5))
sintomas[1:8,1]<- salmonella
sintomas[1:5,2]<- listeria
sintomas[1:2,3]<- bacillusdiarreico
sintomas[1:2,4]<- bacillusemetico
sintomas[1:6,5]<- campylobacter
sintomas
#esta matriz será usada en el codigo final

#####

##Carolina Álvarez

##Ultimo cambio: 11 de noviembre de 2021

#####