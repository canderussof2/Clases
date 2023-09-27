##################
##################################################################
# # Laboratorio de Procesamiento de Informaci?n Meteorol?gica/Oceanogr?fica

# 2? cuatrimestre 2023
##################################################################

# Clase_Array_2 alumnos
##############################


matrix(8,ncol=2,nrow=4)
matrix(NA,ncol=2,nrow=4) #Matrix llena de Na
matrix(Inf,ncol=2,nrow=4) #Matrix llena de Inf
matrix(NaN,ncol=2,nrow=4) #Matrix llena de NaN

b=matrix(runif(6),nrow=3,ncol=2) #runif(20) me da 20 valores aletorios entre 0 
#y 1. Se puede hacer entre otros valores pero hay q ver como: 
#runif(cant valores q quiero, valor min, valor max)
sample(3:11,4) #4 valores aleatorios entre 3 y 11
rnorm(4) #4 valores aleatorios de la dist normal estandar (media 0 y desv estandar 1)
rnorm(4,)

#############################################
J=matrix(NA,nrow=3,ncol=1) #Me genero la matrix de 3 casilleros vacios que se llenan desp

J[1,1]=readline('Ingrese su edad ') #se va llenando por pantalla
J[2,1]=readline('Ingrese su peso ')
J[3,1]=readline('Ingrese su altura ')

########################################
m2 <- matrix(1:15, nrow=5, ncol= 3) 
m2
m3<-rbind(1:3,3:1,c(1,1,1),c(2,2,2),c(3,3,3)) #rbind pega por filas
m3
m2 * m3 #Multiplica elemento a elemento. EL 1 con el 1, el 2 con 2 y así

#######################################
x <- 1:4 #es un vector
x

z <- x %*% x	#En z guardo un nº. Es el producto interno (1*1+ 2*2+ 3*3+ 4*4)

drop(z) 
y <- diag(x) #Lo ubico en la diagonal	
y

g <- matrix(1:12, ncol = 3, nrow = 4) #Va llenando por default por columnas 
g

y %*% g	#Producto Matricial entre g e y	
y %*% x #Producto Matricial entre matriz y vector
x %*% g #Producto Matricial entre vector y matriz 		

#######################################
A=matrix(c(1:2,3:4), ncol=2,byrow=TRUE)

det(A) #Cálculo del determinante		

solve(A) #Calcula la inversa de A

A%*%solve(A) #Cálculo de la identidad

#######################################
rm(list=ls())
B=matrix(c(1,8,5,3,0,2,3,6,1), ncol=3,byrow=TRUE)
B
L=B #Para no sobreescribir
L[lower.tri(B)]=0 #Coloca 0 en el triangulo inf, sin la diagonal Triang inf es 
#de la diagonal para abajo. A la matriz L [elementos de la matriz B] le ponga 0``
L
L[lower.tri(B,diag=TRUE)]=5 #Acá toma los elementos de la diagonal y les pone 5   
#Se usa por ej en la Matriz de Correlación. Es matriz espejada c/ una diag de 1
U=B
U[upper.tri(B,diag=TRUE)]=10

M=B
M[upper.tri(B,diag=TRUE)]->pp
####################################

a<-matrix(c(1,1,1,2,2,2,3,3,3,4,4,4),nrow=3,ncol=4)
mean(a) #Media de mi matrix. Es un escalar

colMeans(a,dims=1) #Calcula la media por columna. Puedo no poner el dims = 1		
rowMeans(a,dims=1) #Calcula la media por filas. Puedo no poner el dims = 1	


b<-matrix(c(4,4,4,5,5,5,6,6,6,7,7,7),nrow=3,ncol=4)
c=abind(a,b,along=3) #es un array porque tiene en el primer tiempo la matriz a 
#y en le segundo la matriz b. Genero un array de 3 x 4 x 2.
#abind es una librería que hay q descargar
c
media_1<-apply(c,c(1,3),mean) #A quien, las dimensiones a las que le quiero aplicar, la función.
#Para cada fila (dim=1) y cada tiempo (3), promedio las columnas. El resultado tiene 
#una dimens de 3x2 (3 filas y 2 columnas) porque perdi una columna 
media_2<-apply(c,c(2,3),mean) #Para cada columna y cada tiempo promedio columnas
media_3<-apply(c,c(1,2),mean) #Promedio para cada fila y columna el tiempo.
#Tengo el valor medio de cada uno de mis tiempos

desvio_1<-apply(c,c(1,3),sd)
desvio_2<-apply(c,c(2,3),sd)
desvio_3<-apply(c,c(1,2),sd)

#############################################

## Otras funciones
rm(list=ls())
aa<-array(data=c(2,4,3,5,6,1,8,4,2,6,4,8,3,4,7),dim=c(5,3))
aa

mm<-table(aa) #tabla de frecuencias de cada valor
max(mm)
min(mm)

match(aa,c(4,2)) #Dado un array y un vector muestra donde se encuentran los elementos del vector en el array

bb<-array(data=c("a","b","c","a","d","c"),dim=c(2,3)) #Matriz de letras
match(bb,"a") #Para buscar la letra a en la matriz bb





