#############
# VIDEO 2.1 #
#############

# asi se escribe un comentario

# si selecciono toda la suma y preciono CTRL+ENTER en la consola de abajo me muestra el resultado
4 + 8

# idem que antes, en este caso con un exponente
4^2

# asi asginamos valores a variables (tambien debemos ejecutarlo con CTRL+ENTER para que se lleve a cabo
# la asginaci?n porque sino en el siguiente paso nos va a tirar error cuando queramos ver su valor)
x <- 86

# asi llamamos a la variable (para ver el valor, igual que antes CTRL+ENTER selecionando la linea)
x

# aplicando todo lo que vimos hasta ahora, seleciona y ejecuta todo el bloque:
oficina <- 7
platzi <- 1
transporte <- 1.5
tiempo_al_dia <- oficina + platzi + transporte
tiempo_al_dia

#############
# VIDEO 2.2 #
#############

# Tipos de datos y estructuras de datasets
# usamos un datasets de "mtcars" y lo instalamos en la consola con el siguiente comando:
# install.packages("mtcars")
# tambien una vez escrito esto en la consola lo ejecutamos selecionandolo y precionando CTRL+ENTER
# como no est? mas habilitado... lo vamos a tener que sacar del github de la profe


# STR significa ESTRUCTURA, y as? vinculamos los datos a nuestra hoja de R. Notese que cuando ejecutamos
# en la consola nos muestra todos los datos y la definici?n del tipo de dato que son
# tener en cuenta que si no conocemos el dataset podemos preguntarle en la consola tipiando:
# ?mtscars
# e inmediatamente nos mostrara en la solapa help a tu derecha una biblioteca con informaci?n de la libreria
str(mtcars)

# verifiquemos el tipo de estructura de una variable, por ejemplo la de "vs"
# nos va a decir integer, pero si analizamos el dato, solo vale 1 o 0, entonces es booleano o logica
class(mtcars$vs)

# por lo tanto debemos convertir la variable a una estructura mas adecuada
# eso se hace asignandole a la variable el valor convertido con as.logical(tabla$variable)
mtcars$vs = as.logical(mtcars$vs)
class(mtcars$vs)

#############
# VIDEO 2.3 #
#############

# veamos la estructura de nuestro dataset economia naranja (orangeec)
str(orangeec)

# summary: nos muestra el resumen de un dataset
# nos sale una tabla con valores estadisticos que pueden ser util como el "mean" que es la "media"
summary(orangeec)
summary(mtcars)

# paso de libras a kilos la variable "wt" del dataset mtcars
wt <- (mtcars$wt * 1000)/2
wt

# y ahora hacemos lo mismo pero cambiandolo en el dataset posta
# para eso transformo esa variable del dataset, en todo el dataset, y me almaceno ese cambio
# en una nueva variable
str(mtcars)
mtcars.new <- transform(mtcars, wt= wt*1000/2)
mtcars.new
summary(mtcars.new)

# para modificar wt directamente en el modelo de datos puedo usar el siguiente codigo
# mtcars$wt = (mtcars$wt*1000)/2

#############
# VIDEO 2.4 #
#############

#veamos como se crean vectores y como se opera con ellos
tiempo_platzi <- c(25,5,10,15,10)
tiempo_lecturas <- c(30,10,5,10,15)
tiempo_aprendizaje <- tiempo_platzi + tiempo_lecturas
tiempo_aprendizaje

# ahora vectores pero con caracteres
dias_aprendizaje <- c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")

# ahora vecotres boleanos o logicos
dias_que_estuvimos_mas_de_20_min <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
dias_que_estuvimos_mas_de_20_min

# ?cuanto tiempo adicional tenemos cada dia para nuestro aprendizaje?
total_tiempo_platzi <- sum(tiempo_platzi)
total_tiempo_platzi
total_tiempo_lecturas <- sum(tiempo_lecturas)
total_tiempo_lecturas
total_tiempo_adicional <- total_tiempo_platzi + total_tiempo_lecturas
total_tiempo_adicional

# no responde a la pregunta, nos da un total, yo quiero para cada d?a, entonces, necesito trabajar con matrices
# matriz de fila X columna
# creamos la matriz cruda
matriz_tiempo <- matrix(c(tiempo_platzi, tiempo_lecturas), nrow=2, byrow=TRUE)
# creamos los nombres para las filas y las columnas
dias <- dias_aprendizaje
actividad <- c("tiempo platzi", "tiempo lecturas")
# le asignamos los nombres de fila y columna a la matriz
colnames(matriz_tiempo) <- dias
rownames(matriz_tiempo) <- actividad
# la observamos
matriz_tiempo
# respondamos d?a por d?a los resultados. Esto se logra sumando todas las filas de una misma columna
colSums(matriz_tiempo)

#############
# VIDEO 2.5 #
#############

# aprendamos mas agregando una actividad nueva como oir un podcast cada d?a, es decir, nueva fila
# debemos usar rbind que nos a?ade un nuevo vector como fila a nuestra matriz
matriz_final <- rbind(matriz_tiempo, c(10,15,30,5,0))
colSums(matriz_final)

# si queremos ver solo un elemento especifico, le decimos la fila y la columna
matriz_final[1,5]

#### desafio, agregar una nueva columna, ejemplo, los sabados ####
# notese que en ves de usar rbind, debo usar cbind (donde r es row y c es column)
matriz_super_final <- cbind(matriz_final, c(10,15, 0))
matriz_super_final

#############
# VIDEO 2.5 #
#############

# comparadores para buscar datos
# ?? !? < <= > >= !
# | = 0
# %in% = significa que algo est? en el dataset
# exploremos el dataset de mtcars

# busquemos los autos que tengan menos de 6 cilindros 
# (ojo la coma al final indica que busque en todo el dataset/observaciones/filas)
mtcars[mtcars$cyl < 6,]

# que paises tienen un PBI mayor o igual a 15000 en todos los paises?
orangeec[orangeec$GDP.PC>=15000,]

# que paises tienen un aporte a su PBI a travez de la economia naranja (economias creativas) 
# menor o igual al 2% del PBI de ese pais
orangeec[orangeec$Creat.Ind...GDP<=2,]

# hagamos subsettings
# paises que tienen mas de un 80% de su poblaccion con acceso a internet y ademas mas del 4,5%
# de su PBI está destinado en educación
neworangeec <- subset(orangeec, Internet.penetration...population > 80
                      & Education.invest...GDP >= 4.5)
neworangeec

# ahora queremos saber el porcentaje de PBI que aportan por economía naranja aquellos
# paises que tienen mas de un 80% de su poblaccion con acceso a internet y ademas mas del 4,5%
# de su PBI está destinado en educación
neworangeec <- subset(orangeec, Internet.penetration...population > 80
                                 & Education.invest...GDP >= 4.5,
                      select = Creat.Ind...GDP)
neworangeec

# instalamos el paquete "plyr" por consola con el comando:
# install.packages("plyr")
#library(plyr)
rename(orangeec, c("Creat.Ind...GDP" = "AporteEcNja"))
                   
#############
# VIDEO 2.5 #
#############

nivel_curso <- c("Basico", "Intermedio", "Avanzado")
nivel_curso

# nos muestra los primeros 6 datos del dataset
head(mtcars)

# nos muestra los ultimos 6 datos del dataset
tail(mtcars)

# instalo el siguiente paquete:
# install.packages("dplyr")
#library(dplyr)
# los textos son fct = factor, y los numericos son dbl = double
glimpse(orangeec)

# listas, almacenamos cualquier tipo de estructura
new_vector <- 1:8
new_matriz <- matrix(1:9, ncol=3)
dataframe <- mtcars[1:4,] 
new_vector
new_matriz
dataframe
new_lista <- list(new_vector, new_matriz, dataframe)
new_lista

#################
# VIDEO 3.1-2-3 #
#################

# grafico de barras -> ordenado por tamaño de barra de mayor a menor
# histograma -> sigue el patron del eje
# grafica de disperción o scatter plot -> solo numeros en cada eje y los puntos no se pueden unir
# grafica de lineas -> idem que antes pero sin las restricciones
# box plot -> rectangulo compuesto por 1/4, 1/2 y 3/4, con minimo y maximo extendidos por una linea

#############
# VIDEO 3.4 #
#############

# grafica de dispercion
# primeros parametros son los valores de los puntos
# segundos parametros son los nombres del eje
# tercer parametro es el titulo de la grafica de dispercion
plot(mtcars$mpg ~ mtcars$cyl,
     xlab="cilindros", ylab="millas por galon",
     main="relacion cilindos y millas por galon")
plot(mtcars$mpg ~ mtcars$hp,
     xlab="caballos de fuerza", ylab="millas por galon",
     main="relacion caballos de fuerza y millas por galon")
plot(orangeec$Unemployment ~ orangeec$Education.invest...GDP,
     xlab="Inversion en educacion (% del PBI)", 
     ylab="Desempleo",
     main="relacion inversion en educacion y desempleo")
plot(orangeec$GDP.PC ~ orangeec$Creat.Ind...GDP,
     xlab="Aporte economia naranja al PIB(%)", 
     ylab="PIB per capita",
     main="relacion economia naranja y PIB per capita")

#############
# VIDEO 3.4 #
#############

# histogramas
# instalo ggplot2, con:
# install.packages("ggplot2")
# bin = binwidth = ancho de cada barra
qplot(mtcars$hp,
      geom="histogram", # la geometria
      xlab="caballos de fuerza",
      main="Carros segun caballos de fuerza")


ggplot(mtcars, 
          aes(x=hp) # aes hace referencia a estetica
       ) + 
  geom_histogram() +
  labs(x="caballos de fuerza", 
       y="cantidad de carros",
       title="caballos de fuerza en carros seleccionados") +
  theme(legend.position = "none") + #posicion de la leyenda
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# vamos a cambiarle el ancho a las barras, a 30 opciones por barra
ggplot(mtcars, aes(x=hp)) + 
  geom_histogram(binwidth = 30) +
  labs(x="caballos de fuerza", 
       y="cantidad de carros",
       title="caballos de fuerza en carros seleccionados") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())


ggplot() +
  geom_histogram(data=mtcars,
                 aes(x=hp),
                 fill="blue", # barritas de color azul
                 color="red", # y un contorno rojo
                 binwidth = 20)  +
  labs(x="caballos de fuerza", 
       y="cantidad de carros",
       title="caballos de fuerza en carros seleccionados") +
  xlim(c(80,280)) + # ajustamos el eje x con un limite y lo defino por un contenedor
  theme(legend.position = "none") +
  theme(panel.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank())
  









