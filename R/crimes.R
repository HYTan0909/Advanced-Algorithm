library(ggplot2)
library(dplyr)
library(maps)
library(ggmap)
library(mongolite)
library(lubridate)
library(gridExtra)
crimes=data.table::fread("crime.csv")
names(crimes)

names(crimes) = gsub(" ","",names(crimes))
names(crimes)

connection_string = 'mongodb+srv://hytan:1234@MyCluster1.ihzso.mongodb.net'
my_collection = mongo(collection="crimes", db="Vancouver", url=connection_string)
my_collection$insert(crimes)

my_collection$iterate()$one()
length(my_collection$distinct("TYPE"))
my_collection$count('{"TYPE" : "Mischief"}')

query1= my_collection$find('{"TYPE" : "Mischief", "MONTH" : 6 }')
query2= my_collection$find('{"TYPE" : "Mischief", "MONTH" : 6 }',
                           fields = '{"_id":0, "TYPE":1, "MONTH":6}')
ncol(query1) # with all the columns
ncol(query2) # only the selected columns

my_collection$aggregate('[{"$group":{"_id":"$NEIGHBOURHOOD", "Count":
{"$sum":1}}}]')%>%na.omit()%>%
  arrange(desc(Count))%>%head(10)%>%
  ggplot(aes(x=reorder(`_id`,Count),y=Count))+
  geom_bar(stat="identity",color='skyblue',fill='#b35900')+geom_text(aes(label = Count), color =
                                                                       "blue") +coord_flip()+xlab("Location Description")

crimes%>%group_by(`NEIGHBOURHOOD`)%>%summarise(Total=n())%>%
  arrange(desc(Total))%>%head(10)%>%
  ggplot(aes(x=reorder(`NEIGHBOURHOOD`,Total),y=Total))+
  geom_bar(stat="identity",color='skyblue',fill='#FFC0CB')+geom_text(aes(label = Total), color =
                                                                       "blue") +coord_flip()+xlab("Location Description")
