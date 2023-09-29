##################
##################################################################
# # Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 
# 2? cuatrimestre 2023
##################################################################
rm(list=ls())
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/")
# Clase_Informaci?n R y binario Alumnos
###################################################

#--------------- GUARDAR ARCHIVOS ---------------
x <- stats::runif(20) #Genero 20 numeros aleatorios. stats:: es del paquete 
                      #desde donde viene. 

y <- list(a = 1, b = TRUE, c = "oops") #Lista de 3 elementos

save(x, y, file = "xy.RData") #Lo guardo en el archivo xy.RData. Lo guarda en el 
                              #directorio que setee

#--------------- CARGA DE ARCHIVOS ---------------
#Si me paro dentro de files, donde se guardó el archivo y le hago doble click, 
#lo carga en el environment.

load("xy.RData") #para cargar el archivo load ("nombre_archivo"). 
#OJO QUE OTRAS VARIABLES NO TENGAN EL MISMO NOMBRE XQ SINO TOMA LOS VALORES DE 
#LAS VARIABLES QUE CARGUÉ


#--------------------------------------------------------------------------
save.image()
unlink("xy.RData")	
unlink(".RData") 		

#--------------------------------------------------------------------------
rm(x,y) #borro del environment a x e y
attach("xy.RData") #Se attachea en environment. Toca en el cuadradito verde, 
                   #violeta y azul
x
y

detach("file:xy.RData")

#--------------------------------------------------------------------------
#data () carga o muestra el conjunto de archivos de datos disponibles de los 
#paquetes de R.

try(data(package="rpart")) #muestra los archivos de datos en la libreria rpart
#rpart es una libreria que ya viene  

data(USArrests, "VADeaths") #carga los conjuntos de datos 'USArrests' y 'VADeaths'
                           #Los carga como promesa

ds <- c("USArrests", "VADeaths") #Vector de caracteres 
ds #Solo me da los nombres
data(list = ds) #recien ahora es que estoy cargando los datos

USArrests
VADeaths

#--------------------------------------------------------------------------
#ejercicio que hacen SOLOS

# genero una matriz de 20 valores aleatorios que tenga 5 columnas
mi_matriz<-matrix(data=runif(20),ncol=5)

# Crear una segunda matriz de 20 numeros ordenados por fila en 5 columnas
mi_matriz2<-matrix(data=1:20,ncol=5,byrow=T)

# Guardar los datos usando la funcion save en el archivo matriz20.Rdata
save(mi_matriz,mi_matriz2,file="matriz20.RData")

#Borrar el ambiente de trabajo y volver a cargar la informaci?n guardada en 
#matriz20.RData utilizando dos metodos diferentes
rm(mi_matriz,mi_matriz2) 

load("matriz20.RData") #1er forma de cargar

attach("matriz20.RData") #2da forma de cargar

#--------------------------------------------------------------------------
#Ejemplo 10. Pedirle a Cami


#--------------------------------------------------------------------------
### BINARIO
#Para escribir en formato binario
#writeBin(object, con, size = NA_integer_, endian = .Platform$endian,
         #useBytes = FALSE)
  #object: lo que quiero escribir en el archivo
  #con: un objeto conexion o una cadena de caracteres nombrando un archivo. La
  #conexión se trata de “archivos generalizados”, como archivos comprimidos, URLs
  #size=el numero de bytes por elemento
  #endian= “little”, “big” o “swap” (ver mas adelante

zz <- file("testbin") #Guardo un archivo file ("nombre_archivo"). Caja donde
                      #despues voy a guardar cosas
zz #Tira caracteristicas                        	

#--------------- PERMISOS ---------------

#PERMISSION
#“r” o “rt” abrir para leer en modo texto
#“w” o “wt” abrir para escribir en modo texto
#“a” o “at” abrir para agregar en modo texto (append)
#“rb” abrir para leer en modo binario
#“wb” abrir para escribir en modo binario
#“ab” abrir para agregar en modo binario
#“r+” o “r+b” lee y escribe (no crea)
#“w+” o “w+b” abre para leer y escribir truncando el archivo
#“a+” o “a+b” abre para leer y agregar

#--------------- Little vs Big-Endian  ---------------
#EN EL PDF (no es necesario)

#--------------- Leer en binario ---------------

#readBin(con, what, n = 1L, size = NA_integer_, signed = TRUE,
        #endian = .Platform$endian)
#con: un objeto conexion o una cadena de caracteres nombrando una
    #archivo. La conexión se trata de “archivos generalizados”, como
    #archivos comprimidos, URLs.
#what especificar el tipo de objeto que estoy por leer numeric, integer,
    #complex, character.
#n la máxima cantidad de registros a ser leídos. Puedo colocar un número
    #grande.
#IMPORTANTE: conocer como fue grabado el archivo para poder leerlo
             #correctamente.

zz <- file("testbin", "wb")	#wb le doy permiso para escribir. No para leerlo,
                            #sino para poder escribir
zz

#####################

writeBin(1:10, zz) #Escribo esos 10 numeros en el zz    	

close(zz) #lo cierro

zz <- file("testbin", "rb")   

readBin(zz, integer(), 4) #para que lea los primeros 4 valores enteros  

readBin(zz, integer(), 6) #Para que lea los otros 6

######################################
zz1 <- file("testbin", "wb")	#permiso para escribir        
writeBin(pi, zz1, endian = "little") #ahora escribo
close(zz1) #cierro                     		 

zz1 <- file("testbin", "rb") #pido permiso para leer
readBin(zz1, numeric(), 1, endian = "little") #Pido que lea un numero solo. 

#No vamos a notar diferencias NOSOTROS con lo del endian

########################################

zz2 <- file("testbin", "wb")
writeBin(pi^2, zz2, size = 4, endian = "swap")
close(zz2)                         		    

zz2 <- file("testbin", "rb")            
readBin(zz2, numeric(), size = 4, endian = "swap")

#VER Ejemplo 11

