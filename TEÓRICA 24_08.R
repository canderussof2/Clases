rm(list=ls())
a = pi
b = 18
if (a>b)
c=a+b  
c
x=a>0
x
if (x) resultado="entre acá"
resultado
x=a<0
if (x) resultado="entre acá"
resultado
x
rm(resultado)
if (x) resultado="entre acá"
resultado
ifelse(T, "el parámetro del test es verdadero", "el parámetro del test es falso")
ifelse(F, "el parámetro del test es verdadero", "el parámetro del test es falso")
x<-c(T,F,T)
x
ifelse(x, "el parámetro del test es verdadero", "el parámetro del test es falso")
a<-c(2,5,10,8)
b<-c(1,15,0,3)
if(a<5 & b>0) rta="cumple la condición"
rta
(a<5 & b>0)
(a<5 && b>0)
if (a<5 && b>0) rta="cumple la condición"
rta
x<- c(-2.048,1.055,0.832,-4.177,8.298,-0.201,4.630,-3.88,0.938,-1.071)
type="mean"
switch(type,mean=mean(x), median=median(x),standdev=sd(x))
type="median"
switch(type,mean=mean(x), median=median(x),standdev=sd(x))
type="standev"
switch(type,mean=mean(x), median=median(x),standdev=sd(x))
type="standdev"
switch(type,mean=mean(x), median=median(x),standdev=sd(x))
ccc <- c("b","QQ","a","A","bb")
for(ch in ccc)
  cat(ch,":",switch(EXPR=ch, a=1,b=2:3),"\n")
for(ch in ccc)
  cat(ch,":",switch(EXPR=ch, a=,A=1,b=2:3,"Otherwise:last"),"\n")


#----------------------- EJERCICIOS TEÓRICA -----------------------
#Script para testear si pi^e >= que e^pi. Para practicar IF
e= exp(1) #forma para poner la función e en R
#Defino a y b
a<-pi**e 
b<-e**pi
if(a>b) resultado ="pi^e >= que e^pi" #Para ver si cumple
resultado

#----------------------- EJERCICIO TEÓRICA -----------------------
#Script para practicar IF ELSE
x=0 #Defino la variable
#Empiezo a plantear las condiciones
if(x>0) {
  print("x es mayor que cero")} else if(x<0) {
    print("x es menor que cero")} else {
      "x es cero"}
  
#----------------------- EJERCICIO TEÓRICA -----------------------
#Script para practicar IF ELSE Scan. Para que el usuario eliga el valor de x
print("entre un solo valor numérico para x"); x=scan()
#Empiezo a plantear las condiciones
if(x>0) {
  print("x es mayor que cero")} else if(x<0) {
    print("x es menor que cero")} else {
      "x es cero"}


