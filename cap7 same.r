if ( #1 Case 1: all the same ) {                           
    prize <- #2 look up the prize                          
} else if ( #3 Case 2: all bars ) {                        
    prize <- #4 assign $5
} else {
    #5 count cherries
    prize <- #6 calculate a prize 
}

#7 count diamonds
#8 double the prize if necessary

#1 test wheter the symbols are three of a kind
#2 look up the prize for three of a kind based on the common symbol
#3 test whether the symbols are all bars
#4 assign the prize of $5
#5 count the number of cherries
#7 count the number of diamonds
#6 calculate a prize based on the number of cherries
#8 adjust the prize for diamonds


##########################################checking if all three kind are different ALT 1 ###################
symbols <- c("7", "7", "7")


if (symbols[1]==symbols[2] & symbols[2] == symbols[3]){
  print("all three kind are the same")
} else {
  print("they are different")
}
###########################################################################################################

symbols
# alt 2
symbols[1] == symbols[2] & symbols[2] == symbols[3] 

# alt3
all(symbols == symbols[1]) 

# alt 4
length(unique(symbols) == 1)

############################### NOW WE CAN CHECK IF THEY ARE THE SAME KIND  WITH UPDATED CODE###############
same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]

if (same) {                           
  prize <- #2 look up the prize                          
  } else if ( #3 Case 2: all bars ) {                        
    prize <- #4 assign $5
    } else {
      #5 count cherries
      prize  #6 calculate a prize 
    }

#7 count diamonds
#8 double the prize if necessary