alturasseila <- read.table(textConnection("90-100 6 \n100-105  
11 \n105-110 12 \n110-115 17 \n115-120 18 \n120-125 11 \n125-130 9 \n130-135 6 \n135-140 4 \n140-145 4"),  header=FALSE, stringsAsFactors=FALSE)
names(alturasseila) <- c("Interval", "Freq")

