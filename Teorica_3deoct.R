rm(list=ls())
setwd("/home/clinux01/Escritorio/Cande Labo Martes/")
file.create(..., showWarnings = TRUE) #crea archivos con el nombre dado si no 
                                      #existen y los trunca si ya existen.
file.exists(...)
file.remove(...)
file.rename(from, to)
file.append(file1, file2)
file.copy(from, to, overwrite = recursive, recursive = FALSE,
          copy.mode = TRUE, copy.date = FALSE)
          
#----------------------------------------------------------------
#Cargar datos.
#Scan: funcion basica para importar un archivo de texto

#Funcion SCAN
#scan(file = "", what = double(), nmax = -1, n = -1, sep = "",
     #quote = if(identical(sep, "\n")) "" else "'\"", dec = ".",
     #skip = 0, nlines = 0, na.strings = "NA",
     #flush = FALSE, fill = FALSE, strip.white = FALSE,
     #quiet = FALSE, blank.lines.skip = TRUE, multi.line = TRUE,
     #comment.char = "", allowEscapes = FALSE,
     #fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)
#file: nombre del archivo entre “”, si esta en blanco lee lo que se ingresa del teclado.
       #Si el archivo no esta en el directorio de trabajo especificar el PATH completo.
       #También se puede usar para conectarse a URL
#what: el tipo a ser leído. logical, integer, numeric, complex, character, raw y list
#sep: por default, scan espera que los datos estén separados por espacios. Se puede
      #usar sep para identificar el caracter que separa los campos
#skip: el número de líneas del archivo de datos que deben ser salteados antes de
       #comenzar a leer los datos.
#nlines: si es positivo, el numero máximo de líneas de datos que se deben lee

WKDIR<-"/home/clinux01/Escritorio/Cande Labo Martes/"
setwd(WKDIR) #fijo el directorio de trabajo
vec <- scan("UnVec.txt") #scan("nombre_archivo"). Lo guarda como vector
print(vec) #lee los 6 elementos
class(vec) #numeric

vec2<-scan("IntVect.txt") #los guarda como numeric
vec3<-scan("IntVect.txt",integer()) #los guarda como integer
vec4<-scan("IntVect.txt",integer()) #error porque ve la coma y n o sabe como leerla
vec5<-scan("IntVect.txt",integer(),sep=",") #los guarda como integer
vec6<-scan("IntVect.txt",integer(),sep=",",skip=1)

#----------------------------------------------------------------
#WRITE
#Un objeto se puede escribir en un archivo de texto usando la función write

#write(x, file = "data",
      #ncolumns = if(is.character(x)) 1 else 5,
      #append = FALSE, sep = " ") 
#x: los datos que se quieren escribir en el archivo
#file: una cadena de caracteres indicando el nombre del archivo. Si no se especifica el
       #nombre el archivo se llamara data y se genera en el directorio de trabajo
#ncolumns: numero de columnas en los cuales se escribirán los datos. Por DEFAULT son 5
#append: si es TRUE los datos se agregaran al archivo existente
         #append = True me va agregando info al archivo existente, sino lo sobreescribe
#sep: caracter usado para separar columnas. Si sep = "\t" las columnas se separan con
      #tabulación; default es " ".

#dato:Si x es una matriz de dos dimensiones debe ser traspuesta para que en el
    #archivo sean las mismas que en la representación interna de R

#Ejemplo
x <- matrix(1:10, ncol = 5) # creamos una matriz de 2 x 5
write(x) #R me genera un archivo en mi directorio q por default se llama data. 
        #Me cambia como lo escribi porquie le gusta mas poner como vectores
getwd() 

write(t(x), sep = "\t", append=T) #Escribamos la matriz traspuesta en el mismo archivo,
                                  #y con un formato donde
 #t(x) es la transpuesta          #las columnas estan separadas por tabulaciones

unlink("data") #unlink("nombre_archivo"). borra el archivo donde estuvo escribiendo los datos

#podemos usar el comando write para escribir en pantalla
write(x, "", sep = "\t") #en el lugar del archivo colocamos comillas. 
                         #me los escribe como vectores
write(t(x), "", sep = "\t") #Para que me aparezcan como yo los guarde

#----------------------------------------------------------------
#WRITE.MATRIX
#Es una función de la librería MASS.
#Escribe una matriz o un data.frame a un archivo o a la consola usando los
#nombres de las columnas y respetando la forma de las columnas

#write.matrix(x, file = "", sep = " ", blocksize)
#x: matriz o data frame.
#file: nombre del archivo de salida. Default ("") sale por la consola.
#sep: Separador entre las columnas.
#blocksize: Si es provisto y positivo, la salida se escribe en bloques que tiene
            #tantas filas como blocksize. Escoger un número lo más grande posible
            #consistente con la memoria disponible.

require(MASS) #debo cargar la librería que contiene la función
l= matrix(rnorm(10000),ncol=10) #creo una matriz de 1000 x 10
write.matrix(l,file="matriz1000x10") #Para que el archivo tenga el mismo formato
write.matrix(l,file="matriz1000x10b",blocksize=100) #cambia formas de las columnas

#----------------------------------------------------------------
#WRITE.TABLE. Para DF

#write.table imprime el argumento x (luego de convertirlo a un data frame sino
 #lo es ni es una matriz) a un archivo

#write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ", eol = "\n", 
            #na ="NA", dec = ".", row.names = TRUE, col.names = TRUE, 
            #qmethod = c("escape","double"), fileEncoding = "")

#x: los datos que se quieren escribir en el archivo, preferentemente un data frame o
    #una matriz
#file: una cadena de caracteres indicando el nombre del archivo. Si “” escribe en la
       #consola
#na: el caracter para usar como dato faltante
#append: si TRUE agrega datos al final del archivo de escritura
#qmethod: como tratar las comillas dobles en los caracteres

#La función I() en data.frame evita que los caracteres sean convertidos a 
#factores y que se eliminen los nombres, y se asegura que las matrices se
#inserten como una única columna

x <- data.frame(a = I("a \ quote"), b = pi) #creo un data frame
write.table(x, file = "foo.txt", sep = ",", col.names = NA, qmethod = "double")
write.table(x, file = "foo2.txt", sep =",")          
            
#----------------------------------------------------------------
#EJ 1
a<-matrix(data=rnorm(100),ncol=10)
require(MASS)
write.matrix(a,file="matriz_a")
write(a,file="matriz_a",append=T) #Escribe por default 5 columnas y sin trasponer      
write.table(a, file = "matriz_a", append=T) #pone nombres tamb

#----------------------------------------------------------------
#EJ 2
b<-c(1:95,NA,NA,NaN,NaN,Inf)
matriz_b<-matrix(data= b, ncol=10)
require(MASS)
write.matrix(b,file="matriz_b")
write(b,file="matriz_b",append=T)       
write.table(b, file = "matriz_b", append=T) #Cambia NaN por NA. Los considera iguales

#----------------------------------------------------------------
#GRABAR DATOS
#WRITE.CSV, WRITE.CSV2

#Tanto para write.csv como para write.csv2 las opciones son las mismas que
#write.table salvo que qmethod = "double" siempre
#col.names =NA si row.names = TRUE(default) sino col.names=TRUE

#Además sep queda definido como
#write.csv usa "." para el punto decimal y la coma para separar los números en
#columnas. sep= ,
#write.csv2 usa la coma para el punto decimal y un punto y coma para separar
#los números en columnas, la convención de Excel para archivos CSV en algunas
#localidades del Oeste de Europa. sep=;
x <- data.frame(a = I("a \ quote"), b = pi)
write.csv(x, file = "foo.csv") 
write.csv(x, file = "foo2.csv", row.names = FALSE) #PONE DECIMAL CON PUNTO
write.csv2(x, file = "foo.csv2", row.names = FALSE) 

#----------------------------------------------------------------
#READ.TABLE
#lee un archivo con formato de tabla y crea un data frame,donde los casos
#corresponden a las lineas y las variables a los campos en el archivo.

read.table(file, header = FALSE, sep = "", quote = "\"'",
           dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
           row.names, col.names, as.is = !stringsAsFactors,
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE, fill = !blank.lines.skip,
           strip.white = FALSE, blank.lines.skip = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           stringsAsFactors = default.stringsAsFactors(),
           fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)

#header: un valor lógico indicando si el archivo contiene el nombre de las 
         #variables en la primer línea
#sep: el default es espacio en blanco
#dec: el caracter usado para el punto decimal.
#row.names un vector con los nombres de las filas: nombres, numero indicando
          #la columna donde estan, o el nombre de la columna que los contiene. 
          #Si no se usa las filas son numeradas
#na.strings los caracteres que deben tomarse como NA. Los espacios en blanco 
            #se consideran NA

#READ.CSV, READ.CSV2, READ.DELIM, READ.DELIM2
read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)
read.csv2(file, header = TRUE, sep = ";", quote = "\"",
          dec = ",", fill = TRUE, comment.char = "", ...)
read.delim(file, header = TRUE, sep = "\t", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", ...)
read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
            dec = ",", fill = TRUE, comment.char = "", ...)

#read.csv and read.csv2 son idénticos a read.table excepto por los defaults. Son
#para ser usados para leer archivos (‘.csv’) con ‘valores separados por coma’ 
#(.csv2) por punto y coma.
#read.delim y read.delim2 son para leer archivos que usan el TAB para separar 
#los valores, y cambia el símbolo decimal. Notar que en estas variantes 
#header = TRUE y fill = TRUE, y que el comment character esta deshabilitado.

#READ.FWF
#Lee una tabla con datos de formato ancho fijo y lo convierte en un data.frame.
#Los records de mas de una linea son concatenados a una sola linea antes de ser
#procesados

read.fwf(file, widths, header = FALSE, sep = "\t",
         skip = 0, row.names, col.names, n = -1,
         buffersize = 2000, fileEncoding = "", ...)
#widths: un vector entero que contiene los anchos de los campos (de una línea) o una
#lista de vectores enteros que contiene los anchos de varias líneas
#Colocar un valor negativo indica la cantidad de columnas que se deben
#saltear, e.g., -5 saltear 5 columnas.

#Tanto read.table como read.fwf usan scan para leer el archivo y luego
#procesan los resultados. Son muy convenientes pero a veces es mejor
#usar scan directamente.
#Otras funciones de lectura:
#•read.fortran
#•read.ftable

#READ.FWT CAT. 
read.fwf(file, widths, header = FALSE, sep = "\t",
         skip = 0, row.names, col.names, n = -1,
         buffersize = 2000, fileEncoding = "", ...)
#Ej 1
ff <- tempfile() #Archivos temporarios creo
cat(file = ff, "123456", "987654", sep = "\n")
read.fwf(ff, widths = c(1,2,3)) 
read.fwf(ff, widths = c(1,-2,3)) #Me saca la 2da columna y la reemplaza por la 3
unlink(ff) 

#Ej 2
ff <- tempfile()
cat (file = ff, "123", "987654", sep = "\n")
read.fwf(ff, widths = c(1,0, 2,3))
unlink(ff)

#Ej 3
ff <- tempfile()
cat(file = ff, "123456", "987654", sep = "\n")
read.fwf(ff, widths = list(c(1,0, 2,3), c(2,2,2))) 
ff #Para R se llama ff, en la compu aparece como temporario

#FORMATO ASCII-SCAN. EJ 13

#FORMATO ASCII-SCAN. EJ 14

scan("test1.dat",sep=",") #Guarda como vector y en el dato ausente pone NA


#Eficiencia
