# creating a sequence of values
# between -15 to 15 with a difference of 0.1
x = seq(-15, 15, by=0.1)

y = dnorm(x, mean(x), sd(x))

# output to be present as PNG file
png(file="dnormExample.png")

# Plot the graph.
plot(x, y)

# saving the file
dev.off() 

# creating a sequence of values
# between -10 to 10 with a difference of 0.1
x <- seq(-10, 10, by=0.1)

y <- pnorm(x, mean = 2.5, sd = 2)

# output to be present as PNG file
png(file="pnormExample.png")

# Plot the graph.
plot(x, y)

# saving the file
dev.off()

# Create a sequence of probability values
# incrementing by 0.02.
x <- seq(0, 1, by = 0.02)

y <- qnorm(x, mean(x), sd(x))

# output to be present as PNG file
png(file = "qnormExample.png")

# Plot the graph.
plot(x, y)

# Save the file.
dev.off()

# Create a vector of 1000 random numbers
# with mean=90 and sd=5
x <- rnorm(10000, mean=90, sd=5)

# output to be present as PNG file
png(file = "rnormExample.png")

# Create the histogram with 50 bars
hist(x, breaks=50)

# Save the file.
dev.off()

dbinom(3, size = 13, prob = 1 / 6)
x <- c(0:10)
probabilities <- dbinom(x, size = 10, prob = 1 / 6)
data.frame(x, probabilities)
plot(0:10, probabilities, type = "l")

pbinom(3, size = 13, prob = 1 / 6)
plot(0:10, pbinom(0:10, size = 10, prob = 1 / 6), type = "l")

qbinom(0.8419226, size = 13, prob = 1 / 6)
x <- seq(0, 1, by = 0.1)
y <- qbinom(x, size = 13, prob = 1 / 6)
plot(x, y, type = 'l')

rbinom(8, size = 13, prob = 1 / 6)
hist(rbinom(8, size = 13, prob = 1 / 6))
