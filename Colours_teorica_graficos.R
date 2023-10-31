#*******************************************************************************
# Gustavo Naumann
# UBA-CONICET, Buenos Aires, 24.08.2015
#
# Purpose: Introduction to different definitions of colours and colour palettes in R 
#*******************************************************************************

########################################################################################
### Vector con colores #################################################################
########################################################################################

X<-1:5 
colors <- c("honeydew","dodgerblue","firebrick","forestgreen","gold")

par(fig=c(0,1,0,1), # Figure region in the device display region (x1,x2,y1,y2)
    omi=c(0.05,0.15,0,0.05), # global margins in inches (bottom, left, top, right)
    mai=c(0.6,0.6,0.6,0.5)) # subplot margins in inches (bottom, left, top, right)

barplot(X, col= colors) #diagrama de barras, cada bloque con un color distinto

legend("topleft", colors  , text.col = "darkblue", horiz = FALSE,
       col=colors, cex=0.8, lty=1, y.intersp = 1, lwd = 3 ) #grafico la leyenda
#topleft: part3e sup izq, colores los toma de colors y el color del texto en azul oscuro,
#leyenda escrita en vertical, colores se toma de colors.
legend("bottomleft", colors  , text.col = "violetred3", horiz = TRUE,
       col=colors, cex=0.8, lty=1, y.intersp = 1, lwd = 3 )

########################################################################################
#### Paletas de colores Mapas ##########################################################
########################################################################################
require(ncdf4)
require(fields)
require(mapdata)

nc<- open.ncdf4(paste("/home/clinux01/Escritorio/Cande Labo Martes/Clases-Teoricas","netcdf_SLP_SA_1979_2014.nc",sep=""))
lon<-get.var.ncdf(nc,"longitude")
lats<-get.var.ncdf(nc,"latitude")
time<-get.var.ncdf(nc,"time")
MSLP<-get.var.ncdf(nc,"msl") ## MSLP * 100


P <- MSLP[,,1]/100
mn<-min(P); mx<-max(P)
brk <- seq(mn,mx,length.out = 13)
levs<-brk

RGB<-matrix(c(0,  0.167,	1,
              0.1,	0.4,	1,
              0.2,	0.6,	1,
              0.4,	0.8,	1,
              0.6,	0.933,	1,
              0.8,	1,	1,
              1,	1,	0.8,
              1,	0.933,	0.6,
              1,	0.8,	0.4,
              1,	0.6,	0.2,
              1,	0.4,	0.1,
              1,	0.167,	0), nrow=12, byrow=TRUE)

cols<-rgb(RGB[,1],RGB[,2],RGB[,3]) #convierte color a rgb

image.plot(lon-360,rev(lats[1:55]),P[,55:1], breaks=brk, lab.breaks=names(brk), col=cols)
contour(lon-360,rev(lats[1:55]),P[,55:1], add=TRUE, col=c("gray12","gray50","gray89"), levels = c(1010,1012,1016))
map(database="worldHires", add=TRUE, col="black", interior=TRUE)

########################################################################################
#### Generar una escala de grises  ##############
########################################################################################

for (i in 1:12){
  k <- 6*i
  cols[i] <- paste("gray",k,sep ="")
}

image.plot(lon-360,rev(lats[1:55]),P[,55:1], breaks=brk, lab.breaks=names(brk), col=cols)
contour(lon-360,rev(lats[1:55]),P[,55:1], add=TRUE, col=c("gray12","gray50","gray89"), levels = c(1010,1012,1016))
map(database="worldHires", add=TRUE, col="black", interior=TRUE)

########################################################################################
#### Generar una escala de cian RGB  ################
########################################################################################
rgbs <- cbind(12, seq(32,255, length=12), seq(32,255, length=12)) / 255
cols <- rgb(rgbs[,1], rgbs[,2], rgbs[,3]) 

image.plot(lon-360,rev(lats[1:55]),P[,55:1], breaks=brk, lab.breaks=names(brk), col=cols)
contour(lon-360,rev(lats[1:55]),P[,55:1], add=TRUE, col=c("gray12","gray50","gray89"), levels = c(1010,1012,1016))
map(database="worldHires", add=TRUE, col="black", interior=TRUE)

