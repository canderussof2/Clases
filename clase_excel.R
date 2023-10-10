# # Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 1 cuatrimestre 2022

rm(list=ls())
setwd("/home/clinux01/Escritorio/Cande Labo Martes/")

#-------------------------------------------------------------------------------
#read.xls
#Esta función lee un archivo Microsoft Excel y lo guarda como un data.frame en R.
#Es parte del paquete gdata, luego para poder ejecutar la función lo primero es cargar la librería

#read.xls(xls, sheet=1, verbose=FALSE, pattern, na.strings =c("NA","#DIV/0!"),...,
#method=c("csv","tsv","tab"), perl="perl")
#xls: el path al lugar donde se encuentra el archivo: Ruta
#sheet: el nombre o numero de la hoja de excel ha ser leída. 1 por default
#verbose: valor lógico indicando si se imprimen detalles durante el procesamiento.
#pattern: si se especifica, saltea todas las líneas antes de encontrar esta cadena de caracteres
#si quiero saltear lineas. Busque hasta q renglon esta esa info y saltea lo anterior
#perl: nombre del ejecutable en perl que se utilizará
#method: formato intermedio a usar “csv” (separados por coma) o “tab” (separados por tabulacion)
#na.strings: un vector con cadena de caracteres con los valores que se tomaran como NA (igual que en read.table)
#donde encuentra ese valor lo cambia por NA
#blank.lines.skip: valor lógico indicando si las líneas en blanco en el archivo original deben ser ignoradas.
#saltear esas lineas en blanco
#... Argumentos adicionales de read.table. Se usan los valores defaults de read.csv()

#Celdas vacias las toma como NA
#Esta funcion trabaja traduciendo el archivo Excel a un archivo temporario .csv o .tab, usando
#los scripts en Perl xls2csv o xls2tab que estan instalados como parte del paquete (gdata).

#Primero hay q instalar Pearl

require(gdata)  #no tengo el paquete, tengo q instalar gdata
xlsfile <- file.path(path.package('gdata'),'xls','iris.xls')
xlsfile #les muestra el path donde se encuentra el archivo
require(readxl)                   

#Leo usando 3 metodos. No hay diferencias. Clase: DF 
iris <- read.xls(xlsfile) # lee con los parametros por default y convierte en csv
iris1 <- read.xls(xlsfile,method="csv") # especifico que sea en formato csv
iris2 <- read.xls(xlsfile,method="tab") # especifico que sea en formato tab

#-------------------------------------------------------------------------------
exampleFile <- file.path(path.package('gdata'),'xls', 'ExampleExcelFile.xls')
exampleFile2007 <- file.path(path.package('gdata'),'xls', 'ExampleExcelFile.xlsx')

## ver los numeros de las hojas:
sheetCount(exampleFile)
if( 'XLSX' %in% xlsFormats() ){ ## ver si soporta el formato XLSX.
  sheetCount(exampleFile2007)
}

## ver los nombres de las hojas en el archivo
sheetNames(exampleFile)
if( 'XLSX' %in% xlsFormats() ){ ## if XLSX is supported..
  sheetNames(exampleFile2007)
}

data <- read.xls(exampleFile) ## default lee la primer hoja
data_2 <- read.xls(exampleFile, sheet=2) ## leo la segunda hoja por numero
data_3 <- read.xls(exampleFile, sheet="Sheet Second",v=TRUE) ## leo por nombre. 
#v es de verbose

## cargo la tercer hoja, salteo las primeras dos lineas que no son datos...
if( 'XLSX' %in% xlsFormats() ){ ## if XLSX is supported..
  data_4 <- read.xls(exampleFile2007, sheet="Sheet with initial text", skip=2)
}

#-------------------------------------------------------------------------------
#Ejemplo
meteo<-file.path('datos.xls')
sheetCount(meteo)
sheetCount("datos.xls") 
sheetNames("datos.xls")
readxl::excel_sheets(meteo) #Lee los nombres pero con el otro paquete

#2 formas de acceder a la misma info
meteo_0<-read.xls(meteo,sheet=2) #con meteo pongo toda la ruta
meteo_1<-read.xls("datos.xls",sheet = 2) #Aca puse solo el nombre pero es lo mismo
                                         #Tengo q estar parada igual donde esta guardado creo
head(meteo_1)
class(meteo_1) #df

#calculo del coef de correlacion
correlacion<-cor(meteo_1[,1],meteo_1[,2]) #correlacion entre el inst 1 y 2
#da aprox -0.73. Es una correlacion inversa. Bastante significativa porque esta bastante cerca de 1

meteo_2<-read.xls(meteo,sheet = 3, skip=1,col.names=c("Año", "Mes","Tmax","Tmin","pp")) 
meteo_2A<-read_xls(meteo,sheet = 3)
head(meteo_2)
class(meteo_2) #df
plot(meteo_2[,3],type="l") #De meteo_2 grafico la columna 3, q es una linea por type = "l"
plot(meteo_2[1:12,5],type="h") #lo mismo pero con lineas verticales

medias<-apply(meteo_2[,3:5],2,mean) #De meteo_2 le calcula la media a las columnas 3, 4 y 5
tail(meteo_2)

medias_onda<-matrix(0,nrow=12,ncol=3) #matriz de 12 filas y 3 columnas 
for (i in 1:12){ 
  a=which(meteo_2[,2]==i) #primero todos los q son 1(eneros), despues todos los 
                          #del 2(febreros) hasta 12 (diciembre). 
                          #El 2 es porque el numero se fija en la columna 2
  medias_onda[i,1:3]<-apply(meteo_2[a,3:5],2,mean) #va guardando en cada fila de la matriz
}

plot(medias_onda[,1],type="l",col='red',ylim=c(0,30)) #Grafico de Tmax medias de cada mes
                                                      #ylim=c() me da el interv en y
lines(medias_onda[,2],type="l",col='blue') #lines para superponer al grafico anterior

#grafico de las dos q tenian una correlacion negativa
plot(meteo_1[,1],type="l",col='red', ylim=c(20,30))
lines(meteo_1[,2],type="l",col='blue')

#-------------------------------------------------------------------------------




