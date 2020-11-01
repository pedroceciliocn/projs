install.packages("rvest")
library(rvest)
URL <- "https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/world-map.html"


PAGE <- read_html(URL) %>%
  html_nodes(xpath="/html/body/div[7]/main/div[3]/div/div[3]/div[2]") %>%
  purrr::map(~html_nodes(.x, 'li') %>% 
               html_text() %>% 
               gsub(pattern = '\\t|\\r|\\n', replacement = ''))


countries <- PAGE[[1]]
countries

countries <- as.data.frame(matrix(unlist(countries),nrow=length(countries),byrow=TRUE))
names(countries)[1] <- "Countries"
Countriestable <- data.frame(Sr.No.=seq.int(nrow(countries)),countries)
Countriestable


###################################
install.packages("sf")
install.packages("raster")
install.packages("GADMTools")
install.packages("leaflet")

library(sf)
library(raster)


AllCountries <- map_data("world")
class(AllCountries)
write(AllCountries$region,"NamesOfCountries.txt")
CountriesAvailable<- AllCountries %>% 
  group_by(region) %>% 
  summarise()

setdiff(as.character(Countriestable$Countries), CountriesAvailable$region)

Countriestable$Countries
Countriestable$Countries <- recode(Countriestable$Countries, "Algeria" = "Argelia")
Countriestable$Countries <- recode(Countriestable$Countries, "United States" = "USA")
Countriestable$Countries <- recode(Countriestable$Countries, "United Kingdom" = "Reino Unido")
Countriestable$Countries <- recode(Countriestable$Countries, "Republic of Korea" = "Coreia do Sul")
Countriestable$Countries <- recode(Countriestable$Countries, "North Macedonia" = "Macedonia")
Countriestable$Countries <- recode(Countriestable$Countries, "Bosnia" = "Bosnia and Herzegovina")
Countriestable$Countries <- recode(Countriestable$Countries, "Holy See (Vatican City)" = "Vaticano")
Countriestable$Countries <- recode(Countriestable$Countries, "Czechia" = "Tchequia")

Countriestable$Countries <- recode(Countriestable$Countries, "Brunei Darussalam" = "Brunei")
Countriestable$Countries <- recode(Countriestable$Countries, "Eswatini" = "Swaziland")
Countriestable$Countries <- recode(Countriestable$Countries, "Ivory Coast (Côte d’Ivoire)" = "Costa do Marfim")
Countriestable$Countries <- recode(Countriestable$Countries, "Congo" = "Congo")

Countriestable<-Countriestable[!(Countriestable$Countries=="Antigua and Barbuda"),]
Countriestable<-Countriestable[!(Countriestable$Countries=="Democratic Republic of Congo"),]
Countriestable<-Countriestable[!(Countriestable$Countries=="Saint Vincent and the Grenadines"),]
Countriestable <- Countriestable[!(Countriestable$Countries=="Trinidad and Tobago"),]
Country_Antigua <- data.frame(Sr.No.=nrow(Countriestable)+1,Countries="Antigua")
Countriestable <-  rbind(Countriestable, Country_Antigua)
Country_Barbuda <- data.frame(Sr.No.=nrow(Countriestable)+1,Countries="Barbuda")
Countriestable <-  rbind(Countriestable, Country_Barbuda)
Country_SaintVincent <- data.frame(Sr.No.=nrow(Countriestable)+1,Countries="Saint Vincent")
Countriestable <-  rbind(Countriestable, Country_SaintVincent)
Country_Grenadines <- data.frame(Sr.No.=nrow(Countriestable)+1,Countries="Grenadines")
Countriestable <-  rbind(Countriestable, Country_Grenadines)
Country_Trinidad <- data.frame(Sr.No.=nrow(Countriestable)+1,Countries="Trinidad")
Countriestable <-  rbind(Countriestable, Country_Trinidad)
Country_Tobago <- data.frame(Sr.No.=nrow(Countriestable)+1,Countries="Tobago")
Countriestable <-  rbind(Countriestable, Country_Tobago)
Countriestable$Countries <- recode(Countriestable$Countries, "United States" = "EUA")

Countriestable$Countries <- recode(Countriestable$Countries, "Brazil" = "Brasil")
Countriestable$Countries


library(GADMTools)
library(rgeos)

HKMap <- getData('GADM', country='Hong Kong', level=0)
class(HKMap)
centerHK <- data.frame(gCentroid(HKMap, byid = TRUE))
MACMap <- getData('GADM', country='macao', level=0)
centerMAC <- data.frame(gCentroid(MACMap, byid = TRUE))

BRMap <- getData('GADM', country='Brazil', level=0)
class(BRMap)
centerBR <- data.frame(gCentroid(BRMap, byid = TRUE))
centerBR

USAMap <- getData('GADM', country='United States', level=0)
class(USAMap)
centerUSA<- data.frame(gCentroid(USAMap, byid = TRUE))
centerUSA

ITAMap <- getData('GADM', country='Italy', level=0)
class(ITAMap)
centerITA<- data.frame(gCentroid(ITAMap, byid = TRUE))
centerITA

SPAMap <- getData('GADM', country='Spain', level=0)
class(SPAMap)
centerSPA<- data.frame(gCentroid(SPAMap, byid = TRUE))
centerSPA
GBMap <- getData('GADM', country='Gibraltar', level=0)
class(GBMap)
centerGB <- data.frame(gCentroid(GBMap, byid = TRUE))
centerGB

library(leaflet)
boundries <- maps::map("world", Countriestable$Countries, fill = TRUE, plot = FALSE)
class(boundries)

Map_AffectedCountries <- leaflet() %>%
  addProviderTiles("OpenStreetMap.Mapnik") %>%
  addPolygons(data = boundries, group = "Countries", 
              color = "Blue", 
              weight = 2,
              smoothFactor = 0.2,
              popup = ~names,
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black",
                                                  weight = 2, 
                                                  bringToFront = FALSE)) %>%
  addPolygons(data=HKMap, group = "id",
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "Hong Kong",
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black", 
                                                  weight = 2,
                                                  bringToFront = FALSE)) %>%
  addLabelOnlyMarkers(data = centerHK, lng = ~x, lat = ~y, 
                      label = "Hong Kong", 
                      labelOptions = labelOptions(noHide = F, 
                                                  textsize = "15px", 
                                                  direction = 'top', 
                                                  textOnly = TRUE))    %>%
  addPolygons(data=BRMap, group = "id",
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "Brazil",
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black", 
                                                  weight = 2,
                                                  bringToFront = FALSE)) %>%
  addLabelOnlyMarkers(data = centerBR, lng = ~x, lat = ~y, 
                      label = "Brazil", 
                      labelOptions = labelOptions(noHide = F, 
                                                  textsize = "15px", 
                                                  direction = 'top', 
                                                  textOnly = TRUE))    %>%
  addPolygons(data=USAMap, group = "id",
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "United States Of America",
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black", 
                                                  weight = 2,
                                                  bringToFront = FALSE)) %>%
  addLabelOnlyMarkers(data = centerUSA, lng = ~x, lat = ~y, 
                      label = "United States Of America", 
                      labelOptions = labelOptions(noHide = F, 
                                                  textsize = "15px", 
                                                  direction = 'top', 
                                                  textOnly = TRUE))    %>%
  addPolygons(data=ITAMap, group = "id",
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "Italy",
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black", 
                                                  weight = 2,
                                                  bringToFront = FALSE)) %>%
  addLabelOnlyMarkers(data = centerITA, lng = ~x, lat = ~y, 
                      label = "Italy", 
                      labelOptions = labelOptions(noHide = F, 
                                                  textsize = "15px", 
                                                  direction = 'top', 
                                                  textOnly = TRUE))    %>%
  addPolygons(data=SPAMap, group = "id",
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "Spain",
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black", 
                                                  weight = 2,
                                                  bringToFront = FALSE)) %>%
  addLabelOnlyMarkers(data = centerSPA, lng = ~x, lat = ~y, 
                      label = "Spain", 
                      labelOptions = labelOptions(noHide = F, 
                                                  textsize = "15px", 
                                                  direction = 'top', 
                                                  textOnly = TRUE))    %>%
  addPolygons(data=MACMap, group = "id",
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "Macau",
              fillOpacity = 0.1,
              label = "Macau",
              labelOptions = labelOptions(noHide = F, 
                                          textsize = "15px",
                                          direction = 'top'),
              highlightOptions = highlightOptions(color = "black", 
                                                  weight = 2,
                                                  bringToFront = FALSE))

Map_AffectedCountries

boundryGuadalupe <- maps::map("world", "Mexico:Guadalupe Island", fill = TRUE, plot = FALSE)
Map_AffectedCountries <- Map_AffectedCountries %>%
  addProviderTiles("OpenStreetMap.Mapnik") %>%
  addPolygons(data = boundryGuadalupe, group = "Countries", 
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              #popup = ~names,
              fillOpacity = 0.1,
              highlightOptions = highlightOptions(color = "black",
                                                  weight = 2,bringToFront = FALSE)) %>%
  addPolygons(data=GBMap,group='id',
              color = "red", 
              weight = 2,
              smoothFactor = 0.2,
              popup = "Gibraltar",
              fillOpacity = 0.1,
              label = "Gibraltar",
              labelOptions = labelOptions(noHide = F, textsize = "15px",                                         direction = 'top'),
              highlightOptions = highlightOptions(color = "black", weight = 2,
                                                  bringToFront = F))

Map_AffectedCountries
####################################
library(readr)
library(knitr) 
library(RCurl)
library(htmlwidgets)
library(htmltools)

Main <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series"
confirmed <-  file.path(Main,"time_series_covid19_confirmed_global.csv")
confirmed
Deaths <- file.path(Main,"time_series_covid19_deaths_global.csv")
Deaths
Recoverd<- file.path(Main,"time_series_covid19_recovered_global.csv")
Recoverd
ConfirmedData <- read.csv(confirmed)
DeathData <- read.csv(Deaths)
RecoveredData <-  read.csv(Recoverd)


DateColumn <- colnames(ConfirmedData)[ncol(ConfirmedData)]
cleanDateColumn <- gsub('X','',DateColumn)

popupConfirmed <- paste("
                        <strong>County: </strong>", 
                        ConfirmedData$Country.Region, 
                        "<br><strong>Province/State: </strong>", 
                        ConfirmedData$Province.State, 
                        "<br><strong>Confirmed: </strong>", 
                        ConfirmedData[,DateColumn]
)

popupdeath <- paste("
                    <strong>County: </strong>", 
                    DeathData$Country.Region, 
                    "<br><strong>Province/State: </strong>", 
                    DeathData$Province.State, 
                    "<br><strong>Deaths: </strong>", 
                    DeathData[,DateColumn] 
)

popupRecovered <- paste("
                        <strong>County: </strong>", 
                        RecoveredData$Country.Region, 
                        "<br><strong>Province/State: </strong>", 
                        RecoveredData$Province.State, 
                        "<br><strong>Recovered: </strong>", 
                        RecoveredData[,DateColumn]
)

palConfirmed <- colorBin(palette = "GnBu", domain = ConfirmedData[,DateColumn] , bins = 3 , reverse = FALSE)

paldeath     <- colorBin(palette = "OrRd", domain = DeathData[,DateColumn]     , bins = 3 , reverse = FALSE)

palrecovered <- colorBin(palette = "BuGn", domain = RecoveredData[,DateColumn] , bins = 3 ,  reverse = FALSE)

title <- tags$style(HTML(".map-title {
                         font-family: 'Cool Linked Font', fantasy; 
                         transform: translate(-10%,20%); 
                         position: fixed !important; 
                         left: 10%; 
                         text-align: left; 
                         padding-left: 10px; 
                         padding-right: 10px; 
                         background: rgba(255,255,255,0.75); 
                         font-weight: bold; 
                         font-size: 25px}")
)


subtitle <- tags$style(HTML(".map-subtitle {
                            transform: translate(-10%,150%);
                            position: fixed !important;
                            left: 10%;
                            text-align: left;
                            padding-left: 10px;
                            padding-right: 10px;
                            font-size: 18px}")
)

CasesLabel<- tags$style(HTML(".cases-label{
                             position: absolute; 
                             bottom: 8px; 
                             left: 16px; 
                             font-size: 18px}")
)

leaflettitle <- tags$div(title, HTML("Status of COVID-19"))  

leafletsubtitle <- tags$div(subtitle, HTML("YouTube: Dr Rehan Zafar"))  

CasesLabelonMap <- tags$div(CasesLabel, HTML(paste(
  "<strong>Date: </strong>", 
  cleanDateColumn, 
  "<strong>Confirmed: </strong>",
  sum(as.numeric(ConfirmedData[,DateColumn])), 
  "<strong>Deaths: </strong>",
  sum(as.numeric(DeathData[,DateColumn])),
  "<strong>Recovered: </strong>",
  sum(as.numeric(RecoveredData[,DateColumn]))))
)

CasesLabelonMap
##
Mapwithvalues <- Map_AffectedCountries %>% 
  addCircleMarkers(data= ConfirmedData, 
                   lng = ~Long, 
                   lat = ~Lat, 
                   radius = ~log(ConfirmedData[,DateColumn])*5, 
                   stroke = FALSE, 
                   fillOpacity = 1, 
                   popup = popupConfirmed, 
                   color = ~palConfirmed(ConfirmedData[,DateColumn]), 
                   group = "Circles(Confirmed)") %>%
  addLabelOnlyMarkers(data= ConfirmedData, 
                      lng = ~Long, 
                      lat = ~Lat, 
                      label  = ~as.character(ConfirmedData[,DateColumn]), 
                      group="Values(Confirmed)", 
                      labelOptions = labelOptions(noHide = T, 
                                                  direction = 'center', 
                                                  textOnly = T, 
                                                  style=list('color'='blue', 
                                                             'font-family'= 'sans',
                                                             'font-style'= 'bold', 
                                                             'font-size' = '20px', 
                                                             'border-color' = 'rgba(0,0,0,0.5)'))) %>%
  addLegend("bottomright", 
            pal = palConfirmed, 
            values = ConfirmedData[,DateColumn], 
            title = "Confirmed", 
            opacity = 1) %>%
  addCircleMarkers(data= RecoveredData, 
                   lng = ~Long, 
                   lat = ~Lat, 
                   radius = ~log(X2.27.20)*5, 
                   stroke = FALSE, 
                   fillOpacity = 1, 
                   popup = popupRecovered, 
                   color = ~palrecovered(RecoveredData$X2.27.20), 
                   group = "Circles(Recovered)") %>%
  addLabelOnlyMarkers(data= RecoveredData, 
                      lng = ~Long, 
                      lat = ~Lat, 
                      label  = ~as.character(RecoveredData[,DateColumn]), 
                      group="Values(Recovered)", 
                      labelOptions = labelOptions(noHide = T, 
                                                  direction = 'center', 
                                                  textOnly = T, 
                                                  style=list('color'='green', 
                                                             'font-family'= 'sans', 
                                                             'font-style'= 'bold', 
                                                             'font-size' = '20px',
                                                             'border-color' = 'rgba(0,0,0,0.5)'))) %>%
  addLegend("bottomright", 
            pal = palrecovered, 
            values = RecoveredData[,DateColumn], 
            title = "Recovered", 
            opacity = 1) %>%
  addCircleMarkers(data= DeathData, 
                   lng = ~Long, 
                   lat = ~Lat, 
                   radius = ~log(DeathData[,DateColumn])*5, 
                   stroke = FALSE, 
                   fillOpacity = 1, 
                   popup = popupdeath, 
                   color = ~paldeath(DeathData[,DateColumn]), 
                   group = "Circles(Death)") %>%
  addLabelOnlyMarkers(data= DeathData, 
                      lng = ~Long, 
                      lat = ~Lat, 
                      label  = ~as.character(DeathData[,DateColumn]), 
                      group="Values(Death)", 
                      labelOptions = labelOptions(noHide = T, 
                                                  direction = 'center', 
                                                  textOnly = T, 
                                                  style=list('color'='red', 
                                                             'font-family'= 'sans', 
                                                             'font-style'= 'bold',
                                                             'font-size' = '20px',
                                                             'border-color' = 'rgba(0,0,0,0.5)'))) %>%
  addLegend("bottomright", 
            pal=paldeath, 
            values=DeathData[,DateColumn], 
            title = "Deaths", 
            opacity = 1) %>%
  addLayersControl(overlayGroups = c("Circles(Confirmed)","Values(Confirmed)" ,"Circles(Recovered)","Values(Recovered)", "Circles(Death)","Values(Death)"), options = layersControlOptions(collapsed = FALSE)) %>%
  addControl(leaflettitle, position = "topleft", className="map-title") %>%
  addControl(leafletsubtitle, position = "topleft", className="map-subtitle") %>%
  addControl(CasesLabelonMap, position = "bottomleft", className="cases-label")

Mapwithvalues
saveWidget(Mapwithvalues, file="map1.html", selfcontained=FALSE)