roll <- function(){
    die <- 1:6
    dice <- sample(die, size = 2, replace = TRUE)
    sum(dice)
}

show_env <- function(){
    list(ran.in = environment(),
        parent = parent.env(environment()),
        objects = ls.str(environment())
         )
}

show_env()

environment(show_env)

library(pryr)
environment(parenvs)

show_env <- function(){
    a <- 1
    b <- 2
    c <- 3
    list(ran.in = environment(),
         parent = parent.env(environment()),
         objects = ls.str(environment())
    )
}


foo <- "take me to your runtime"

show_env <- function(x = foo){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment())
  )
}


deal <- function(){
    deck[1, ]
}

DECK <- deck

deck <- deck[-1, ]

head(deck, 3)

deal <- function(){
    card <- deck[1, ]
    deck <- deck[-1, ]
    card
}

deal <- function(){
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}

deal()

shuffle <- function(cards){
    random <- sample(1:52, size = 52)
    cards[random, ]
}

head(deck, 3)
a <- shuffle(deck) 
head(deck, 3) ## nao "shufflow"

head(a, 3)




shuffle <- function(){
  random <- sample(1:52, size = 52)
  assign("deck", DECK[random, ], envir = globalenv())
}

shuffle()
deal()

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
}


##############################

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
shuffle

environment(deal)
environment(shuffle)

###################################



setup <- function(deck){
  DECK <- deck
  
  DEAL <- function(){
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

shuffle()

deal()

)