#> deck[ , ]




> new <- deck[1, c(1, 2, 3)]
> new
face   suit value
1 king spades    13

> vec <- c(6, 1, 3, 6, 10, 5)
> vec[1:3]
[1] 6 1 3
> deck[1:2, 1:2]
face   suit
1  king spades
2 queen spades
> deck[1:2, 1, drop = FALSE]
face
1  king
2 queen


#> deck[-(2:52), 1:3]
##face   suit value
##1 king spades    13

#> deck[-2:-52, 1:3]
##face   suit value
##1 king spades    13


#> rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F)
#deck[rows, ]



#deck[1, c("face", "suit", "value")]
##face   suit value
##1 king spades    13


#deck[1:3, c("face", "suit", "value")]
##face   suit value
##1  king spades    13
##2 queen spades    12
##3  jack spades    11


#deck[ , "face"]
#deck[ , "value"]
#deck[ , "suit"]



#deal <- function(cards){
#    cards[1, ]
#}

#> deal(deck)
##face   suit value
##1 king spades    13




#deck2 <- deck[1:52, ]

#head(deck2)
##face   suit value
##1  king spades    13
##2 queen spades    12
##3  jack spades    11
##4   ten spades    10
##5  nine spades     9
##6 eight spades     8


#deck3 <- deck[c(2, 1, 3:52), ]
#head(deck3)

##face   suit value
##2 queen spades    12
##1  king spades    13
##3  jack spades    11
##4   ten spades    10
##5  nine spades     9
##6 eight spades     8

random <- sample(1:52, size = 52)
random

deck4 <- deck[random, ]
head(deck4)

#agora sim
shuffle <- function(cards){
    random <- sample(1:52, size = 52)
    cards[random, ]
}

deal(deck)

deck2 <- shuffle(deck)
deal(deck2)

##deu certo














#> deck$value
##[1] 13 12 11 10  9  8  7  6  5  4  3  2  1 13 12 11 10  9  8  7  6  5  4  3  2  1 13 12 11 10  9  8  7  6  5  4  3  2  1 13 12 11
##[43] 10  9  8  7  6  5  4  3  2  1

#> mean(deck$value)
##[1] 7
#> median(deck$value)
##[1] 7


#> lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
#> lst
##$numbers
##[1] 1 2
##
##$logical
##[1] TRUE
##
##$strings
##[1] "a" "b" "c"


> lst[1]
$numbers
[1] 1 2

> lst[2]
$logical
[1] TRUE

> lst[3]
$strings
[1] "a" "b" "c"

> lst[1:3]
$numbers
[1] 1 2

$logical
[1] TRUE

$strings
[1] "a" "b" "c"

> lst$numbers
[1] 1 2
> sum(lst$numbers)
[1] 3
> lst[[1]]
[1] 1 2
> lst[[2]]
[1] TRUE
> lst[[3]]
[1] "a" "b" "c"

> lst["numbers"]
$numbers
[1] 1 2

> lst[["numbers"]]
[1] 1 2