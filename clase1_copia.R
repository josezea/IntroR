######################3 Fundamentos básicos del lenguaje ####################################
edad = 10
edad

# Voy recoger datos de peso estaturas y sexo en unos estudiantes
# <-   =  es lo mismo

# Vectores: son un conjunto de valores que son  numéricos o de caracteres (hay otros..)

id = c(1, 2, 3, 4, 5)
id
# Voluntarios
nombre <- c("Daniel", "Carolina", "Marlen", "Rafael", "Sandra") # vector de tipo character
NOMBRE <- 2 # case sensitivity
# estatura en centimetros
estaturas = c(177, 160, 156, 165, 157)
mean(estaturas) 
sum(estaturas) / 5

uso_celular <- c("Moderado", "Mucho", "Mucho", "Moderado", "Moderado")
fuma <- c(F, T, T, F, F) # TRUE es con T y FALSE es con F

# Dataframe: Conjunto de datos
datos <- data.frame(id, nombre, estaturas, uso_celular, fuma)

datos$estaturas
mean(datos$estaturas)
class(datos$estaturas)
class(datos$fuma)


# Leer las pruebas saber 11 2020 (primer semestre)
# Ruta del archivo
setwd("~/curso R distrital") # Colocar o configurar carpeta de trabajo (set working directory)
saber11_20201 = read.delim("SB11_20201.TXT", sep = "|")


summary(saber11_20201$PUNT_INGLES)
hist(saber11_20201$PUNT_INGLES)


summary(saber11_20201$PUNT_MATEMATICAS)
summary(saber11_20201$PUNT_C_NATURALES)

