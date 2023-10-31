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
#-------------------------------------------------------------------------------
#axes: un valor logico indicando si ambos ejes deben ser dibujados. Usar parametro grafico
#“xaxt” o “yaxt” para eliminar uno de los ejes.
#frame.plot: logical, indicando si se debe trazar un recuadro al grafico. Default TRUE
#lty: un vector con tipos de lineas.
#lwd: un vector con anchos de lineas. Numeros positivos, default 1.
#0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash
x<--10:10
plot(x,type="l",lty=2,lwd=4,col="deeppink")

#PAR
#puede ser usado para establecer o preguntar por parámetros gráficos. Escribir
#en la consola par() devuelve los valores de los parámetros

#bg: El color de fondo del área de graficado
#fg: El color del “foreground” de los gráficos. Es el color que se usa por
#default en los ejes, cajas alrededor de los gráficos, etc.
#fig: Un vector numérico del tipo c(x1, x2, y1, y2) que da las coordenadas
#(NDC) de la figura en la región de display. Si se establecen estos valores
#se inicia un nuevo grafico, para agregar al grafico existente usar
#también new = TRUE.
#mai: Un vector numérico del tipo c(inferior, izquierdo, superior, derecho)
#que especifica el tamaño de los márgenes en pulgadas.
#mar: idem mai pero en lugar de pulgadas numero de líneas. Default c(5, 4, 4, 2) + 0.1.
#oma: Un vector del tipo c(inferior, izquierdo, superior, derecho) dando el
#tamaño de los márgenes externos en líneas de texto.
#omd: Un vector del tipo c(x1, x2, y1, y2) dando la región dentro de los márgenes
#exteriores en NDC (= normalized device coordinates), i.e., como una fracción (in [0, 1]) de la región.
#omi: Un vector del tipo c(inferior, izquierdo, superior, derecho)
#dando el tamaño de los márgenes externos en pulgadas.

#LEGEND: Esta funcion puede ser usada para agregar una leyenda al grafico.

#LAYOUT: divide el dispositivo en tantas filas y columnas como aparecen en la matriz mat, con
#los anchos de las columnas y las alturas de las filas especificadas en sus respectivos argumentos.
#layout(mat, widths = rep.int(1, ncol(mat)), heights = rep.int(1, nrow(mat)), respect = FALSE)
#layout.show(n = 1) #grafica (parte de) la disposicion actual, esquema de las n figuras.
#lcm(x) # tomar x como el numero de centimetr

#EJEMPLO 1
layout(matrix(c(1,1,0,2), 2, 2, byrow = TRUE))
layout.show(2)
x<-array(rnorm(100),c(100,4)) #datos a graficar.
titulo<-c("Figura1","Figura 2","Figura 3","Figura 4") #Titulo de c/ graf indiv
for(k in 1:4){
  plot(x[,k], type="l", col="darkblue", lwd=2,
       ylab="variable",xlab="tiempo",xlim=c(0,100),ylim =c(-3,3) )
  title(main=(titulo[k]), line=1, cex.main=1.2)
  }

#EJEMPLO 2
nf <- layout(matrix(c(1,1,0,2), 2, 2, byrow = TRUE), respect = TRUE) 
#igual a la anterior salvo respect, relaciones entre altos y anchos
layout.show(nf)

#EJEMPLO 3
# crea una sola figura de 5cm x 5cm.#le especifico el alto y el ancho de la figura
nf <- layout(matrix(1), widths = lcm(5), heights = lcm(5)) 
layout.show(nf)

