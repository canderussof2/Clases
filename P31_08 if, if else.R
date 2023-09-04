#----------- Práctica 31/08 -----------
getwd()
setwd("/home/clinux01/Escritorio/Cande Labo Jueves/Practica_1/")
#setwd("/Users/cande/Desktop/Cande/UBA/2do año/Laboratorio de Procesamiento de Información Meteorológica/Práctica/Prácticas/Practica 1/")

rm(list=ls())

#----------- PRIMER EJERCICIO -----------
#Raiz cuadrada de un numero cualquiera. Para esto le vamos a pedir al usuario que ingrese por pantalla un numero. Si es positivo o igual a cero podemos calcular la raiz sin problema Pero si es negativo, R no podra calcular la raiz cuadrada, entonces podemos imprimir un mensaje que pida al usuario que ingrese un número válido

numero<-readline("Ingrese un número")
n<-as.numeric(numero)
if(numero>=0){sqrt(n)
} else {print("Ingrese un número válido (mayor o igual a cero)")
}

#----------- SEGUNDO EJERCICIO -----------
rm(list=ls())
nota<-readline("Ingrese su nota")
nt<-as.numeric(nota)
if(nt>=4 & nt<=10) {
  print("El parcial esta aprobado")
} else if (nt<4 & nt>0) {
  print("El parcial esta desaprobado")
} else {
  print("Ingrese una nota válida")
}

#----------- TERCER EJERCICIO -----------
rm(list=ls())

tmax<-readline("Ingrese la temperatura máxima registrada (en ◦C)")
tmax<-as.numeric(tmax)
tmin<-readline("Ingrese la temperatura mínima registrada (en ◦C)")
tmin<-as.numeric(tmin)
amplitud=tmax-tmin
if(tmax<tmin){
  print("Tmax menor a Tmin. verificar los datos")
} else if (tmax>tmin) {
  print(paste("La amplitud diaria fue de",amplitud))
} else {
  print("Tmax es igual a Tmin, verificar datos")
}

                
