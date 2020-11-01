
# IDENTIFY CASE
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

# GET PRIZE
if (same) {                           
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])                          
} else if (all(bars)) {                        
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1] 
}

#ADJUST FOR DIAMONDS
diamonds <- sum(symbols == "DD")
prize*2^diamonds