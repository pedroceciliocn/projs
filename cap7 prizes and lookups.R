
#### ALT TO CALCULATE PRIZES WITH IFs######################

if (same) {
    symbols <- symbols[1]
    if (symbol == "DD") {
        prize <- 800
    } else if (symbol == "7") {
        prize <- 80
    } else if (symbol == "BBB") {
        prize <- 40
    } else if (symbol == "BB") {
        prize <- 25
    } else if (symbol == "B") {
        prize <- 10
    } else if (symbol == "C") {
        prize <- 10
    } else if (symbol == "0") {
        prize <- 0
    }
}

######## loops

payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
payouts
payouts["DD"]
payouts["B"]
unname(payouts["DD"])


#lookup

symbols <- c("7", "7", "7")
symbols[1]

payouts[symbols[1]]

symbols <- c("C", "C", "C")
payouts[symbols[1]]


########### UPDATED CODE ##############################################################

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

if (same) {                           
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])                          
} else if (all(bars)) {                        
  prize <- 5
} else {
  #5 count cherries
  prize  #6 calculate a prize 
}

#7 count diamonds
#8 double the prize if necessary




################### TEST AND EXERCISES ####################################################

symbols <- c("C", "DD", "C")

symbols == "C"

sum(symbols == "C")
sum(symbols == "DD")

################### UPDATED CODE ############################################################

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

if (same) {                           
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])                          
} else if (all(bars)) {                        
  prize <- 5
} else {
  cherries <- sum(symbols == "C")
  prize  #6 calculate a prize 
}

diamonds <- sum(symbols == "DD")
#8 double the prize if necessary