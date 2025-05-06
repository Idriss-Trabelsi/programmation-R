## création d'une matrice

## on utilise la fonction matrix 

help("matrix")

mat1 <- matrix(data=c(1,2,3,4,5,6),
               nrow=3,
               ncol=2)
mat1

# creer une matrice a partir du vecteur suivant : 

age <- c(25,19,18,20,21)
revenu <- c(500,250,400,300,400)
depense <- c(10,23,14,16,18)

menage <- matrix(data=c(age,revenu,depense),
                 nrow=5,
                 ncol=3,
                )
menage


genre <- c("homme","homme","femme","femme","femme")

menage2 <- matrix(data = c(menage,genre),
                  nrow=5,
                  ncol=4)
menage2
typeof(menage2)


### indexation d'une matrice 

# afficher la valeur de la ligne 2 colonne 3

menage[2,3]


## afficher les valeurs des lignes 1 et 4 et de la colonne 2

menage[c(1,4),2]

# afficher la premiere colonne 
menage[,1]
menage[1:2,]


## changer le valeur 2*3 par NA 

menage[2,3] <- 2
menage

menage[c(2,3),1] <- c(21,21)
menage


## nommer les colonnes de la matrice menage 
# utiliser colnames()
help(colnames)
colnames(menage) <- c("age","revenu","depense")
menage

## afficher le vecteur revenu 

menage[,"revenu"]

## nommer les lignes id1,id2,id3,id....id5

rownames(menage) <- rownames(menage,do.NULL = FALSE, prefix ="ID")
menage


## les listes : 

vect1 <- c(12,123,54,16,18)
vect2 <- c(0.23,0.526,1.25,1.326,12.5,0.12)
vect3 <- c("A","R_prog","python","abcd")
vect4 <- c(T,T,F,T,F,T,T)
My_list1 <- list(vect1,vect2,vect3,vect4)
My_list1

My_list1 <- list(My_list1,menage)
My_list1


## afficher les valeurs du premier object :
My_list1[1]
My_list1[[1]]
My_list1[[1]][2]


## les data frame : liste + matrice ----
## la fonction data.frame()

# mettre les vecteurs age,revenu,depense et genre 
# dans une data.frame

my_data <- data.frame(age,revenu,depense,genre)
my_data$age


## exporter les donnes sous format .txt .csv .xls .xlsx

write.table(my_data,file="Data.txt")
write.csv(my_data,file="Data.csv")
write.csv2(my_data,file="Data2.csv")

#####################
data()
data(co2)
View(co2)
str(co2)
head(co2,n=3)
tail(co2,5)
length(co2)
nrow(co2)
ncol(co2)
dim(co2)
help(co2)

# refaire avec la base "mtcars","hflights"
data()
data(mtcars)
View(mtcars)
str(mtcars)
head(mtcars,n=10)
tail(mtcars,5)
length(mtcars)
nrow(mtcars)
ncol(mtcars)
dim(mtcars)
help(mtcars)

data(hflights)
install.packages("hflights")
library(hflights)


