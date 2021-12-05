library(glue)

sub_controller <- function(filename='input.csv') {
  input <- read.csv(filename, header=FALSE, sep=' ')
  depth <- 0
  horizontal <- 0

  for(i in 1:nrow(input)) {
    command <- input[i, ]$V1
    magnitude <- input[i, ]$V2
    # if(command == 'forward'){
    #   horizontal <- horizontal + magnitude
    # } else if(command == 'up') {
    #   depth <- depth - magnitude
    # } else if(command == 'down') {
    #   depth <- depth + magnitude
    # }

    switch(as.character(command),
      forward={
        horizontal <- horizontal + magnitude
      },
      up={
        depth <- depth - magnitude
      },
      down={
        depth <- depth + magnitude
      }
    )
  }
  depth * horizontal
}

sub_controller2 <- function(filename='input.csv') {
  input <- read.csv(filename, header=FALSE, sep=' ')
  depth <- 0
  horizontal <- 0
  aim <- 0

  for(i in 1:nrow(input)) {
    command <- input[i, ]$V1
    magnitude <- input[i, ]$V2
    if(command == 'forward'){
      horizontal <- horizontal + magnitude
      depth <- depth + (aim * magnitude)
    } else if(command == 'up') {
      aim <- aim - magnitude
    } else if(command == 'down') {
      aim <- aim + magnitude
    }
    # print(glue::glue("command: {command}"))
    # print(glue::glue("magnitude: {magnitude}"))
    # print(glue::glue("depth: {depth}"))
    # print(glue::glue("horizontal: {horizontal}"))
    # print(glue::glue("aim: {aim}"))
  }

  depth * horizontal
}