brasileirao <- data.frame(
  equipe = c("Santos", "Flamengo", "Palmeiras", "São Paulo", 
             "Atlético", "Corinthians",
             "Internacional", "Bahia", "Athletico",
             "Botafogo", "Ceará", "Goiás", 
             "Grêmio", "Fortaleza", "Vasco", "Cruzeiro", 
             "Chapeoense", "Fluminense", "CSA", "Avaí"),
  posição = c(1:20),
  PD = c(15, 15, 15, 15,
         15, 15,
         15, 15, 15,
         15, 15, 15,
         15, 15, 15, 15,
         15, 15, 15, 15),
  V = c(10, 9, 8, 8,
        8, 7,
        7, 6, 7,
        7, 6, 5,
        4, 5, 4, 3,
        3, 3, 2, 0),
  E = c(2, 3, 6, 6,
        3, 6,
        3, 6, 1,
        1, 2, 3,
        6, 2, 5, 5,
        4, 3, 5, 6),
  D = c(3, 3, 1, 1,
        5, 2,
        5, 4, 7,
        7, 7, 7,
        5, 8, 6, 7,
        8, 9, 8, 9),
  GM = c(25, 32, 24, 20,
         22, 17,
         17, 18, 22, 
         14, 19, 14,
         18, 16, 14, 13,
         16, 19, 4, 7),
  GS = c(14, 18, 10, 9,
         17, 8,
         12, 15, 15,
         15, 14, 24,
         20, 21, 22, 22,
         27, 25, 22, 21),
  Pts = c(32, 30, 30, 30,
          27, 27,
          24, 24, 22,
          22, 20, 18,
          18, 17, 17, 14,
          13, 12, 11, 6),
  stringAsFactor = FALSE
  
  
)







tabelabrasileirao$V[tabelabrasileirao$equipe == "Santos"] <- 10
tabelabrasileirao$E[tabelabrasileirao$equipe == "Santos"] <- 3
tabelabrasileirao$D[tabelabrasileirao$equipe == "Santos"] <- 3 
tabelabrasileirao$GM[tabelabrasileirao$equipe == "Santos"] <- 28
tabelabrasileirao$GS[tabelabrasileirao$equipe == "Santos"] <- 17
tabelabrasileirao$SG[tabelabrasileirao$equipe == "Santos"] <- 11




tabelabrasileirao$V[tabelabrasileirao$equipe == "Palmeiras"] <- 8
tabelabrasileirao$E[tabelabrasileirao$equipe == "Palmeiras"] <- 6
tabelabrasileirao$D[tabelabrasileirao$equipe == "Palmeiras"] <- 1 
tabelabrasileirao$GM[tabelabrasileirao$equipe == "Palmeiras"] <- 24
tabelabrasileirao$GS[tabelabrasileirao$equipe == "Palmeiras"] <- 10
tabelabrasileirao$SG[tabelabrasileirao$equipe == "Palmeiras"] <- 14
















