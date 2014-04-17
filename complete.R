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
  vect1 <- numeric(0)
  vect2 <- numeric(0)
  complete_frame <- data.frame(id=vect1, nobs= vect2)
  
  
  for (i in id) {
    
    # Read in file
    doc <- files[i]
    path <- paste(directory, doc, sep="/")
    data <- read.csv(path)
    
    # Count number of observations
    keep <- complete.cases(data)
    nobs <- sum(keep)
    
    # Add ID and number of obs to vector
    vect1 <- c(vect1, i)
    vect2 <- c(vect2, nobs)
  
  }
  
  complete_frame <- data.frame(id=vect1, nobs=vect2)
  return(complete_frame)
  
}
