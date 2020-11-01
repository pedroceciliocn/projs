library(pryr)
parenvs(all = TRUE)




> ls(emptyenv())
character(0)

> ls(globalenv())
[1] "a"                 "A"                 "deal"              "deck"              "deck2"             "deck3"            
[7] "deck4"             "deck5"             "dice"              "dice3"             "die"               "die3"             
[13] "facecard"          "five"              "gender"            "int"               "k"                 "lst"              
[19] "mil"               "mtcars"            "my_number"         "name"              "Name"              "new"              
[25] "now"               "random"            "roll"              "roll2"             "roll3"             "rolls"            
[31] "rows"              "shuffle"           "soma"              "tabelabrasileirao" "text"              "u"                
[37] "v"                 "vec"               "w"                 "x"                 "x1"                "x2"               
[43] "x3"                "y"                 "z"                
> 

> head(globalenv()$deck, 3)
face   suit value
1  king spades    13
2 queen spades    12
3  jack spades    11
> 
  > assign("new", "Hello Global", envir = globalenv())
> head(globalenv()$tabelabrasileirao, 4)
equipe PD  V E D GM GS Pts stringAsFactor SG
1  Flamengo 16 10 3 3 35 18  33          FALSE 17
2    Santos 16 10 3 3 28 17  33          FALSE 11
3 Palmeiras 16  8 6 1 24 10  30          FALSE 14
4 São Paulo 16  8 6 1 20  9  30          FALSE  0
> 
  > globalenv()$new
[1] "Hello Global"
> 
  
  
  
  
  
roll <- function() {
    die <- 1:6
    dice <- sample(die, size = 2, replace = TRUE)
    sum(dice)
}


show_env <- function(){
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(), 
       parent = parent.env(environment()), 
       objects = ls.str(environment()))
}



deal <- function() {
    deck[1, ]
}

deal()

DECK <- deck
deck <- deck[-1, ]

head(deck, 3)


deal <- function() {
  card <- deck[1, ]
  deck <- deck[-1, ]
  card
}

##########################
deal <- function(){
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
}

shuffle <- function(cards){
    random <- sample(1:52, size = 52)
    cards[random, ]
}

head(deck, 3)

a <- shuffle(deck)
## agora sim


shuffle <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
}

shuffle()
head(deck, 3)


############################################################
setup <- function(deck){
    DECK <- deck
    DEAL <- function(){
        card <- deck[1, ]
        assign("deck", deck[-1, ], envir = globalenv())
        card
    }
    SHUFFLE <- function(){
        random <- sample(1:52, size = 52)
        assign("deck", DECK[random, ], envir = globalenv())
    }
    list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)

deal <- cards$deal
shuffle <- cards$shuffle

deal


#########################

setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

