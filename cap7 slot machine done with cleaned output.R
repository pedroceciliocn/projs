slot_display <- function(prize) {
    
  # extract symbols
  symbols <- attr(prize, "symbols")
  
  # collapse symbols into single string
  symbols <- paste(symbols, collapse = " ")
  
  # combine symbol with prize as a regular expression
  # \n is regular expression for new line (i.e. return or enter)
  string <- paste(symbols, prize, sep = "\n$")
  
  # display regular expression in console without quotes
  cat(string)
}


play()
slot_display(one_play)




> symbols <- attr(one_play, "symbols")
> symbols
[1] "B" "0" "B"

> symbols <- paste(symbols, collapse = " ")
> symbols
[1] "B 0 B"


>prize <- one_play
>string <- paste(symbols, prize, sep = "\n$")
>string
[1] "B 0 B\n$5"

>cat(string)
B 0 B
$5


# finnaly play without quotes and cleaned output
slot_display(play())


> class(one_play) <- "slots"
> args(print)
function (x, ...) 
  NULL

print.slots <- function(x, ...) {
    cat("I'm using the print.slots method")
}

print(one_play)
one_play

rm(print.slots)



now <- Sys.time()
attributes(now)



print.slots <- function(x, ...) {
  slot_display(x)
}

one_play

### MODIFIED PLAY FUNCTION #####################
play <- function() {
    symbols <- get_symbols()
    structure(score(symbols), symbols = symbols, class = "slots")
}


class(play())

play()



##########################

methods(class = "factor")