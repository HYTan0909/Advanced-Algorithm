data<-read.csv("C:/Users/student/Documents/diamond.csv")
View(data)  

library(ggplot2)
ggplot(data, mapping=aes(x=x,y=y)) + geom_point()

ggplot(data = diamonds, mapping = aes(x = x, y = y)) +geom_point(na.rm = TRUE)

data$depth = ifelse(is.na(data$depth),ave(data$depth, FUN = function(x) mean(x, na.rm = 'TRUE')),data$depth)

data$depth = as.numeric(format(round(data$depth, 1)))

#Exercise q1
data$x = ifelse(is.na(data$x),ave(data$x, FUN = function(x) mean(x, na.rm = 'TRUE')),data$x)

data$y = ifelse(is.na(data$y),ave(data$y, FUN = function(x) mean(x, na.rm = 'TRUE')),data$y)

data$z = ifelse(is.na(data$z),ave(data$z, FUN = function(x) mean(x, na.rm = 'TRUE')),data$z)

#Exercise q2
data$table = ifelse(is.na(data$table),ave(data$table, FUN = function(x) median(x, na.rm = 'TRUE')),data$table)

data$price = ifelse(is.na(data$price),ave(data$price, FUN = function(x) median(x, na.rm = 'TRUE')),data$price)

#Exercise 3
data$x = as.numeric(format(round(data$x, 1)))
data$y = as.numeric(format(round(data$y, 1)))
data$z = as.numeric(format(round(data$z, 1)))
data$table = as.numeric(format(round(data$table, 1)))
data$price = as.numeric(format(round(data$price, 1)))

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))

install.packages('magrittr')
library(magrittr)
library(dplyr)
data %>% count(cut)

ggplot(data) + geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

data %>% count(cut_width(carat, 0.5))

smaller <- data %>% filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) + geom_histogram(binwidth = 0.1)

ggplot(data = smaller, mapping = aes(x = carat, colour = cut)) + geom_freqpoly(binwidth = 0.1)

data$cut = factor(data$cut, levels = c("Fair", "Good", "Ideal", "Premium", "Very Good"), labels = c(1,2,3,4,5))

#Splitting The Dataset Into Training and Testing Sets
install.packages('caTools')
library(caTools)

set.seed(123)
split = sample.split(data$Species, SplitRatio = 0.8)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)