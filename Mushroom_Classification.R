library(caret)
library(ISLR2)
library(ModelMetrics)

mushrooms <- read.csv("mushroom_cleaned.csv")

set.seed(5)

#change variable types
mushrooms$class <- factor(mushrooms$class, levels= c(0,1))
mushrooms$gill.color <- factor(mushrooms$gill.color)

# Lets do k-fold Crossvalidation
k=10
# get fold size
fold.size <- round(nrow(mushrooms)/k, 0)
#shuffle Dataset
mush.shuffle <- mushrooms[sample(1:nrow(mushrooms)),]
# Scale????

# Create test predictions vector/list
test.pred <- c()

MAE.test <- c()

for( fold in 1:k )
{
  # get our fold indecies
  fold.indecies <- 
    c(((fold-1)*fold.size+1): 
        min(fold*fold.size, nrow(mush.shuffle)))
  
  mush.train <- mush.shuffle[-fold.indecies,]
  mush.test <- mush.shuffle[fold.indecies,]
  
  poisonous.fit <- glm(class~., data= mush.train, family= "binomial")
  
  preddictions <- predict(poisonous.fit, mush.test, type= "response")
  
  test.pred <- append(test.pred, ifelse(predictions > 0.5, 1, 0))
  
}

## error
mean(test.pred == mush.shuffle$class)


