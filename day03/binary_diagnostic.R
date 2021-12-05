library(glue)

binary_diagnostic <- function(filename='input.csv') {
  f <- file(filename, "rb")
  i <- 0
  lists <- list()
  while(i < 15){
    chars <- readChar(f, 6) %>% trim %>% strsplit(split='') # %>% strtoi(base=2)
    if(length(chars) == 0) {
      break
    }
    lists[[length(lists) + 1]] <- as.numeric(unlist(chars)) 
    i <- i + 1
  }
  # print(lists)
  # strtoi
  # lists <- list(as.numeric(unlist(chars1)), as.numeric(unlist(chars2)))
  df <- as.data.frame(do.call(rbind, lists))
  # print(df)
  mat <- as.matrix(df, nrow = 2, byrow = TRUE)
  # print(mat)
  bins <- 1*(colSums(mat) > 6)
  print(class(unlist(bins)))
  print(unlist(as.character(bins)))
  chars <- unlist(as.character(bins))
  print(paste(chars))
  print(strtoi(chars, base=2))
  close(f)
  198
}