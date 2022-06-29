my_data <- mtcars

#print first 6 line of my_data
head(my_data, 6)

install.packages('ggpubr')
library(ggpubr)

ggscatter(my_data, x = "mpg", y = "wt",
          add = "reg.line", conf.int = TRUE,
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")

# Shapiro-Wilk normality test for mpg
shapiro.test(my_data$mpg)

# Shapiro-Wilk normality test for wt
shapiro.test(my_data$wt)

# mpg
ggqqplot(my_data$mpg, ylab = "MPG")
# wt
ggqqplot(my_data$wt, ylab = "WT")

res <- cor.test(my_data$wt, my_data$mpg,
                method = "pearson")
res

#Extract the p.value
res$p.value
# Extract the correlation coefficient
res$estimate
res <- cor.test(my_data$wt, my_data$mpg,
                method = "pearson")
res
