#Read data with R base
getwd()
datos <- read.delim("../Exercises/ais.txt", header = TRUE, sep = "\t")
str(datos)
# Check the data structure

library(funModeling)
df_status(datos)
describe(datos) # From HMISC package

# Check the proportion of males and females in the sample

prop.table (table(datos$Sex)) *100

# Profiling categorical variables

freq(datos, input = c('Sex', 'Sport'))

# Only use male sample, and using select for two variables

datos_male <- subset (datos, Sex = "male")
datos_male <- datos_male %>% select(Hg, Hc)     

# report number of missing values per colums

anyNA(datos_male)

# descriptive statistics with R base
summary(datos_male)
df_status(datos_male)
