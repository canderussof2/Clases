##################################################################
# # Laboratorio de Procesamiento de Información Meteorológica/Oceanogr?fica

# 2do cuatrimestre 2023
##################################################################

# Clase_Arrays 1

##############################################################################################
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/")
rm(list=ls())

z<-numeric(1500) #Guarde en z 1500 ceros
dim(z) <- c(3,5,100) #Transformo el vector en un array. Me hace 100 matrices de 3 filas y 5 columnas


h<-numeric(24) #Guarde en h 24 ceros
Z <- array(h, dim=c(3,4,2)) #Arma un array con lo que tenes guardado en h con esas dimensiones. Es lo mismo que antes 
Z[,,1] #Me devuelve el primer tiempo del array. Cuando abro [ ] significa que estamos adentro de la matriz. Aca me devuelve el primer tiempo
Z [2,3,1] #Me devuelve el elemento del primer tiempo de la segunda fila y tercer columna

#En meteorología, latitud -> fila, longitud -> columnas

#############################
m <- 21:40 #AHora le asigno la secuencia del 21 al 40
dim(m)<-c(4,5) #4 filas y 5 columnas
m #Me lo muestra por pantalla. La maquina por default acomoda por columnas.
class(m) #"matrix"

dim(m)<-c(5,4) #Redimensiono m. 5 filas y 4 columnas 	
m

m[3,4] #Me meto dentro de la matriz. En la fila 3, columna 4	
m[14]	#Cuenta los elementos y me da el valor de esa posición


m[3,] #Pido todos los elementos de la fila 3			
m[,2] #Pido todos los elementos de la columna 2		

#############################
nn<-1:120
dim(nn)<-c(3,4,2,5) #3 filas, 4 columnas, 2 alturas, 5 tiempos
nn #completa por filas, columnas, altura, tiempos. 

#############################
m1<-matrix(11:30,nrow=4,ncol=5,byrow=TRUE) #nrow n° filas, ncol es n°col, by row porque necesito que me lo llene por fila. Si no le pongo nada me lo llena por columna
rownames(m1)<-c('rojo','azul','amarillo','verde') #Nombro a las filas
colnames(m1)<-c('a','b','c','d','e') #Nombro a las columnas. Si me olvido de llamara  una me aparece q hay error en las dimensiones q le puse´			
m1						
colnames(m1) #Devuelve los nombres de las columnas.
m1[,'b'] 

#############################
x<-c(1:6)
dim(x)<-c(2,3)
dimnames(x)<-list(c('Fila1','Fila2'),c('Col1','Col2','Col3')) #Nombro a mis dimensiones. En este caso a mis filas y columnas. Listas me permiten jugar con la cantidad y el tipo de los elementos. Lo vamos a ver más adelante :)
x
ejema<-matrix(1:12,ncol=3,byrow=T,
              dimnames=list(letters[1:4],LETTERS[1:3])) #Fijando una dimensión, te fija la otra. En una sola sentencia tamb le puse nombre a las dimensiones
ejema #me ubica los elementos por filas
ejema[1,1]
ejema[,c(2,3)] #De la sefunda dim, quiero el segundo y tercer 
ejema[,c(-1,-3)] #-1 y -3 para que me muestre todo menos la primer y tercer columna
ejema[,c(-1,-3),drop=F] #Me mantiene la columna. Sirve para fines mas q nada estéticos

#############################
m2<-cbind(c(2,3,4.5),c(5,6,7.5)) 
m2		
m3<-rbind(c(2,3,4.5),c(5,6,7.5))
m3		
#############################
x<-matrix(1:6,2,3) #Lo q pongo en la matriz, 2 filas, 3 columnas
x
x[,2]
x[1,1:2]
x[3,] 
x[3] #Da error porque estaria pidiendo la 3 fila y no hay
ncol(x); nrow(x)
t(x)
cbind(1,x) #Pega una columna de unos con la matriz 
cbind(1:3,1:6) #Recicla el primer elemento las veces q lo requiera
apply(x,1,sum) #Aplico a la matriz una función segun la función q yo quiera. Aplica a la matrix x por fila le suma 1 
max(x); min(x) #Elementos maximos y minimos
dim(x) #dimensiones de la matriz
length(x) 
max(dim(x)) #Maximo de las dimensiones. Aca da 3

#############################
a=diag(3) #Matriz cuadrada (en este caso 3x3) con diagonal de 1	
a
b=rnorm(9) #Forma de obtener 9 valores aleatorios de la dist normal con media 0 y desvio estandar 1. Me da vector de 9 elementos		
b

dim(b)=c(3,3) #le cambio las dimensiones

require(abind) #Forma de instalar el paquete abind. Es como antes de pegar (cbinf y rbind)     
abind(a,b,along=3)->c	#Pegar matriz a con la b. Y con along empiezo a jugar con dimensiones. A lo largo de 3 me genera tiempos, la matriz a es el primer tiempo y la b el segundo creo
c
abind(a,b,along=1)->d   		
d
abind(a,b,along=2)->e     		
e
##################################################

c<-matrix(c(2,1,5,6,3,8,4,9,2,7,3,5),nrow=3,ncol=4)
c
c[order(c[,1]),] #Ordena por columnas, por default es creciente. Si la quiero decreciente uso el decreasing=T
c[order(c[,3]),]    		
c[order(c[,2],decreasing=TRUE),]

#################################################
x
diag(x) #a pesar de no ser cuadrada me da la diagonal

l<-diag(5) #Matriz diagonal de 5x5 
l
s=diag(10,3,4) #Matriz de 3 filas y 4 columnas con diagonal de 10
s
x=c(2,3,4,5)
x
y=diag(x,4,4) #Matriz de 4x4 con diagonal a x
y

#######################
#Variable indexada: Obj tienen dimensiones 

#Suma elem de cad afila
x<-matrix(1:6,2,3)
#Bien rudim
suma_fila<-vector("numeric",2)
aux=0 #Variable auxiliar 
for (i in 1:2) {
  for(ii in 1:3) {
    aux=aux+x[i,ii]
  }
  suma_fila[i]=aux
  aux=0
}
 suma_fila

 #apply. Hace lo mismo mas facil
 apply(x,1,sum)
 
 #Otra funcion q hace lo mismo pero mas facil
 rowsums(x)
 