###################################################################
########## Linear discriminant analysis(LDA)
#linear combination of features to seperate categorical variables/factors/classes
# linear classifier
#normally distributed predictor & equality of covariance

data(iris)
head(iris)

library(MASS)
lda1 <- lda(Species ~ ., 
            iris)
lda1
#proportion of trace that is
# the percentage separation achieved by each discriminant function.

lda <- lda(Species ~ ., 
           iris, 
           prior = c(1,1,1)/3)
lda

plot(lda)

lda1$svd
#singular values (svd) that gives 
#the ratio of the between- and within-group standard deviations 
#on the linear discriminant variables.

prop.lda = lda$svd^2/sum(lda$svd^2)
prop.lda

plda <- predict(object = lda1,
                newdata = iris)
plda

dataset = data.frame(species = iris[,"Species"],
                     lda = plda$x)
dataset
#seperability achieved by LDA1 
ldahist(data = plda$x[,1], g=iris$Species)

#seperability achieved by LDA2 
ldahist(data = plda$x[,2], g=iris$Species)

p1=ggplot(dataset) + geom_point(aes(lda.LD1, lda.LD2, colour = species, shape = species), size = 2.5) 
p1
##compare to pca

pca <- prcomp(iris[,-5],
              center = TRUE,
              scale. = TRUE) 
pca$x

df = data.frame(species = iris[,"Species"],
                pca = pca$x)
df

p2=ggplot(df) + geom_point(aes(pca.PC1, pca.PC2, colour = species, shape = species), size = 2.5)
p1
p2

require(gridExtra)
grid.arrange(p1, p2)

######## generalize: how does lda perform on unseen data
library(caret)
library(lattice)
validation_index <- createDataPartition(iris$Species, p=0.75, list=FALSE)
# use the remaining 75% of data to training the models
train = iris[validation_index,]
train
# select 25% of the data for validation
test = iris[-validation_index,]
test

lda2 <- lda(Species ~ ., 
            train, 
            prior = c(1,1,1)/3)

plot(lda2)

#predict on unseen
plda <- predict(object = lda2,
                newdata = test)

head(plda$class)
train
test
#seperability achieved by LDA1 on the test data
ldahist(data = plda$x[,1], g=iris$Species)
ldahist(data = plda$x[,2], g=iris$Species)

confusionMatrix(plda$class, test$Species)

#visualize
dataset2 = data.frame(species = test[,"Species"],
                      lda = plda$x)
plda$x

ggplot(dataset2) + geom_point(aes(lda.LD1, lda.LD2, colour = species, shape = species), size = 2.5) 

###### qda:  does not assume homogeneity of variance-covariance matrices

qda2 <- qda(Species ~ ., 
            train, 
            prior = c(1,1,1)/3)
qda2

pqda <- predict(object = qda2,
                newdata = test)
pqda

dataset3 = data.frame(species = test[,"Species"],
                      lda = pqda$class)
dataset2

head(pqda$class)

confusionMatrix(pqda$class, test$Species)


##############################