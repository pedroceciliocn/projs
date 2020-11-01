> deck2 <- deck
> vec <- c(0, 0, 0, 0, 0, 0)
> vec
[1] 0 0 0 0 0 0
> vec[1]
[1] 0
> vec[1] <- 1000
> vec
[1] 1000    0    0    0    0    0



> vec[c(1, 3, 5)] <- c(1, 1, 1)
> vec
[1] 1 0 1 0 1 0

> vec[1:3] <- c(1, 1, 1)
> vec
[1] 1 1 1 0 1 0
> vec <- c(0, 0, 0, 0, 0, 0)
> vec[c(1, 3, 5)] <- c(1, 1, 1)
> vec
[1] 1 0 1 0 1 0
> vec[4:6] <- vec[4:6]+1
> vec
[1] 1 0 1 1 2 1
> 
  > vec[7] <- 0
  > vec
  [1] 1 0 1 1 2 1 0
  > 
    > deck2$new <- 1:52
    > deck2$new
    [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42
    [43] 43 44 45 46 47 48 49 50 51 52
    > head(deck2)
    face   suit value new
    1  king spades    13   1
    2 queen spades    12   2
    3  jack spades    11   3
    4   ten spades    10   4
    5  nine spades     9   5
    6 eight spades     8   6
    > 
      > deck2$new <-NULL
    > head(deck2)
    face   suit value
    1  king spades    13
    2 queen spades    12
    3  jack spades    11
    4   ten spades    10
    5  nine spades     9
    6 eight spades     8
    > deck2[c(13, 26, 29, 52)]
    Error in `[.data.frame`(deck2, c(13, 26, 29, 52)) : 
      undefined columns selected
    > deck2[c(13, 26, 29, 52), ]
    face     suit value
    13  ace   spades     1
    26  ace    clubs     1
    29 jack diamonds    11
    52  ace   hearts     1
    > View(deck2)
    > deck2[c(13, 26, 39, 52), ]
    face     suit value
    13  ace   spades     1
    26  ace    clubs     1
    39  ace diamonds     1
    52  ace   hearts     1
    > deck2[c(13, 26, 39, 52), 3]
    [1] 1 1 1 1
    > deck2$value[c(13, 26, 39, 52)]
    [1] 1 1 1 1
    > 
      > deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
    > deck2$value[c(13, 26, 39, 52)]
    [1] 14 14 14 14









> deck2[c(13, 26, 29, 52), ]
face     suit value
13  ace   spades     1
26  ace    clubs     1
29 jack diamonds    11
52  ace   hearts     1
> View(deck2)
> deck2[c(13, 26, 39, 52), ]
face     suit value
13  ace   spades     1
26  ace    clubs     1
39  ace diamonds     1
52  ace   hearts     1
> deck2[c(13, 26, 39, 52), 3]
[1] 1 1 1 1
> deck2$value[c(13, 26, 39, 52)]
[1] 1 1 1 1
> 
  > deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
> deck2$value[c(13, 26, 39, 52)]
[1] 14 14 14 14


> deck2$value[c(13, 26, 39, 52)] <- 14
> deck2$value[c(13, 26, 39, 52)]
[1] 14 14 14 14





