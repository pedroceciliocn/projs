get_symbols <- function() {
    wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
    sample(wheel, size = 3, replace = TRUE,
      prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

get_symbols()


########### DONE FUNCTION THAT WE GONNA USE LATER ######
play <- function() {
    symbols <- get_symbols() # step 1: generate symbols
    print(symbols)           # step 2: display the symbols
    score(symbols)           # step 3: score the symbols 
}
########################################################


#################### IF ################################

if (num < 0) {
    num <- num * -1
}

num <- -2

num

num <- 4

##
num <- -1



symbols <- c("7", "7", "7")
symbols <- c("B", "BB", "BBB")
if (symbols[1]==symbols[2]){
  if (symbols[2]==symbols[3]){
    print("all three kind are the same")
    }
} else {
  print("they are different")
}

if (num < 0) {
    print("num is negative.")
    print("Don't worry, I'll fix it.")
    num <- num * -1
    print("Now num is positive.")
}

#######################################################

################## ELSE ###############################

a <- 3.14

dec <- a - trunc(a)
dec

if (dec >= 0.5) {
    a <- trunc(a) + 1
}else {
    a <- trunc(a)
}

a

a <- 1
b <- 1

if (a > b) {
  print("A wins!")
} else if (a < b) {
    print("B wins!")
} else {
  print("Tie.")
}

