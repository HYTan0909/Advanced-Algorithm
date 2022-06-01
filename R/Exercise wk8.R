#load diabetes dataset
diabetes <- read.csv('diabetes.csv')

#plot 3 attributes 
library(car)
diabetes[1:3]
scatterplotMatrix(diabetes[1:3])

#Identify which attributes have higher standard deviation compare to other variables. 
diabetes.pca <- prcomp(diabetes[1:3], scale=T)
diabetes.pca$sdev

#Find the highest correlation between the attributes. 
mosthighlycorrelated <- function(mydataframe,numtoreport)
{
  # find the correlations
  cormatrix <- cor(mydataframe)
  # set the correlations on the diagonal or lower triangle to zero,
  # so they will not be reported as the highest ones:
  diag(cormatrix) <- 0
  cormatrix[lower.tri(cormatrix)] <- 0
  # flatten the matrix into a dataframe for easy sorting
  fm <- as.data.frame(as.table(cormatrix))
  # assign human-friendly names
  names(fm) <- c("First.Variable", "Second.Variable","Correlation")
  # sort and print the top n correlations
  head(fm[order(abs(fm$Correlation),decreasing=T),],n=numtoreport)
}
mosthighlycorrelated(diabetes[1:9], 10)


