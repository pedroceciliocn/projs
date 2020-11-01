
#x<-1:4
#y<-2
#k<-1:4
#> x%*%x
##[,1]
##[1,]   30
#> x%o%y
##[,1]
##[1,]    2
##[2,]    4
##[3,]    6
##[4,]    8
#> y%o%x
##[,1] [,2] [,3] [,4]
##[1,]    2    4    6    8


#round(3.141516, digits = 2) arredonda
#mean(1:6) media aritmetica dum vetor
#round(mean(die)) arredonda a media do vetor
#sample(x = 1:4, size = 2) 2 numeros aleatorios entre 1 e 4 (sem repetição)
#sample(x = 1:4, size = 2, replace = TRUE) 2 numeros aleatorios entre 1 e 4 (com repetição)
#args(round) mostra os argumentos da função
##function (x, digits = 0)
## NULL


roll2 <- function(bones = 1:6){
  dice <- sample(bones, size = 1, replace = TRUE)
  sum(dice)
}

roll2()


roll3<- function(bones = 1:10){
dice3 <- sample(bones, 2, replace=TRUE)
sum(dice3)
}
roll3()

#roll3<- function(bones = 1:10){
 # dice3<- sample(bones, size = 2, replace=TRUE)
  #soma<-sum(dice3)
#}


#die3 = 1:10
#dice3<- sample(die3, size = 2, replace=TRUE)
#sum(dice3)



#> x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1) cria um vetor com os dados elementos
#> y<-x^3 cria um vetor y e atribui a ele o mesmo vetor x com os valores elevados ao cubo
#> qplot(x, y) plota o gráfico com os pontos (não esqueça de antes carregar a biblioteca ggplot2 usando library("ggplot2"))

#> x1<- c(1, 2, 2, 2, 3, 3) carrega os valores no vetor x1
#> qplot(x1, binwidth = 1) plota o gráfico do tipo histograma com x1 (a barra vertical sobe a cada vez que um valor se repete)


roll <- function(){
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE, prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

#> rolls <- replicate(10000, roll())
#> qplot(rolls, binwidth = 1)