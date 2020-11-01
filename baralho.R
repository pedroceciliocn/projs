die <- c(1, 2, 3, 4, 5, 6)
die
is.vector(die)


> length(die)

#> 3==4
##[1] FALSE
#> 3!=4
##[1] TRUE
#> 3>=4
##[1] FALSE


#> logic <- c(TRUE, FALSE, TRUE)
#> logic
##[1]  TRUE FALSE  TRUE

#> logic <- c(T, F, T)
#> logic
##[1]  TRUE FALSE  TRUE

#> typeof(logic)
##[1] "logical"

#> typeof(F)
##[1] "logical"



#> dim(die) <- c(2,3)
#> die
##[,1] [,2] [,3]
##[1,]    1    3    5
##[2,]    2    4    6
#> dim(die) <- c(3,2)
#> die
##[,1] [,2]
##[1,]    1    4
##[2,]    2    5
##[3,]    3    6



#> m <- matrix(die, nrow = 2)
#> m
##[,1] [,2] [,3]
##[1,]    1    3    5
##[2,]    2    4    6
#> m <- matrix(die, nrow = 2, byrow = TRUE) preenche pela linha
#> m
##[,1] [,2] [,3]
##[1,]    1    2    3
##[2,]    4    5    6




#> ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
#> ar
##, , 1
##
##[,1] [,2]
##[1,]   11   13
##[2,]   12   14
##
##, , 2
##
##[,1] [,2]
##[1,]   21   23
##[2,]   22   24
##
##, , 3
##
##[,1] [,2]
##[1,]   31   33
##[2,]   32   34


#> hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
#> matrix(hand1, nrow = 5, ncol = 2)
##[,1]    [,2]    
##[1,] "ace"   "spades"
##[2,] "king"  "spades"
##[3,] "queen" "spades"
##[4,] "jack"  "spades"
##[5,] "ten"   "spades"
#> matrix(hand1, nrow = 5)
##[,1]    [,2]    
##[1,] "ace"   "spades"
##[2,] "king"  "spades"
##[3,] "queen" "spades"
##[4,] "jack"  "spades"
##[5,] "ten"   "spades"
#> matrix(hand1, ncol = 2)
##[,1]    [,2]    
##[1,] "ace"   "spades"
##[2,] "king"  "spades"
##[3,] "queen" "spades"
##[4,] "jack"  "spades"
##[5,] "ten"   "spades"
#> dim(hand1) <- c(5,2)
#> hand1
##[,1]    [,2]    
##[1,] "ace"   "spades"
##[2,] "king"  "spades"
##[3,] "queen" "spades"
##[4,] "jack"  "spades"
##[5,] "ten"   "spades"


#> now <- Sys.time()
#> typeof(now)
##[1] "double"
#> now
##[1] "2019-08-14 10:20:35 -03"
#> class(now)
##[1] "POSIXct" "POSIXt" 
#> unclass(now)
##[1] 1565788836
#> mil <- 1000000
#> mil
##[1] 1e+06

#> class(mil)
##[1] "numeric"
#> class(mil) <- c("POSIXct", "POSIXt")
#> mil
##[1] "1970-01-12 10:46:40 -03"
#> gender <- factor(c("male", "female", "female", "male"))
#> typeof(gender)
##[1] "integer"

#> attributes(gender)
##$levels
##[1] "female" "male"  

##$class
##[1] "factor"

#> unclass(gender)
##[1] 2 1 1 2
##attr(,"levels")
##[1] "female" "male"  
#> gender
##[1] male   female female male  
##Levels: female male
#> as.character(gender)
##[1] "male"   "female" "female" "male" 




brasileirao <- data.frame(
  equipe = c("Santos", "Flamengo", "Palmeiras", "São Paulo", 
             "Atlético", "Corinthians",
             "Internacional", "Bahia", "Athletico",
             "Botafogo", "Ceará", "Goiás", 
             "Grêmio", "Fortaleza", "Vasco", "Cruzeiro", 
             "Chapeoense", "Fluminense", "CSA", "Avaí"),
  posição = c(1:20),
  PD = c(15, 15, 15, 15,
         15, 15,
         15, 15, 15,
         15, 15, 15,
         15, 15, 15, 15,
         15, 15, 15, 15),
  V = c(10, 9, 8, 8,
        8, 7,
        7, 6, 7,
        7, 6, 5,
        4, 5, 4, 3,
        3, 3, 2, 0),
  E = c(2, 3, 6, 6,
        3, 6,
        3, 6, 1,
        1, 2, 3,
        6, 2, 5, 5,
        4, 3, 5, 6),
  D = c(3, 3, 1, 1,
        5, 2,
        5, 4, 7,
        7, 7, 7,
        5, 8, 6, 7,
        8, 9, 8, 9),
  GM = c(25, 32, 24, 20,
         22, 17,
         17, 18, 22, 
         14, 19, 14,
         18, 16, 14, 13,
         16, 19, 4, 7),
  GS = c(14, 18, 10, 9,
         17, 8,
         12, 15, 15,
         15, 14, 24,
         20, 21, 22, 22,
         27, 25, 22, 21),
  Pts = c(32, 30, 30, 30,
          27, 27,
          24, 24, 22,
          22, 20, 18,
          18, 17, 17, 14,
          13, 12, 11, 6),
  stringAsFactor = FALSE
  
  
)



#> deck <- read.csv("~/ADM/2019.2/ESTATISTICA/R/deck.csv", stringsAsFactors=FALSE)
#>   View(deck)

#> head(deck)
##face   suit value
##1  king spades    13
##2 queen spades    12
##3  jack spades    11
##4   ten spades    10
##5  nine spades     9
##6 eight spades     8

#> head(deck, 10)
##face   suit value
##1  king spades    13
##2 queen spades    12
##3  jack spades    11
##4   ten spades    10
##5  nine spades     9
##6 eight spades     8
##7  seven spades     7
##8    six spades     6
##9   five spades     5
##10  four spades     4

#write.csv(deck, file = "cards.csv", row.names = FALSE)

#> deck[ , ]