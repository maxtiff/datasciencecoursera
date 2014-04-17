corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  files <- dir(directory)
  
  for (i in seq_along(files)) {
    
    obs <- complete(directory, i)$nobs
    print(obs)
    
    if (obs > threshold) {
      
      doc <- files[i]
      path <- paste(directory, doc, sep="/")
      data <- read.csv(path)
      
      keep <- complete.cases(data)
      print(keep[data])
    }
  }
  
}
