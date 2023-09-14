##################
##################################################################
# # Laboratorio de Procesamiento de Informaci?n Meteorol?gica/Oceanogr?fica
#
# 2? cuatrimestre 2023
##################################################################

###########  CLASE data.frame ALUMNOS
rm(list=ls())
#########################################################

iris #Aparece toda la información
print(iris) #Pasa lo mismo
plot(iris) #La representa graficamente. Hace graficos de dispersion entre las variables que tengo		
summary(iris) #Resumen de la estadística básica. La ultima columna que me habla de las species y me pone 50 de c/u eso despues lo relaciono con los factores. Aca 3 niveles porque son 3 palabras 	
str(iris) #La info de lo q tenes y algunos valores. Tantas observaciones de tantas variables. A las variables les pone $ 			
head(iris) 	
tail(iris) 			

########################################

m <- cbind(ord=1:3, edad=c(30L, 26L, 9L)) #Creo una matriz pegando vectores por columna, ord y edad son los nombres de mis columnas. Con L xq son enteros  
v <- c(1.80, 1.72, 1.05) 

ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v)
ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v,row.names=1) #Hago q el nombre de la primera fila aparezca 

#############################
WORKDIR <- setwd("/home/clinux01/Escritorio/Cande Labo Jueves/")

setwd (WORKDIR)

mitabla <- read.table("Leer_tabla.txt") #Lee los datos y construye una tabla
is.data.frame(mitabla) #pregunto si es un data frame
colnames(mitabla)
rownames(mitabla)

mitabla$Piso #Para ir a la segunda columna del data frame. NombreDataFrame$ColumnaQuieroAcceder.Con eso puedo hacer calcuculo

mitabla[[2]] #Otra forma para acceder a la segunda columna [[n°de columna que quiero entrar]].Con eso puedo hacer calcuculo

mitabla[2] #Otra forma para acceder a la segunda columna pero con todo. Con eso no puedo hacer calcuculo

mitabla[3, 2] #Ingresa al elemento 3 de la segunda fila 

mitabla[3, 2] <- 106 #Le asigno un nuevo valor al elemento 3 de la columna 2
mitabla$Total <- mitabla$Precio * mitabla$Area #Le agrego una columna nueva donde los valores estan datos por la multiplicación entre los valores de las columnas que les di

###########################
#
datosimp <- data.frame(anyos=c(1.3,0.4,1.1,2.3,3.1,1.3),
                       tipo=c(2,3,3,1,3,1),edad=c(22,21,34,42,17,43),
                       sexo=c("H","M","H","H","M","H"))

attach(datosimp) #Para "llamar" una columna sin poner lo de $ y [[]]

detach(datosimp)



datos.hombre.filtrados <- datosimp$anyos[datosimp$sexo=='H'] #Del data frame, me quiero quedar con la columna anyos, con [] me mento dentro de esa columna y le pido los que son de H. En datos.hombre.filtrados guarda los datos de los años de H. Se queda con los elementos donde el factor corresponde a H
mas.peq <- subset(datosimp,anyos<2,select=c(edad,sexo)) #Me quedo con algunas cosas. De todo tu data frame, en anyos quedate con los que son menores a 2 y arma un data frame nuevo con las columnas que son edad y sexo.

attach(datosimp)
edad.final <- edad + anyos #No afecta el Data frame
datosimp <- transform(datosimp, edad.final = edad+anyos) #Si modifica el dataframe
datosimp <- transform(datosimp, edad = edad+1) #Altera la variable



############################################


#ejercicio solos leer consigna


############ nuevo 2023 ###################
rm(list=ls())
aa<-airquality

#Para calcular la temperatura media 
tempmedia<-mean(airquality$Temp)
mean(airquality[[4]])

#Media de mayo
mediamayo<-mean(airquality$Temp[airquality$Month=="5"]) 

#Dia mas ventoso
vientomax<-max(airquality$Wind) #Primero saco el numerico mágico
diamasventoso<-subset(airquality,Wind==vientomax,select=c(Month,Day))
diamasventoso2<-subset(airquality,Wind==max(Wind),select=c(Month,Day,Wind))

#ordenar la información según el criterio de velocidad del viento ascendente
orden.viento<-airquality[order(airquality$Wind,decreasing=TRUE),]
head(orden.viento)

# crear una tabla adicional seleccionando solo 2 de las variables para el mes de mayo.

mayo<-subset(airquality, airquality$Month=="5",select=c(Ozone,Solar.R,Day,Month))
class(mayo)

# graficar estas variables seleccionadas
plot(mayo$Ozone) 

#------------------------------------------------------------------------------
library(reshape) 

head(airquality)

original<-airquality

formato_long<-melt(airquality,id=c("Month","Day")) #Hago reshape con mes y dia. Lo que teniamos encolumnado ahora cambio de forma. Hay veces que para graficar me sirve mas así

formato_long_2<-melt(airquality,id=c("Month"))

formato_long_3<-melt(airquality,id=c("Ozone"))

