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
#PLOT
#Ploteo de una serie de tiempo
#Puedo graficar una sola variable o las dos
cars
plot(cars) #por default me grafica puntos
plot(sin,-pi,2*pi) #lo dibuja con linea porq es una funcion

#type el tipo de plot que debe dibujarse. Posibilidades:
plot(cars, type="p")#"p" para puntos,viene por default
plot(cars, type="l")#"l" para lineas,
plot(cars, type="b")#"b" ambos (punto+linea),
plot(cars, type="c")#"c" grafica solo las lineas de la opcion "b",
plot(cars, type="o")#"o" ambos pero sobrepuestos,
plot(cars, type="h")#"h" del tipo ‘histograma’ (o ‘alta-densidad’) de lineas verticales,
plot(cars, type="s") #"s" tipo escalera,
plot(cars, type="S")#"S" otro tipo de pasos ver ‘Details’ de plot,
plot(cars, type="n")#"n" no graficar

#Titulos
plot(cars,type="o",main="Grafico de la variable",sub="cars",xlab="velocidad",ylab="distancia")
#main: El titulo del grafico
#sub: subtitulo del grafico
#xlab: titulo para el eje x
#ylab: titulo para el eje y
#asp: la razon y/x para el aspecto del grafico, see plot.window.Para hacer un grafico proporicionado

#Ejemplo
#Defino dos variables
x<-(0:65)/10 #cada uno de los datos dividido 10
y<-sin(x)

plot(x) #es una recta
plot(x,y) #Dibuja el seno
plot(x, y, main="Función Seno") #pongo titulo
z<-cos(x) #cambio de funcion
plot(x, z, main="Función Coseno")
plot(x, z, main="Función Coseno",type="l")

#Parametros q puedo cambiar
#col: permite modificar colores
#Axes: opciones para los ejes
#frame.plot: trazar un recuadro al grafico
#lty: tipos de lineas.
#lwd: anchos de lineas.
#par: establecer o preguntar parámetros gráficos
#legend: agregar una leyenda al grafico, ej si hay dos variables con 2 colores
#layout: divide espacio a graficar en filas y columnas
#mtext: titulo para eje derecho
#xlim, ylim: cambia el rango de valores de los ejes

plot(x, y, main="Seno", type="l")
plot(x, z, main="Coseno", lty=2, col="red", type="l") #lty=2 es una linea punteada mas grande
plot(x, z, main="Coseno", lty=3, col="blue", type="l", xlim=c(0, 2), ylab="cos(x)") 
#lty=3 es una linea punteada mas chica, tamb le cambie limites al eje x y el titulo al eje y

#Funciones que permiten dibujar sobre un gráfico ya creado:
windows() #Crea una ventana nueva
#points(x, y, ...) #Dibuja una nube de puntos
#lines(x, y, ...) #Dibuja una línea que une todos los puntos
#ablines() #Dibuja una línea recta dada la interc. y pendiente
#polygons(x, y, ...) # Dibuja un polígono cerrado
#text(x, y, labels, ...) # Escribe texto en unas coordenadas
plot(x, y, main="Funciones seno y coseno", type="l")
lines(x, z, col="blue", lty=2) 
text(x=c(0.5, 0.5), y=c(0, 1), labels=c("sin(x)", "cos(x)"),col=c("black", "blue"))

#Funciones graficas interactivas: para completar graficos interactivamente
#locator(): devuelve las coordenadas de los puntos.
plot(x, y, main="Funciones seno y coseno", type="l")
lines(x, z, col=2, lty=2)
legend(locator(1),legend=c("sin(x)","cos(x)"),lty=c(1,2),col=c(1,2)) #pomgo la leyenda tocando en el grafico

#identify(x, y, labels): identifica los puntos con el mouse y escribe la correspondiente etiqueta
x <- 1:10; y <- sample(1:10)
plot(x, y); identify(x, y) #usar ESC para terminar

nombres <- paste("punto", x, ".", y, sep ="")
plot(x, y); identify(x, y, labels=nombres) #usar ESC para termina. Poner nombres

colors() #para ver la lista de colores
demo("colors")
?rainbow
pie(rep(1, 12), col = rainbow(12))
pie(rep(1, 15), col = rainbow(15))
pie(rep(1, 12), col = heat.colors(12))
pie(rep(1, 12), col = terrain.colors(12))
pie(rep(1, 12), col = topo.colors(12))
pie(rep(1, 12), col = cm.colors(12))

#Buscar tonalidades de colores
colors()[grep("red",colors())] # todos los tonos de rojo

#-------------------------------------------------------------------------------
#Script de Colors
