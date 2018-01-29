rm(list=ls())
a = 10
a
b = 5
c = a +b
c
T
F
b > a
c < b
c > a

e = "hello"
class(e)
class (a)


nvec = c(1,2,3,4,5)
nvec
class(nvec)

cvec =c("U", "S", "A")
cvec


v = c(T, 20, 40)
v

#Nombrar a mi vector con names 
temps = c(1,2,4,5,6,7,8,22)
temps
names(temps) = c('Mon','Tue', 'Wed', 'Thus', 
                 'Fri', 'Sat', 'Sun')
temps

days = c('Mon','Tue', 'Wed', 'Thus', 
         'Fri', 'Sat', 'Sun')
days

#También se puede hacer creando un vector sin
#poner todo a mano como en el primer ejemplo
names(temps)= days
temps

#Elegir y patrón

v1 = c(100,200,300)
v1
v2 = c("a", "b", "c")
v2

v1[c(1,2)]

v3 = c(1,2,3,4,5,6)
v3
v3[c(2:4)]

#Elegir en tabla
v4  = c('a', 'b', 'c', 'd', 'e', 'f')
v4

names(v3) = v4
v3
v3[c(2,4)]
v3[c(v3>4)]

#Elegir mayor o menor
v3[v3>4]

#Para saber verdadero o falso
v3>5

g = v3>5
v3[g] #Asi sale el que es mayor a 5


#Matriz

q = 1:10
q
matrix(q)

q

#En vez de tener de 1 a 10 en una linea tendremos
#en dos
matrix(q, nrow = 2)

#De 1 a 12 en 4 filas 

matrix(1:12, byrow = FALSE, nrow = 4)


##### Ejercicio 
goog= c(450, 451, 452, 445, 468)
msft = c(230, 231, 232, 233, 220)

stocks= c(goog, msft)

stock.matrix = matrix(stocks, byrow = T, nrow = 2)



days1 = c('Mon','Tue', 'Wed', 'Thus', 
          'Fri')
st.names = c('GOOG', 'MSFT')

colnames(stock.matrix) = days1

rownames(stock.matrix) = st.names

print(stock.matrix)

####

#Data Frames

state.x77

str(state.x77)
head(state.x77)
tail(state.x77)
summary(state.x77)

#Crear 

days = c('mon', 'tue', 'wed', 'thu', 'fri')
temp = c(22.4, 23.5, 25.7, 22.22, 27.1)
rain = c( T, F, T, F, F)

df = data.frame(days, temp, rain)

#Conseguimos la información de la parte de days
df$days

#Nos da solo info de cuando rain es T o True
subset(df, subset = rain==T)

#Nos da solo info del día que es mon 
subset(df, days=="mon")

### ORDENAR

#Para ordenar. Nos dice el orden de mayor a menor
#de las temperaturas. 4 primero significa que es
#donde menor temperatura hay 
sorted.temp = order(df['temp'])
sorted.temp

df[sorted.temp, ]

######

#Data Input and Output 

#CSV


#Excel
installed.packages("readxl")
library(readxl)
ex = excel_sheets('UExcel.xlsx')

#Web Scraping
install.packages('rvest')
library(rvest)
library(xml2)
#Elegir con la extensión de la lupa y así consigo en este caso .prominent
tripadvisor = read_html("https://www.tripadvisor.es/Hotels-g187457-San_Sebastian_Donostia_Province_of_Guipuzcoa_Basque_Country-Hotels.html")
title = tripadvisor%>%html_nodes(".prominent")%>%html_text()
title
precio = tripadvisor%>%html_nodes(".review_count")%>%html_text()
precio
wifi = tripadvisor%>%html_nodes(".label")%>%html_text()
wifi
hotel_table = data.frame(title, precio, wifi) 
