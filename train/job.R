install.packages("randomForest")

library(randomForest)
library(plumber)

# train model
model = randomForest(Species ~ ., data = iris)

# save model
save(model, file = "/gcs/garrido-ml-models/rmodel/model.RData")