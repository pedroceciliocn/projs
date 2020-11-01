
symbols <- c("B", "BB", "BBB")

############ ALT 1 TO CHECK IF ALL SYMBOLS ARE BAR#############
symbols[1] == "B" | symbols[1] == "BB" | symbols[1] == "BBB" & 
  symbols[2] == "B" | symbols[2] == "BB" | symbols[2] == "BBB" &
  symbols[3] == "B" | symbols[3] == "BB" | symbols[3] == "BBB"

########### ALT 2 (MORE EFFI)##################################
all(symbols %in% c("B", "BB", "BBB"))

################UPDATED CODE##################################

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

if (same) {                           
  prize <- #2 look up the prize                          
} else if (all(bars)) {                        
  prize <- #4 assign $5
  } else {
    #5 count cherries
    prize  #6 calculate a prize 
  }

#7 count diamonds
#8 double the prize if necessary



##EXAMPLE TO WATCH OUT
symbols <- c("B", "B", "B")
all(symbols %in% c("B", "BB", "BBB"))


