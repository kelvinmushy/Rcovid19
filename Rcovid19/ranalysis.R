library(httr)
library(jsonlite)
library(tidyverse)
library(plotly)
library(dbplyr)

res = GET("https://2019ncov.asia/api/country_region")

#kabla uja vuta json data zako please angalia kwanza library zainafanya kazi vizuri kwa kutumia diamonds dataset
#kila utakapo jaribu kuangalia kitu unacho kihitaji kutokana na information jaribu kuondoa alama ya # ili uweze kuexcute R code
#nakutakia kila la heri jaribu kufuatilia kwa umakin



#data(diamonds, package = "ggplot2")
#diamonds
# create three visualizations of the diamonds dataset
#plot_ly(diamonds, x = ~cut)
#plot_ly(diamonds, x = ~cut, y = ~clarity)
#plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")


#here check data forma
data1->charToRaw(res)
#result our data is on characher form

#convert data to json format
data->fromJSON(data1)
#so our  result of data is on data frame now so u may use only data varible 

#check exactly colnames variable  in order to under standing all variable
#names(data$results
#result of your colnames will apper country_region" "confirmed" "deaths" "recovered" "last_updated" 

#kumbuka sisi tunataka kujua  darifa mbali mbali kama vile kifo ,walio pona maambukizi mapya mengine
#basi tutaanza tumia plotyl library ili kuweza kupata data kwa njia ya statics


#plot_ly(data$results, x = ~deaths,y=~ country_region)
#utaona case ya tanzania na vifo haviko kwa wingi kwahiyo ni swala la kumshukuru Mungu

#basi tuangailie na maambukizi mapya
#plot_ly(data$results, y= ~confirmed,x=~ country_region)

#jibu utaona newcase marekani wanaongoza na Tanzania hatuko kabisa kwenye list

#embu tujaribu kuangalia tanzania tu pekee yake tuweze kujua taarifa zake


#utaona Tanzania haipo kabisa
#Tuangalie kutokana na nchi moja mfano tanzania 
y=data$results
p=y[y$country_region== 'Tanzania',]
#matokeo yataonysha kwamba Tanzania waliothibitika 509, death 21,na recovery 183

plot_ly(p,y = ~deaths,x=~country_region)


