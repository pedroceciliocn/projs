wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")

combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
combos



###### CODE USED BEFORE WITH PROBS ###############################
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}


###################### USING THE PROB PART OF THE CODE ###############

prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
prob

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

head(combos, 3)

combos$prob <- combos$prob1 * combos$prob2 * combos$prob3

sum(combos$prob)

####################################################################

symbols <- c(combos[1, 1], combos[1 , 2], combos[1, 3])
symbols

score(symbols)

