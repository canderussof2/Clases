#Laboratorio de Procesamiento de Informaci?n Meteorol?gica/Oceanografica
#2 cuatrimestre 2023
#################################################################################
#Clase Funciones
#################

#Luego de crear la función, al momento de correrla salta todo lo del script, 
#salta todos los comandos, va hacia donde esta la función, la ejecuta y después vuelve.
#La función (o subrutina) pone todo lo que hace entre {}. Puede ir haciendo una 
#sola o varias expresiones. Entre () van los argumentos
#nombre_funciom <- function(arg_1, arg_2, ..., arg_n) {expresión}
#args(nombre de la función) devuelve lista de los argumentos q necesito ponerle
#formals(nombre de la función) info de los argumentos y si alguno tiene un valor asignado 

factorial<-function(x) prod(1:x) #puedo escribir sin llaves porque es un solo argumento.
#x es el argumento. Prod(1:x) me hace la multiplicacion de 1 hasta ese valor x.
#Yo tengo que ejecutar esa funcion con argumentos especificos. Genericamente, le estoy 
#diciendo que hay que ingresar un solo valor. Al hacer la funcion le digo "que 
#es lo que voy a meter", en este caso, un numero. 

factorial(4)
factorial(8)

#####################
#Tengo que ingresar los valores x e y, mi función me devuelve esa raiz cuadrada
hipotenusa <- function(x, y) {
  sqrt(x^2 + y^2) #acá no aparece por pantalla ni tampoco se guarda en una variable
}
#Tengo que ingresar los valores x e y, mi función es
hipotenusa <- function(x, y) {
  return(sqrt(x^2 + y^2)) #el return hace que, despues de calcularlo, el resultado 
  #aparezca por pantalla. Aparece por pantalla pero no se le asigna a una variable
}

class(hipotenusa) #Reconoce que es una función
hipotenusa(2,3) #Por default toma el primero como x y el segundo como y
hipotenusa(y=3,x=2) #Si es que quiero definir cual es y y cual es x

#############################
ff <- function(r) {
  return(PI * r^2)
}

ff(2) #error porque puse a PI en mayuscula y no como pi

######################
#Vamos al ejemplo 8
modulo <- function(v) {         # nombro a la funci?n con el nombre "modulo". y 
  # mi arguemnto es un vector (v)
  s <- 0                        # inicializo en 0 a la suma de los cuadrados
  for (e_v in v) {              # me desplazo por los elementos del vector. e_v 
    # es un contador q va yendo por los elementos del vector
    s <- s + e_v^2              # incremeto la suma de los cuadrados
  }
  sqrt(s)                     # calculo la raiz cuadrado y ese es el resultado
}

# Probamos con un vector
vv <- c(-2, 3, 4, -5)

#Lo mismo pero optimizado. Agarra elem por elemento, primero los eleva, despues suma y despues raiz
modulosimple<-funcion (v) {sqrt(sum(v^2))}

# Probamos con un vector

vv <- c(-2, 3, 4, -5)

# Evaluamos la funcion
modulo(vv)

################################################
#Vamos al ejemplo 9 
#Pedirle a cami 
######################
ejem.fun <- function(x, y, label = "la x"){ #En Label fijo el nombre de la variable
  plot(x, y, xlab = label) } #en el eje x pone el nombre que defini en label 

ejem.fun(1:5,c(2,4,6,8,10))



ejem.fun.2<-function(x){ #Acá el argumento es x solo
  y<-x^2 #Aca me genero los y
  plot(x, y) }

ejem.fun.2(1:5)
######################

grande<-function(x,y){
  y.g<-y>x #Aca guarda un vector de True y False. Vector logico
  x[y.g]<-y[y.g] #Asigna a las posicioens verdaderas de x las posiciones donde y es verdadero
  x
}

#Mira tu hoja de la fech 26/09

grande(1:5, c(1,6,2,7,3)) #Son todas formas equivalente
grande(x=1:5, y=c(1,6,2,7,3))
grande(y=c(1,6,2,7,3), x=1:5)
grande(1:5, y=c(1,6,2,7,3))

############################

media.total<-function(...) { mean(c(...)) }

############################

media.total<-function(...){
  for (x in list(...)){
    if (!is.numeric(x)) stop("No son numeros")
  }
  mean(c(...))
}

############################
#Funciones con avisos
myplot <- function(x,y) {
  if(missing(y)) { #Si es que no le ponen valores a la y hace esto
    y <- x
    x <- 1:length(y)
  }
  plot(x,y)
}


myplot(1:20,11:30)
myplot(12:20)

############################

xln <- function(x){
  return(-x * log(x))
}
x <- 1:10000 / 10000

plot(x, xln(x), type = "l", xlab = "", ylab = "",
     main = "Funci?n -x * log(x)")


########################

grande<-function(x,y=0*x){	#Por default siempre compara con cero
                            #si ponemos y=0 lo como como numero y no funciona
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}

grande(c(-12:3))
grande(c(1,5),2:3)

############################
grande<-function(x,y=0*x){	#Funcion arreglada con avisos
  if (missing(y)) warning("Estamos comparando con 0")
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}
grande(-3:3)

############################################

DosMuestras <- function(y1, y2) { #Algo de tstudent
  n1 <- length(y1); n2 <- length(y2)
  yb1 <- mean(y1); yb2 <- mean(y2)
  s1 <- var(y1); s2 <- var(y2)
  s <- ((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2)
  tst <- (yb1 - yb2)/sqrt(s*(1/n1 + 1/n2))
  tst
}

altura.hombres<-(c(1.78,1.65,1.82,1.69,1.74,1.89,1.67,1.58,1.72,1.64,1.85,1.92,1.70,1.63))
altura.mujeres<-(c(1.56,1.74,1.63,1.58,1.54,1.72,1.63,1.71,1.65))
DosMuestras(altura.hombres,altura.mujeres)

###########################################

fibbonacci <- function(y) {if (y==0 | y==1)     
  return (1)
  F0 <- 1; F1 <- 1; i <- 2
  repeat {
    s <- F0 + F1                 	
    if (i == y)                    
      return (s)              	
    
    F0 <- F1
    F1 <- s
    i <- i+1                           
  } } 


fibbonacci(0) 
fibbonacci(4) 
fibbonacci(8)                  
fibbonacci(1)


##################
#si ya tengo un script que tenga todas mis funciones lo puedo llamar asi
#source("directorio") porque sino queda mal el script