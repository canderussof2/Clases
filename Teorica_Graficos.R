#TEORICA DEL 31/10. GRAFICOS

rm(list=ls())
#setwd("/home/clinux01/Escritorio/Cande Labo Martes/Clases-Teoricas/")
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/Practica_4/")

#barplot Diagrama de barras
#boxplot Diagrama de caja
#contour GrÃ¡fico de contorno
#hist Histograma
#pairs Pares de grÃ¡ficos de dispersiÃ³n por variables
#plot Rutina de dibujo general
#points y lines Se utilizan para agregar lÃ­neas o puntos a un plot.

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
plot(cars, type="h")#"h" del tipo â€˜histogramaâ€™ (o â€˜alta-densidadâ€™) de lineas verticales,
plot(cars, type="s") #"s" tipo escalera,
plot(cars, type="S")#"S" otro tipo de pasos ver â€˜Detailsâ€™ de plot,
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
plot(x, y, main="FunciÃ³n Seno") #pongo titulo
z<-cos(x) #cambio de funcion
plot(x, z, main="FunciÃ³n Coseno")
plot(x, z, main="FunciÃ³n Coseno",type="l")

#Parametros q puedo cambiar
#col: permite modificar colores
#Axes: opciones para los ejes
#frame.plot: trazar un recuadro al grafico
#lty: tipos de lineas.
#lwd: anchos de lineas.
#par: establecer o preguntar parÃ¡metros grÃ¡ficos
#legend: agregar una leyenda al grafico, ej si hay dos variables con 2 colores
#layout: divide espacio a graficar en filas y columnas
#mtext: titulo para eje derecho
#xlim, ylim: cambia el rango de valores de los ejes

plot(x, y, main="Seno", type="l")
plot(x, z, main="Coseno", lty=2, col="red", type="l") #lty=2 es una linea punteada mas grande
plot(x, z, main="Coseno", lty=3, col="blue", type="l", xlim=c(0, 2), ylab="cos(x)") 
#lty=3 es una linea punteada mas chica, tamb le cambie limites al eje x y el titulo al eje y

#Funciones que permiten dibujar sobre un grÃ¡fico ya creado:
windows() #Crea una ventana nueva
#points(x, y, ...) #Dibuja una nube de puntos
#lines(x, y, ...) #Dibuja una lÃ­nea que une todos los puntos
#ablines() #Dibuja una lÃ­nea recta dada la interc. y pendiente
#polygons(x, y, ...) # Dibuja un polÃ­gono cerrado
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
#â€œxaxtâ€? o â€œyaxtâ€? para eliminar uno de los ejes.
#frame.plot: logical, indicando si se debe trazar un recuadro al grafico. Default TRUE
#lty: un vector con tipos de lineas.
#lwd: un vector con anchos de lineas. Numeros positivos, default 1.
#0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash
x<--10:10
plot(x,type="l",lty=2,lwd=4,col="deeppink")

#PAR
#puede ser usado para establecer o preguntar por parÃ¡metros grÃ¡ficos. Escribir
#en la consola par() devuelve los valores de los parÃ¡metros

#bg: El color de fondo del Ã¡rea de graficado
#fg: El color del â€œforegroundâ€? de los grÃ¡ficos. Es el color que se usa por
#default en los ejes, cajas alrededor de los grÃ¡ficos, etc.
#fig: Un vector numÃ©rico del tipo c(x1, x2, y1, y2) que da las coordenadas
#(NDC) de la figura en la regiÃ³n de display. Si se establecen estos valores
#se inicia un nuevo grafico, para agregar al grafico existente usar
#tambiÃ©n new = TRUE.
#mai: Un vector numÃ©rico del tipo c(inferior, izquierdo, superior, derecho)
#que especifica el tamaÃ±o de los mÃ¡rgenes en pulgadas.
#mar: idem mai pero en lugar de pulgadas numero de lÃ­neas. Default c(5, 4, 4, 2) + 0.1.
#oma: Un vector del tipo c(inferior, izquierdo, superior, derecho) dando el
#tamaÃ±o de los mÃ¡rgenes externos en lÃ­neas de texto.
#omd: Un vector del tipo c(x1, x2, y1, y2) dando la regiÃ³n dentro de los mÃ¡rgenes
#exteriores en NDC (= normalized device coordinates), i.e., como una fracciÃ³n (in [0, 1]) de la regiÃ³n.
#omi: Un vector del tipo c(inferior, izquierdo, superior, derecho)
#dando el tamaÃ±o de los mÃ¡rgenes externos en pulgadas.

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

#EJEMPLO 4
#Crea un scatterplot con histogramas en los margenes
x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks = seq(-3,3,0.5), plot = FALSE) #construyo hist pero no grafico
yhist <- hist(y, breaks = seq(-3,3,0.5), plot = FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3, 3)
yrange <- c(-3, 3)
nf <- layout(matrix(c(2,0,1,3),2,2,byrow = TRUE), c(3,1), c(1,3), TRUE)
#primero las dim del ancho y desp la del alto. Graf 1 mide 3x3, el 2 mide 1x3 y el graf 3 mide 3x1
layout.show(nf)
par(mar = c(3,3,1,1))  #margenes del 1 graf
plot(x, y, xlim = xrange, ylim = yrange, xlab = "", ylab = "") #lo q grafico en el 1 gráfico. Defino rangos y digo q no ponga etiquetas
par(mar = c(0,3,1,1)) #margenes del 2 graf
barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0) #grafico histograma con barplot, sin ejes, defino lim para eje x y sin espacio entre barritas
par(mar = c(3,0,1,1))
barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0, horiz = TRUE) #grafico histograma con barplot, sin ejes, defino lim para eje x y sin espacio entre barritas y en horizontal (el default es vertical)

#-------------------------------------------------------------------------------
#FIGURAS EN VARIOS PANELES
#VOY A GRAFICAR 4 SERIES EN UNA HOJA (DOS FILAS Y DOS COLUMNAS)
x<-array(rnorm(100),c(100,4)) #creo los datos a graficar. Replico los 100 datos en 4 columnas
titulo<-c("Figura1","Figura 2","Figura 3","Figura 4") #Titulo de cada grafico individual
par(fig=c(0,1,0,1), omi=c(0.05,0.15,0,0.05),mai=c(0.6,0.6,0.6,0.5)) 
# Region de la Figura dentro de la region display (x1,x2,y1,y2)
# margenes globales en pulgadas (inferior, izquierdo, superior, derecho)
# margenes del subplot en pulgadas (inf izq, superior, derecho)
layout(matrix(1:4, 2, 2, byrow= TRUE))
for(k in 1:4){
  plot(x[,k], type="l", col="darkblue", lwd=2,
       ylab="variable",xlab="tiempo",xlim=c(0,100),ylim=c(-3,3) )
  title(main=(titulo[k]), line=1, cex.main=1.2)
  abline(v=20,lty=2,col="grey"); abline(v=40,lty=2,col="grey");
  abline(v=60,lty=2,col="grey")
} #abline son las lineas verticales punteadas

#-------------------------------------------------------------------------------
#CURVE: graficar funciones curvas creo
#curve(expr, from = NULL, to = NULL, n = 101, add = FALSE, type = "l", xname = "x", xlab = xname, ylab = NULL, log = NULL, xlim = NULL, ...)
#Traza una curva correspondiente a la función sobre el intervalo [desde, hasta].
#curve también puede graficar una expresión en la variable xname, default x.
#expr: el nombre de una función, o una expresión escrita como una función de x que será evaluada a un objeto de la misma longitud que x
#x: una función numérica de R ‘vectorizada’.
#y: alias para from para compatibilidad con plot
#from, to: el rango sobre el cual se debe realizar el gráfico.
#n: integer; el número de valores de x ha ser evaluados.
#add: logical; si TRUE agregar un gráfico ya existente; si NA comenzar un nuevo grafico tomando los defaults para los límites y la escala logaritmica del eje x del grafico previo. Es FALSE (y devuelve un warning si se coloca otra opcion) si no hay un grafico abierto.
#xlim: NULL o un vector numeric de length 2; si non-NULL provee el defaultde c(from, to) y, salvo que add = TRUE, selecciona los limites en x para el grafico.
#type: plot type: ver plot.default.
#xname: una cadena de caracteres dando el nombre para el eje x.
#xlab, ylab, log, ...: etiquetas y parametros graficos que pueden ser especificados como argumentos
#Para el "function" de plot, ... No puede incluir expr
curve(sin, -2*pi, 2*pi, xname = "t")
curve(tan, xname = "t", add = NA, main = "curve(tan) --> same x-scale as previous plot")

#-------------------------------------------------------------------------------
#BARPLOT: Crea un grafico de barras con barras horizontales o verticales.
require(grDevices) # librería para colores
#Ej 1
tN <- table(Ni <- stats::rpois(100, lambda = 5))
#genera datos al azar usando la funcion de poisson media 5
r <- barplot(tN, col = rainbow(20))
#- type = "h" plotting *is* 'bar'plot
lines(r, tN, type = "h", col = "red", lwd = 2) #lines siempre superpone sobre un graf preexistente 

#Ej 2
#No especifica colores, usa gris
barplot(tN, space = 1.5, axisnames = FALSE, sub = "barplot(..., space= 1.5, axisnames = FALSE)")

#Ej 3
mp <- barplot(VADeaths) # default
tot <- colMeans(VADeaths)
text(mp, tot + 3, format(tot), xpd = TRUE, col = "blue") #agrego el valor medio

#Ej 4: EJEMPLO DE BARRAS RAYADAS
barplot(VADeaths, angle = 15+10*1:5, density = 20, col = "black", legend = rownames(VADeaths)) #angle me va cambiando el angulo de las lineas de acuerdo al valor. density me da la cantidad de lineas
title(main = list("Death Rates in Virginia", font = 4))

#-------------------------------------------------------------------------------
#GRAFICOS EN DOS EJES

x<-array(rnorm(100),c(100,4))
par(fig=c(0,1,0,1), # Region de la figura en el display device (x1,x2,y1,y2)
    omi=c(0.05,0.9,0,0.3)) # margenes globales en pulgadas (abajo, izq, sup, derecha)
plot(x[,1], type="l", col="darkblue", lwd=3, ylab="variable 1",xlab="Tiempo", xlim=c(0,100), ylim =c(-3,3) )
title(main=("Grafico en dos ejes"), font=2, line=1, cex.main=1.2)
par(new=TRUE) #para graficar sobre la figura anterior
barplot(x[,3]*x[,1], col="darkred",lwd=2, yaxt="n", ylab="",xaxt="n", xlab="",cex.axis=1.0 )
axis(4, cex.axis=1.0) # Valores en el eje derecho. 4 porque es a la derecha
mtext("variable 2", side=4, line=2, col="darkred", cex=1.0) # Texto para el eje derecho

#-------------------------------------------------------------------------------
#BOXPLOT
#Forma 1
x<-rnorm(100)
boxplot(x)

#para matrices, uno por cada col de la matriz
x<-array(rnorm(100),c(100,5))
boxplot(x)

boxplot(x,notch=TRUE) #notch ajusta la cintura de la mediana
title(main="notch=TRUE")

#-------------------------------------------------------------------------------
#GRAFICOS ESPACIALES

#GRAFICO DE ISOLINEAS
#CONTOUR: Crear un grafico de contornos o agregar contornos a un grafico ya existente

#EJEMPLO 1
x <- -6:16
op <- par(mfrow = c(2, 2),mai=c(0.4,0.4,0.4,0.4))
contour(outer(x, x), method = "edge", vfont = c("sans serif", "plain")) #edge es uno de los metodos para interpolar los datos
z <- outer(x, sqrt(abs(x)), FUN = "/")
image(x, x, z) #grafica en colores
contour(x, x, z, col = "pink", add = TRUE, method = "edge", vfont = c("sans serif", "plain")) #add =T me grafica sobre el grafico anterior
contour(x, x, z, ylim = c(1, 6), method = "simple", labcex = 1, xlab = quote(x[1]), ylab = quote(x[2])) #cambia los limites de y
contour(x, x, z, ylim = c(-6, 6), nlev = 20, lty = 2, method = "simple", main = "20 levels; \"simple\" labelling method",cex.main=0.8)

#EJEMPLO 2
#volcano. Datos de R. lineas de altura q tiene un volcan
rx <- range(x <- 10*1:nrow(volcano)) 
ry <- range(y <- 10*1:ncol(volcano))
ry <- ry + c(-1, 1) * (diff(rx) - diff(ry))/2
tcol <- terrain.colors(12)
opar <- par(pty = "s", bg = "lightcyan") #bg le da color al fondo
par(opar)
plot(x = 0, y = 0, type = "n", xlim = rx, ylim = ry, xlab = "", ylab = "")
#hasta aca grafica un cuadrado en blanco
u <- par("usr")
rect(u[1], u[3], u[2], u[4], col = tcol[8], border = "red") 
contour(x, y, volcano, col = tcol[2], lty = "solid", add = TRUE, vfont = c("sans serif", "plain"))
title("A Topographic Map of Maunga Whau", font = 4)
abline(h = 200*0:4, v = 200*0:4, col = "lightgray", lty = 2, lwd = 0.1)

#EJEMPLO 3 Correrlo linea por linea
## contourLines produce las mismas lineas de contorno que contour
plot(x = 0, y = 0, type = "n", xlim = rx, ylim = ry, xlab = "", ylab = "")
u <- par("usr")
rect(u[1], u[3], u[2], u[4], col = tcol[8], border = "red")
contour(x, y, volcano, col = tcol[1], lty = "solid", add = TRUE, vfont = c("sans serif", "plain"))
line.list <- contourLines(x, y, volcano)
invisible(lapply(line.list, lines, lwd=3, col=adjustcolor(2, .3)))
par(opar)

#-------------------------------------------------------------------------------
#FILLED.CONTOUR: Esta función produce un grafico de contornos con las áreas entre los contornos rellenas con un color solido. Se muestra la escala de colores a la derecha del graficO

#EJEMPLO 1
require(grDevices) # for colours
filled.contour(volcano, color = terrain.colors, asp = 1) #ASP= 1 HACE Q EL EJE X Y EL EJE Y SEAN PROPORCIONALES

#EJEMPLO 2
x <- 10*1:nrow(volcano)
y <- 10*1:ncol(volcano)
filled.contour(x, y, volcano, color = terrain.colors,
               plot.title = title(main = "The Topography of Maunga Whau",
                                  xlab = "Meters North", ylab = "Meters West"),
               plot.axes = { axis(1, seq(100, 800, by = 100))
                 axis(2, seq(100, 600, by = 100)) },
               key.title = title(main = "Height\n(meters)"),
               key.axes = axis(4, seq(90, 190, by = 10)))
#keytitle me habla del titulo de la leyenda, keyavex me define como quiero q sean los ejes
mtext(paste("filled.contour(.) from", R.version.string),
      side = 1, line = 4, adj = 1, cex = .66) #agrega el texto de abajo q habla de R

#-------------------------------------------------------------------------------
#ejemplo 15.R se grafican sombreado e isolineas.

#-------------------------------------------------------------------------------
#PLOTEAR UNA SUPERFICIE EN 3D
#SURF3D: grafica una superficie en 3-D con una variable de color.
#ver EJEMPLO 16

#-------------------------------------------------------------------------------
#GUARDAR ARCHIVITOS
x<-1:36
y<-sqrt(x)
jpeg("Grafico.jpg") #toma todas las opciones default
plot(x,y,type="l",xlab="x",ylab="y", main="Parabola y=x^2", col="red")
dev.off() #cierra el archivo. IMPORTANTISIMO

#EJEMPLO
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/Practica_4/")
# Generar los gráficos de Ejemplos de Rectángulos en RStudio
example(rect)
# Generar los gráficos de Ejemplos de Rectángulos como JPEG
jpeg(file = "myplot.jpeg")
example(rect)
dev.off() #guarda solo la ultima imagen 
# Abrir el archivo y ver lo generado
# Repetir lo anterior pero cambiando el nombre del archivo como se ve abajo
jpeg(file = "myplot%02d.jpeg")
example(rect)
dev.off() #Ahora si me genero dos archivos diferentes

#-------------------------------------------------------------------------------
#POINTS:es una funcion generica que dibuja una sequencia de puntos en las coordenadas especificadas. Los caracteres se dibujan centrados en las coordenadas

#Script plotsymbols.r
#Esta funcion genera graficos con distintos simbolos para usar con POINTS
pchShow <-function(extras = c("*",".", "o","O","0","+","-","|","%","#"),
           cex = 3, ## good for both .Device=="postscript" and "x11"
           col = "red3", bg = "gold", coltext = "brown", cextext = 1.2,
           main = paste("plot symbols :  points (...  pch = *, cex =",
                        cex,")"))
  {
    nex <- length(extras)
    np  <- 26 + nex
    ipch <- 0:(np-1)
    k <- floor(sqrt(np))
    dd <- c(-1,1)/2
    rx <- dd + range(ix <- ipch %/% k)
    ry <- dd + range(iy <- 3 + (k-1)- ipch %% k)
    pch <- as.list(ipch) # list with integers & strings
    if(nex > 0) pch[26+ 1:nex] <- as.list(extras)
    plot(rx, ry, type = "n", axes  =  FALSE, xlab = "", ylab = "", main = main)
    abline(v = ix, h = iy, col = "lightgray", lty = "dotted")
    for(i in 1:np) {
      pc <- pch[[i]]
      ## 'col' symbols with a 'bg'-colored interior (where available) :
      points(ix[i], iy[i], pch = pc, col = col, bg = bg, cex = cex)
      if(cextext > 0)
        text(ix[i] - 0.3, iy[i], pc, col = coltext, cex = cextext)
    }
  }

pchShow()
pchShow(c("o","O","0"), cex = 2.5)
pchShow(NULL, cex = 4, cextext = 0, main = NULL)

#EJEMPLO 2: PCH dentro de la funcion plot
op <- par(bg = "light green")
x <- seq(0, 2*pi, len = 51)
plot(x, sin(x), type = "o", pch = 24, bg="cyan",col = "blue", cex = .8)
par(op)

#-------------------------------------------------------------------------------
#PLOTEAR UNA MATRIZ
#image.plot: esta incluida en el paquete fields que no es parte del R basico, por lo tanto debo cargar la librería con require(fields)
#La estrategia para image.plot es simple, dividir la región de graficado en dos regiones: bigplot y smallplot. La imagen se ubica en una y la leyenda en la otra, de esta forma siempre hay lugar para la leyenda. Algunos ajustes pueden hacerse a esta regla, como no achicar bigplot si ya hay lugar para leyenda, y además ubicar la leyenda cerca de la imagen dibujada. Uno puede especificar explícitamente las regiones con las opciones bigplot y smallplot si los valores por default no funcionan

require(fields)

#EJEMPLO 1
x<- 1:10 #datos 
y<- 1:15 #datos
z<- outer( x,y,"+") #coordenadas
image.plot(x,y,z) #creo la imagen
#o bien creando una lista y poniendo etiquetas
obj<- list( x=x,y=y,z=z)
image.plot(obj, legend.lab="Sverdrups")
#identifico algunos puntos sobre la imagen
points( 5:12, 5:12, pch="X", cex=3)

#EJEMPLO 2
brk<- quantile( c(z)) #calculo los cuartiles de z
#grafico poniendo puntos de corte, paleta de colores rainbow y 4 colores, etiquetas a la barra de colores
image.plot(x,y,z, breaks=brk, col=rainbow(4), lab.breaks=names(brk))

#EJEMPLO 3
#Defino una paleta de 12 colores que guardo en colorTable
blues<- designer.colors(6, c( "blue", "white") )
reds <- designer.colors(6, c( "white","red") )
colorTable<- c( blues[-6], reds) #quito el blanco del azul que se repite tambien en el rojo. La cantidad de colores es uno menos que los breakpoints
#genero los puntos de corte, 6 para el azul y 6 para rojo
brks<- c(seq( 1, 10,,6), seq( 17, 25,,6))
image.plot( x,y,z,breaks=brks, col=colorTable)

#EJEMPLO 4
#Grafica datos de precipitacion de un modelo climatico regional en una grilla irregular
data( RCMexample) #cargo los datos
image.plot( RCMexample$x, RCMexample$y, RCMexample$z[,,1])
#agrego el mapa
world( add=TRUE, lwd=2, col="grey")
#hago zoom en una region
ind<- 50:75
image.plot(RCMexample$x[ind,ind], RCMexample$y[ind,ind], RCMexample$z[ind,ind,1], border="grey50", lwd=2) #marco los bordes de las grillas en gris

#-------------------------------------------------------------------------------
#arrow.plot (VECTORES DE VIENTO): es una funcion del paquete fields que agrega flechas en puntos especificados donde la longitud de las flechas se escalan para entrar en el area de dibujo.
#Angulo de la flechita me da la direccion y el largo la velocidad del viento

#ver Ejemplo 17


