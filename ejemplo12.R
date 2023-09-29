#################################################
# ejemplo12.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019
################################################# 

#Cargar datos en formato binario!
#1) Leer el archivo de temperaturas de superficie del mar
#                  SST_19821999.T42.grd
#escrito en formato binario de acceso directo, proveniente de 
#una architectura big endian.!
#El header!
#             SST_19821999.T42.ctl
#en el directorio DATA, nos da ulterior informanci?n: 
#el archivo contine datos medios mensuales del Hadley Centre 
#(periodo 1982-1999), en una grilla Gausseana T42, con 
# valores indefinidos expresados por el entero negativo -32768.0
 
# 2) Corroborar su lectura del archivo ploteando la matriz de datos

#UNDEF es el codigo faltante, donde voy a meter los NA
#XDEF tengo 128 puntos de longitudes (x) 
#YDEF 64 puntos de latitudes (niveles) (y) 
#ZDEF solo tengo una vez porque es superficie del mar pero tengo 216 tiempos 
#(meses) porque el intervalo es mensual

# Limpio el espacio de trabajo
rm(list=ls())

datos='/home/clinux01/Escritorio/Cande Labo Jueves/SST_19821999.T42.grd'   

# Hago el open del file a leer
fid=file(datos,'rb') #Pido permiso para leer
fid

# Defino variables
nx=128; #long, numero de pixeles para una grilla de tipo T42
ny=64; #lat
itt=216; #12 meses * 18 anios (1982 a 1999)
undef=-32768.0;


# inicializo la matriz donde voy a poner los datos, para ponerlo en formato campo
sst=matrix(0,nrow=nx*ny,nco=itt) #matriz llena de ceros. En cada fila tengo 
                                #puntos de reticula (xy). 
                                #Genere espacio para lo que voy a ir leyendo 
for (it in 1:itt){
it
sst[,it]=readBin(fid,numeric(),size=4,nx*ny,endian="swap") #para cada columna 
                                                           #it, ent odas tus filas, 
                                                          #lee los primeros nx*ny
                                                          #(8192) puntos de reticula
}

#Pedi permiso y lo que lee lo almacena en sst

close(fid)

class(sst) #Matriz
dim(sst) #216 meses y 8192 puntos de reticula

# lo pienso como serie temporal (evoluci?n de un punto en el tiempo)
sst_punto= sst[5580,] #fijo una fila y hago que corra las columnas
plot(1:216,sst_punto,'l',col='red') #una grafico de lineas
plot(1:216,sst[1,],'l') #Me aparece linea porque no saque los datos faltantes

# lo pienso como campos espaciales (comportamiento en todos los puntos en un tiempo)

# Enmascaro los valores indefinidos (continentes)
sst[sst==undef]=NA; #para reemplazar cada vez que vea el valor de undef por NA.
                    #Esto iria que este bein al comienzo. Datos faltante porque 
                    #yo estoy estudiando temp del mar y seguro es dato de temp 
                    #en el continente

# Expreso como arreglo tridimensional
sst2=array(sst,dim=c(nx,ny,itt)) #le cambio las dimensiones (128*64*216) (x*y*t)
ls.str()

# Verifico la lectura ploteando la matriz en el tiempo 1
contour(sst2[,,1]) #fijo el tiempo 1. Tengo el campo de un mes. Puedo ver los 
                  #valores con los que estoy trabajando. Donde esta en blanco es
                  #porque son los continentes. 
# y en otros tiempos ... 216 y 50 
contour(sst2[,,216]) #fijo el tiempo 216
contour(sst2[,,50]) #fijo el tiempo 50

#Calculo la sst media del periodo
media<-apply(sst2,c(1,2),mean) #mi media tiene 64 * 128. Me olvido de tiempo
contour(media)


anio<-itt/12  #Para que en anio me quede cuantos años. Divido por 12 porque se
              #que son mensuales

#Cambio dimensiones
meses<-array(sst2,dim=c(nx,ny,12,anio)) #quiero 12 campos, porque quiero el 
                                        #campo de cada mes. Respeto long y lat pero
                                        #pongo 12 (de los 12 meses) por anio
                                        #"apilo" todos los campos de enero, todos
                                        # todos los de febrero y asi. 
                                        #12 porque son 12 por año. "La 1era pila
                                       #son los primeros 12, la 2da los otros 12 y asi
dim(meses)

media_mensual<-apply(meses,c(1,2,3),mean) #Valor promedio mensual de los 18 años

dim(media_mensual)

#grafico los 12 campos
for (i in 1:12) {
  contour(media_mensual[,,i])
  title(main=paste0("mes",i))
}

#TERMINAR DE COPIAR EN EL SCRIPT NUEVO QUE SUBA
plot(media_mensual [52,35,],type="l")


