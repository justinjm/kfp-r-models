# serving.R

library("randomForest")

#* Health check
#* @get /ping
#* @serializer unboxedJSON
function() {
    list(status = "OK")
}

#* @apiTitle flower classifier
#* @param petal_length 
#* @param petal_width 
#* @param sepal_length
#* @param sepal_width
#* @post /classify
function (req) 
{
    instances <- as.data.frame(jsonlite::fromJSON(req$postBody))
    results <- list()
    
    load("model.RData")
    
    for(i in 1:nrow(instances)) {       # for-loop over columns
        petal_length <- instances[i, "instances.petal_length"]
        petal_width <- instances[i, "instances.petal_width"]
        sepal_length <- instances[i, "instances.sepal_length"]
        sepal_width <- instances[i, "instances.sepal_width"]
        test = c(sepal_length, sepal_width, petal_length, petal_width)
        test = sapply(test, as.numeric)
        test = data.frame(matrix(test, ncol = 4))
        colnames(test) = colnames(iris[, 1:4])
        results <- append(results, predict(model, test))
    }
    
    list(predictions = results)
}
