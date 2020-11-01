for (value in c("My", "first", "for", "loop")) {
  print("one run")
  
}

for (value in c("My", "second", "for", "loop")) {
  print(value)
  
}

value ### shows the last value



for (i in c("My", "second", "for", "loop")) {
  print(i)
  
}

for (string in c("My", "second", "for", "loop")) {
  print(string)
  
}

############################################
chars <- vector(length = 4)

words <- c("My", "fourth", "for", "loop")

for (i in 1:4) {
  chars[i] <- words[i]
  
}

chars


