#TEORICA DEL 31/10. GRAFICOS

rm(list=ls())
setwd("/home/clinux01/Escritorio/Cande Labo Martes/Clases-Teoricas/")

#barplot Diagrama de barras
#boxplot Diagrama de caja
#contour Gráfico de contorno
#hist Histograma
#pairs Pares de gráficos de dispersión por variables
#plot Rutina de dibujo general
#points y lines Se utilizan para agregar líneas o puntos a un plot.

#-------------------------------------------------------------------------------
#Ploteo de una serie de tiempo: PLOT
#Puedo graficar una sola variable o las dos
cars
plot(cars) #por default me grafica puntos
plot(sin,-pi,2*pi) #lo dibuja con linea porq es una funcion

