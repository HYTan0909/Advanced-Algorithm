#1. One-Sample
set.seed(0)
ship_vol <- c(rnorm(75, mean = 37000, sd = 2500))
t.test(ship_vol, mu = 39000)

t.test(ship_vol, mu = 39000, alternative = 'less')

#2. Paired Sample
#Author DataFlair
set.seed(2820)
pre_Treatment <- c(rnorm(2000, mean = 150, sd = 10))
post_Treatment <- c(rnorm(2000, mean = 144, sd = 9))
t.test(pre_Treatment, post_Treatment, paired = TRUE)

#3. Independent Samples
#Author DataFlair
set.seed(0)
Spenders_Cleve <- rnorm(60, mean = 350, sd = 77)
Spenders_NY <- rnorm(60, mean = 400, sd = 80)
t.test(Spenders_Cleve, Spenders_NY, var.equal = TRUE)

#Author DataFlair
Amount_Spent <- c(Spenders_Cleve, Spenders_NY)
city_name <- c(rep("Cleveland", 60), rep("New York", 60))
t.test(Amount_Spent ~ city_name, var.equal = TRUE)

#Author DataFlair
t.test(Spenders_Cleve, Spenders_NY, var.equal = FALSE)

#Author DataFlair
x = rnorm(10)
y = rnorm(10)
t.test(x,y)

#1. Simple Correlation
#Author DataFlair
count = c(9,25,15,2,14,25,24,47)
speed = c(2,3,5,9,14,24,29,34)
cor(count, speed)
cor(count, speed, method = 'spearman')

#2. Covariance
set.seed(5)
x <- rnorm(30, sd=runif(30, 2, 50))
mat <- matrix(x,10)
V <- cov(mat)
V