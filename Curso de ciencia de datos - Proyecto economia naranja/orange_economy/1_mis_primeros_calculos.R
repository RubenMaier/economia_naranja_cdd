#############
# VIDEO 2.1 #
#############

# asi se escribe un comentario

# si selecciono toda la suma y preciono CTRL+ENTER en la consola de abajo me muestra el resultado
4 + 8

# idem que antes, en este caso con un exponente
4^2

# asi asginamos valores a variables (tambien debemos ejecutarlo con CTRL+ENTER para que se lleve a cabo
# la asginación porque sino en el siguiente paso nos va a tirar error cuando queramos ver su valor)
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
# como no está mas habilitado... lo vamos a tener que sacar del github de la profe


# STR significa ESTRUCTURA, y así vinculamos los datos a nuestra hoja de R. Notese que cuando ejecutamos
# en la consola nos muestra todos los datos y la definición del tipo de dato que son
# tener en cuenta que si no conocemos el dataset podemos preguntarle en la consola tipiando:
# ?mtscars
# e inmediatamente nos mostrara en la solapa help a tu derecha una biblioteca con información de la libreria
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

# ¿cuanto tiempo adicional tenemos cada dia para nuestro aprendizaje?
total_tiempo_platzi <- sum(tiempo_platzi)
total_tiempo_platzi
total_tiempo_lecturas <- sum(tiempo_lecturas)
total_tiempo_lecturas
total_tiempo_adicional <- total_tiempo_platzi + total_tiempo_lecturas
total_tiempo_adicional

# no responde a la pregunta, nos da un total, yo quiero para cada día, entonces, necesito trabajar con matrices
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
# respondamos día por día los resultados. Esto se logra sumando todas las filas de una misma columna
colSums(matriz_tiempo)

#############
# VIDEO 2.5 #
#############

# aprendamos mas agregando una actividad nueva como oir un podcast cada día, es decir, nueva fila
# debemos usar rbind que nos añade un nuevo vector como fila a nuestra matriz
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
# %in% = significa que algo esté en el dataset
# exploremos el dataset de mtcars

# busquemos los autos que tengan menos de 6 cilindros 
# (ojo la coma al final indica que busque en todo el dataset/observaciones/filas)
mtcars[mtcars$cyl < 6,]

