library(plumber)
pr <- plumber::plumb("./serving.R")
pr$run(host="0.0.0.0", port=7080)