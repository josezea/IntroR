library(dplyr) # Biblioteca
library(ggplot2)

# Análisis de las pruebas saber 2020  - 2 (Bogotá)

table(df_bgta2$ESTU_PAIS_RESIDE)


## Operador %>% : Luego haga total 
# prendo estufa %>% saca aceite %>% echo paila %>% echo huevo ...

# ¿Cómo estamos en matematicas? (min, promedio, max)
df_bgta2 %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                       prom_mat = mean(PUNT_MATEMATICAS),
                       max_mat = max(PUNT_MATEMATICAS))

#2.  Hay diferencias en el desempeño en matemáticas en las jornadas

names(df_bgta2)

# Ordenado de menor a mayor
df_bgta2 %>% group_by(COLE_JORNADA) %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                       prom_mat = mean(PUNT_MATEMATICAS),
                       max_mat = max(PUNT_MATEMATICAS)) %>%
             arrange(prom_mat)



# Ordenado de menor a mayor
df_bgta2 %>% group_by(COLE_JORNADA) %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                                                  prom_mat = mean(PUNT_MATEMATICAS),
                                                  max_mat = max(PUNT_MATEMATICAS)) %>%
  arrange(desc(prom_mat))



consulta <- df_bgta2 %>% group_by(COLE_JORNADA) %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                                                  prom_mat = mean(PUNT_MATEMATICAS),
                                                  max_mat = max(PUNT_MATEMATICAS)) %>%
  arrange(desc(prom_mat))

ggplot(consulta, aes(x = COLE_JORNADA , y = prom_mat )) + geom_bar(stat = "identity")


# Analizar el puntaje de matemáticas por jornada pero sólo en los colegios públicos

consulta2 <- df_bgta2 %>% filter(COLE_NATURALEZA == "OFICIAL") %>% 
  group_by(COLE_JORNADA) %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                                       prom_mat = mean(PUNT_MATEMATICAS),
                                       max_mat = max(PUNT_MATEMATICAS)) %>%
  arrange(desc(prom_mat))
consulta2

# Contar cuantos estudiantes de colegios públicos hay en cada jornada 
consulta3 <- df_bgta2 %>% filter(COLE_NATURALEZA == "OFICIAL") %>% 
  group_by(COLE_JORNADA) %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                                       prom_mat = mean(PUNT_MATEMATICAS),
                                       max_mat = max(PUNT_MATEMATICAS),
                                       num_estudiantes = n()) %>%
  arrange(desc(prom_mat))


# Comprar el desmepeño de colegios públicos y privados
consulta4 <- df_bgta2 %>%
  group_by(COLE_NATURALEZA) %>% summarise(min_mat = min(PUNT_MATEMATICAS), 
                                       prom_mat = mean(PUNT_MATEMATICAS),
                                       max_mat = max(PUNT_MATEMATICAS),
                                       num_estudiantes = n()) %>%
  arrange(desc(prom_mat))
consulta4


ggplot(data = df_bgta2, aes(x = PUNT_MATEMATICAS, color = COLE_NATURALEZA)) + geom_density()



# Ver los 100 mejores en puntaje global en Bogotá (sólo de colegios públicos)

df_bgta2 %>% filter(COLE_NATURALEZA == "OFICIAL") %>% 
  group_by(COLE_COD_DANE_ESTABLECIMIENTO,
           COLE_NOMBRE_ESTABLECIMIENTO) %>% 
  summarise(promedio_PuntajeGlobal = mean(PUNT_GLOBAL), num_estud = n()) %>% 
  arrange(desc(promedio_PuntajeGlobal)) %>% ungroup() %>%
  mutate(ranking = 1:n())

# Obtener los mejores colegios públicos de Bogotá
consulta5 = df_bgta2 %>% filter(COLE_NATURALEZA == "OFICIAL") %>% 
  group_by(COLE_COD_DANE_ESTABLECIMIENTO,
           COLE_NOMBRE_ESTABLECIMIENTO) %>% 
    summarise(promedio_PuntajeGlobal = mean(PUNT_GLOBAL), num_estud = n()) %>% 
  arrange(desc(promedio_PuntajeGlobal)) %>% ungroup() %>%
  mutate(ranking = 1:n()) %>% filter(ranking <= 20)

ggplot(data = df_bgta2, aes(x =  PUNT_C_NATURALES, y = PUNT_MATEMATICAS)) + geom_point()

# Calcular a que estratos soecioecomicos  les fue mejor en las pruebas saber  


consulta6 <- df_bgta2  %>% 
  group_by(FAMI_ESTRATOVIVIENDA) %>% 
  summarise(promedio_PuntajeGlobal = mean(PUNT_GLOBAL), num_estud = n()) %>% 
  arrange(desc(promedio_PuntajeGlobal) )

setwd("~/curso R distrital")
library(readxl)
datos <- read_excel("juguete.xlsx" )

# Para leer datos copiando y pegando
#datos2 <- read.delim("clipboard")
library(RODBC)

