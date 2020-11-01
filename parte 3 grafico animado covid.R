library(tidyverse)
library(plotly)
library(cowplot)
library(grid)

Main <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series"
confirmed_Path <-  file.path(Main,"time_series_covid19_confirmed_global.csv")
confirmed_Path

Deaths_Path <- file.path(Main,"time_series_covid19_deaths_global.csv")
Deaths_Path

Recoverd_Path<- file.path(Main,"time_series_covid19_recovered_global.csv")
Recoverd_Path

ConfirmedData <- read.csv(confirmed_Path,stringsAsFactors = FALSE)
DeathData     <- read.csv(Deaths_Path,stringsAsFactors = FALSE)
RecoveredData <- read.csv(Recoverd_Path,stringsAsFactors = FALSE)

Region <- "Brazil"

accumulate_by <- function(dat, var){
var <- lazyeval::f_eval(var, dat)
lvls <- plotly:::getLevels(var) 
dats <- lapply(seq_along(lvls), 
               function(x){
                 cbind.data.frame(dat[var %in% lvls[seq(1, x)], ], 
                                       frame = lvls[[x]])})
dplyr::bind_rows(dats)
}

DataClean <- function(data, region, CaseType){
  CleanedData <- data %>% 
    pivot_longer(cols = starts_with("X"),
                 names_to = "Date",
                 names_prefix = "X",
                 names_ptypes = list(week = integer()), 
                 values_to = CaseType,
                 values_drop_na = TRUE) %>% 
    mutate(Province.State = ifelse(Province.State %in% "", Country.Region, Province.State)) %>% 
    mutate(Date = as.Date(Date, "%m.%d.%y")) %>% 
    filter(Province.State == region) %>% 
    arrange(Date) %>% 
    mutate(ID = row_number())
  return(CleanedData)
  }

ConData <- DataClean(ConfirmedData, Region, "Confirmed")

RecData <- DataClean(RecoveredData, Region, "Recovered") %>% select(ID,Recovered)

DeData <-DataClean(DeathData,Region,"Deaths") %>% select(ID,Deaths)

AllData <- list(ConData, RecData, DeData) %>% reduce(left_join, by = "ID")

frames <- AllData %>% accumulate_by(~ID)

#####
plot <- ggplot(data=frames,aes(x=Date, frame = frame)) + 
  geom_line(aes(y=Confirmed, colour="Confirmed"),size=1) + 
  geom_line(aes(y= Recovered, colour = "Recovered"),size=1) + 
  geom_line(aes(y= Deaths, colour = "Deaths"),size=1) + 
  labs(colour="Cases") + 
  scale_color_manual(values=c('#0751B8','#B82607', '#0BB807')) + 
  theme_bw()+ 
  theme(legend.box.background = element_rect(), 
        legend.box.margin = margin(6, 6, 6, 6)) + 
  labs(title = paste("Cases Over the Period of Time Since First Report in",Region), 
       subtitle = "YouTube Channel: Dr Rehan Zafar", 
       x = "Date",
       y="Cases") 
plot

#### animate
fig1 <- ggplotly(plot) %>% 
  animation_opts(frame = 100, 
                 transition = 0, 
                 redraw = FALSE) %>% 
  animation_slider(currentvalue = list(prefix = "Day ")) 
fig1

### static confirma
subplot1 <- ggplot(data=frames,aes(x=Date, frame = frame)) + 
  geom_line(aes(y=Confirmed, colour="Confirmed"), color = "#0751B8",size=1) +  
  labs(colour="Cases") + 
  theme_bw()
subplot1

### static recover
subplot2 <- ggplot(data=frames,aes(x=Date, frame = frame)) + 
  geom_line(aes(y=Recovered, colour="Recovered"), color = "#0BB807",size=1) + 
  labs(colour="Cases") + 
  theme_bw()
subplot2

### static mortes
subplot3 <- ggplot(data=frames,aes(x=Date, frame = frame)) +  
  geom_line(aes(y=Deaths, colour="Deaths"), color = "#B82607",size=1) +  
  labs(colour="Cases") +  
  theme_cowplot(12)
subplot3

##combina os 3 graficos separa_os
grid.newpage()
grid.draw(rbind(ggplotGrob(subplot1), 
                ggplotGrob(subplot2),
                ggplotGrob(subplot3), 
                size = "last"))

##### outra forma
cowplot::plot_grid(subplot1,subplot2,subplot3, labels = c('A', 'B','C'), label_size = 12, align = "v", ncol = 1)



####anima_o usan_o plotyly
fig2 <- plot_ly() %>%  
  
  # We are going to add the information of Confirmed cases by using add_trace()
  add_trace(data=frames, 
            x = ~Date, 
            y = ~Confirmed, 
            name= 'Confirmed', 
            frame = ~frame,  
            type = 'scatter', 
            mode = 'lines+markers', 
            marker = list(size = 10, 
                          color = 'rgba(51, 153, 255, .5)', 
                          line = list(color = 'rgba(0, 38, 77, .8)', width = 2)), 
            line = list(color = 'rgba(0, 38, 77, .8)', 
                        width = 2)) %>% 
  add_trace(data=frames, 
            x = ~Date, 
            y = ~Recovered, 
            name='Recovered', 
            frame = ~frame,  
            type = 'scatter', 
            mode = 'lines+markers', 
            marker = list(size = 10, 
                          color = 'rgba(153, 255, 153, .8)', 
                          line = list(color = 'rgba(0, 179, 0, .8)', width = 2)), 
            line = list(color = 'rgba(0, 179, 0, .8)', 
                        width = 2)) %>% 
  add_trace(data=frames, 
            x = ~Date, 
            y = ~Deaths, 
            name='Deaths', 
            frame = ~frame, 
            type = 'scatter', 
            mode = 'lines+markers',
            marker = list(size = 10, 
                          color = 'rgba(255, 102, 102, .5)', 
                          line = list(color = 'rgba(152, 0, 0, .8)', width = 2)), 
            line = list(color = 'rgba(152, 0, 0, 1)', 
                        width = 2)) %>% 
  layout(legend=list(x = 100, y = 0.5, yanchor="top"), 
         title = list(text=paste("<b> Cases Over the Period of Time in",Region, "Since First Report </b>"), 
                      size = 10), 
         xaxis=list(autoscale=FALSE,
                    range = c(head(frames$Date, n=1),tail(frames$Date, n=1)+2),
                    title = "<b> Days </b>"), 
         yaxis=list(title = "<b> Cases </b>")) %>%
  animation_opts(10, easing = "elastic", redraw = TRUE)
fig2

### outra forma
fig3 <- plot_ly() %>%  
  add_trace(data=AllData, 
            x = ~Date, 
            y = ~Confirmed, 
            name= 'Confirmed', 
            type = 'scatter', 
            mode = 'lines+markers', 
            marker = list(size = 10, 
                          color = 'rgba(51, 153, 255, .5)', 
                          line = list(color = 'rgba(0, 38, 77, .8)', width = 2)), 
            line = list(color = 'rgba(0, 38, 77, .8)', 
                        width = 2)) %>% 
  add_trace(data=AllData, 
            x = ~Date, 
            y = ~Recovered, 
            name='Recovered', 
            type = 'scatter', 
            mode = 'lines+markers', 
            marker = list(size = 10, 
                          color = 'rgba(153, 255, 153, .8)', 
                          line = list(color = 'rgba(0, 179, 0, .8)', width = 2)), 
            line = list(color = 'rgba(0, 179, 0, .8)', 
                        width = 2)) %>%
  add_trace(data=AllData, 
            x = ~Date, 
            y = ~Deaths, 
            name='Deaths', 
            type = 'scatter', 
            mode = 'lines+markers',
            marker = list(size = 10, 
                          color = 'rgba(255, 102, 102, .5)', 
                          line = list(color = 'rgba(152, 0, 0, .8)', width = 2)), 
            line = list(color = 'rgba(152, 0, 0, 1)', 
                        width = 2)) %>% 
  layout(legend=list(x = 100, y = 0.5, yanchor="top"), 
         title = list(text=paste("<b> Cases Over the Period of Time in",Region, "Since First Report </b>"), 
                      size = 10), 
         xaxis=list(autoscale=FALSE,
                    range = c(head(frames$Date, n=1),tail(frames$Date, n=1)+2),
                    title = "<b> Days </b>"), 
         yaxis=list(title = "<b> Cases </b>")) 

fig3
#### agora 3 graficos separa_os
subplotly1 <-  plot_ly(AllData, 
                       x = ~Date, 
                       y = ~Confirmed,
                       name='Confirmed', 
                       type = 'scatter', 
                       mode = 'lines+markers',
                       marker = list(size = 10, 
                                     color = 'rgba(51, 153, 255, .5)', 
                                     line = list(color = 'rgba(0, 38, 77, .8)', width = 2)), 
                       line = list(color = 'rgba(0, 38, 77, .8)', 
                                   width = 2))
subplotly1 # casos

subplotly2 <-  plot_ly(AllData, 
                       x = ~Date, 
                       y = ~Recovered,
                       name='Recovered', 
                       type = 'scatter', 
                       mode = 'lines+markers', 
                       marker = list(size = 10, 
                                     color = 'rgba(153, 255, 153, .8)', 
                                     line = list(color = 'rgba(0, 179, 0, .8)', width = 2)), 
                       line = list(color = 'rgba(0, 179, 0, .8)', 
                                   width = 2))
subplotly2 #curra_os

subplotly3 <- plot_ly(AllData, 
                      x = ~Date, 
                      y = ~Deaths,
                      name='Deaths',
                      type = 'scatter', 
                      mode = 'lines+markers',
                      marker = list(size = 10, 
                                    color = 'rgba(255, 102, 102, .5)', 
                                    line = list(color = 'rgba(152, 0, 0, .8)', width = 2)), 
                      line = list(color = 'rgba(152, 0, 0, 1)', 
                                  width = 2))
subplotly3 #mortes

###os 3 juntos
figsubplotly <- subplot(subplotly1, subplotly2, subplotly3)
figsubplotly

#verticalmente
figsubplotlyrows <- subplot(subplotly1, subplotly2, subplotly3, nrows= 3, shareX = TRUE)
figsubplotlyrows
