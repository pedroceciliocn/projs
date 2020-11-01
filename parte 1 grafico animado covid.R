library(tidyverse)
library(httr)
library(readxl)
install.packages("Rcurl")
library(RCurl)

urlExists <- function(address) { 
  tryCatch ({ 
    con <- url(address) 
    a <- capture.output(suppressWarnings(readLines(con))) 
    close(con) 
    TRUE;
    }, 
    error = function(err) { 
      occur <- grep("cannot open the connection", capture.output(err)); 
      if(length(occur) > 0) FALSE;
})
}

url1 = paste0("https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-",Sys.Date(),".xlsx")

url2 = paste0("https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-",Sys.Date(),".xls")

if (urlExists(url1))
{
  cat("xlsx file exists")
  GET(url1, write_disk(tf <- tempfile(fileext = ".xlsx"))) 
  df = read_xlsx(tf) 
}

if (urlExists(url2)) 
{ 
  cat("xls file exists") 
  GET(url2, write_disk(tf <- tempfile(fileext = ".xls"))) 
  df = read_excel(tf) 
}
# Covid Explore ```{r} 
covid_death_total <- sum(df$Deaths) 

``` There have been `r covid_death_total` deaths since `r Sys.Date()`. The features we have are: `r names(df)`. ```{r} 

install.packages("kableExtra")
library(kableExtra) 
edf <- df %>% 
  group_by(`Countries and territories`) %>% 
  mutate(deathRate = sum(Deaths)/sum(Cases))

redf <- edf %>% head(100)
kable(redf) %>%
  kable_styling(bootstrap_options = "striped", full_width = F)
```

# Our First Graph

```{r}
library(ggplot2)

edf %>% filter(Deaths > 0) %>%
  group_by(`Countries and territories`) %>%
  summarise(Cases_Total = sum(Cases), Deaths_Total = sum(Deaths)) %>%
  ggplot(aes(`Countries and territories`)) +
  geom_point(aes(y = Cases_Total, color = "yellow")) +
  geom_point(aes(y = Deaths_Total, color = "red")) +
  coord_flip()
```
