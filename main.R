library(jsonlite)
library(xgboost)

model = xgb.load('xgb_model.model')

#* @post /iris_pred
iris_pred = function(Sepal.Length = NULL, Sepal.Width= NULL, Petal.Length= NULL, Petal.Width= NULL){
  
  new_data = data.frame(Sepal.Length = as.integer(Sepal.Length),
                        Sepal.Width = as.integer(Sepal.Width),
                        Petal.Length = as.integer(Petal.Length),
                        Petal.Width = as.integer(Petal.Width)
  )
  
  xgb_data = as.matrix(new_data)
  prediction = predict(model,xgb_data)
  result = data.frame(Answer = c('setosa','versicolor','virginica')[which.max(prediction)])
  toJSON(result)
  
}
