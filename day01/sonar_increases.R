library(readr)

# OPTIONS
# * could make single generic function that takes window size as a parameter
# * use `readChar` for speed?
# * find an approach using Reduce?

sonar_window_increases <- function(filename='input.csv') {
  input <- read.csv(filename, header=FALSE)

  sum <- 0
  for(i in 4:nrow(input)){
    previous_window <- input[i-1,] + input[i-2,] + input[i-3,]
    window <- input[i,] + input[i-1,] + input[i-2,]
    if(window > previous_window){
      sum <- sum + 1
    }
  }
  sum
}

sonar_increases <- function(filename='input.csv') {
  input <- read.csv(filename, header=FALSE)
  # result <- Reduce(function(x,sum) if(x>lag(x)) sum+1 else sum, input$V1)
  sum <- 0
  for(i in 2:nrow(input)){
    if(input[i,] > input[i-1,]){
      sum <- sum + 1
    }
  }
  sum
  # print(result)
  # result
}