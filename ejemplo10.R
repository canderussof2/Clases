#################################################
# ejemplo10.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2021
################################################# 

# Leer la serie del tiempo de El Ni?o3: ninio3_19701999.Rdata 
# 
# Corroborar la lectura del archivo ploteando la serie
# plot(variable)
#
# Calcular la serie de las medias mensuales (generar una serie de 12 tiempos) 
# Verificar su forma ploteandola 
#
# Grabar la nueva serie en formato R, bajo el nombre: ninio312_19701999.Rdata 
#
# Liberar la memoria y corroborar el correcto guardado de la serie re-leyendola y ploteandola nuevamente
###############################################################

#dos formas iguales de cargar los datos. En la primera en DATA guardo el "camino"

DATA <- "/home/clinux01/Escritorio/Cande Labo Jueves"
datos=paste(DATA,"ninio3_19701999.RData",sep="")
# en esta forma escribo el "camino" en la misma sentencia
datos="home/clinux01/Escritorio/Cande Labo Jueves/ninio3_19701999.Rdata"
load(datos);

ls.str() #La persona que genero el archivo al guardar la variable dentro del 
         #archivo le puso datos_ninio

plot(datos_ninio)     #grafica puntos, diagrama de dispersion
plot(datos_ninio,type="l")   #grafica una linea uniendo los puntos
plot(datos_ninio,type="l",col="green")   #grafica una linea verde
plot(datos_ninio,type="b",col="green")   #grafica una linea y puntos verde

#Reescribo el vector en una matriz donde cada columna es un mes y las filas los a?os

###COMO LO HAGO?????
# El vector esta ordenado un mes abajo del otro hasta terminar un a?o y luego comienza el siguiente

ninio_3=matrix(datos_ninio,ncol=30)
ninio_3=aperm(ninio_3)


ninio_3_mean=colMeans(ninio_3,na.rm=TRUE)
barplot(ninio_3_mean,col="red")

save(ninio_3_mean,file="D:/00_Facultad/Docencia/Computacion_2020/clases_2020/ninio3mensual_19701999.Rdata")
rm(list=ls())
load("D:/00_Facultad/Docencia/Computacion_2020/clases_2020/ninio3mensual_19701999.Rdata")
ls.str()
barplot(ninio_3_mean,col="green")


