# Store the data in the variable my_data
my_data <- iris
# Print the first 10 rows
head(my_data, 10)
#Print the last 10 rows
tail(my_data, 10)
# Description of the data
str(my_data)
# Statistical summary of the data
summary(my_data)
# Change the value of digits
summary(my_data, digits = 1)
# Compute the maximum value
max(my_data$Sepal.Length)
# Compute the minimum value
min(my_data$Sepal.Length)
# Compute the mean value
mean(my_data$Sepal.Length)
# Compute the mean of each column
sapply(my_data[, -5], mean)
# Compute the median value
median(my_data$Sepal.Length)
# Standard deviation
sd(my_data$Sepal.Length)
# Variance
var(my_data$Sepal.Length)
# Compute the median absolute deviation
mad(my_data$Sepal.Length)

# Compute the mode
# install modeest package
install.packages("modeest")
library(modeest)
mfv(my_data$Sepal.Length)

# Range
range(my_data$Sepal.Length)
# Compute range for each column
sapply(my_data[, -5], range)

# Quartile
quantile(my_data$Sepal.Length)
# Compute quartiles for each column
sapply(my_data[, -5], quantile)

# Deciles
quantile(my_data$Sepal.Length, seq(0, 1, 0.1))

# Interquartile
IQR(my_data$Sepal.Length)
# Compute IQR for each column
sapply(my_data[, -5], IQR)

#install pastecs package
install.packages("pastecs")
library(pastecs)

res <- stat.desc(my_data[, -5])
round(res, 2)

install.packages("ggpubr")
library(ggpubr)

#box plot
ggboxplot(my_data, y = "Sepal.Length", width = 0.5)

#histogram
gghistogram(my_data, x = "Sepal.Length", bins = 9, add = "mean")

#Empirical Cummulative Distribution Function (ECDF)
ggecdf(my_data, x = "Sepal.Length")

#Q-Q plots
ggqqplot(my_data, x = "Sepal.Length")

#Exercise q1
ggboxplot(my_data, y = "Sepal.Width", width = 0.5)
ggboxplot(my_data, y = "Petal.Length", width = 0.5)
ggboxplot(my_data, y = "Petal.Width", width = 0.5)

#Exercise q2
gghistogram(my_data, x = "Sepal.Width", bins = 9, add = "mean")
gghistogram(my_data, x = "Petal.Length", bins = 9, add = "mean")
gghistogram(my_data, x = "Petal.Width", bins = 9, add = "mean")

install.packages("dplyr")
library(dplyr)

#Descriptive statistics by groups
group_by(my_data, Species) %>%
  summarise(
    count = n(),
    mean = mean(Sepal.Length, na.rm = TRUE),
    sd = sd(Sepal.Length, na.rm = TRUE)
  )

#Graphics for grouped data
library(ggpubr)
# Box plot colored by groups: Species
ggboxplot(my_data, x = "Species", y = "Sepal.Length",
          color = "Species",
          palette = c("#00AFBB", "#E7B800", "#FC4E07"))

#Stripchart for grouped data
# Stripchart colored by groups: Species
ggstripchart(my_data, x = "Species", y = "Sepal.Length",
             color = "Species",
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             add = "mean_sd")

#Piechart for grouped data
# Piechart for group
ggplot(my_data, aes(x="", y="Sepal.Length", fill=Species))+
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

# Hair/eye color data
df <- as.data.frame(HairEyeColor)
hair_eye_col <- df[rep(row.names(df), df$Freq), 1:3]
rownames(hair_eye_col) <- 1:nrow(hair_eye_col)
head(hair_eye_col)

# hair/eye variables
Hair <- hair_eye_col$Hair
Eye <- hair_eye_col$Eye

# Frequency distribution of hair color
table(Hair)
# Frequency distribution of eye color
table(Eye)

# Compute table and convert as data frame
df <- as.data.frame(table(Hair))
df

# Visualize using bar plot
library(ggpubr)
ggbarplot(df, x = "Hair", y = "Freq")

#Two categorical variables
tbl2 <- table(Hair , Eye)
tbl2

#Cross tabulation data frame
xtabs(~ Hair + Eye, data = hair_eye_col)

#Compute table and convert as data frame
df <- as.data.frame(tbl2)
head(df)

#Visualize using bar plot
library(ggpubr)
ggbarplot(df, x = "Hair", y = "Freq",
          color = "Eye",
          palette = c("brown", "blue", "gold", "green"))

#Visualize using bar plot-position dodge
# position dodge
ggbarplot(df, x = "Hair", y = "Freq",
          color = "Eye", position = position_dodge(),
          palette = c("brown", "blue", "gold", "green"))

#Multiway tables
xtabs(~Hair + Eye + Sex, data = hair_eye_col)

#Flat contingency tables
ftable(Sex + Hair ~ Eye, data = hair_eye_col)

#Compute table margins
Hair <- hair_eye_col$Hair
Eye <- hair_eye_col$Eye
# Hair/Eye color table
he.tbl <- table(Hair, Eye)
he.tbl

# Margin of rows
margin.table(he.tbl, 1)

# Margin of columns
margin.table(he.tbl, 2)

# Frequencies relative to row total
prop.table(he.tbl, 1)

# Table of percentages
round(prop.table(he.tbl, 1), 2)*100

he.tbl/sum(he.tbl)
