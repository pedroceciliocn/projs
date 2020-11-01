
#### INSIDE (WITH) CHERRIE COUNTER

if (cherries == 2) {
    prize <- 5
} else if (cherries == 1) {
    prize <- 2
} else {}
  prize <- 0

#############
c(0, 2, 5)
c(0, 2, 5)[1]
  
cherries + 1
  
c(0, 2, 5)[cherries + 1]
  
cherries
  
  
##########################  UPDATED CODE

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

if (same) {                           
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])                          
} else if (all(bars)) {                        
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1] 
}

diamonds <- sum(symbols == "DD")
#8 double the prize if necessary
