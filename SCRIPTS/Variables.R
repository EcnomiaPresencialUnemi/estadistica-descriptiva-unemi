df <- BDD_POB_CPV2022_CANT
# Filtrar solo registros del cantón Milagro (código 0910)
df_milagro <- subset(df, CANTON == "0910")

# Exportar a la carpeta DATA
write.csv(df_milagro, "DATA/BDD_POB_CPV2022_MILAGRO.csv", row.names = FALSE)
remove(BDD_POB_CPV2022_CANT)
remove(df)

###############################################################################
#                    ESTADÍSTICA DESCRIPTIVA - SEMANAS 1 y 2                 #
#                          CENSO POBLACIÓN MILAGRO 2022                       #
#                           SCRIPT DIDÁCTICO INTERACTIVO                      #
###############################################################################

# IMPORTANTE: Ejecutar línea por línea o sección por sección
# Este script está diseñado para clase EN VIVO con explicaciones teóricas
# NIVEL: PRINCIPIANTES ABSOLUTOS EN R - PRIMERA CLASE

# Requisito: Tener cargado df_milagro (datos del Censo 2022 - Cantón Milagro)
# Si no lo tienes, primero ejecuta: df_milagro <- read.csv("tu_archivo.csv")

###############################################################################
# MÓDULO 1: EXPLORANDO NUESTROS DATOS (10 minutos)
# Objetivo: Familiarizarse con el dataset y R básico
###############################################################################

# ===== PAUSA TEÓRICA =====
# Pregunta a los estudiantes: 
# "¿Qué esperan encontrar en un censo de población?"
# "¿Qué tipo de preguntas se hacen en un censo?"
# ==========================

# 1.1 PRIMEROS PASOS: ¿Qué tenemos?
# print() muestra texto o números en la pantalla
print("=== CONOCIENDO NUESTROS DATOS DEL CENSO MILAGRO 2022 ===")

# EJERCICIO INTERACTIVO 1:
# "Antes de ejecutar el código, ¿cuántos habitantes creen que tiene Milagro?"
# [Dar tiempo para respuestas de estudiantes]

# CÓDIGO DE RESPUESTA:
# nrow() cuenta las filas (en nuestro caso, personas)
poblacion_total <- nrow(df_milagro)
# Mostrar el resultado
poblacion_total

# ncol() cuenta las columnas (variables o preguntas del censo)
num_variables <- ncol(df_milagro)
num_variables

# ===== PAUSA TEÓRICA =====
# Conceptos clave:
# - POBLACIÓN vs MUESTRA: ¿Qué tenemos aquí?
# - VARIABLE: Cada columna representa una pregunta del censo
# - OBSERVACIÓN: Cada fila es una persona censada
# ==========================

# 1.2 ¿Qué variables tenemos disponibles?
# names() muestra los nombres de las columnas
names(df_milagro)

# head() muestra las primeras 6 filas del dataset
head(df_milagro)

# EJERCICIO INTERACTIVO 2:
# "Mirando los nombres de las variables, ¿cuáles creen que son más importantes 
# para análisis económico y social?"
# [Discutir respuestas]

# CÓDIGO DE RESPUESTA: Identificar variables clave
print("Variables principales que analizaremos:")
print("P01 = Parentesco con jefe del hogar")
print("P02 = Sexo al nacer") 
print("P03 = Edad en años cumplidos")

# ===== PAUSA TEÓRICA =====
# Explicar códigos principales del censo:
# P02 = Sexo al nacer (1=Hombre, 2=Mujer)  
# P03 = Edad en años cumplidos
# P01 = Parentesco (relación con jefe/a del hogar)
# ==========================

###############################################################################
# MÓDULO 2: TIPOS DE VARIABLES (10 minutos)
# Objetivo: Clasificar variables según su naturaleza
###############################################################################

# ===== PAUSA TEÓRICA =====
# Pregunta: "¿Recuerdan los tipos de variables en estadística?"
# - Cualitativas (categóricas): Nominal y Ordinal
# - Cuantitativas (numéricas): Discreta y Continua
# ==========================

# 2.1 VARIABLE CUALITATIVA NOMINAL: Sexo (P02)
print("=== ANALIZANDO SEXO (P02) - Variable Categórica Nominal ===")

# EJERCICIO INTERACTIVO 3:
# "¿Qué tipo de variable es el sexo y por qué?"
# "¿Esperan que haya igual número de hombres y mujeres?"
# [Escuchar respuestas]

# CÓDIGO DE RESPUESTA:
# table() cuenta cuántas veces aparece cada valor
tabla_sexo <- table(df_milagro$P02)
tabla_sexo

print("¿Por qué es variable categórica nominal?")
print("- Tiene categorías: 1 y 2")
print("- No hay orden entre hombre y mujer")
print("- Los números son solo etiquetas")

# ===== PAUSA TEÓRICA =====
# Variable NOMINAL: Las categorías no tienen orden natural
# 1 = Hombre, 2 = Mujer (los números son solo códigos, no orden)
# ==========================

# 2.2 VARIABLE CUANTITATIVA DISCRETA: Edad (P03)
print("=== ANALIZANDO EDAD (P03) - Variable Cuantitativa Discreta ===")

# EJERCICIO INTERACTIVO 4:
# "¿Por qué decimos que la edad es discreta y no continua?"
# "¿Cuál creen que es la edad mínima y máxima en nuestros datos?"
# [Discutir respuestas]

# CÓDIGO DE RESPUESTA:
# min() encuentra el valor más pequeño
edad_min <- min(df_milagro$P03)
edad_min

# max() encuentra el valor más grande
edad_max <- max(df_milagro$P03)
edad_max

print("¿Por qué es variable cuantitativa discreta?")
print("- Es numérica: podemos sumar, restar, etc.")
print("- Es discreta: solo números enteros (0, 1, 2, 3...)")
print("- No existe edad 25.5 años cumplidos")

# ===== PAUSA TEÓRICA =====
# Variable DISCRETA: Solo puede tomar valores enteros específicos
# No puede existir una persona de 25.5 años cumplidos
# ==========================

###############################################################################
# MÓDULO 3: TABLAS DE FRECUENCIA BÁSICAS (15 minutos)
# Objetivo: Construir e interpretar tablas de frecuencia
###############################################################################

# ===== PAUSA TEÓRICA =====
# ¿Para qué sirven las tablas de frecuencia?
# - Resumir datos categóricos
# - Ver distribución de una variable
# - Base para gráficos
# ==========================

# 3.1 FRECUENCIA SIMPLE - Variable Sexo
print("=== TABLA DE FRECUENCIA: SEXO ===")

# EJERCICIO INTERACTIVO 5:
# "Viendo los números de la tabla anterior, ¿cuál es más frecuente?"
# "¿Cómo calcularían el porcentaje de cada sexo?"
# [Dar tiempo para cálculos mentales]

# CÓDIGO DE RESPUESTA:
# Ya tenemos la tabla, la mostramos de nuevo
frec_sexo <- table(df_milagro$P02)
print("Frecuencias absolutas (conteos):")
frec_sexo

# Calcular porcentajes paso a paso
# sum() suma todos los valores
total_personas <- sum(frec_sexo)
print("Total de personas:")
total_personas

# Dividir cada frecuencia entre el total y multiplicar por 100
hombres_freq <- frec_sexo[1]
mujeres_freq <- frec_sexo[2]

porcentaje_hombres <- hombres_freq / total_personas * 100
porcentaje_mujeres <- mujeres_freq / total_personas * 100

print("Porcentajes calculados manualmente:")
porcentaje_hombres
porcentaje_mujeres

# También podemos usar prop.table() que hace lo mismo automáticamente
porcentajes_automaticos <- prop.table(frec_sexo) * 100
print("Porcentajes usando prop.table():")
porcentajes_automaticos

# 3.2 MEJORAR LA TABLA CON ETIQUETAS
# Cambiar los nombres 1, 2 por Hombres, Mujeres
names(frec_sexo) <- c("Hombres", "Mujeres")
print("Tabla con etiquetas claras:")
frec_sexo

# EJERCICIO INTERACTIVO 6:
# "¿Estos porcentajes coinciden con sus expectativas?"
# "¿Qué factores podrían explicar esta distribución?"
# [Discusión sobre demografía]

# CÓDIGO DE RESPUESTA - ANÁLISIS SIMPLE:
print("=== ANÁLISIS DE LA DISTRIBUCIÓN POR SEXO ===")

# abs() calcula el valor absoluto (siempre positivo)
diferencia_sexos <- abs(frec_sexo["Hombres"] - frec_sexo["Mujeres"])
print("Diferencia entre hombres y mujeres:")
diferencia_sexos

# Calcular qué porcentaje representa esta diferencia
porcentaje_diferencia <- diferencia_sexos / total_personas * 100
print("Esta diferencia representa el siguiente % del total:")
porcentaje_diferencia

# [El profesor interpreta: si es menos de 3%, es equilibrado; si más, hay desequilibrio]

# ===== PAUSA TEÓRICA =====
# Interpretación económica:
# - ¿Cómo afecta la composición por sexo al mercado laboral?
# - ¿Qué implicaciones tiene para políticas públicas?
# ==========================

# 3.3 FRECUENCIA DE PARENTESCO (P01) - Los primeros 10
print("=== TABLA DE FRECUENCIA: PARENTESCO (Top 10) ===")

# EJERCICIO INTERACTIVO 7:
# "¿Cuál creen que será la categoría de parentesco más común?"
# "¿Por qué?"
# [Escuchar hipótesis]

# CÓDIGO DE RESPUESTA:
# Crear tabla de parentesco
frec_parentesco <- table(df_milagro$P01)

# sort() ordena de menor a mayor, decreasing=TRUE los pone de mayor a menor
frec_parentesco_ordenado <- sort(frec_parentesco, decreasing = TRUE)

# head() toma los primeros elementos (en este caso los 10 primeros)
top_10_parentesco <- head(frec_parentesco_ordenado, 10)
print("Los 10 tipos de parentesco más frecuentes:")
top_10_parentesco

# EJERCICIO INTERACTIVO 8:
# "¿Cuál es la categoría más común? ¿Coincide con sus predicciones?"
# "¿Qué nos dice esto sobre la estructura familiar en Milagro?"
# [Analizar resultados juntos]

# CÓDIGO DE RESPUESTA - ANÁLISIS ESTRUCTURA FAMILIAR:
print("=== ANÁLISIS DE ESTRUCTURA FAMILIAR ===")

# El primer elemento es el más frecuente
frecuencia_mas_alta <- top_10_parentesco[1]
print("La categoría más frecuente aparece:")
print(frecuencia_mas_alta)

# names() obtiene los nombres, [1] toma el primero
codigo_mas_frecuente <- names(top_10_parentesco)[1]
print("El código más frecuente es:")
print(codigo_mas_frecuente)

# [El profesor explica qué significa este código según el diccionario del censo]

###############################################################################
# MÓDULO 4: FRECUENCIAS PARA VARIABLES NUMÉRICAS (10 minutos)
# Objetivo: Trabajar con distribuciones de edad
###############################################################################

# ===== PAUSA TEÓRICA =====
# Para variables numéricas con muchos valores únicos:
# - Agrupamos en intervalos (clases)
# - Creamos histogramas
# - Calculamos frecuencias acumuladas
# ==========================

# 4.1 DISTRIBUCIÓN DE EDADES - Tabla simple
print("=== DISTRIBUCIÓN DE EDADES - Primeras 20 ===")

# EJERCICIO INTERACTIVO 9:
# "¿Esperan ver muchas personas de edad 0? ¿Por qué?"
# "¿Qué edades creen que serán más comunes?"
# [Discutir antes de ver resultados]

# CÓDIGO DE RESPUESTA:
# Crear tabla de todas las edades
frec_edades <- table(df_milagro$P03)

# Mostrar solo las primeras 20 edades
primeras_20_edades <- head(frec_edades, 20)
print("Cuántas personas hay de cada edad (primeras 20):")
primeras_20_edades

# Mirar específicamente la edad 0
print("Personas de edad 0 (bebés menores de 1 año):")
frec_edades["0"]

# 4.2 ESTADÍSTICAS BÁSICAS DE LA EDAD
print("=== ESTADÍSTICAS BÁSICAS DE LA EDAD ===")

# EJERCICIO INTERACTIVO 10:
# "¿Cuál creen que es la edad promedio de la población de Milagro?"
# "¿Será similar a la mediana?"
# [Recoger estimaciones numéricas]

# CÓDIGO DE RESPUESTA:
# mean() calcula el promedio (suma todos los valores y divide entre el total)
edad_promedio <- mean(df_milagro$P03)
print("Edad promedio:")
edad_promedio

# median() encuentra el valor del medio cuando se ordenan todos los datos
edad_mediana <- median(df_milagro$P03)
print("Edad mediana:")
edad_mediana

# round() redondea los números para que sean más fáciles de leer
edad_promedio_redondeado <- round(edad_promedio, 1)
print("Edad promedio redondeado a 1 decimal:")
edad_promedio_redondeado

# EJERCICIO INTERACTIVO 11:
# "¿Sus estimaciones estuvieron cerca?"
# "¿Por qué la media y mediana son diferentes?"
# [Discutir interpretación]

# CÓDIGO DE RESPUESTA - COMPARAR MEDIA Y MEDIANA:
print("=== COMPARACIÓN MEDIA vs MEDIANA ===")

# Calcular la diferencia
diferencia_media_mediana <- edad_promedio - edad_mediana
print("Diferencia (promedio - mediana):")
diferencia_media_mediana

print("Valores para comparar:")
print(paste("Promedio:", round(edad_promedio, 1), "años"))
print(paste("Mediana:", edad_mediana, "años"))

# [El profesor interpreta: si promedio > mediana, hay personas mayores que "jalan" el promedio hacia arriba]

# ===== PAUSA TEÓRICA =====
# MEDIA vs MEDIANA:
# - Media: sensible a valores extremos
# - Mediana: punto medio, más robusta
# - En poblaciones: ¿qué nos dice cada una?
# ==========================

###############################################################################
# MÓDULO 5: PRIMEROS GRÁFICOS (10 minutos)
# Objetivo: Visualizar nuestros datos
###############################################################################

# ===== PAUSA TEÓRICA =====
# "Una imagen vale más que mil palabras"
# Los gráficos nos ayudan a:
# - Ver patrones rápidamente
# - Comunicar resultados
# - Detectar errores en datos
# ==========================

# 5.1 GRÁFICO DE BARRAS BÁSICO - Sexo
print("=== GRÁFICO DE BARRAS: DISTRIBUCIÓN POR SEXO ===")

# EJERCICIO INTERACTIVO 12:
# "Antes de hacer el gráfico, dibujen en papel cómo esperan que se vea"
# "¿Qué barra será más alta?"
# [Tiempo para dibujo rápido]

# CÓDIGO DE RESPUESTA:
# Usar la tabla que ya tenemos
frec_sexo_para_grafico <- table(df_milagro$P02)
names(frec_sexo_para_grafico) <- c("Hombres", "Mujeres")

# barplot() crea un gráfico de barras
barplot(frec_sexo_para_grafico)

# Agregar título con main=
barplot(frec_sexo_para_grafico, main = "Población por Sexo - Milagro 2022")

# Agregar etiquetas a los ejes con xlab= y ylab=
barplot(frec_sexo_para_grafico, 
        main = "Población por Sexo - Milagro 2022",
        xlab = "Sexo", 
        ylab = "Número de Personas")

# Agregar colores con col=
barplot(frec_sexo_para_grafico, 
        main = "Población por Sexo - Milagro 2022",
        xlab = "Sexo", 
        ylab = "Número de Personas",
        col = c("lightblue", "pink"))

# EJERCICIO INTERACTIVO 13:
# "¿Se parece a su dibujo?"
# "¿Es fácil ver la diferencia entre las barras?"
# "¿Qué les dice este gráfico?"
# [Comparar con predicciones]

# CÓDIGO DE RESPUESTA - ANÁLISIS DEL GRÁFICO:
print("=== ANÁLISIS DEL GRÁFICO DE BARRAS ===")

# Comparar las dos barras
hombres_total <- frec_sexo_para_grafico["Hombres"]
mujeres_total <- frec_sexo_para_grafico["Mujeres"]

print("Número de hombres:")
hombres_total
print("Número de mujeres:")
mujeres_total

# Calcular diferencia entre las barras
diferencia_barras <- abs(hombres_total - mujeres_total)
print("Diferencia entre las barras:")
diferencia_barras

# [El profesor interpreta: si la diferencia es pequeña, las barras se ven similares]

# ===== PAUSA TEÓRICA =====
# Principios de buenos gráficos:
# - Título claro
# - Ejes etiquetados
# - Colores que ayuden a la interpretación
# ==========================

# 5.2 HISTOGRAMA BÁSICO - Edad
print("=== HISTOGRAMA: DISTRIBUCIÓN DE EDADES ===")

# EJERCICIO INTERACTIVO 14:
# "¿Cómo creen que se distribuyen las edades en Milagro?"
# "¿Será una población joven, adulta, o equilibrada?"
# [Escuchar hipótesis]

# CÓDIGO DE RESPUESTA:
# hist() crea un histograma
hist(df_milagro$P03)

# Agregar título y etiquetas
hist(df_milagro$P03, 
     main = "Distribución de Edades - Milagro 2022",
     xlab = "Edad (años)", 
     ylab = "Frecuencia")

# Agregar color
hist(df_milagro$P03, 
     main = "Distribución de Edades - Milagro 2022",
     xlab = "Edad (años)", 
     ylab = "Frecuencia",
     col = "lightgreen")

# EJERCICIO INTERACTIVO 15:
# "¿Qué forma tiene la distribución?"
# "¿Dónde se concentra más la población?"
# "¿Es una población joven o envejecida?"
# [Analizar forma del histograma juntos]

# CÓDIGO DE RESPUESTA - CONTAR GRUPOS DE EDAD:
print("=== ANÁLISIS POR GRUPOS DE EDAD ===")

# Contar jóvenes (menores de 30)
# sum() cuenta cuántos TRUE hay en la condición df_milagro$P03 < 30
jovenes <- sum(df_milagro$P03 < 30)
print("Personas menores de 30 años:")
jovenes

# Contar adultos (30-59)
adultos <- sum(df_milagro$P03 >= 30 & df_milagro$P03 < 60)
print("Personas de 30-59 años:")
adultos

# Contar mayores (60+)
mayores <- sum(df_milagro$P03 >= 60)
print("Personas de 60+ años:")
mayores

# Calcular porcentaje de jóvenes
total_poblacion <- nrow(df_milagro)
porcentaje_jovenes <- jovenes / total_poblacion * 100
print("Porcentaje de población joven:")
round(porcentaje_jovenes, 1)

# [El profesor interpreta: si más del 40% son jóvenes, es población joven]

# ===== PAUSA TEÓRICA =====
# Interpretación de histogramas:
# - Forma de la distribución (simétrica, sesgada)
# - Moda(s): picos en el histograma
# - Dispersión: qué tan "aplastada" o "puntiaguda" es
# ==========================

###############################################################################
# MÓDULO 6: MEDIDAS DESCRIPTIVAS BÁSICAS (15 minutos)
# Objetivo: Calcular e interpretar medidas de tendencia central y dispersión
###############################################################################

# ===== PAUSA TEÓRICA =====
# Las medidas numéricas nos ayudan a:
# - Resumir información en pocos números
# - Comparar diferentes poblaciones
# - Tomar decisiones informadas
# ==========================

# 6.1 MEDIDAS DE TENDENCIA CENTRAL
print("=== MEDIDAS DE TENDENCIA CENTRAL - EDAD ===")

# EJERCICIO INTERACTIVO 16:
# "¿Recuerdan qué es la moda?"
# "¿Cómo la encontrarían en nuestros datos?"
# [Repasar concepto de moda]

# CÓDIGO DE RESPUESTA:
# Mostrar las tres medidas principales
print("Las tres medidas de tendencia central:")

print(paste("Media (promedio):", round(edad_promedio, 1), "años"))
print(paste("Mediana (valor del medio):", edad_mediana, "años"))

# Para la moda, necesitamos encontrar la edad más frecuente
# Usamos la tabla de edades que ya creamos
tabla_edades <- table(df_milagro$P03)

# max() encuentra la frecuencia más alta
frecuencia_maxima <- max(tabla_edades)
print(paste("La frecuencia más alta es:", frecuencia_maxima))

# Para encontrar qué edad tiene esa frecuencia, necesitamos buscar manualmente
# [El profesor puede mostrar la tabla y encontrar visualmente la moda]
print("Tabla de edades (para encontrar la moda visualmente):")
head(sort(tabla_edades, decreasing = TRUE), 5)

# EJERCICIO INTERACTIVO 17:
# "¿Cuál de las tres medidas representa mejor a la población de Milagro?"
# "¿Por qué las tres son diferentes?"
# "¿Qué medida usarían para describir la 'edad típica' de Milagro?"
# [Discutir cuándo usar cada una]

# CÓDIGO DE RESPUESTA - COMPARAR LAS TRES MEDIDAS:
print("=== COMPARACIÓN DE LAS TRES MEDIDAS ===")
print("Medidas calculadas:")
print(paste("• Media:", round(edad_promedio, 1), "años"))
print(paste("• Mediana:", edad_mediana, "años"))
print(paste("• Moda: ver tabla anterior"))

print("¿Cuándo usar cada medida?")
print("• MEDIA: Para cálculos matemáticos y promedios")
print("• MEDIANA: Cuando hay valores extremos")
print("• MODA: Para encontrar el valor más común")

# ===== PAUSA TEÓRICA =====
# Interpretación económica de las medidas:
# - Edad promedio: para planificar servicios públicos
# - Mediana: división natural de la población
# - Moda: edad más común, importante para mercadeo
# ==========================

# 6.2 MEDIDAS DE DISPERSIÓN
print("=== MEDIDAS DE DISPERSIÓN - EDAD ===")

# EJERCICIO INTERACTIVO 18:
# "¿Qué significa que una población sea 'dispersa' en edad?"
# "¿Milagro tendrá edades muy variadas o similares?"
# [Conceptualizar dispersión]

# CÓDIGO DE RESPUESTA:
# Calcular el rango (diferencia entre máximo y mínimo)
rango_edades <- edad_max - edad_min
print("Medidas de dispersión:")
print(paste("Rango:", rango_edades, "años"))
print(paste("Va desde", edad_min, "hasta", edad_max, "años"))

# var() calcula la varianza
varianza_edad <- var(df_milagro$P03)
print(paste("Varianza:", round(varianza_edad, 1)))

# sd() calcula la desviación estándar
desviacion_estandar <- sd(df_milagro$P03)
print(paste("Desviación estándar:", round(desviacion_estandar, 1), "años"))

# EJERCICIO INTERACTIVO 19:
# "¿Qué significa que la desviación estándar sea de [X] años?"
# "¿La población de Milagro es muy diversa en edades?"
# "Si fuera una población muy homogénea, ¿cómo sería la desviación estándar?"
# [Interpretar el valor específico cuando lo ejecuten]

# CÓDIGO DE RESPUESTA - INTERPRETAR LA DISPERSIÓN:
print("=== INTERPRETACIÓN DE LA DISPERSIÓN ===")
print(paste("La desviación estándar es:", round(desviacion_estandar, 1), "años"))

# Calcular el rango típico (promedio ± 1 desviación estándar)
limite_inferior <- edad_promedio - desviacion_estandar
limite_superior <- edad_promedio + desviacion_estandar

print("Esto significa que la mayoría de personas tienen edades entre:")
print(paste(round(limite_inferior, 1), "y", round(limite_superior, 1), "años"))

# [El profesor interpreta: si la desviación es pequeña, las edades son similares]

# ===== PAUSA TEÓRICA =====
# Interpretación de dispersión:
# - Desviación estándar baja: población homogénea
# - Desviación estándar alta: población heterogénea
# - Importante para planificación y políticas públicas
# ==========================

###############################################################################
# MÓDULO 7: ANÁLISIS BIVARIADO BÁSICO (10 minutos)
# Objetivo: Analizar dos variables simultáneamente
###############################################################################

# ===== PAUSA TEÓRICA =====
# Análisis bivariado nos permite ver:
# - Relaciones entre variables
# - Diferencias entre grupos
# - Patrones más complejos
# ==========================

# 7.1 TABLA DE CONTINGENCIA: Sexo vs Rangos de Edad
print("=== ANÁLISIS BIVARIADO: SEXO vs GRUPOS DE EDAD ===")

# EJERCICIO INTERACTIVO 20:
# "¿En qué grupo de edad esperan encontrar más diferencias entre hombres y mujeres?"
# "¿Por qué podría haber diferencias?"
# [Hipótesis sobre demografía por género]

# CÓDIGO DE RESPUESTA:
# Crear grupos de edad simples manualmente
# Primero crear vectores TRUE/FALSE para cada grupo

# Jóvenes: menores de 18
es_joven <- df_milagro$P03 < 18

# Adultos: 18-64
es_adulto <- df_milagro$P03 >= 18 & df_milagro$P03 < 65

# Mayores: 65+
es_mayor <- df_milagro$P03 >= 65

# Crear una nueva columna con los grupos
# Empezamos con todos como "Adulto"
df_milagro$grupo_edad <- "Adulto"

# Cambiar los jóvenes
df_milagro$grupo_edad[es_joven] <- "Joven"

# Cambiar los mayores
df_milagro$grupo_edad[es_mayor] <- "Mayor"

# Crear tabla de contingencia
# table() con dos variables hace una tabla cruzada
tabla_sexo_edad <- table(df_milagro$P02, df_milagro$grupo_edad)
print("Tabla cruzada: Sexo vs Grupo de Edad")
tabla_sexo_edad

# EJERCICIO INTERACTIVO 21:
# "¿Qué observan en esta tabla?"
# "¿Hay más niños o niñas? ¿Y en otros grupos?"
# [Analizar patrones en la tabla]

# CÓDIGO DE RESPUESTA - ANALIZAR CADA GRUPO:
print("=== ANÁLISIS POR GRUPOS ===")

# Extraer números específicos de la tabla
jovenes_sexo_1 <- tabla_sexo_edad[1, "Joven"]
jovenes_sexo_2 <- tabla_sexo_edad[2, "Joven"]

print(paste("Jóvenes sexo 1:", jovenes_sexo_1))
print(paste("Jóvenes sexo 2:", jovenes_sexo_2))

adultos_sexo_1 <- tabla_sexo_edad[1, "Adulto"]
adultos_sexo_2 <- tabla_sexo_edad[2, "Adulto"]

print(paste("Adultos sexo 1:", adultos_sexo_1))
print(paste("Adultos sexo 2:", adultos_sexo_2))

mayores_sexo_1 <- tabla_sexo_edad[1, "Mayor"]
mayores_sexo_2 <- tabla_sexo_edad[2, "Mayor"]

print(paste("Mayores sexo 1:", mayores_sexo_1))
print(paste("Mayores sexo 2:", mayores_sexo_2))

# EJERCICIO INTERACTIVO 22:
# "¿En qué grupo de edad las diferencias son más marcadas?"
# "¿Qué factores sociales o económicos podrían explicar estas diferencias?"
# [Discusión sobre causas demográficas]

# CÓDIGO DE RESPUESTA - CALCULAR DIFERENCIAS:
print("=== DIFERENCIAS POR GRUPO ===")

# Calcular diferencias absolutas en cada grupo
diferencia_jovenes <- abs(jovenes_sexo_1 - jovenes_sexo_2)
diferencia_adultos <- abs(adultos_sexo_1 - adultos_sexo_2)
diferencia_mayores <- abs(mayores_sexo_1 - mayores_sexo_2)

print(paste("Diferencia en jóvenes:", diferencia_jovenes))
print(paste("Diferencia en adultos:", diferencia_adultos))
print(paste("Diferencia en mayores:", diferencia_mayores))

# [El profesor interpreta: el grupo con mayor diferencia necesita más investigación]

# ===== PAUSA TEÓRICA =====
# Aplicaciones económicas:
# - Planificación de la fuerza laboral
# - Diseño de productos por demografía
# - Políticas de salud diferenciadas
# ==========================

###############################################################################
# MÓDULO 8: INTRODUCCIÓN A PAQUETES MODERNOS (5 minutos)
# Objetivo: Mostrar herramientas más avanzadas disponibles
###############################################################################

# ===== PAUSA TEÓRICA =====
# R tiene miles de paquetes especializados:
# - janitor: tablas más elegantes
# - ggplot2: gráficos profesionales (próxima clase)
# - dplyr: manipulación de datos (próxima clase)
# ==========================

# 8.1 CARGAR PAQUETE JANITOR
# install.packages("janitor")    # Solo ejecutar la primera vez

# library() carga un paquete para usarlo
library(janitor)

# 8.2 EJEMPLO DE TABLA MODERNA

# EJERCICIO INTERACTIVO 23:
# "¿Cómo se ve nuestra tabla de sexo con herramientas modernas?"
# "¿Será más fácil de leer?"
# [Comparar estilos]

# CÓDIGO DE RESPUESTA:
print("=== TABLA BÁSICA (lo que ya conocemos) ===")

# Método básico
tabla_basica <- table(df_milagro$P02)
names(tabla_basica) <- c("Hombres", "Mujeres")
print("Conteos:")
tabla_basica

porcentajes_basicos <- prop.table(tabla_basica) * 100
print("Porcentajes:")
round(porcentajes_basicos, 1)

print("=== TABLA MODERNA (con paquete janitor) ===")

# tabyl() es como table() pero más elegante
tabla_moderna <- tabyl(df_milagro, P02)
print("Tabla automática con conteos y porcentajes:")
tabla_moderna

print("VENTAJAS de las herramientas modernas:")
print("• Conteos Y porcentajes en una sola tabla")
print("• Formato más profesional")
print("• Más fácil de leer")
print("• Listo para reportes")

###############################################################################
# MÓDULO 9: RESUMEN Y EJERCICIOS PARA CASA (5 minutos)
# Objetivo: Consolidar aprendizajes
###############################################################################

print("=== FUNCIONES DE R APRENDIDAS HOY ===")
print("• nrow() - contar filas (personas)")
print("• ncol() - contar columnas (variables)") 
print("• names() - ver nombres de variables")
print("• head() - ver primeras filas")
print("• print() - mostrar resultados en pantalla")
print("• table() - crear tablas de frecuencia")
print("• mean() - calcular promedio")
print("• median() - calcular mediana")
print("• min() y max() - valores mínimo y máximo")
print("• sum() - sumar valores")
print("• abs() - valor absoluto")
print("• round() - redondear números")
print("• sort() - ordenar valores")
print("• prop.table() - convertir a porcentajes")
print("• var() - calcular varianza")
print("• sd() - calcular desviación estándar")
print("• barplot() - gráfico de barras")
print("• hist() - histograma")

print("=== CONCEPTOS ESTADÍSTICOS APRENDIDOS ===")
print("• Tipos de variables: nominal, ordinal, discreta, continua") 
print("• Tablas de frecuencia y porcentajes")
print("• Medidas de tendencia central: media, mediana, moda")
print("• Medidas de dispersión: rango, varianza, desviación estándar")
print("• Análisis bivariado: tabla de contingencia")
print("• Gráficos básicos: barras e histograma")

print("=== EJERCICIOS PARA PRÓXIMA CLASE ===")
print("1. Hacer tabla de frecuencias de parentesco (P01)")
print("2. Calcular media y mediana de parentesco")
print("3. Crear un gráfico de barras de parentesco")
print("4. Interpretar todos los resultados")
print("5. Investigar qué significan los códigos de parentesco del censo")

# EJERCICIO INTERACTIVO FINAL:
# "¿Qué fue lo más sorprendente de los datos de Milagro?"
# "¿Cómo podrían usar esta información en su futura carrera?"
# "¿Qué otras preguntas les surgen sobre la población?"
# [Reflexión grupal]

# CÓDIGO DE RESPUESTA - DATOS DESTACADOS:
print("=== DATOS DESTACADOS DE LA CLASE ===")
print(paste("• Población total:", format(poblacion_total, big.mark = ",")))
print(paste("• Edad promedio:", round(edad_promedio, 1), "años"))
print(paste("• Edad mínima:", edad_min, "años"))
print(paste("• Edad máxima:", edad_max, "años"))
print(paste("• Variables en el dataset:", num_variables))

print("=== ¡FELICITACIONES! ===")
print("Completaron su primera clase de R exitosamente")
print("Aprendieron funciones básicas y conceptos estadísticos importantes")
print("En la próxima clase: gráficos más profesionales y análisis avanzado")

###############################################################################
#                              FIN DEL SCRIPT                                #
# ¡Excelente trabajo! Dominaron los fundamentos de R y estadística          #
# descriptiva usando datos reales del censo de Milagro 2022                 #
#                                                                           #
# PRÓXIMA CLASE: Visualizaciones avanzadas y manipulación de datos          #
###############################################################################