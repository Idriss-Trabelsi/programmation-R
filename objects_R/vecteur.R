# Tp1: creation d'objects ----
## Les vecteurs ----

### La fonction c() ----
?c
help(c)
## creer un vecteur numerique 
numeric_vector1  <- c(1, 2, 3, 4, 5)
print(numeric_vector1)
numeric_vector2  <- c(1.23, 2.02, 3.52, 4.256, 5.25)
print(numeric_vector2)


## vecteur logique
logical_vector <- c(TRUE,TRUE,FALSE,F,T);logical_vector


## vecteur  chaine de caractere 
caracter_vector <- c("Ali","Mohamed","fraj");caracter_vector


## creer un vecteur combiné
combire_vector1 <- c(2,"ali",12,FALSE);combire_vector1
combine_vector2 <- c(12,T,F,17);combine_vector2
combine_vector3 <- c("ali",T);combine_vector3


## indexation de vecteur ----
vector1 <- rnorm(50);vector1


### extraire la deuxieme valeur du vecteur 
vector1[2]
numeric_vector2[6]

numeric_vector2[c(1,3,5)]

numeric_vector2[-2]

## combiner deux vecteurs

## autres fonctions pour creer des vecteurs
#seq(),rep(),sample(),rbind(),cbind() ----

help("seq")

v1 <-  seq(1,9);v1

v2 <- seq("hdhd");v2

v3 <- seq(T);v3

v4 <- rep(5, times=4);v4

v5 <- rep("amine" , times=2);v5


v6 <- sample("amine");v6


help("sample")
x <- 1:10
##sample(x[x >  8]) 
sample(x[x >  9]) 
##sample(x[x > 10]) 
sample(c(0,1), 100, replace = TRUE)



help("rbind")
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
result <- rbind(vec1, vec2)
print(result)


df1 <- data.frame(id = 1:2, nom = c("Alice", "Bob"))
df2 <- data.frame(id = 3:4, nom = c("Charlie", "David"))
df_result <- rbind(df1, df2)
print(df_result)


help("cbind")
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
result <- cbind(vec1, vec2)
print(result)


df1 <- data.frame(id = 1:3)
df2 <- data.frame(nom = c("Alice", "Bob", "Charlie"))
df_result <- cbind(df1, df2)
print(df_result)





#Différence entre cbind() et rbind()
#Fonction	  Fusionne par	      Condition
#rbind()	  Ligne	              Même nombre de colonnes
#cbind()	  Colonne	            Même nombre de lignes
