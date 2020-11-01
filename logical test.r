
> vec[c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)]
[1] 2
> 
  > 1>2
[1] FALSE
> 
  > 1 > c(0, 1, 2)
[1]  TRUE FALSE FALSE
> 
  > c(1, 2, 3) == c(3, 2, 1)
[1] FALSE  TRUE FALSE
> 1 %in% c(3, 4, 5)
[1] FALSE
> c(1, 2) %in% c(3, 4, 5)
[1] FALSE FALSE
> c(1, 2, 3, 4, 5) %in% c(3, 4, 5)
[1] FALSE FALSE  TRUE  TRUE  TRUE
> c(1, 2, 3, 4) %in% c(3, 4, 5)
[1] FALSE FALSE  TRUE  TRUE

> c(1, 2, 3, 4) %in% c(3, 4, 5)
[1] FALSE FALSE  TRUE  TRUE
> 
  > deck2$face
[1] "king"  "queen" "jack"  "ten"   "nine"  "eight" "seven" "six"   "five"  "four"  "three" "two"   "ace"   "king"  "queen"
[16] "jack"  "ten"   "nine"  "eight" "seven" "six"   "five"  "four"  "three" "two"   "ace"   "king"  "queen" "jack"  "ten"  
[31] "nine"  "eight" "seven" "six"   "five"  "four"  "three" "two"   "ace"   "king"  "queen" "jack"  "ten"   "nine"  "eight"
[46] "seven" "six"   "five"  "four"  "three" "two"   "ace"  
> deck2$face == "ace"
[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[22] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[43] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
> 
  > sum(deck2$face == "ace")
[1] 4

x > 2 
& x < 9

