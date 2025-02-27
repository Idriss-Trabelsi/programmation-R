## Exercice 1 : ----

## Creating Vectors 

x <- c(1,2,3,4)
x

y <- c("Apple","Banana","Cherry")
y

## Manipulating Vectors 

x[3]
x[3] <- 10
x
length(x)
z <- c(x,y)
z

## Creating Matrices 

M <- matrix(data=c(1:8),
                   nrow=2,
            ncol=4,
            byrow=FALSE)
M
n <- matrix(data=c(5.99,7.33,14.123,96.14,78.14,88.13,19.55,14.125),
            nrow=2,
            ncol=4,
            byrow=FALSE)

n



## Manipulating matrices 

M[2,]

M[2,] <- c(10,20,30,40)
M
dim(M)

trans_n <- t(n)
trans_n

## Creating Lists 

L <- c("X","Y","M")
L
L$Y <- n
L


## Creating Data Frame 

df <- data.frame("x","y","m")
df
df[2,]
df[2,] <- c(10,20,"banana")
df


## Exercice 2 : ----

Favorite_Movies <- c("The kingdom","Coins","Detective","Siccin","The Dark Hole")
Favorite_Movies

Movie_Ratings <- matrix(data=c(9.2,7.0,7.1,8.5,6.5,8.8,7.4,9.9,8.9),
                        nrow=3,
                        ncol=3,
                        byrow=FALSE)
Movie_Ratings


Favorite_books <- c("SWITCH","TRY","RICHY","SMARTER","RICH AND POOR DAD")
Favorite_books

Favorite_artists <- data.frame(
  Name = c("SWEATER WEATHER", "FORMAT DZ", "TOXIC", "LATE GOODBYES", "BLACK FRIDAY"),
  Genre = c("RAP", "POP", "POP", "POP", "RAP"),
  Year_Formed = c(2010, 2020, 2023, 2024, 2022)
)
Favorite_artists

artist_genre <- factor(Favorite_artists$Genre)
artist_genre
Favorite_artists

Favorite_Movies[2]

Movie_Ratings[2,3]

Favorite_books[[3]]
Favorite_books[3]

Favorite_artists$Name

levels(artist_genre)

Favorite_Movies <- c(Favorite_Movies,"The Fire")
Favorite_Movies

Movie_Ratings <- matrix(data=c(Movie_Ratings,c(7,8,9)),
                        ncol=3,
                        nrow=5)
Movie_Ratings

Favorite_books <- c(Favorite_books,"Query")
Favorite_books

Favorite_artists


Favorite_artists <- rbind(Favorite_artists, data.frame(Name = "PSYCHO", Genre = "Rock", Year_Formed = 2010))
Favorite_artists

length(Favorite_Movies)
dim(Movie_Ratings)
length(Favorite_books)
dim(Favorite_artists)


Favorite_Movies[2] <- "The Silence of the Lambs"
Favorite_Movies

Movie_Ratings[3,2] <- 10
Movie_Ratings

Favorite_books[3] <- "Moby Dick"
Favorite_books

Favorite_artists$Genre[1] <- "Pop"
Favorite_artists

Movie_Ratings <- Movie_Ratings[order(-Movie_Ratings[, 3]), ]
Movie_Ratings



Favorite_Movies <- sort(Favorite_Movies)
Favorite_Movies



Favorite_books <- Favorite_books[order(sapply(Favorite_books, nchar))]
Favorite_books

Favorite_artists <- Favorite_artists[order(Favorite_artists$Year_Formed), ]
Favorite_artists


## Exercice 3 : ----

age <- c(22, 35, 28, 33, 25)

names <- c("John","Jane", "Jim","Jill","Jack")

person_info <- matrix(c(names,age),
                      nrow = 5,
                      ncol = 2)
person_info

person_details <- list(names=names,age=age)
person_details

people <- data.frame(person_details)
people

help("as.factor")
help("ifelse")
people$age_group <- as.factor(ifelse(people$age <= 25, "Young", 
                                     ifelse(people$age <= 35, "Middle-aged", "Old")))
people

people$gender <- c("Male","Female","Male","Female","Male")
people

people[1:3,]  

people[, c("age", "gender")]

help(order)
people[order(-people$age),]

people[order(people$gender, -people$age),]



## Exercice 4 : ----

sales <- data.frame(
  product_preference = c("toothbrush","toothpaste","floss","mouthwash"),
  price = c(3.99,2.99,1.99,4.99),
  units_sold = c(5000,6000,4000,7000)
)
sales

sales$revenue <- sales$price*sales$units_sold
sales

help(mean)
help(median)
help(sd)

summary_stat <- data.frame(mean_price = mean(sales$price),
                           median_price = median(sales$price),
                           sd_price = sd(sales$price),
                           mean_units_sold = mean(sales$units_sold),
                           median_units_sold =median(sales$units_sold),
                           sd_units_sold =sd(sales$units_sold)
)
summary_stat

help("pie")
pie(sales$revenue, labels = sales$product_preference, main = "Market Share by Revenue")

customer_survey <- data.frame(
  age = c(25,30,35,40,45,50,55,60,65,70),
  gender = c("Male","Female","Male","Female","Male","Female","Male","Female","Male","Female"),
  product_preference = c("toothbrush","toothpaste","floss","mouthwash","toothbrush","toothpaste","floss","mouthwash","toothbrush","toothpaste")
)
customer_survey

help(merge)
marketing_data <- merge(sales,customer_survey,by ="product_preference")
marketing_data

help(subset)
subset(marketing_data, gender == "Male" & product_preference == "toothbrush")
