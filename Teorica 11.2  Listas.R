##################
##################################################################
# # Laboratorio de Procesamiento de Informacion Meteorologica/Oceanografica
#
# 2? cuatrimestre 2023
rm(list=ls())
##################################################################

##### Clase LISTAS Alumnos

#####################
pp=rnorm(120,mean=20, sd=7) #120 datos con media 20 y desvio 7
hist(pp) #Calculo histograma. Hay un montón de argumentos 
result=hist(pp)
result #Al guardar el histograma en una variable, al pedirla por pantalla me da
#los elmentos que uso el R para hacer el histograma. Breaks son los límites creo.
#Counts es frecuencia del intervalo. Adentro de result tengo variables 
#almacenadas de distintos tipos y longitudes
is.list(result)


hist(pp,freq=TRUE)
hist(pp,freq=FALSE)

result=hist(pp)
###################################
familia <- list("Maria", "Juan", 10, c("Hugo", "Paula"), c(8,6)) #Crea una lista
# [[ ]] es porque les falta nombre. El $ aparece cuando tengo asignado nombres a 
# elementos de la lista

familia <- list(madre="Maria", padre="Juan", casados=10,hijos=c("Hugo", "Paula"), edades=c(8, 6))
#Para ponerle nombre a los elementos. Ahora aparece con $


length(familia) #tiene 5 cosas almacenadas en la lista pero no me importa
#la long particular de cada uno
length(familia$casados) #Para saber la cantidad de elementos guardadas en un 
#elemento de la lista
length(familia$hijos)

#################################

familia$madre #metete en flia, dentro de flia metete en madre y accedo 
#al elemento
familia[["madre"]] #Es lo mismo q antes 	
familia[[4]] #es lo mismo q pedir los nombres de los hijos
familia[[4]][1] #Parate en familia, en el elemento 4, quedate con el primero. No
#es necesario el doble corchete () porque ya estoy dentro
familia[["padre"]] <- "Juan Pedro" #Puedo modificar la lista
familia$padre   		

familia[[4]][3]<-"Ana" #agrego elemntos a mi lista
familia&edades[3]<-1 #Otra forma de agregar.Parate en el elemento, en la
#posición 3 y asignale a esa posición ese valor (aca 1)
familia[[4]][2:3] #Pido ciertos elementos

##################################

familia$cumple<-c("3mar","15oct","31dic","7feb","6ago") #Agrego otro elemento a la lista

################################
lista.ABC <- c(lista.A, lista.B, lista.C) #Junto las distintas listas
################################

mi.lista <- list(a = 1:3, b = c("hola", "adios"),z=matrix(1:4,2,2)) #Una lista
#con una secuencia, un vector y una matriz

mi.lista[1:2] #Me da todo a y todo b (primeros dos elementos)

mi.lista[2] #Me muestra todo b (el segundo elemento) 
mi.lista[[2]] #Ya estoy accediendo a los elementos para trabajar con ellos

is.list(mi.lista[2]) #Si es una lista, con un solo elemento de dos dimensiones
is.list(mi.lista[[2]]) #No es una lista porque ya estoy metida adentro 

#############################################

air<-airquality

lapply(airquality[, 1:4], mean, na.rm = TRUE) #Funcion apply pero para listas.Me
#omite los NA. Sec del 1:4 porque quiero esas columnas. El resultado me lo
#devuelve como lista

sapply(airquality[, 1:4], mean, na.rm = TRUE) #Lo mismo pero cambia la estética

################################################
cc<-list(aa=rbinom(10,30,0.5),bb=runif(100,-8,4))

#Calculo de las medias
media_1<-lapply(cc,mean) #me lo devuelve como lista
media_2<-sapply(cc,mean) 


###############################################
datos1<-read.table("datos_lista.txt",header=TRUE) #Para abrir el archivo. Header=TRUE 
#xq lo quiero con encabezado. Lo muestra como dataframe
datos<-as.list(read.table("datos_lista.txt",header=TRUE)) #Para forzar q sea lista
#La lista me da temperaturas medidas par una boya y calculado por dos modelos (Er y Had)
#Quiero ver la correlacion

corr_BOYA_ErSST<-cor.test(datos$BOYA,datos$ErSST) #Hace correlacion de pearson 
#por default. Correlaciona los datos de boya y el modelo Er. Me devuelve muchos
#elementos. df son gdl, valor de t-student, interv confianza

corr_BOYA_HadSST<-cor.test(datos$BOYA,datos$HadSST) #Hace correlacion de pearson 
#por default. Correlaciona los datos de boya y el modelo Had. Me devuelve muchos
#elementos. df son gdl, valor de t-student, interv confianza

#Quien tiene mayor correlación?
corr_BOYA_ErSST$estimate
corr_BOYA_HadSST$estimate

#Para ver si es significativa
corr_BOYA_ErSST$p.value
corr_BOYA_HadSST$p.value

#Correlaciones segun el ENSO. LN es La Niña, EN es El Niño, N es Neutro
aniosninio<-datos$anio[datos$obs=="EN"] #Me quiero quedar con los años niño
boyaninio<-datos$BOYA[datos$obs=="EN"] #Me quiero quedar con los datos de boya de años niño
HadSSTninio<-datos$HadSST[datos$obs=="EN"] #Me quiero quedar con los datos del modelo Had de años niño

corr_BOYA_HadSST_Ninio<-cor.test(boyaninio,HadSSTninio)


