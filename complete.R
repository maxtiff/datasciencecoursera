complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- dir(directory)
  
  for (i in id) {
    
    doc <- files[i]
    path <- paste(directory, doc, sep="/")
    data <- read.csv(path)
    
    #keep <- data[complete.cases(data),]
    keep <- complete.cases(data)
    
    nobs <- sum(keep)
  
    num_kept <- data.frame(id, nobs)
    return(num_kept)
  }
  
}
