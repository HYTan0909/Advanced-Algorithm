library(tidyverse)
library(ggpubr)

install.packages("remotes")
remotes::install_github("kassambara/datarium")

# Load the package
data("marketing", package = "datarium")
head(marketing, 4)

ggplot(marketing, aes(x = youtube, y = sales)) + geom_point() + stat_smooth()

cor(marketing$sales, marketing$youtube)

model <- lm(sales ~ youtube, data = marketing)

summary(model)

model <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
summary(model)

summary(model)$coefficient

model <- lm(sales ~ youtube + facebook, data = marketing)
summary(model)

confint(model)
