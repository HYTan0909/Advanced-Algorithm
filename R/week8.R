# Store the data in the variable my_data
mydata <- iris

install.packages('car')
library(car)

mydata[2:4]

scatterplotMatrix(mydata[2:4])

plot(mydata$Sepal.Length, mydata$Petal.Length)

text(mydata$Sepal.Length, mydata$Petal.Length, mydata$Species, cex=0.7, pos=4,
     col="red")

install.packages('RColorBrewer')

library(RColorBrewer)

makeProfilePlot <- function(mylist,names)
{
  require(RColorBrewer)
  # find out how many variables we want to include
  numvariables <- length(mylist)
  # choose 'numvariables' random colours
  colours <- brewer.pal(numvariables,"Set1")
  # find out the minimum and maximum values of the variables:
  mymin <- 1e+20
  mymax <- 1e-20
  for (i in 1:numvariables)
  {
    vectori <- mylist[[i]]
    mini <- min(vectori)
    maxi <- max(vectori)
    if (mini < mymin) { mymin <- mini }
    if (maxi > mymax) { mymax <- maxi }
  }
  # plot the variables
  for (i in 1:numvariables)
  {
    vectori <- mylist[[i]]
    namei <- names[i]
    colouri <- colours[i]
    if (i == 1) { plot(vectori,col=colouri,type="l",ylim=c(mymin,mymax)) }
    else { points(vectori, col=colouri,type="l") }
    lastxval <- length(vectori)
    lastyval <- vectori[length(vectori)]
    text((lastxval-10),(lastyval),namei,col="black",cex=0.6)
  }
}

names <- c("Sepal Length","Sepal Width","Petal Length","Petal Width")
mylist <- list(mydata$Sepal.Length, mydata$Sepal.Width, mydata$Petal.Length,
               mydata$Petal.Width)
makeProfilePlot(mylist,names)

cor.test(mydata$Sepal.Length, mydata$Petal.Length)

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

mosthighlycorrelated(mydata[1:4], 10)

mydata.pca <- prcomp(mydata[1:4], scale=T)

summary(mydata.pca)

mydata.pca$sdev

sum((mydata.pca$sdev)^2)

screeplot(mydata.pca, type="lines")

plot(mydata.pca$x[,1],mydata.pca$x[,2]) # make a scatterplot
# add labels
text(mydata.pca$x[,1],mydata.pca$x[,2], mydata$Species, cex=0.7, pos=4, col="red")

#Prepare Data
mydata2 = na.omit(mydata) # listwise deletion of missing
mydata2=mydata[,1:4]
mydata2= scale(mydata2) # standardize variables

fit = kmeans(mydata2, 5) # 5 cluster solution

aggregate(mydata2,by=list(fit$cluster),FUN=mean)

mydata2 <- data.frame(mydata2, fit$cluster)

# Ward Hierarchical Clustering
d = dist(mydata2, method = "euclidean") # distance matrix
fit = hclust(d, method="ward")
plot(fit) # display dendogram

groups =cutree(fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(fit, k=5, border="blue")

